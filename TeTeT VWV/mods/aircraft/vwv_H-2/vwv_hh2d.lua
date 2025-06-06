vwv_hh2d =  {

	Name             = "vwv_hh2d",
	DisplayName      = _("[VWV] HH-2D Seasprite"),
	DisplayNameShort = _("HH-2D"),
	--HumanCockpit 		= false,
	--HumanCockpitPath    = current_mod_path.."/Cockpit/",

	Picture 			=  current_mod_path.."/Textures/sh_2c_f.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "sh_2c_f",

	shape_table_data 	=
	{
		{
			file  	 = "sh_2c_f";
			life  	 = 5; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = "kaman_h2_desrt"; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destroyed: 300sec 2m
			username = "sh_2c_f";
			index    =  WSTYPE_PLACEHOLDER;
            classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap = true;
		},
		{
			name  = "kaman_h2_desrt";
			file  = "kaman_h2_desrt";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000021",
	attribute  			= {wsType_Air, wsType_Helicopter, wsType_Battleplane, WSTYPE_PLACEHOLDER ,"Attack helicopters",},
	Categories 			= {"{828CEADE-3F1D-40aa-93CE-8CDB73FE2710}", "Helicopter",},

----------------------------------------

		length			=	18.654,
		height			=	4.893,
		rotor_height		=	1.791,
		rotor_diameter		=	16.4,
		blades_number		=	4,
		blade_area		=	3.48,
		rotor_RPM		=	258,
		engines_count		=	2,
		apu_rpm_delay_ = 2,
		blade_chord		=	0.53,
		rotor_MOI		=	8700,
		rotor_pos 		= 	{0, 1.646, 0},
		thrust_correction	=	0.75,
		fuselage_Cxa0		=	0.45,
		fuselage_Cxa90		=	5.9,
		fuselage_area		=	4.9,
		centering		=	-0.09,
		tail_pos 		= 	{-10.042, 1.76, 0},
		tail_fin_area		=	4.75,
		tail_stab_area		=	2.94,
		M_empty	= 8030,
		M_nominal =	9800,
		M_max =	11900,
		MOI = {12000, 35000, 40000},
		M_fuel_max		=	1100,
		V_max			=	295.0,
		V_max_cruise		=	270.0,
		Vy_max			=	8.5,
		H_stat_max_L		=	4170,
		H_stat_max		=	3170,
		H_din_two_eng		=	5790,
		H_din_one_eng		=	2900,
		range			=	600,
		flight_time_typical	=	110,
		flight_time_maximum	=	138,

	nose_gear_pos 				= { -2.681, -1.70,	0}, -- nosegear coord
	main_gear_pos 				= {  2.113, -1.70,   1.114}, -- main gear coords
-----------------------------------------------------------
	lead_stock_main	=	-0.1,
	lead_stock_support	=	-0.1,
	stores_number	=	4,
	scheme	=	1,
	fire_rate	=	625,
	crew_size	=	2,
	crew_members =
	{
		[1] =
		{
			ejection_seat_name	=	0,
			drop_canopy_name	=	0,
			pos = {2.5, 0.0, -1.3},
		}, -- end of [1]
		[2] =
		{
			ejection_seat_name	=	0,
			drop_canopy_name	=	0,
			pos = {2.5, 0.0, 1.3},
			canopy_arg = 38,
		}, -- end of [2]
	}, -- end of crew_members

	LandRWCategories =
    {
        [1] =
        {
           Name = "HelicopterCarrier",
        },
        [2] =
        {
           Name = "AircraftCarrier",
        },
        [3] =
        {
            Name = "AircraftCarrier With Catapult",
        },
        [4] =
        {
            Name = "AircraftCarrier With Tramplin",
        },
    },

	TakeOffRWCategories =
    {
        [1] =
        {
            Name = "HelicopterCarrier",
        },
        [2] =
        {
           Name = "AircraftCarrier",
        },
        [3] =
        {
            Name = "AircraftCarrier With Catapult",
        },
        [4] =
        {
            Name = "AircraftCarrier With Tramplin",
        },
    },

	takeoff_and_landing_type = "VTOL",

	RCS	=	7,
	IR_emission_coeff	=	0.72,
	Vy_land_max	=	12.8,
	Ny_max	=	2.5,
	sound_name	=	"Aircrafts/Engines/RotorAH1W",
	engine_data =
	{
		power_take_off	=	1148,
		power_max	=	1263,
		power_WEP	=	1263,
		power_TH_k =
		{
			[1] = 	{6.1988,	-154.38,	1319.2},
			[2] = 	{7.3972,	-166.85,	1354.6},
			[3] = 	{-1.3775,	-103.72,	1292.3},
			[4] = 	{-3.0581,	-51.096,	1058.7},
		}, -- end of power_TH_k
		SFC_k = 	{0,	-5.899e-005,	0.3759},
		power_RPM_k = 	{-0.0778,	0.2506,	0.8099},
		power_RPM_min	=	9.1384,
		sound_name	=	"Aircrafts/Engines/EngineGE",
	}, -- end of engine_data
----	cannon_sight_type	=	1,  ---- valore originale
	cannon_sight_type	=	2,  ---- valore modificato come nell'Apache
	fires_pos =
	{
		[1] = 	{0,	0,	0},
		[2] = 	{-1.32,	0,	-0.46},
		[3] = 	{-1.32,	0,	0.46},
		[4] = 	{-7.12,	-0.47,	0},
		[5] = 	{1.053,	-1.32,	0},
		[6] = 	{-0.45,	-1.32,	0},
		[7] = 	{0,	0,	0},
		[8] = 	{0,	0,	0},
		[9] = 	{0,	0,	0},
		[10] = 	{0,	0,	0},
		[11] = 	{0,	0,	0},
	}, -- end of fires_pos

	-- Countermeasures, ALE-39, typical 30 Chaff; 30 Flares (60)
	SingleChargeTotal = 60,
	CMDS_Incrementation = 30,
	ChaffDefault = 30,
	ChaffChargeSize = 1,
	FlareDefault = 30,
	FlareChargeSize = 1,
	CMDS_Edit = true,


	chaff_flare_dispenser 	= {
		[1] =
		{
			dir =  {0, 1, -1},
			pos =  {-3, -1, 2},
		}, -- end of [1]
		[2] =
		{
			dir =  {0, 1, 1},
			pos =  {-3, -1, -2},
		}, -- end of [2]
	}, -- end of chaff_flare_dispenser

	engines_nozzles =
    {
            [1] =
            {
                pos         =  { -7.027, 1.165, 1.563}, -- nozzle coords
                azimuth = 15,
                smokiness_level = 0.1,
                exhaust_length_ab_K    =    0.3,
            },

            [2] =
            {
                pos         =  { -7.027, 1.165, -1.563}, -- nozzle coords
                azimuth = -15,
                smokiness_level = 0.1,
                exhaust_length_ab_K    =    0.3,
            },


    }, -- end of engines_nozzles
	net_animation =
	{
        0,
        1,
        2,
        3,
        4,
        5,
        6,
		9, --collective
		11, -- stick roll
		15, --stick pitch
		37,-- main rotor spin
		14, -- stab
		900, -- rotor blur
		22, -- probe
		122, -- probe extension
		123, -- esss
	},

	--sensors
	detection_range_max		 = 20,
	radar_can_see_ground 	 = true, -- this should be examined (what is this exactly?)

	undercarriage_movement   = 2, -- with value 2 DCS will use mechanimated gears, other values - default
--        Crew = 2,
    CanopyGeometry = {
            azimuth = {-165.0, 165.0},
            elevation = {-85.0, 90.0}
    },

    Sensors = {
		RWR = "Abstract RWR", -- RWR type
		RADAR = "Tornado SS radar", -- Radar type
		OPTIC = {"long-range naval optics", "long-range naval FLIR", "long-range naval LLTV"},
	},

	Failures = {
		{ id = 'hydro_main',  		label = _('HYDRO MAIN'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'hydro_common',  	label = _('HYDRO COMMON'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'l_engine',  		label = _('L-ENGINE'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'r_engine',  		label = _('R-ENGINE'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'asc_p',  		label = _('ASC PITCH'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'asc_r',  		label = _('ASC ROLL'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'asc_y',  		label = _('ASC YAW'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'asc_a',  		label = _('ASC ALT'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'abris_software',	label = _('ABRIS SOFTWARE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'abris_hardware',	label = _('ABRIS HARDWARE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'laser_failure' ,	label = _('LASER FAILURE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
    },

	Pylons = {

		pylon(1, 0, 0, 0.0000, 0.0000,{use_full_connector_position = false, connector = "Pylon_1",
			  FiX = 0, FiY = 0, FiZ = 5},
			{
				{ CLSID = "{DFT-150gal}", attach_point_position = {-0.3, 0.08, 0}, connector = "Pylon_1" },
				-- { CLSID = "{US_108GAL_PAPER_FUEL_TANK}", attach_point_position = {-0.3, 0.08, 0}, connector = "Pylon_1" },
				{ CLSID = "{US_108GAL_PAPER_FUEL_TANK}", attach_point_position = {-0.455, -0.197, 0.200}, connector = "Pylon_1" },
				-- { CLSID = "SPITFIRE_45GAL_TORPEDO_TANK", attach_point_position = {-0.555, -0.197, 0.200}, connector = "Pylon_1" },
			}
		),
		pylon(2, 0, -2.605000, -0.3800, 1.5800,{use_full_connector_position = false, connector = "Pylon_2"},
			{
			}
		),
		pylon(3, 0, -4.005000, 0.0000, 0.0000,{use_full_connector_position = false, connector = "Pylon_3"},
			{
			}
		),
		pylon(4, 0, -4.005000, 0.0000, 0.0000,{use_full_connector_position = false, connector = "Pylon_4",
			  FiX = 0, FiY = 0, FiZ = 5},
			{
				{ CLSID = "{DFT-150gal}", attach_point_position = {-0.3, 0.10, 0}, connector = "Pylon_4" },
				-- { CLSID = "{US_108GAL_PAPER_FUEL_TANK}", attach_point_position = {-0.3, 0.12, 0}, connector = "Pylon_4" },
				{ CLSID = "{US_108GAL_PAPER_FUEL_TANK}", attach_point_position = {-0.460, -0.194, -0.200}, connector = "Pylon_4" },
				-- { CLSID = "SPITFIRE_45GAL_TORPEDO_TANK", attach_point_position = {-0.560, -0.194, -0.200}, connector = "Pylon_4" },
			}
		),
		pylon(5, 0, -4.005000, -0.38, 0.0000,
		      {arg = 202, arg_value = 0, use_full_connector_position = false, connector = "Pylon_5"},
			{
				-- { CLSID = "{AIRBORNE_MI8}", attach_point_position = {1.00,-0.10, 0.00, } },
				-- { CLSID = "CABLE_MH6", arg_value = 1, attach_point_position = {0.00, 1.00 ,0.00  } },
				-- { CLSID = "suspended_soldier", arg_value = 1, attach_point_position = {-0.10, -4.20 ,-0.18  } },
				-- { CLSID = "stretcher_sling", arg_value = 1, attach_point_position = {-0.10, -4.20 ,-0.18  } },
				{ CLSID = "ab-212_cable", arg_value = 1, attach_point_position = {0.00, 0.75 ,0.00  } },
				{ CLSID = "rescue_crew_sling", arg_value = 1, attach_point_position = {1.22, -2, -1.15} },
				{ CLSID = "uscg_stretcher", arg_value = 1, attach_point_position = {-0.03, -2.55, -0.05} },
			}
		),
	},

----------------------------------------------------------------------------------------------

		Tasks = {
        aircraft_task(Escort),
        aircraft_task(GroundAttack),
        aircraft_task(CAS),
        aircraft_task(AFAC),
        aircraft_task(AntishipStrike),
    },
    DefaultTask = aircraft_task(AntishipStrike),

	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
---------------------------------------------------------------------------------
--  Damage section fron Kamov KA50, reduced by ~1/3 by TeTeT
---------------------------------------------------------------------------------
	Damage = {
		[0]		= {critical_damage = 2, args = {146}},  --- NOSE_CENTER
		[3]		= {critical_damage = 10,args = {65}}  , --- COCKPIT
		[4]		= {critical_damage = 10, args = {150}}, --- CABIN_LEFT_SIDE
		[5]		= {critical_damage = 10, args = {149}}, --- CABIN_RIGHT_SIDE
		[7]		= {critical_damage = 1, args = {249}} , --- GUN
		[9]		= {critical_damage = 1, args = {154}},  --- FUSELAGE_LEFT_SIDE
		[10]	= {critical_damage = 1, args = {153}},  --- FUSELAGE_RIGHT_SIDE
		[11]	= {critical_damage = 1, args = {167}},  --- ENGINE_L
		[12]	= {critical_damage = 1, args = {161}},  --- ENGINE_R
		[15]	= {critical_damage = 2, args = {267}},  --- ??
		[16]	= {critical_damage = 2, args = {266}},  --- ??
		-- [23] 	= {critical_damage = 3, args = {214}},  --- WING_R_CENTER
		[24]	= {critical_damage = 3, args = {213}, deps_cells = {26, 60}},
		[25]	= {critical_damage = 1, args = {226}},
		[26]	= {critical_damage = 1, args = {216}},
		[29] 	= {critical_damage = 3, args = {224}},  	--- WING_L_CENTER
		[31]	= {critical_damage = 1, args = {229}},
		[32]	= {critical_damage = 1, args = {219}},
		-- [35]	= {critical_damage = 3, args = {225}, deps_cells = {29, 31, 25, 23}},
		[35]	= {critical_damage = 3, args = {225}, deps_cells = {29, 31, 25}},
		[36]	= {critical_damage = 3, args = {215}, deps_cells = {30, 32, 26, 24, 60}} ,
		[37]	= {critical_damage = 1, args = {227}},
		[38]	= {critical_damage = 1, args = {217}},
		[39]	= {critical_damage = 2,	args = {244}, deps_cells = {53}},
		[40]	= {critical_damage = 2, args = {241}, deps_cells = {54}},
		[45] 	= {critical_damage = 1,  args = {235}},  --- STABILIZER_L_OUT
		[46] 	= {critical_damage = 1,  args = {233}},   --- STABILIZER_R_OUT
		[51]	= {critical_damage = 1, args = {239}},
		[52]	= {critical_damage = 1, args = {237}},
		[53]	= {critical_damage = 1, args = {248}},
		[54]	= {critical_damage = 1, args = {247}},
		[55]	= {critical_damage = 2, args = {159}},
		[56]	= {critical_damage = 4, args = {81,159,132}}, -- Tail
		[57]	= {critical_damage = 4, args = {157}},
		[59]	= {critical_damage = 2, args = {148}},
		[60]	= {critical_damage = 1, args = {144}},
---------------- Blade from Ka50 Kamov
		[64] = {critical_damage = 2, args = {117}}, -- blade 1 in
		[67] = {critical_damage = 2, args = {120}},  -- blade 2 in
		[70] = {critical_damage = 2, args = {123}},  -- blade 3 in
		[73] = {critical_damage = 2, args = {126}}, -- blade 4 in
		[76] = {critical_damage = 2, args = {129}},  -- blade 5 in
		[79] = {critical_damage = 2, args = {132}},  -- blade 6 in (rear)
---------------- Wheel ----------------------------------------------------
		[83]	= {critical_damage = 1, args = {134}} ,-- nose wheel
		[84]	= {critical_damage = 1, args = {136}}, -- left wheel
		[85]	= {critical_damage = 1, args = {135}} ,-- right wheel
    },

	DamageParts =
	{
		[1] = "kaman_h2_Rotor", -- Rotor
		[2] = "kaman_h2_Tail", -- Tail
	},

	lights_data = {
	}
};
add_aircraft(vwv_hh2d);
