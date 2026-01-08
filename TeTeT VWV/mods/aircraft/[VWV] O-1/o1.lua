-- Cessna O-1G Bird Dog (Model 305A)
-- Performance adjusted for Continental O-470-11 (213 HP)
-- Vietnam War Configuration (FAC)
return {
	Name						= "vwv_o-1",
	DisplayName					= _("[VWV] O-1G Bird Dog"),
	DisplayNameShort			= _("O-1G"),
	date_of_introduction		= 1950.12,
	HumanCockpit				= false,

	Picture						= current_mod_path .. "/Textures/o1_bird_dog.png",
	Rate						= 20, -- RewardPoint in Multiplayer
	Shape						= "o1_birddog",
	WorldID						= WSTYPE_PLACEHOLDER,
	propellorShapeType			= "3ARG_PROC_BLUR",
	propellorShapeName			= "o1_blade.fbx",
	shape_table_data			=
	{
		{
			file				= "o1_birddog";
			life				= 50; -- lifebar (Fragile airframe)
			vis					= 3; -- visibility gain.
			desrt				= "o1_birddog_collision"; -- Name of destroyed object file name
			fire				= { 300, 2}; -- [s], [m] Fire on the ground after destoyed
			username			= "vwv_o-1";
			index				= WSTYPE_PLACEHOLDER;
			classname			= "lLandPlane"; -- Light Land Plane
			positioning			= "BYNORMAL";
			drawonmap			= true;
		},
		{
			name				= "o1_birddog_collision";
			file				= "o1_birddog_collision";
			fire				= { 300, 2}; -- [s], [m]
		},
	},
	mapclasskey					= "P0091000026",
	attribute					= {wsType_Air, wsType_Airplane, wsType_Battleplane, WSTYPE_PLACEHOLDER, "Battleplanes",},
	Categories					= { },
	country_of_origin 			= "USA",

	-------------------------
	
	-- WEIGHT PARAMETERS [kg]
	M_empty						= 732,				-- [kg] Empty weight: ~1,614 lbs
	M_nominal					= 950,				-- [kg] Normal loaded: ~2,100 lbs (Fuel + Pilot + Rockets)
	M_max						= 1089,				-- [kg] Max takeoff: ~2,400 lbs (Overload FAC)
	M_fuel_max					= 115,				-- [kg] Max fuel: ~250 lbs / 41 US Gal usable (Standard tanks)
	defFuelRatio				= 0.6,				-- Spawn with 60% fuel by default

	-- PERFORMANCE
	H_max						= 5640,				-- [m] Service ceiling: ~18,500 ft
	V_max_sea_level				= 51.41,			-- [m/s TAS] Max speed SL: ~100 kts / 115 mph / 185 kph
	V_max_h						= 44.0,				-- [m/s TAS] Max speed at Ceiling: ~85 kts (Power limited)
	V_opt						= 46.49,			-- [m/s TAS] Cruise speed: ~90 kts / 104 mph (Econ Cruise)
	V_take_off					= 26,				-- [m/s TAS] Takeoff speed: ~50 kts / 58 mph (STOL)
	V_land						= 28,				-- [m/s TAS] Approach speed: ~54 kts / 62 mph
	CAS_min						= 24.14,			-- [m/s TAS] Stall speed (clean): ~47 kts / 54 mph
	Mach_max					= 0.20,				-- [Mach] Max Mach number (Vne = 151 mph)
	range						= 853,				-- [km] Max range: ~460 nm / 530 miles
	Vy_max						= 5.8,				-- [m/s TAS] Rate of climb: ~1,150 ft/min (Sea Level)

	-- ENGINE (1x Continental O-470-11 Flat-Six)
	-- Rated 213 HP @ 2600 RPM
	thrust_sum_max				= 450,				-- [kgf] Static Thrust (Est. 900-1000 lbs for STOL prop)
	thrust_sum_ab				= 450,				-- [kgf] No AB
	engines_count				= 1,				-- [#] Number of engines
	has_afteburner				= false,
	has_speedbrake				= false,
	has_thrustReverser			= false,
	average_fuel_consumption	= 0.021,			-- [kg/s] ~13.5 GPH cruise (~0.021 kg/s)

	-- AERODYNAMICS
	bank_angle_max				= 60,				-- [deg] Max bank angle
	Ny_min						= -1.5,				-- [G] Negative G limit
	Ny_max						= 3.8,				-- [G] Positive G limit (Utility Category)
	Ny_max_e					= 4.4,				-- [G] Emergency G limit
	AOA_take_off				= math.rad(12.0),	-- [rad] Takeoff AoA (Taildragger 3-point)
	center_of_mass 		= {-0.788, 0.11, 0.0},		-- [m] Relative to model center
	moment_of_inertia	= {1200, 3500, 2800}, 		-- [kg*m^2] {Roll, Yaw, Pitch} - Tuned for O-1G mass distribution

	-- DIMENSIONS
	wing_area					= 16.16,			-- [m^2] Wing area: 174 sq ft
	wing_span					= 10.97,			-- [m] Wing span: 36 ft
	length						= 7.85,				-- [m] Length: 25 ft 9 in
	height						= 2.22,				-- [m] Height: 7 ft 3.5 in

	-- SENSORS
	RCS							= 2.5,				-- [m^2] Radar Cross Section (Small metal fabric plane)
	detection_range_max			= 8,				-- [km] Absolute maximum distance flight crew can see ground vehicles
	IR_emission_coeff			= 0.15,				-- [proportion] Small piston engine, low heat signature
	IR_emission_coeff_ab		= 0.15,
	radar_can_see_ground		= true,				-- Aircraft sensors can detect ground & sea surface units

	-- ENGINES
	-- sound_name					= "Aircrafts/Engines/PackardMerlinProp/Engine", -- Placeholder, usually need custom sound for Flat-6

	wing_type					= 0,
	wing_tip_pos		= {-0.39, 0.75, 5.42},		-- [m] wingtip coords for visual effects

	nose_gear_pos		= {-5.595, -0.755, 0},		-- [m] Tailwheel {x,y,z}
	main_gear_pos		= {0.299, -1.755, 1.15},	-- [m] Main gear {x,y,z}
	tand_gear_max		= math.tan(math.rad(180)),	-- [tan] Maximum tail wheel turning angle

	nose_gear_wheel_diameter	= 0.23,				-- [m] Tail wheel diameter (approx 8")
	main_gear_wheel_diameter	= 0.454,			-- [m] Main gear wheel diameter (approx 24")
	
	stores_number				= 4,
	tanker_type					= 0,
	flaps_maneuver				= 25/40,			-- [0-1] Takeoff flaps (20-30 deg); landing 30-40, max 60
	brakeshute_name				= 0,
	is_tanker					= false,
	
	engines_nozzles = {
		[1] = {
			pos			= {0.75, -0.938, -0.2115},	-- [m] Exhaust ventral side under engine (port)
			elevation			= math.rad(-10),	-- [rad]
			diameter			= 0.08,				-- [m]
			exhaust_length_ab	= 0.5,				-- [m]
			exhaust_length_ab_K	= 0.1,
			smokiness_level		= 0.05,
			engine_number		= 1
		},
		[2] = {
			pos			= {0.75, -0.938, 0.2115},	-- [m] Exhaust ventral side under engine (starboard)
			elevation			= math.rad(-10),	-- [rad]
			diameter			= 0.08,				-- [m]
			exhaust_length_ab	= 0.5,				-- [m]
			exhaust_length_ab_K	= 0.1,
			smokiness_level		= 0.05,
			engine_number		= 1
		},
	}, -- end of engines_nozzles

---------------------------------------------------------------------------------
--  Crew
---------------------------------------------------------------------------------

	crew_size					= 2,				-- Pilot + Observer/FAC
	crew_members =
	{
		[1] =
		{
			pilot_name			= "pilot_p51",
			ejection_seat_name	= 0,
			drop_canopy_name	= 0,
			pos					= {-0.3, -0.3, 0.0}, -- [m] Pilot
			ejection_order		= 1,
		}, 
		[2] =
		{
			pilot_name			= "pilot_p51",
			ejection_seat_name	= 0,
			drop_canopy_name	= 0,
			pos					= {-1.2, -0.3, 0.0}, -- [m] Observer
			ejection_order		= 2,
		},
	}, -- end of crew_members

	fires_pos =
	{
		[1]		= {1.3, -0.2,  0.0}, 				-- Engine
		[2]		= {0.0,  0.7,  2.32}, 				-- Wing L
		[3]		= {0.0,  0.7, -2.32},				-- Wing R
	}, 

	-- Countermeasures (None standard on O-1)
	SingleChargeTotal			= 0,
	CMDS_Incrementation			= 0,
	ChaffDefault				= 0,
	ChaffChargeSize				= 0,
	FlareDefault				= 0,
	FlareChargeSize				= 0,
	CMDS_Edit					= false,
	chaff_flare_dispenser		= {},

	-- Sensors & Radio
	CanopyGeometry = {
		azimuth		= {-180.0, 180.0},				-- Pilot can check 6 o'clock
		elevation	= {-85.0,  90.0}				-- Can see ground (canted windows) and zenith (roof windows)
	},
	
	Sensors = { },
	
	HumanRadio = {
		editable = true,
		frequency = 225.0,
		minFrequency = 24,
		maxFrequency = 399.975,
		rangeFrequency = {
			{min =  24.0, max =  76.000, modulation	= MODULATION_FM},
			{min = 118.0, max = 135.975, modulation	= MODULATION_AM},
			{min = 225.0, max = 399.975, modulation	= MODULATION_AM}
		},
		modulation = MODULATION_AM,
	},

	Guns = { },				-- Some O-1s carried M16s or mounted M60s, but usually personal weapons only

	Pylons =  {
		pylon(1, 0, -0.372167, 0.4-0.01, -2.9945, {use_full_connector_position = true, connector = "pylon_1"},
			{	-- Port wing outboard
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -0.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, 0.025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		),
		pylon(2, 0, -0.365, 0.40425-0.027, -2.65856, {use_full_connector_position = true, connector = "pylon_2"}, 
			{	-- Port wing inboard
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -0.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, 0.025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		),
		pylon(3, 0, -0.365, 0.408193-0.027, 2.660548, {use_full_connector_position = true, connector = "pylon_3"},
			{	-- Starboard wing inboard
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -0.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, 0.025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		),
		pylon(4, 0, -0.371791, 0.404373-0.01, 2.996509, {use_full_connector_position = true, connector = "pylon_4"},
			{	-- Starboard wing outboard
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -0.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, 0.025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		)
	},

	Tasks = {
		aircraft_task(AFAC),				-- Airborne Forward Air Controller
		aircraft_task(CAS),					-- Close air support
		aircraft_task(Reconnaissance),
		aircraft_task(Transport),
    },
	DefaultTask					= aircraft_task(AFAC),

	SFM_Data = {
		aerodynamics = {
			-- AERODYNAMICS TABLE (Cessna O-1 / NACA 2412 Airfoil)
			Cy0					= 0.15,		-- Zero AoA lift coefficient (High lift wing)
			Mzalfa				= 4.5,		-- Pitch stability (Stable platform)
			Mzalfadt			= 0.8,		-- Pitch damping
			kjx					= 1.55,		-- Roll inertia
			kjz					= 1.5,		-- Pitch inertia
			Czbe				= -0.08,	-- Directional stability
			
			-- Drag & Lift Coefficients
			cx_gear				= 0.015,	-- Fixed gear drag
			cx_flap				= 0.035,	-- Flap drag (High drag at 60 deg)
			cy_flap				= 0.22,		-- Flap lift (High lift slotted flaps)
			cx_brk				= 0.0,		-- No airbrakes
			
			table_data = {
				-- Mach, Cx0,   Cya,   B,     B4,   Omxmax, Aldop,  Cymax
				{0.0,  0.052, 0.075, 0.065, 0.012, 0.6,    18,    1.60},
				{0.1,  0.052, 0.075, 0.065, 0.012, 0.6,    18,    1.60}, -- Cruise region (normal drag)
				{0.15, 0.052, 0.075, 0.065, 0.012, 0.6,    17,    1.55},
				{0.2,  0.075, 0.078, 0.070, 0.014, 0.5,    16,    1.45}, -- [!] Drag begins to spike at ~130 kts
				{0.3,  0.120, 0.080, 0.085, 0.020, 0.4,    15,    1.30}, -- [!] Massive drag wall at ~190 kts
				{0.4,  0.160, 0.085, 0.100, 0.040, 0.3,    14,    1.10},
				{0.5,  0.200, 0.090, 0.150, 0.100, 0.2,    12,    0.90},
			},
		},
		
		engine = {
			-- ENGINE TABLE (Continental O-470-11)
			-- Rated 213 HP @ 2600 RPM
			
			type				= "Inline",
			typeng				= 2, 		-- Piston
			-- name				= "RollsRoyceMerlin",
			
			Nominal_RPM			= 2600,		-- [RPM] Max continuous
			Nmg			= 600/2600*100,		-- [%] Idle ~600 RPM
			Displ				= 7.7,		-- [l] 471 cubic inches = 7.7 liters
			Stroke				= 0.1016,	-- [m] 4.0 inches
			N_indic_0			= 158830,	-- [W] Indicated Power (~213 HP)
			V_pist_0			= 6,		-- 6 Cylinders
			cylinder_firing_order	= {1, 4, 5, 2, 3, 6}, -- Standard Flat-6
			
			-- Propeller (McCauley 1A200 Fixed Pitch - climb optimized)
			Init_Mom			= 122,		-- [N*m] Breakaway torque
			D_prop				= 2.29,		-- [m] 90 inch prop
			MOI_prop			= 1.1,		-- [kg*m^2] Moment of inertia for the prop itself
			k_gearbox			= 1.0,		-- Direct drive
			prop_blades_count	= 2,		-- [#]
			prop_direction		= 1,		-- CCW when viewed from the front
			prop_pitch_min		= 12.5,		-- [deg] Fixed pitch
			prop_pitch_max		= 12.5,		-- [deg] Fixed pitch
			prop_pitch_feather	= 0,		-- No feathering
			prop_locations = {
			
				{1.757, -0.237, 0.004}, 	{ 0.0, math.rad(-2.0), math.rad(-3.0) },
				
				-- Based on the engine installation of the Cessna 305A (O-1G) Bird Dog,
				-- the Continental O-470-11 engine is mounted with specific down-thrust
				-- and starboard-thrust to counteract the high torque and P-factor of the
				-- climb-optimized propeller.
			},
			
			-- Engine performance
			hMaxEng				= 0.1,		-- [km] Critical altitude (Naturally Aspirated)
			dcx_eng				= 0.005,	-- Engine cooling drag
			cemax				= 0.35,		-- [kg/s] Specific Fuel Consumption
			cefor				= 0.35,		-- [kg/s] Specific Fuel Consumption
			
			dpdh_m				= 0,		-- Tells DCS to rely purely on piston thermodynamics modeling
			dpdh_f				= 0,		-- Tells DCS to rely purely on piston thermodynamics modeling
			
			MAX_Manifold_P_1	= 96000,	-- [Pa] Manifold pressure for max continuous cruise (aka METO) ~28 inHg
			MAX_Manifold_P_2	= 101325,	-- [Pa] Manifold pressure for dry takeoff (Sea Level)
			MAX_Manifold_P_3	= 101325,	-- [Pa] Manifold pressure for wet takeoff or war emergency power
			
			k_adiab_1			= 0.026,	-- Adiabatic efficiency (low blower)
			k_adiab_2			= 0.026,	-- Adiabatic efficiency (high blower)
			k_after_cool		= 0.0,		-- No intercooler
			k_Eps				= 7.0,		-- [ratio] Compression Ratio 7.0:1 (AvGas 80/87)
			
			-- Power/Torque Multipliers (Tuned for O-470 low end torque)
			Nu_0				= 1.4,		-- High static torque
			Nu_1				= 0.8,		-- Linear power curve
			Nu_2				= 0.02,		-- Low speed prop
			
			N_fr_0				= 0.05,		-- Static Friction Coefficient (The "Stiction" Factor)
			N_fr_1				= 0.02,		-- Dynamic Friction Coefficient (The "Viscosity" Factor)
			
			P_oil				= 241317,	-- [Pa] ~35 psi
			k_boost				= 1.0,		-- Naturally Aspirated
			k_cfug				= 0.0,		-- [coeff] Supercharger Centrifugal Compressor Pressure Rise
			k_oil				= 4e-5,		-- Oil Drag/Viscocity factor
			k_piston			= 1500,		-- Scaled for naturally aspirated O-470 (~140 psi BMEP vs ~260 psi for R-3350)
			k_reg				= 0.0,		-- No turbo regulator
			k_vel				= 0.01,		-- Ram Air Recovery factor
			
			Startup_Prework		= 10.0,		-- [s]
			Startup_Ignition_Time	= 4.0,	-- [s]
			Shutdown_Duration	= 12.0,		-- [s]
			Startup_RPMs		= {
				{0.0, 0},
				{1.0, 40},
				{3.0, 60},
				{3.5, 300},
				{6.0, 600}
			},
			
			MinRUD				= 0,
			MaxRUD				= 1,
			MaksRUD				= 1,
			ForsRUD				= 1,
	
			table_data = {
				-- Thrust Curve (N) for 213 HP Prop
				--  Mach,  Thrust (N)
					{0.0,   4410},  -- Static (Matches thrust_sum_max 450kg * 9.8)
					{0.05,  4200},  -- 33 kts: Very little drop-off yet
					{0.1,   3650},  -- 66 kts: (Key Fix) Strong pull at Vy (Best Rate of Climb)
					{0.13,  2500},  -- 85 kts: Prop begins to lose efficiency rapidly
					{0.15,  1750},  -- 99 kts: Vmax intercept (Thrust = Drag)
					{0.18,   800},  -- 118 kts: Overspeed, thrust vanishes
					{0.22,     0},  -- 145 kts: Prop provides no thrust (windmilling)
					{0.4,      0},
				
			--[[
					{0.0,   4400},
					{0.05,  4000},
					{0.1,   3100},
					{0.15,  1600},	-- [Reduced] Thrust drops fast as you outrun the prop pitch
					{0.2,    600},	-- [Reduced] Very little push at 130 kts
					{0.25,     0},	-- [Zero] Prop produces no net thrust above ~160 KTAS
					{0.3,      0},
					{0.4,      0},
				]]
			},
		},
	},

----------------------------------------------------------------------------------------------------
---  Damage Section
-----------------------------------------------------------------------------------------------------

	Failures = {
		-- power plant
		{ id = 'ENG0_GOVERNOR_FAILURE',		label = _('Prop governor Fault.'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG0_MAGNETO0',				label = _('Magneto 1 Fault.'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG0_MAGNETO1',				label = _('Magneto 2 Fault.'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG0_JAMMED',				label = _('Engine Jam'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		--{ id = 'sight_failure',	label = 'SIGHT FAILURE',	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 }
	},

    -- Blueprint taken from Damage.lua of ED
	Damage = verbose_to_dmg_properties({
		["COCKPIT"]					= {critical_damage = 2, args =  { 65}},
		["NOSE_CENTER"]				= {critical_damage = 3, args =  {146}},

		["WING_L_OUT"]				= {critical_damage = 5, args =  {223},deps_cells = {"FLAP_L_IN","WING_L_PART_OUT"}},
		["WING_R_OUT"]				= {critical_damage = 5, args =  {213},deps_cells = {"FLAP_R_IN","WING_R_PART_OUT"}},
		["WING_L_PART_OUT"]			= {critical_damage = 3, args =  {221}},
		["WING_R_PART_OUT"]			= {critical_damage = 3, args =  {231}},
		["FLAP_L_IN"]				= {critical_damage = 2, args =  {227}},
		["FLAP_R_IN"]				= {critical_damage = 2, args =  {217}},

		["FUSELAGE_BOTTOM"]			= {critical_damage = 5, args =  {152}},
		["FUSELAGE_CENTR_TOP"]		= {critical_damage = 5, args =  {151}},

		["FIN_TOP"]					= {critical_damage = 3, args =  {244}},
		["RUDDER"]					= {critical_damage = 2, args =  {247}},

		["STABILIZER_L_IN"]			= {critical_damage = 2, args =  {235}},
		["STABILIZER_R_IN"]			= {critical_damage = 2, args =  {233}},
		["wheel_front"]				= {critical_damage = 1},
		["wheel_left"]				= {critical_damage = 1},
		["wheel_right"]				= {critical_damage = 1},
	}),

	DamageParts = { },

-- ============================================================
-- LIGHTS DEFINITION
-- ============================================================

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
        typename = "Collection",
        lights = {
			[WOLALIGHT_NAVLIGHTS] = {		-- Navigation Lights
				typename = "Collection",
				lights = {
					{	-- Left Wing (Red)
						typename			= "Spot", position = {-0.208, 0.747, -5.445},
						proto				= lamp_prototypes.BANO_7M_red,
						direction			= {azimuth = math.rad(-55.0), elevation = math.rad(0)},
						angle_max 			= math.rad(110.0),
					},
					{	-- Right Wing (Green)
						typename			= "Spot", position = {-0.208, 0.747, 5.445},
						proto				= lamp_prototypes.BANO_7M_green,
						direction			= {azimuth = math.rad(55.0), elevation = math.rad(0)},
						angle_max 			= math.rad(110.0),
					},
					{	-- Tail (White)
						typename			= "Spot", position = {-5.78, -0.105, 0.0},
						proto				= lamp_prototypes.ANO_3_Bl,
						direction			= {azimuth = math.rad(180.0), elevation = math.rad(0)},
						angle_max 			= math.rad(140.0),
					},
				},
			},
            [WOLALIGHT_TAXI_LIGHTS] = {		-- Taxi Lights (Left Wing Leading Edge - inboard light)
                typename = "Collection",
                lights = {
					{
						typename			= "Spot", position = {0.12, 0.673, -3.645}, 					-- Port wing leading edge
						direction			= {azimuth = math.rad(0.0), elevation = math.rad(15.0)},		-- Depressed 15 degrees
						proto				= lamp_prototypes.LFS_R_27_130,
						angle_max 			= math.rad(40.0+2),												-- 40 degrees horizontal
						emitter_angle_z 	= math.rad(15.0+2),												-- 15 degrees vertical
						range				= 150,															-- [m] Shorter range, wider wash
						cool_down_t			= 0.5,
					},
					{
						typename			= "Spot", position = {0.12, 0.674, -3.7594}, 					-- Port wing leading edge
						direction			= {azimuth = math.rad(0.0), elevation = math.rad(3.0)},			-- Depressed 3 degrees
						proto				= lamp_prototypes.LFS_P_27_450,
						angle_max 			= math.rad(10.0+2),												-- 10 deg conical beam (GE 4594)
						-- range				= 600,														-- [m] Effective beam reach
						cool_down_t			= 1.25,
					},
				},
			},
            [WOLALIGHT_LANDING_LIGHTS] = {	-- Landing Lights (Left Wing Leading Edge - outboard light)
                typename = "Collection",
                lights = {
					{
						typename			= "Spot", position = {0.12, 0.673, -3.645}, 					-- Port wing leading edge
						direction			= {azimuth = math.rad(0.0), elevation = math.rad(15.0)},		-- Depressed 15 degrees
						proto				= lamp_prototypes.LFS_R_27_130,
						angle_max 			= math.rad(40.0+2),												-- 40 degrees horizontal
						emitter_angle_z 	= math.rad(15.0+2),												-- 15 degrees vertical
						range				= 150,															-- [m] Shorter range, wider wash
						cool_down_t			= 0.5,
					},
					{
						typename			= "Spot", position = {0.12, 0.674, -3.7594}, 					-- Port wing leading edge
						direction			= {azimuth = math.rad(0.0), elevation = math.rad(3.0)},			-- Depressed 3 degrees
						proto				= lamp_prototypes.LFS_P_27_450,
						angle_max 			= math.rad(10.0+2),												-- 10 deg conical beam (GE 4594)
						-- range				= 600,														-- [m] Effective beam reach
						cool_down_t			= 1.25,
					},
				},
			},
			[WOLALIGHT_BEACONS] = {			-- Beacon (Red rotating beacon ventral side under pilot's seat)
				typename = "Collection",
				lights = {
					{
						typename			= "RotatingBeacon",
						position			= {-0.0285, -1.018, 0.002},										-- Ventral side under pilot's seat
						proto				= lamp_prototypes.MSL_3_2,
						color 				= {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},					-- Bright, fiery red-orange
						angular_velocity	= math.rad(180.0),
						angle_max 			= math.rad(30.0),
					},
				},
			},
			[WOLALIGHT_STROBES] = {			-- Beacon (Red rotating beacon ventral side under pilot's seat)
				typename = "Collection",
				lights = {
					{
						typename			= "RotatingBeacon",
						position			= {-0.0285, -1.018, 0.002},										-- Ventral side under pilot's seat
						proto				= lamp_prototypes.MSL_3_2,
						color 				= {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},					-- Bright, fiery red-orange
						angular_velocity	= math.rad(180.0),
						angle_max 			= math.rad(30.0),
					},
				},
			},
		},
	},
}