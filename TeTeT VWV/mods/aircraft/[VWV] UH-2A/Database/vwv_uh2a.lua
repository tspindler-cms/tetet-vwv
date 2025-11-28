return {
	Name 				=   'vwv_uh2a',
	DisplayName			= _('[VWV] UH-2A Seasprite'),
	DisplayNameShort	= _('UH-2A'),

	Picture 			=  current_mod_path..'/Textures/sh_2c_f.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "uh2a_dcs",

	shape_table_data 	=
	{
		{
			file  	 = 'uh2a_dcs';
			life  	 = 5; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = ''; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destroyed: 300sec 2m
			username = 'uh2a_dcs';
			index    =  WSTYPE_PLACEHOLDER;
            classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap = true;
		},
		{
			name  = "";
			file  = "";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000020",
	attribute  			= {wsType_Air, wsType_Helicopter, wsType_Battleplane, WSTYPE_PLACEHOLDER ,"Attack helicopters",},
	Categories 			= {"{828CEADE-3F1D-40aa-93CE-8CDB73FE2710}", "Helicopter",},

    -- TeTeT: Copied and adjusted from UH-1 core config
    -- adjustments from https://en.wikipedia.org/wiki/Kaman_SH-2_Seasprite or model
    length	= 11.68, --	17.62,
    height	= 4.14, --	4.41,
    rotor_height	= 3.47, --	2.091,
    rotor_diameter	= 12.69, --	14.7,
    blades_number	=	4,
    blade_area	=	6.2,
    rotor_RPM	=	324,
    engines_count	=	2,
    blade_chord	=	0.534,
    rotor_MOI	=	3000,
    rotor_pos = 	{0,	2.44,	0},
    thrust_correction	=	0.75,
    fuselage_Cxa0	=	0.47,
    fuselage_Cxa90	=	5.9,
    fuselage_area	=	5,
    centering	=	-0.1,
    tail_pos = 	{-8.525,	2.114,	0},
    tail_fin_area	=	1.2,
    tail_stab_area	=	1.7,
    M_empty	= 3193, --	2883,
    M_nominal	=	3158,
    M_max	=	4310,
    MOI = 	{2600,	12443,	13197},
    M_fuel_max	=	631,
    V_max	=	240,
    V_max_cruise	=	204,
    Vy_max	=	6.1,
    H_stat_max_L	=	2150,
    H_stat_max	=	1850,
    H_din_two_eng	=	3840,
    H_din_one_eng	=	1900,
    range	= 680, --	510,
    flight_time_typical	=	150,
    flight_time_maximum	=	192,
--    main_gear_pos = 	{-0.458,	-1.577,	1.332},
--    nose_gear_pos = 	{1.714,	-1.636,	1.33},
	nose_gear_pos 				= { -2.681, -1.70,	0}, -- nosegear coord
	main_gear_pos 				= {  2.113, -1.70,  1.114}, -- main gear coords

    lead_stock_main	=	-0.1,
    lead_stock_support	=	-0.1,
    stores_number	=	4,
    scheme	=	0,
    fire_rate	=	0,

    crew_members =
    {
        [1] =
        {
            ejection_seat_name	=	0,
            drop_canopy_name	=	0,
            pos = 	{2.3,0,	-0.5},
            canopy_args = {38, 1.0, 43, 5.0, 44, 5.0, 459, 10.0, 460, 1.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
            pilot_body_arg = 50,
            role = "pilot" -- left seat
        }, -- end of [1]
        [2] =
        {
            ejection_seat_name	=	0,
            drop_canopy_name	=	0,
            pos = 	{2.3,0,	 0.5},
            canopy_arg = 38,
            canopy_args = {38, 1.0, 43, 5.0, 44, 5.0, 459, 1.0, 460, 10.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
            pilot_body_arg = 472,
            role = "copilot" -- right seat
        }, -- end of [2]
        [3] =
        {
            ejection_seat_name	=	0,
            drop_canopy_name	=	0,
            pos = 	{2.3,0,	 0.5},
            canopy_arg = 38,
            canopy_args = {38, 1.0, 43, 5.0, 44, 5.0, 459, 1.0, 460, 10.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
            pilot_body_arg = 473,
            role = "flight_officer" -- back seat
        }, -- end of [3]
    },
    --[[
    carried_members =
    {
        [1] = {
            canopy_args = {38, 0.5, 43, 5.0, 44, 5.0, 459, 10.0, 460, 1.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
        },
        [2] = {
            canopy_args = {38, 0.5, 43, 5.0, 44, 5.0, 459, 1.0, 460, 10.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
        },
    },
    ]]
    mechanimations = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 1.0, "in", 2.0},},},}, Flags = {"Reversible"},},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 2.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
        },
      --  Door1 = {DuplicateOf = "Door0"},
    }, -- end of mechanimations


Pylons =     {
        pylon(1, 0, 0.00, 0.00, 0.00,
             {use_full_connector_position = true, connector = "Pylon_1",
             FiX = 0, FiY = 0, FiZ = 0},
            {
                { CLSID = "{UH2A_FUEL_TANK_120R}" , connector = "Pylon_1", attach_point_position = {0.0, 0.0, 0}}
            }
        ),
        pylon(2, 0, 0.00, 0.00, 0.00,
             {use_full_connector_position = true, connector = "Pylon_2",
             FiX = 0, FiY = 0, FiZ = 0},
            {
                { CLSID = "{UH2A_FUEL_TANK_120L}" , connector = "Pylon_2", attach_point_position = {0.0, 0.0, 0}}
            }
        ),

    },


    RCS	=	10,
    detection_range_max	=	11,
    IR_emission_coeff	=	0.2,
    Vy_land_max	=	12.8,
    Ny_max	=	1.7,
    radar_can_see_ground	=	true,
    sound_name	=	"Aircrafts/Engines/RotorSH3",
    engine_data =
    {
        power_take_off	=	1044,
        power_max	=	1044,
        power_WEP	=	1044,
        power_TH_k =
        {
            [1] = 	{-1.8859,	17.806,	1030},
            [2] = 	{-2.2584,	20.573,	1030},
            [3] = 	{-0.9078,	-3.1185,	1051.6},
            [4] = 	{-0.2853,	-0.614,	786.19},
        }, -- end of power_TH_k
        SFC_k = 	{0,	-0.000312128,	0.63},
        power_RPM_k = 	{-0.0778,	0.2506,	0.8099},
        power_RPM_min	=	9.1384,
        sound_name	=	"Aircrafts/Engines/EngineGE",
    }, -- end of engine_data
    cannon_sight_type	=	0,
    fires_pos =
    {
        [1] = 	{0,	0.7,	0},
        [2] = 	{-0.6,	1.1,	0},
        [3] = 	{0,	0,	0},
        [4] = 	{-6.8,	0.8,	0},
        [5] = 	{-0.623,	-0.746,	0},
        [6] = 	{0,	0,	0},
        [7] = 	{0,	0,	0},
        [8] = 	{0,	0,	0},
        [9] = 	{0,	0,	0},
        [10] = 	{0,	0,	0},
        [11] = 	{0,	0,	0},
    }, -- end of fires_pos

    chaff_flare_dispenser =
    {
        [1] =
        {
            dir = 	{-0.98,	-0.174,	-0.087},
            pos = 	{-7.7,	-0.25,	-0.5},
        }, -- end of [1]
        [2] =
        {
            dir = 	{-0.98,	-0.174,	0.087},
            pos = 	{-7.7,	-0.25,	0.5},
        }, -- end of [2]
    }, -- end of chaff_flare_dispenser

    cargo_max_weight = 5000, -- maximum weight of extended cargo
    cargo_radius_in_menu = 2000, -- radius, when cargo displays in menu
    helicopter_hook_pos={0.0, -0.84, 0.0},
    h_max_gear_hook=2.4,

    AddPropAircraft = {
        {
            id = "FoldRotor",
            control = 'checkbox' ,
            label = _('Fold Main Rotor'),
            defValue = false,
            weightWhenOn = 0,
            arg = 8,
            wCtrl = 150
        }
    },

    rotor_animation = {
        rotor_locations = {
            {pos = { 0.5824, 1.7843, 0.0}, pitch = -0.01},
        },
        rotor_models = {
            {
                modelRotorHub_EDM       = "vwv_uh2a_rotorhub",
                modelRotorHubLod_FBX    = "/models/vwv_uh2a_rotorhub_lod.fbx",
                boundRotorHub_FBX       = "/models/vwv_sh2f_rotorhub_front_bound.fbx",
                boundBlade_FBX          = "/models/vwv_sh2f_blade_bound.fbx",
                modelBlade_FBX          = {"/models/vwv_sh2f_blade.fbx"},
            },
        },
        tail_rotor = {
				blades_count	= 3,
				modelBlade_FBX	= "/models/vwv_sh2f_tail_blade.fbx",
				rotor_direction	= -1,
				rotor_locations = {{pos = {-7.2187, 1.4516, -0.4933}, pitch = 0.0, yaw = math.rad(90)}},
        },
    },

    -- TeTeT: additional settings
	Tasks = {
        aircraft_task(Transport),
        aircraft_task(Reconnaissance),
    },
    DefaultTask = aircraft_task(Transport),
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

};
