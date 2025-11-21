-- base taken from O-1 Bird Dog, adjusted by E-3 and C-130 values
return
{
	Name 				=   'vwv_ec-121',
	DisplayName			= _('[VWV] EC-121 Warning Star'),
	DisplayNameShort    = _('EC-121'),

	HumanCockpit 		= false,

	Picture 			= current_mod_path..'/Textures/ec121_warning_star.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "ec121",
	propellorShapeType  = "3ARG_PROC_BLUR",
    propellorShapeName  = "ec121_blade.fbx",
	shape_table_data 	=
	{
		{
			file  	 = "ec121";
			life  	 = 150; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = "ec121_collision"; -- Name of destroyed object file name
			fire  	 = { 500, 4}; -- Fire on the ground after destoyed: 500sec 4m
			username = "ec121";
			index    =  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "ec121_collision";
			file  = "ec121_collision";
			fire  = { 500, 4};
		},
	},
	mapclasskey = "P0091000056",
	attribute = {wsType_Air, wsType_Airplane, wsType_Cruiser, WSTYPE_PLACEHOLDER, "AWACS", "All", "NonAndLightArmoredUnits", "NonArmoredUnits", "Air", "Planes"},
	Categories = { {
					CLSID = "{D2BC159C-5B7D-40cf-92CD-44DF3E99FAA9}",
					Name = "AWACS"
	} },
	-- propellorShapeType = "3ARG_PROC_BLUR",

	-------------------------
	M_empty 					= 31387,
	M_nominal 					= 42000,
	M_max 						= 60000,
	M_fuel_max 					= 30000,
	MaxFuelWeight = "30000",
	defFuelRatio = 0.5,
	length 						= 35.40,
	height 						= 7.54,
	wing_area 					= 153.27,
	wing_span 					= 38.45,
	wing_type 					= 0,
	wing_tip_pos 				= {-2.1478,	1.114, 18.5182}, -- wingtip coords for visual effects

	nose_gear_pos				= {14.6869, -3.483, 0},
	main_gear_pos 				= {1.6139, -3.6688, 4.1448},
	tand_gear_max 				= 0.60,  -------- distance between main gears in m

	nose_gear_wheel_diameter 	= 0.755, -- in m
	main_gear_wheel_diameter 	= 1.342, -- in m
	stores_number				= 0,
	V_opt 						= 220,
	V_take_off 					= 61,
	V_land 						= 58,
	V_max_sea_level 			= 130,
	V_max_h 					= 150,
	Vy_max 						= 6,
	Mach_max 					= 0.5,
	H_max 					 	= 12000, -- m
	Ny_min 						= -0.5, -- Min G (for AI)
	Ny_max 						= 1.2	,  -- Max G (for AI)
	Ny_max_e 					= 2.6,  -- Max G (for AI)
	AOA_take_off 				= 0.17, -- AoA in take off (for AI)
	bank_angle_max 				= 10, -- 10, -- Max bank angle (for AI)
	average_fuel_consumption 	= 0.01, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	range 						= 6843, -- Max range in km (for AI)
	CAS_min 					= 72, -- if this is not OVERAL FLIGHT TIME, but jus LOITER TIME, than it sholud be 10-15 minutes.....CAS capability in minute (for AI)
	thrust_sum_max 				= 40000, -- 44400, -- C-130
	thrust_sum_ab 				= 40000, -- 44400,
	has_afteburner 				= false, -- AFB yes/no
	has_speedbrake 				= false, -- Speedbrake yes/no
	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
	flaps_maneuver 				= 0.5, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords
	RCS 						= 10, -- Radar Cross Section m2
	IR_emission_coeff 			= 1.5, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
	IR_emission_coeff_ab 		= 0, -- With afterburner
	engines_count				= 4, -- Engines count
	engines_startup_sequence = { 2, 1, 0, 3 },
	sound_name	=	"Aircrafts/Engines/RollsRoyceMerlin/Engine",

	engines_nozzles = {
		[1] =
		{
			pos =     {4.0,  0, -9.0}, -- nozzle coords forward/back,up/down,left/right
            elevation    =    0.0, -- AFB cone elevation
            diameter    =    0.0, -- AFB cone diameter
            exhaust_length_ab    =    -3, -- lenght in m
            exhaust_length_ab_K    =   0.607, -- AB animation
            smokiness_level     =     0.05,
			engine_number = 1
		},
		[2] =
		{
			pos =     {4.55,  0, -4.2}, -- nozzle coords forward/back,up/down,left/right
            elevation    =    0.0, -- AFB cone elevation
            diameter    =    0.0, -- AFB cone diameter
            exhaust_length_ab    =    -3, -- lenght in m
            exhaust_length_ab_K    =   0.607, -- AB animation
            smokiness_level     =     0.05,
			engine_number = 2
		},
		[3] =
		{
			pos =     {4.55,  0, 4.2}, -- nozzle coords forward/back,up/down,left/right
            elevation    =    0.0, -- AFB cone elevation
            diameter    =    0.0, -- AFB cone diameter
            exhaust_length_ab    =    3, -- lenght in m
            exhaust_length_ab_K    =    0.607, -- AB animation
            smokiness_level     =     0.05,
			engine_number = 3
		},
		[4] =
		{
			pos =     {4.0,  0, 9.0}, -- nozzle coords forward/back,up/down,left/right
            elevation    =    0.0, -- AFB cone elevation
            diameter    =    0.0, -- AFB cone diameter
            exhaust_length_ab    =    3, -- lenght in m
            exhaust_length_ab_K    =    0.607, -- AB animation
            smokiness_level     =     0.05,
			engine_number = 4
		},
	}, -- end of engines_nozzles
--------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--  equipaggio
---------------------------------------------------------------------------------

	crew_size	 = 1,
	crew_members =
	{
			[1] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
			}, -- end of [1]
	}, -- end of crew_members

	fires_pos =
	{
		[1] = 	{1.1, 1.7, 0.8},
		[2] = 	{1.1, 1.3, 0.9},
		[3] = 	{1.2, 1.2, 2.2},
		[4] = 	{1.2, 2.265, 2.3},
		[5] = 	{1.2, 2.5, 0},
		[6] = 	{1.2,	2.2, 0.5},
		[7] = 	{-7.3, 0.95, 0},
	}, -- end of fires_pos

	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0,
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0,
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,
	chaff_flare_dispenser 	=
	{
	}, -- end of chaff_flare_dispenser

	--sensors
	detection_range_max		 = 500,
	radar_can_see_ground 	 = true, -- this should be examined (what is this exactly?)
	CanopyGeometry =
	{
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = {
			RADAR = "AN/APY-1",
			RWR = "Abstract RWR"
	},
	HumanRadio =
	{
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},

	Guns =
	{
    },

	Pylons =  {
	},

	Tasks = {
		aircraft_task(AWACS),
    },
	DefaultTask = aircraft_task(AWACS),
	-- C-130 data
	SFM_Data = {
		aerodynamics = {
			Cy0 = 0,
			Czbe = -0.012,
			Mzalfa = 6.6,
			Mzalfadt = 1,
			cx_brk = 0.06,
			cx_flap = 0.08,
			cx_gear = 0.015,
			cy_flap = 1.2,
			kjx = 2.85,
			kjz = 0.00125,
			table_data = {
				{ 0,   0.024, 0.1, 0.0384, 1e-06, 0.5, 20, 0.9 },
				{ 0.2, 0.024, 0.1, 0.0384, 1e-06, 1.5, 20, 1.05 },
				{ 0.4, 0.024, 0.1, 0.0384, 1e-06, 2.5, 20, 1.2 },
				{ 0.5, 0.024, 0.1, 0.0384, 1e-06, 2.5, 20, 1.2 },
				{ 0.6, 0.027, 0.1, 0.0000, 0.3,   3.5, 20, 1.2 },
				{ 0.7, 0.031, 0.1, 0.0450, 0.9,   3.5, 20, 1.0 },
				{ 0.8, 0.036, 0.1, 0.1070, 1.0,   3.5, 20, 0.8 },
				{ 0.9, 0.045, 0.1, 0.1480, 0.058, 3.5, 20, 0.6 },
				{ 1.0, 0.054, 0.1, 0.1990, 0.10,  3.5, 20, 0.53333333333333 },
				{ 1.5, 0.054, 0.1, 0.1990, 0.10,  3.5, 20, 0.2 },
			},
		},
		-- basically from B-17G merged with table_data from C-130...
		engine = {
			D_prop = 3.53,
			Displ = 29.87,
			ForsRUD = 1,
			Init_Mom = 220,
			MAX_Manifold_P_1 = 420000,
			MAX_Manifold_P_2 = 418000,
			MAX_Manifold_P_3 = 500000,
			MOI_prop = 29,
			MaksRUD = 1,
			MaxRUD = 1,
			MinRUD = 0,
			N_fr_0 = 0.072,
			N_fr_1 = 0.02,
			N_indic_0 = 1523040,  -- great influence on the traction force, the bigger the stronger
			Nmg = 27.272727272727, -- RPM at idle
			Nominal_RPM = 2200,
			Nu_0 = 1.35,   -- was 1.2
			Nu_1 = 1.0,    -- was 0.91
			Nu_2 = 0.001,
			P_oil = 495438,
			Shutdown_Duration = 4.8,
			Startup_Ignition_Time = 3.5,
			Startup_Prework = 12,
			Startup_RPMs = { { 0, 0 }, { 1, 66 }, { 2.99, 66 }, { 3, 85 }, { 4, 600 } },
			Stroke = 0.175,
			V_pist_0 = 12,
			cefor = 0.37, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cemax = 0.37, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cylinder_firing_order = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
			dcx_eng = 0.013, -- 0.015,  -- Engine drag coeficient
			dpdh_f = 1800,  --  altitude coefficient for AB thrust
			dpdh_m = 1800, --  altitude coefficient for max thrust
			hMaxEng = 12.5, -- Max altitude for safe engine operation in km
			k_Eps = 6,  -- great influence on the traction force, the less the stronger the force
			k_adiab_1 = 0.029,
			k_adiab_2 = 0.0562,
			k_after_cool = 0.49,
			k_boost = 3,
			k_cfug = 0.003,
			k_gearbox = 1.778,
			k_oil = 4e-05,
			k_piston = 3300, -- 3000,
			k_reg = 0.003,
			k_vel = 0.017,
			type = "Radial",
			-- propeller custom data for EC-121
			-- prop_direction      = -1,   -- pos rotates cw looking fwd neg is ccw
			prop_pitch_min		= 23.0,	-- prop pitch min, degrees
			prop_pitch_max		= 65.0,	-- prop pitch max, degrees
			prop_pitch_feather	= 91.0,	-- prop pitch feather position, degrees if feather < prop_pitch_max no feathering available
			prop_blades_count   = 3,
			prop_locations      = {
				{5.9, -0.37, -9.09}, {0.0, 0.0, 0.0},
				{6.5, -0.85, -4.12}, {0.0, 0.0, 0.0},
				{6.5, -0.85, 4.12}, {0.0, 0.0, 0.0},
				{5.9, -0.37, 9.09}, {0.0, 0.0, 0.0},
			},
			-- scaled-up power curve (+60%)
			table_data = {
				{ 0.0, 482534, 482534 },
				{ 0.1, 474520, 474520 },
				{ 0.2, 395300, 395300 },
				{ 0.3, 332165, 332165 },
				{ 0.4, 280149, 280149 },
				{ 0.5, 229467, 229467 },
				{ 0.6, 187067, 187067 },
				{ 0.7, 155599, 155599 },
				{ 0.8, 132604, 132604 },
				{ 0.9, 105600, 105600 },
			},
		},
	},

--[[
To break the entries down:

eg oh58d_cells_properties[0] = {critical_damage = 4, args = {161},deps_cells = {11,12},droppable=false}
   ----------green------- loc   ----------red------  ---blue----  ------yellow--------
Green is the model name and part# as referenced in the list at top of the damage.lua

Red, amount of damage it can sustain before something falls off or
you get shot down. Some parts will have an extra section named deps_cells,
I think these parts fall off when the particular part reaches its critical
damage amount unless droppable = false.
Blue is 3D model argument # of the damage part
Yellow is the damage cells affected by damage on this location
	--]]
----------------------------------------------------------------------------------------------------
---  Damage Section
-----------------------------------------------------------------------------------------------------

	Failures = {
	},

    -- Blueprint taken from Damage.lua of ED, Fencer (Scripts/Aircraft/_Common/Damage.lua)
	Damage = verbose_to_dmg_properties({
		["COCKPIT"]				= {critical_damage = 2, args =  { 65}},
		["NOSE_CENTER"]			= {critical_damage = 3, args =  {146}},

		["WING_L_OUT"]			= {critical_damage = 10,args =  {223},deps_cells = {"FLAP_L_IN","WING_L_PART_OUT"}},
		["WING_R_OUT"]			= {critical_damage = 10,args =  {213},deps_cells = {"FLAP_R_IN","WING_R_PART_OUT"}},
		["WING_L_PART_OUT"]		= {critical_damage = 3, args =  {221}},
		["WING_R_PART_OUT"]		= {critical_damage = 3, args =  {231}},
		["FLAP_L_IN"]			= {critical_damage = 4, args =  {227}},
		["FLAP_R_IN"]			= {critical_damage = 4, args =  {217}},

		["FUSELAGE_BOTTOM"]		= {critical_damage = 8, args =  {152}},
		["FUSELAGE_CENTR_TOP"]	= {critical_damage = 8, args =  {151}},
		["FUSELAGE_CENTR_L"]	= {critical_damage = 4, args =  {154}},
		["FUSELAGE_CENTR_R"]	= {critical_damage = 4, args =  {153}},

		["FIN_TOP"]				= {critical_damage = 4, args =  {244}},
		["RUDDER"]				= {critical_damage = 2, args =  {247}},

		["ENGINE_L"]			= {critical_damage = 4, args =  {167}},
		["ENGINE_R"]			= {critical_damage = 4, args =  {161}},

		["STABILIZER_L_IN"]		= {critical_damage = 3, args =  {235}},
		["STABILIZER_R_IN"]		= {critical_damage = 3, args =  {233}},
		["wheel_front"]     = {critical_damage = 1},
		["wheel_left"]      = {critical_damage = 1},
		["wheel_right"]     = {critical_damage = 1},
	}),


	DamageParts =
	{
	},

----------------------------------------------------------------------------------------------------
---  End Damage Section
-----------------------------------------------------------------------------------------------------
    lights_data = {
        typename = "Collection",
        lights = {
            [WOLALIGHT_LANDING_LIGHTS] = {
                typename = "Collection",
                lights = {
					{typename = "strobelight", connector = "EC-121 Light Collison White Top", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
					{typename = "strobelight", connector = "EC-121 Light Collison White Bottom", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
                },
            },
            [WOLALIGHT_TAXI_LIGHTS] = {
                typename = "Collection",
                lights = {
					{typename = "strobelight", connector = "EC-121 Light Collison White Top", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
					{typename = "strobelight", connector = "EC-121 Light Collison White Bottom", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
                },
            },
            [WOLALIGHT_NAVLIGHTS] = {
                typename = "Collection",
                lights = {
				    {typename = "strobelight", connector = "EC-121 Light Nav Green", argument = 193, period = 1.01, phase_shift = 0.5, color = {0,0.8,0}},
					{typename = "strobelight", connector = "EC-121 Light Nav Red", argument = 193, period = 1.01, phase_shift = 0.5, color = {0.8,0,0}},
					{typename = "strobelight", connector = "EC-121 Light Nav White", argument = 193, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
					{typename = "omnilight", connector = "EC-121 Light Nav Green Omni", argument = 193, color = {0,0.8,0}},
					{typename = "omnilight", connector = "EC-121 Light Nav Red Omni", argument = 193, color = {0.8,0,0}},
					{typename = "omnilight", connector = "EC-121 Light Nav White Omni", argument = 193, color = {0.1,0.1,0.1}},
                },
            },
		}
	},

}
