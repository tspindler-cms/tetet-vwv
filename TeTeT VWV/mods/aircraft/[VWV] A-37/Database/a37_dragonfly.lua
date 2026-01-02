---------------------------------------------------------------------------------------------------------------------
--- a_37_dragonfly by Hawkeye60
--- Updated Performance & Organization [2025-12-29]
--- Ref: Cessna A-37B Dragonfly (2x J85-GE-17A)
---------------------------------------------------------------------------------------------------------------------

function Gatling_Effect(rotate_arg_, bar_)
	return { name = "GatlingEffect", arg = rotate_arg_, barrels_n = bar_}
end

local a37_dragonfly =  {

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   IDENTITY & METADATA                                                                                    ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Name				= 'a_37_dragonfly',
	DisplayName			= _('[VWV] A-37B Dragonfly'),
	DisplayNameShort	= _('A-37'),
	date_of_introduction= 1967.08,
	Picture				= current_mod_path..'/Textures/a_37_dragonfly.png',
	Rate				= 40,						-- [points] RewardPoint in Multiplayer
	Shape				= "a_37_dragonfly",
	WorldID             = WSTYPE_PLACEHOLDER,
	defFuelRatio        = 0.8,
	mapclasskey			= "P0091000025",
	attribute			= {wsType_Air, wsType_Airplane, wsType_Battleplane, WSTYPE_PLACEHOLDER, "Battleplanes", "Refuelable" },
	-- Categories			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	Categories			= { },
	shape_table_data 	= 
	{
		{
			file		= 'a_37_dragonfly',
			life		= 18,						-- [hitpoints] Lifebar strength
			vis			= 3,						-- [mult] Visibility gain
			desrt		= 'a_37_dragonfly_collision', -- Name of destroyed object file name
			fire		= {300, 2},					-- [sec, m] Fire duration 300s, radius 2m
			username	= 'a_37_dragonfly',
			index		= WSTYPE_PLACEHOLDER,
		},
		{
			name		= "a_37_dragonfly_collision",
			file		= "a_37_dragonfly_collision",
			fire		= {240, 2},
		},
	},

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   GEOMETRY & DIMENSIONS                                                                                  ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	length				= 8.92,						-- [m] Full length (Real A-37B: ~29ft 3in)
	height				= 2.70,						-- [m] Height (Real A-37B: ~8ft 10in)
	wing_area			= 17.1,						-- [m2] Wing area (Real A-37B: ~184 sq ft)
	wing_span			= 10.93,					-- [m] Wing span (Real A-37B: ~35ft 10in)
	wing_type			= 0,						-- [enum] 0 = Fixed wing
	wing_tip_pos		= {-0.772, -0.800, 4.415},	-- [x,y,z] Coordinates for wingtip trails
	nose_gear_pos		= {1.911, -1.882, -0.00411},-- [x,y,z] Nosegear coords
	nose_gear_wheel_diameter = 0.4258,				-- [m] Nose wheel diameter
	main_gear_pos		= {-0.17476, -1.89, 1.7825},-- [x,y,z] Maingear coords
	main_gear_wheel_diameter = 0.5385,				-- [m] Main gear wheel diameter
	tand_gear_max		= math.tan(math.rad(30)),	-- [tan] Tangent of max steering angle

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   WEIGHTS & FUEL                                                                                         ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	M_empty				= 2817,						-- [kg] Empty weight (approx 6,211 lbs)
	M_nominal			= 5400,						-- [kg] Nominal combat weight
	M_max				= 6350,						-- [kg] Max Takeoff Weight (approx 14,000 lbs)
	M_fuel_max			= 1540,						-- [kg] Internal + Tip Tanks (approx 507 gal usable)
	average_fuel_consumption = 0.45,				-- [kg/s] Approx combined flow at cruise/high power
	
	is_tanker			= false,
	tanker_type			= 2,						-- Probe & drogue
	air_refuel_receptacle_pos = {3.72, -0.8768, -0.02625},	-- [x,y,z] Probe typically on nose (Check model coords)
	center_of_mass      = {0, -1.19, 0.0},
	moment_of_inertia	= {27500, 52000, 34000},	-- [kg*m^2] {Roll, Yaw, Pitch} with tip tanks
	-- moment_of_inertia	= {8120, 32380, 34000},		-- [kg*m^2] {Roll, Yaw, Pitch} w/o tip tanks

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   PERFORMANCE (AI & GENERAL)                                                                             ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	H_max				= 12730,					-- [m] Service ceiling (approx 41,765 ft)
	range				= 1480,						-- [km] Max range
	CAS_min				= 56,						-- [m/s] Loiter/Min speed capability (AI)
	V_opt				= 130,						-- [m/s] Cruise speed (AI)
	V_take_off			= 55,						-- [m/s] Take off speed (AI)
	V_land				= 50,						-- [m/s] Landing speed (AI)
	V_max_sea_level		= 220,						-- [m/s] Max TAS at Sea Level (~427 kts)
	V_max_h				= 226,						-- [m/s] Max TAS at Altitude (~440 kts)
	Vy_max				= 35,						-- [m/s] Max climb rate (approx 6,990 ft/min clean)
	Mach_max			= 0.75,						-- [Mach] Never exceed Mach (A-37 is subsonic)
	Ny_min				= -3.0,						-- [G] Min G limit
	Ny_max				= 6.0,						-- [G] Max G limit (Airframe limit)
	Ny_max_e			= 6.0,						-- [G] Max G limit expanded
	AOA_take_off		= math.rad(9),				-- [rad] AoA in take off (AI)
	bank_angle_max		= 60,						-- [deg] Max bank angle (AI)
	has_afteburner		= false,					-- [bool] J85-GE-17A is non-afterburning
	has_speedbrake		= true,						-- [bool] A-37 has a large speedbrake behind cockpit
	flaps_maneuver		= 30/40,					-- Takeoff flaps = 20 degrees, 40 degrees max (set to 0.75 for gameplay STOL reasons)
	RCS					= 2.5,						-- [m^2] Radar Cross Section
	IR_emission_coeff	= 0.58,						-- [coeff] IR Signature (Non-AB engines)
	IR_emission_coeff_ab = 0.58,					-- [coeff] IR Signature AB (Not applicable)
	brakeshute_name		= 0,						-- No drag chute

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   ENGINES & THRUST                                                                                       ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	-- J85-GE-17A: ~2,850 lbf (12.7 kN) per engine.
	-- Total: 5,700 lbf (~2,585 kgf)
	
	thrust_sum_max		= 2588,						-- [kgf] Total Dry Thrust
	thrust_sum_ab		= 2588,						-- [kgf] Total AB Thrust (Same as dry)
	engines_count		= 2,
	engines_nozzles =
	{
		[1] =
		{
			pos					= {-1.3365, -1.17, -0.697464},
			elevation			= 0,
			diameter			= 0.251,			-- [m] Adjusted for J85 exhaust size
			exhaust_length_ab	= 2.5,
			exhaust_length_ab_K	= 0.76,
			smokiness_level		= 0.4,				-- [0-1] J85s are known to be smoky
		},
		[2] =
		{
			pos					= {-1.3365, -1.17, 0.690759},
			elevation			= 0,
			diameter			= 0.251,
			exhaust_length_ab	= 2.5,
			exhaust_length_ab_K	= 0.76,
			smokiness_level		= 0.4,
		},
	},

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   AERODYNAMICS (SFM)                                                                                     ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	-- Copy from C-101 (Base) adapted for A-37B characteristics
	SFM_Data = {
		aerodynamics = 
		{
			Cy0			= 0.28,		-- [coeff] Zero AoA lift (The A-37 uses a NACA 2418 section at the root tapering to a NACA 2412 at the tip)
			Mzalfa		= 4.355,	-- [coeff] Pitch stability
			Mzalfadt 	= 0.8,		-- [coeff] Pitch damping
			kjx			= 2.25,		-- [coeff] Roll inertia
			kjz 		= 0.00125,	-- [coeff] Pitch inertia
			Czbe 		= -0.016,	-- [coeff] Yaw stability (Sideslip)
			
			cx_gear 	= 0.04,		-- [coeff] Gear drag
			cx_flap 	= 0.055,	-- [coeff] Flap drag
			cy_flap 	= 0.85,		-- [coeff] Flap lift
			cx_brk 		= 0.12,		-- [coeff] Airbrake drag (Large speedbrake)
			table_data 	= {
			-- Cx0 increased to 0.032 to simulate Pylons + Tip Tanks + Probe drag
			-- Cymax increased to 1.4 at low speed to prevent stall during STOL maneuvers
			--    M		 Cx0	 Cya	  B		 B4	   Omxmax	Aldop	Cymax
			-- [Mach]   [Drag] [Lift/A][Polar][Polar4] [Roll]   [AoA] [MaxLift]
				{0.0,	0.032,	0.095,	0.06,	0.03,	1.0,	16.0,	1.60},
				{0.1,	0.032,	0.095,	0.06,	0.03,	1.5,	16.0,	1.65},
				{0.2,	0.032,	0.095,	0.06,	0.03,	2.3,	16.0,	1.65},
				{0.3,	0.032,	0.096,	0.06,	0.03,	2.6,	15.5,	1.55},
				{0.4,	0.032,	0.098,	0.06,	0.03,	2.6,	15.0,	1.45},
				{0.5,	0.033,	0.100,	0.06,	0.03,	2.3,	14.5,	1.40},
				{0.6,	0.034,	0.090,	0.07,	0.04,	2.3,	14.0,	1.20},
				{0.7,	0.038,	0.085,	0.08,	0.05,	2.3,	13.0,	1.10},
				{0.8,	0.055,	0.070,	0.10,	0.10,	1.8,	12.0,	1.00}, -- Drag rise
				{0.9,	0.090,	0.050,	0.15,	0.20,	1.0,	11.0,	0.90},
				{1.0,	0.125,	0.030,	0.20,	0.30,	0.5,	10.0,	0.80},
			}
		}, 
		
		engine = 
		{
			type		= "TurboJet",
			Nmg			= 38.0,		-- [%] Idle RPM
			Nominal_RPM = 16500,  	-- 100% RPM
			MinRUD		= 0,
			MaxRUD		= 1,
			MaksRUD		= 1,
			ForsRUD		= 1,
			hMaxEng		= 13.0,		-- [km] Max engine altitude
			dcx_eng		= 0.0134,	-- [coeff] Engine shutdown drag
			cemax		= 0.037,	-- [coeff] G-load availability factor
			cefor		= 0.037,	-- [coeff] AB factor (Same as mil for non-AB)
			dpdh_m		= 900,		-- [coeff] Thrust decay with altitude (850 - 1000)
			dpdh_f		= 900,		-- [coeff] AB Thrust decay
			
			-- J85-GE-17A Rated ~12,700 N (2,850 lbf)
			table_data = 
			{
			-- flattened curve to improve takeoff acceleration
			--   M			Pmax (N)	Pfor (N)
				{0.0,		12700.0,	12700.0},
				{0.1,		12680.0,	12680.0}, -- Was 12600
				{0.2,		12650.0,	12650.0}, -- Was 12400
				{0.3,		12600.0,	12600.0}, -- Was 12200
				{0.4,		12500.0,	12500.0}, -- Was 12100
				{0.5,		12400.0,	12400.0}, -- Ram recovery begins
				{0.6,		12400.0,	12400.0},
				{0.7,		12800.0,	12800.0},
				{0.8,		13200.0,	13200.0},
				{0.9,		13500.0,	13500.0},
			},
		},
	},

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   SYSTEMS, CREW & PYLONS                                                                                 ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	-- SENSORS & AVIONICS
	detection_range_max		= 0,
	radar_can_see_ground	= false,
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0},
		elevation = {-12.0, 90.0}		-- Bubble canopy allows views to +90
	},
	Sensors = {
		OPTIC = "Merkury LLTV",
	},
	HumanRadio = {
		editable = true,
		frequency = 225.0,
		minFrequency = 30,
		maxFrequency = 399.975,
		rangeFrequency = {
			{min =  30.0, max =  79.950, modulation	= MODULATION_FM},
			{min = 116.0, max = 149.975, modulation	= MODULATION_AM},
			{min = 225.0, max = 399.975, modulation	= MODULATION_AM}
		},
		modulation = MODULATION_AM,
	},
	
	-- COUNTERMEASURES
	SingleChargeTotal		= 0,
	CMDS_Incrementation		= 0,
	ChaffDefault			= 0,
	ChaffChargeSize			= 0,
	FlareDefault			= 0,
	FlareChargeSize			= 0,
	CMDS_Edit				= false,

	-- CREW
	crew_size = 2,
	crew_members = 
	{
		[1] = 
		{
			drop_canopy_name		= "hb_f4e_pilotcanopy",
			ejection_seat_name		= "pilot_f86_seat",
			pilot_name				= "pilot_f86",
			pos						= {0.76, -0.91, -0.286},
			can_be_playable			= true,
			canopy_arg				= 38, 
			ejection_order			= 1,
			canopy_pos				= {-0.68, -0.47, 0},
			ejection_added_speed	= {-5, 15, 0},
			role					= "pilot",
			role_display_name		= _("Pilot"),
			drop_parachute_name		= "pilot_f86_parachute",
			g_suit 			    	= 0.8,		--  G suit effectiveness: 0.0 to 1.0 (1.0 = modern g-suits)
		},
		[2] = 
		{
			drop_canopy_name		= "hb_f4e_wsocanopy",
			ejection_seat_name		= "pilot_f86_seat",
			pilot_name				= "pilot_f86",
			pos						= {0.76, -0.91, 0.242},
			can_be_playable			= true,
			canopy_arg				= 38, 
			pilot_body_arg			= 472,
			ejection_order			= 2,
			canopy_pos				= {-0.68, -0.47, 0},
			ejection_added_speed	= {-5, 15, 0},
			role					= "instructor",
			role_display_name		= _("Instructor pilot"),
			drop_parachute_name		= "pilot_f86_parachute",
			g_suit 			   		= 0.8,		--  G suit effectiveness: 0.0 to 1.0 (1.0 = modern g-suits)
		},
	},

	-- WEAPONS
	Guns = {
		-- Internal GAU-2B/A 7.62mm minigun (Placeholder connector M_197 used in original)
		gun_mount("M_197", { count = 1500}, {muzzle_pos_connector = "POINT_MGUN_11", effects = {Gatling_Effect(351,6), fire_effect(350)}}),
	},

	Pylons =
	{
		-- Pylon 1 (Outer Left)
		pylon(1, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_1", },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA_WP}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}},
			}
		),
		-- Pylon 2
		pylon(2, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_2",  },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
			}
		),
		-- Pylon 3
		pylon(3, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_3", },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
			}
		),
		-- Pylon 4
		pylon(4, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_4",  },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
			}
		),
		-- Pylon 5
		pylon(5, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_5", },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
			}
		),
		-- Pylon 6
		pylon(6, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_6", },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
			}
		),
		-- Pylon 7
		pylon(7, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_7", },
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
			}
		),
		-- Pylon 8 (Outer Right)
		pylon(8, 0, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_8",},
			{
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" },
				{ CLSID = "{mk77mod1}" },
				{ CLSID = "{M260_HYDRA}" },
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" },
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}},
			}
		),
		-- Fuel Tank Arg (Visual only?)
		pylon(9, 1, 0.0000, 0.0009, 0.0000, { use_full_connector_position = false, connector = "PYLON_9", arg = 199, arg_value = 0.0},
			{
				{ CLSID = "dragonfly_fuel_tanks", arg = 199, arg_value = 1.0 },
			}
		),
	},
	
	Tasks = 
	{
		aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(AFAC),
		aircraft_task(RunwayAttack),
		aircraft_task(AntishipStrike),
	},
	DefaultTask = aircraft_task(GroundAttack),
	sounderName = "Aircraft/Planes/a_37_dragonfly",

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ///   DAMAGE & VISUALS                                                                                       ///
-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Damage = verbose_to_dmg_properties(
	{
		["NOSE_CENTER"]			= {critical_damage = 3, args = {146}},
		["NOSE_BOTTOM"]			= {critical_damage = 3, args = {148}, deps_cells = {"FRONT_GEAR_BOX"}},
		["NOSE_RIGHT_SIDE"]		= {critical_damage = 3, args = {149}, deps_cells = {"PITOT"}},
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3, args = {150}, deps_cells = {"PITOT"}},
		["PITOT"]				= {critical_damage = 3},
		["COCKPIT"]				= {critical_damage = 7, args = {65}, deps_cells = {"CREW_1", "CREW_2"}},
		["CREW_1"]				= {critical_damage = 4, args = {663}},
		["ARMOR_PLATE_LEFT"]	= {critical_damage = 6, deps_cells = {"CREW_1"}},
		["CREW_2"]				= {critical_damage = 4, args = {664}},
		["ARMOR_PLATE_RIGHT"]	= {critical_damage = 6, deps_cells = {"CREW_2"}},
		["CABIN_BOTTOM"]		= {critical_damage = 3, args = {297}, deps_cells = {"AIR_BRAKE_L"}},
		["CABIN_RIGHT_SIDE"]	= {critical_damage = 5, args = {298}, deps_cells = {"ARMOR_PLATE_LEFT", "ARMOR_PLATE_RIGHT"}},
		["CABIN_LEFT_SIDE"]		= {critical_damage = 5, args = {299}, deps_cells = {"ARMOR_PLATE_LEFT", "ARMOR_PLATE_RIGHT"}},
		["AIR_BRAKE_L"]			= {critical_damage = 2, args = {183}},
		["FUEL_TANK_F"]			= {critical_damage = 8, args = {147}, deps_cells = {"ARMOR_PLATE_RIGHT"}},
		["WING_R_OUT"]			= {critical_damage = 8, args = {213}, deps_cells = {"AILERON_R"}},
		["WING_R_CENTER"]		= {critical_damage = 9, args = {214}, deps_cells = {"FLAP_R", "AILERON_R", "WING_R_OUT"}},
		["WING_R_IN"]			= {critical_damage = 10, args = {215}, deps_cells = {"WING_R_CENTER", "FLAP_R", "AILERON_R", "WING_R_OUT"}},
		["AILERON_R"]			= {critical_damage = 3, args = {216}},
		["FLAP_R"]				= {critical_damage = 4, args = {217}},
		["WING_L_OUT"]			= {critical_damage = 8, args = {223}, deps_cells = {"AILERON_L"}},
		["WING_L_CENTER"]		= {critical_damage = 9, args = {224}, deps_cells = {"FLAP_L", "AILERON_L", "WING_L_OUT"}},
		["WING_L_IN"]			= {critical_damage = 10, args = {225}, deps_cells = {"WING_L_CENTER", "FLAP_L", "AILERON_L", "WING_L_OUT"}},
		["AILERON_L"]			= {critical_damage = 3, args = {226}},
		["FLAP_L"]				= {critical_damage = 4, args = {227}},
		["FUSELAGE_BOTTOM"]		= {critical_damage = 5, args = {152}},
		["FUSELAGE_RIGHT_SIDE"]	= {critical_damage = 4, args = {153}, deps_cells = {"ENGINE"}},
		["FUSELAGE_LEFT_SIDE"]	= {critical_damage = 4, args = {154}, deps_cells = {"ENGINE"}},
		["ENGINE"]				= {critical_damage = 3},
		["TAIL_BOTTOM"]			= {critical_damage = 4, args = {156}},
		["TAIL_RIGHT_SIDE"]		= {critical_damage = 4, args = {157}},
		["TAIL_LEFT_SIDE"]		= {critical_damage = 4, args = {158}},
		["TAIL"]				= {critical_damage = 20, args = {159}},
		["STABILIZATOR_R"]		= {critical_damage = 7, args = {233}, deps_cells = {"ELEVATOR_R", "ELEVATOR_R_OUT"}},
		["ELEVATOR_R"]			= {critical_damage = 4, args = {238}, deps_cells = {"ELEVATOR_R_OUT"}},
		["ELEVATOR_R_OUT"]		= {critical_damage = 2, args = {237}},
		["STABILIZATOR_L"]		= {critical_damage = 7, args = {235}, deps_cells = {"ELEVATOR_L", "ELEVATOR_L_OUT"}},
		["ELEVATOR_L"]			= {critical_damage = 4, args = {240}, deps_cells = {"ELEVATOR_L_OUT"}},
		["ELEVATOR_L_OUT"]		= {critical_damage = 2, args = {239}},
		["FIN_L_TOP"]			= {critical_damage = 5, args = {242}, deps_cells = {"RUDDER"}},
		["FIN_L_BOTTOM"]		= {critical_damage = 7, args = {246}, deps_cells = {"FIN_L_TOP", "RUDDER"}},
		["RUDDER"]				= {critical_damage = 3, args = {248}},
		["FRONT_GEAR_BOX"]		= {critical_damage = 3, args = {265}, deps_cells = {"WHEEL_F"}},
		["RIGHT_GEAR_BOX"]		= {critical_damage = 5, args = {266}, deps_cells = {"WHEEL_R"}},
		["LEFT_GEAR_BOX"]		= {critical_damage = 5, args = {267}, deps_cells = {"WHEEL_L"}},
		["WHEEL_F"]				= {critical_damage = 4, args = {134}},
		["WHEEL_R"]				= {critical_damage = 4, args = {135}},
		["WHEEL_L"]				= {critical_damage = 4, args = {136}},
	}),

	DamageParts = { },
	
	flaps_transmission          = "Electrical",
    undercarriage_transmission  = "Hydraulic",
	
	-- ===================================================================
    -- 9. LIGHTS DEFINITION
    -- ===================================================================
	
	--[[
		--------------------------------------------------------------
		------------------  HawaiianRyan overhaul  -------------------
		--------------------------------------------------------------
		DCS World\Scripts\Aircrafts\_Common\Lights.lua
		
		WOLALIGHT_STROBES          = 1		-- White strobe anti-collision lights.
		WOLALIGHT_SPOTS            = 2		-- Take-off and landing high power headlights.
		WOLALIGHT_LANDING_LIGHTS   = 2		-- Take-off and landing high power headlights.
		WOLALIGHT_NAVLIGHTS        = 3		-- P-Z colored navigation (position) wingtip lights..
		WOLALIGHT_FORMATION_LIGHTS = 4		-- Formation / Logo lights.
		WOLALIGHT_TIPS_LIGHTS      = 5		-- Helicopter-specific: rotor anti-collision tips lights.
		WOLALIGHT_TAXI_LIGHTS      = 6		-- Taxi headlights.
		WOLALIGHT_BEACONS          = 7		-- Rotary anti-collision lights.
		WOLALIGHT_CABIN_BOARDING   = 8		-- Cabin incandescence illumination.
		WOLALIGHT_CABIN_NIGHT      = 9		-- Cabin night time (UV) illumination.
		WOLALIGHT_REFUEL_LIGHTS    = 10		-- Refuel apparatus illumination.
		WOLALIGHT_PROJECTORS       = 11		-- Search lights, direction-controlled.
		WOLALIGHT_AUX_LIGHTS       = 12		-- White anti-collision strobes & others
		WOLALIGHT_IR_FORMATION     = 13		-- IR formation strips. Currently not implemented due to engine NVG limitations.
		WOLALIGHT_CABIN_WORK	   = 14		-- Flight instrument illumination of pilots
	]]

	lights_data = {
		typename = "collection",
		lights = {
			[WOLALIGHT_BEACONS] = {
				-- Red beacon lights. Old aircraft have rotating/oscillating ones. Modern aircraft flash.
				typename = "Collection",
				lights = {
					-- {typename = "argumentlight", argument = 51,	controller = "Strobe", period = 1.5/2, flash_time = 45/240},	-- beam_width / angular_rate = beam_width * 360 / period
					-- {
						-- typename = "RotatingBeacon", 						-- Top of tail red beacon
						-- proto = lamp_prototypes.MSL_3_2,
						-- position = { -4.178, 0.455, 0.000 },
						-- color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						-- angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					-- },
					{
						typename = "RotatingBeacon", 						-- Dorsal fuselage
						proto = lamp_prototypes.MSL_3_2,
						position = { -0.782, -0.5895, -0.092844 },
						direction = {elevation = math.rad(-5.21)},			-- Rocked back 5.21 degrees
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon", 						-- Belly red beacon
						proto = lamp_prototypes.MSL_3_2,
						position = { -0.270741, -1.544154, 0.216717 },
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						phase_shift = 0.25,									-- Half cycle out of phase with the other one, 0.25 since there's 2 cups
						angle_max = math.rad(12.0)
					},
				},
			},
			[WOLALIGHT_LANDING_LIGHTS] = {typename = "Collection",
				lights = {
					-- {typename = "argumentlight",argument = 49},	-- This arg turns on port & stbd nav lights plus nose taxi/landing light
					{
						typename = "Spot", proto = lamp_prototypes.LFS_R_27_450,
						position = { 3.072, -1.048, 0.114166 },
						direction = {elevation = math.rad(5.0)},
						color = {1, 0.945, 0.8784},
						angle_max = math.rad(28.0),
						cool_down_t = 0.5,
					},
				},
			},
			[WOLALIGHT_NAVLIGHTS] = {typename = "Collection",
				lights = {
					{typename = "argumentlight", argument = 49},	-- This arg turns on port & stbd nav lights plus nose taxi/landing light
					{typename = "argumentlight", argument = 51},	-- This arg turns on aft nav light at the top of the vert stab
				},
			},
			[WOLALIGHT_FORMATION_LIGHTS] = {typename = "Collection",
				lights = {
					-- {typename = "argumentlight",argument = 49},	-- This arg turns on port & stbd nav lights plus nose taxi/landing light
					-- {typename = "argumentlight",argument = 51},	-- This arg turns on aft nav light at the top of the vert stab
					{
						typename = "RotatingBeacon", 						-- Dorsal fuselage
						proto = lamp_prototypes.MSL_3_2,
						position = { -0.782, -0.5895, -0.092844 },
						direction = {elevation = math.rad(-5.21)},			-- Rocked back 5.21 degrees
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon", 						-- Belly red beacon
						proto = lamp_prototypes.MSL_3_2,
						position = { -0.270741, -1.544154, 0.216717 },
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						phase_shift = 0.25,									-- Half cycle out of phase with the other one, 0.25 since there's 2 cups
						angle_max = math.rad(12.0)
					},
				},
			},
			[WOLALIGHT_TAXI_LIGHTS] = {typename = "Collection",
				lights = {
					-- {typename = "argumentlight",argument = 49},			-- This arg turns on port & stbd nav lights plus nose taxi/landing light
					{
						typename = "Spot", proto = lamp_prototypes.LFS_R_27_180,
						position = { 3.072, -1.048, 0.114166 },
						direction = {elevation = math.rad(5.0)},
						color = {1, 0.945, 0.8784},
						angle_max = math.rad(40.0),
						cool_down_t = 0.5,
					},
				},
			},
		}
	},
}

add_aircraft(a37_dragonfly)