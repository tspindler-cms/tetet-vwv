return {
	Name 				=   'vwv_ch46d',
	DisplayName			= _('[VWV] CH-46D Sea Knight'),
	DisplayNameShort	= _('CH-46D'),

	Picture 			=  current_mod_path..'/Textures/sh_2c_f.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "ch46d",

	shape_table_data 	=
	{
		{
			file  	 = "ch46d";
			life  	 = 5; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = ''; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destroyed: 300sec 2m
			username = "ch46d";
			index    =  WSTYPE_PLACEHOLDER;
            classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap = true;
		},
		{
			name  = "ch46d_oblomok";
			file  = "ch46d";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000020",
    attribute   = { wsType_Air, wsType_Helicopter, wsType_Cruiser, WSTYPE_PLACEHOLDER, "Transport helicopters", "Side_approach_type", },
    Categories  = {"{828CEADE-3F1D-40aa-93CE-8CDB73FE2710}", "Helicopter",},


    -- TeTeT: Copied and adjusted from UH-1 core config
    -- adjustments from https://en.wikipedia.org/wiki/Kaman_SH-2_Seasprite or model
    length          = 13.67, -- Full length in m
    height          = 5.11, -- Height in m
    rotor_height	= 3.47, --	2.091,
    rotor_diameter	= 12.69, --	14.7,
    blades_number = 6,
    blade_area = 7,
    rotor_RPM = 265,
    tail_rotor_RPM = -265,
    blade_chord = 0.8,
    rotor_MOI = 18000, -- 26000,
    rotor_pos = { 5.095, 2.989, 0.0},
    thrust_correction = 0.8,
    fuselage_Cxa0 = 0.5,
    fuselage_Cxa90 = 5.9,
    fuselage_area = 8,
    centering = -5.25, -- -5.1415,
    tail_pos = {-5.188, 4.424, 0.0},
    tail_fin_area	=	3.45,
    tail_stab_area	=	2.94,
    MOI = {10000.0, 21000.0, 24000.0},
    -- MOI = {46000.0, 76162.0, 80778.0},
    -- MOI = {70000.0, 115000.0, 120000.0},
    -- MOI = {2600,	12443,	13197},
    V_max                       = 267,
    V_max_cruise                = 250,
    H_stat_max_L                = 3960,
    H_stat_max                  = 2765,
    H_din_two_eng               = 3100,
    H_din_one_eng               = 1600,
    flight_time_typical         = 142,
    flight_time_maximum         = 189,

    -- lead_stock for landing gear?
    lead_stock_main             = 0.265,
    lead_stock_support          = 0.265,
    scheme                      = 2,

    sound_name                  = "Aircrafts/Engines/RotorCH47",
    range = 370,

    wheel_steering_angle_max = math.rad(181.0),
    -- tand_gear_max = 2.231,

    nose_gear_pos 				= { 4.8487, -1.7728, 0 }, -- nose gear coords
    nose_gear_amortizer_direct_stroke        = 0.15,
    nose_gear_amortizer_reversal_stroke      = -0.30,
    nose_gear_amortizer_normal_weight_stroke = -0.025,
    nose_gear_wheel_diameter                 = 0.5039,

    main_gear_pos 				= { -2.84, -1.20, 1.745 }, -- main gear coords
    main_gear_amortizer_direct_stroke        = 0.15,
    main_gear_amortizer_reversal_stroke      = -0.30,
    main_gear_amortizer_normal_weight_stroke = -0.025,
    main_gear_wheel_diameter                 = 0.4898,

    stores_number	=	0,
    fire_rate	=	0,

    -- based on Wikipedia CH-46E and Sullenberger, need to get better data
    M_empty         = 5627.0, -- kg
    M_nominal       = 9700.0, -- kg
    M_max           = 10400.0, -- kg
    M_fuel_max      = 3100, -- kg

    openRamp 			= 1, -- allow task for internal cargo transportation
	InternalCargo = {
        nominalCapacity = 2000,
        maximalCapacity = 3180,
        para_unit_point = 10,
        unit_point 	  = 18,
        -- not sure what the following is about
		unit_block 	  = {0.706, 0.74},
		area 	  	  = {9.2, 1.6, 2},-- cargo bay dimensions
		far_wall_pos  = {4,-1.25,0}, -- coordinates on  point on corner of floor and centerline of far wall , together with area  it will give  geometry of cargo compartment in BCS
		deck_connector = "CARGO_VOLUME", -- volume by area to limit the movement of troops
		ramp_connector = "RAMPA_PLATFORM", -- surface of the ramp for the movement of troops
		seat_connector = "SIT_POINT", -- base for name of seat point for troops (example: "SEAT_POINT" add to use "_0_1" , "_0_2" ...)

		out_door = {
			cargo_generic = {large = true, x = -6.7, z =  0., heading = math.rad(-180),
				door_connector_name = "AIRDROP_RIGHT",
                mechanicals = {
                    close = {"CargoBayGates", "Close"},
                    deploy = {"CargoBayGates", "Hang"},
                    board = {"CargoBayGates", "Open"},
                    deployable = {{mechanism = "CargoBayGates", states = {"Open", "Hang"}}, {mechanism = "CargoBayGate0", states = {"Open", "Hang", "Board"}}, {mechanism = "CargoBayGate3", states = {"On"}},},
                    boardable = {{mechanism = "CargoBayGates", states = {"Open", "CustomStage3", "Board"}}, {mechanism = "CargoBayGate0", states = {"Open", "Board"}},},
                },
            },
		},
	},
	crew_size = 2,
	crew_stations = "HumanOrchestra",
    crew_members =
    {
        [1] =
        {
            ejection_seat_name = 0,
            drop_canopy_name = 0,
            pos = {2.3, 0, -0.5},
            pilot_body_arg = 50,
            canopy_arg = 38,
            role = "pilot"
        }, -- end of [1]
        [2] =
        {
            ejection_seat_name = 0,
            drop_canopy_name = 0,
            pos = {2.3, 0, 0.5},
            pilot_body_arg = 472,
            canopy_arg = 38,
            role = "copilot"
        }, -- end of [2]
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
        -- Copy from CH-47F
        CargoBayGates = {
            {
                Transition = {"Close", "Open"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 6.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Sleep", "for", 1.5}}},
                    {C = {{"Arg", 38, "to", 1.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.91, "speed", 0.186}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 8.0}}},
                    {C = {{"VelType", 0}, {"Arg", 85, "to", 1.0, "speed", 3.5}}},
                },
            },
            {
                Transition = {"Open", "Close"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 4.0}}},
                    {C = {{"VelType", 1}, {"Arg", 85, "to", 0.0, "speed", 0.5}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 6.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Arg", 38, "to", 0.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.0, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Close", "Hang"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 6.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Sleep", "for", 1.5}}},
                    {C = {{"Arg", 38, "to", 1.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.604, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Hang", "Close"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Arg", 38, "to", 0.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.0, "speed", 0.186}}},
                },
            },
			{
                Transition = {"Close", "CustomStage3"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 1.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Sleep", "for", 1.5}}},
                    {C = {{"Arg", 38, "to", 1.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 1.0}}},
                    {C = {{"Arg", 86, "to", 0.55, "speed", 0.186}}}
                },
            },
			{
                Transition = {"CustomStage3", "Close"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Arg", 38, "to", 0.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.0, "speed", 0.186}}},
                },
            },
			{
                Transition = {"Close", "Board"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 6.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Sleep", "for", 1.5}}},
                    {C = {{"Arg", 38, "to", 1.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.91, "speed", 0.186}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 8.0}}},
                    {C = {{"VelType", 0}, {"Arg", 85, "to", 1.0, "speed", 3.5}}},
                },
            },
            {
                Transition = {"Board", "Close"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 4.0}}},
                    {C = {{"VelType", 1}, {"Arg", 85, "to", 0.0, "speed", 0.5}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 6.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Arg", 38, "to", 0.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.0, "speed", 0.186}}},
                },
            },
        },
        CargoBayGate0 = {
            {
                Transition = {"Close", "Open"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    --{C = {{"Sleep", "for", 1.5}}},
                    {C = {{"Arg", 38, "to", 1.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.91, "speed", 0.186}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 4.0}}},
                    {C = {{"VelType", 0}, {"Arg", 85, "to", 1.0, "speed", 3.5}}},
                },
            },
            {
                Transition = {"Open", "Close"},
                Sequence = {
                    {C = {{"VelType", 1}, {"Arg", 85, "to", 0.0, "speed", 0.5}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 4.0}}},
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Arg", 38, "to", 0.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.0, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Close", "Ventilate"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                    {C = {{"Sleep", "for", 1.5}}},
                    {C = {{"Arg", 38, "to", 1.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                },
            },
            {
                Transition = {"Ventilate", "Hang"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.604, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Hang", "Board"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.91, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Board", "Open"},
                Sequence = {
                    {C = {{"PosType", -1}, {"Sleep", "for", 2.0}}},
                    {C = {{"VelType", 0}, {"Arg", 85, "to", 1.0, "speed", 3.5}}},
                },
            },
            {
                Transition = {"Open", "Board"},
                Sequence = {
                    {C = {{"VelType", 1}, {"Arg", 85, "to", 0.0, "speed", 0.5}}},
                    {C = {{"PosType", -1}, {"Sleep", "for", 2.0}}},
                },
            },
            {
                Transition = {"Board", "Hang"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.604, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Hang", "Ventilate"},
                Sequence = {
                    {C = {{"Arg", 86, "to", 0.07, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Ventilate", "Close"},
                Sequence = {
                    {C = {{"Arg", 38, "to", 0.0, "speed", 0.25}}},
                    {C = {{"Sleep", "for", 2.0}}},
                    {C = {{"Arg", 86, "to", 0.0, "speed", 0.186}}},
                },
            },
            {
                Transition = {"Any", "Open"},
                Sequence = {
                    {C = {{"Arg", 86, "set", 0.91}, {"Arg", 38, "set", 1.0}, {"Arg", 85, "set", 1.0}}},
                },
            },
            {
                Transition = {"Any", "Close"},
                Sequence = {
                    {C = {{"Arg", 85, "set", 0.0}, {"Arg", 38, "set", 0.0}, {"Arg", 86, "set", 0.0}}},
                },
            },
        },

    }, -- end of mechanimations

    Pylons =     {
    },

    RCS	=	10,
    detection_range_max	=	11,
    IR_emission_coeff	=	0.2,
    Vy_land_max	=	12.8,
    Ny_max	=	1.7,
    radar_can_see_ground	=	true,

    engines_count = 2, -- Engines count
    engines_nozzles = {
        [1] = {
            pos                 = {-4.5046, 2.042, -0.7},
            elevation           = 5.0,
            azimuth             = 8.0,
            diameter            = 0.57,
            exhaust_length_ab   = 1.0,
            exhaust_length_ab_K = 0.3,
            smokiness_level     = 0.0,
            --*afterburner_effect_texture
            --*afterburner_circles_count
            --*afterburner_circles_pos
            --*afterburner_circles_scale
            engine_number       = 1,
        }, -- end of [1]
        [2] = {
            pos                 = {-4.5046, 2.042, 0.7},
            elevation           = 5.0,
            azimuth             = -8.0,
            diameter            = 0.57,
            exhaust_length_ab   = 1.0,
            exhaust_length_ab_K = 0.3,
            smokiness_level     = 0.0,
            --*afterburner_effect_texture
            --*afterburner_circles_count
            --*afterburner_circles_pos
            --*afterburner_circles_scale
            engine_number       = 2,
        }, -- end of [2]
    }, -- end of engines_nozzles
    --*engines_startup_sequence = {0, 1},
    has_afteburner = false,

    engine_data =
    {
        power_take_off = 2200, -- 2926,
        power_max = 2400, -- 3395,
        power_WEP = 2500, -- 3395,
        --[[
        power_TH_k =
        {
            [1] = {14.007,  -383.35, 3336.5},
            [2] = {15.464,  -409.31, 3447.3},
            [3] = {-2.9802, -222.92, 3025.2},
            [4] = {-4.8014, -104.19, 2382.0},
        },
        ]]
        power_TH_k =
        {
            [1] = {  9.338 , -255.57 , 2224.33 },
            [2] = { 10.309 , -272.87 , 2298.20 },
            [3] = { -1.9868, -148.61 , 2016.80 },
            [4] = { -3.2009,  -69.46 , 1588.00 },
        },

        SFC_k = {0.0, -1.206e-005, 0.3637},
        power_RPM_k = {-0.08639, 0.24277, 0.84175},
        -- power_RPM_k = {-0.08639, 0.24277, 0.7},
        -- power_RPM_k = {-0.12, 0.25, 0.6}, -- Crashes/slows down DCS
        power_RPM_min = 9.1384,
        Nmg_Ready = 88.0,
        sound_name = "Aircrafts/Engines/EngineGE_CH47",
    },
    cannon_sight_type	=	0,
    fires_pos =
    {
        [1] = {-5.958,  1.843,  0.000}, -- "MAIN"
        [2] = {-4.883,  1.221, -0.222}, -- "ENGINE_L"
        [3] = {-4.883,  1.221,  0.222},-- "ENGINE_R"
        [4] = {-5.958,  1.843,  0.000}, -- "TAIL"
        [5] = {-0.277, -0.995, -0.612}, -- "FUEL_TANK_LEFT_SIDE"
        [6] = {-0.277, -0.995,  0.612}, -- "FUEL_TANK_RIGHT_SIDE"
    }, -- end of fires_pos

    effects_presets = {
        {effect = "HeaterExhaustSmokeTrail", preset = "KO_50"},
        {effect = "HeaterExhaustHotAir", preset = "KO_50"},
    },

    chaff_flare_dispenser =
    {
    }, -- end of chaff_flare_dispenser

    cargo_max_weight = 4500, -- maximum weight of extended cargo
    cargo_radius_in_menu = 2000, -- radius, when cargo displays in menu
    helicopter_hook_pos={0.50, -0.40, 0.0},
    h_max_gear_hook=2.4,

	Tasks = {
        aircraft_task(Transport),
        aircraft_task(Reconnaissance),
        aircraft_task(Airborne),
    },
    DefaultTask = aircraft_task(Transport),
	LandRWCategories =
	{
		[1] =
		{
			Name = "AircraftCarrier",
		}, -- end of [1]
		[2] =
		{
			Name = "HelicopterCarrier",
		}, -- end of [2]
	}, -- end of LandRWCategories
	TakeOffRWCategories =
	{
		[1] =
		{
			Name = "AircraftCarrier",
		}, -- end of [1]
		[2] =
		{
			Name = "HelicopterCarrier",
		}, -- end of [2]
	}, -- end of TakeOffRWCategories

    Damage = verbose_to_dmg_properties({
        -- Сabin
        ["COCKPIT"] = {
            args = {65}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["FUSELAGE_BOTTOM"] = {
            args = {149}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["FUSELAGE_TOP"] = {
            args = {150}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["ROTOR"] = {
            args = {151}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["TAIL_ROTOR"] = {
            args = {152}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["TAIL_BOTTOM"] = {
            args = {153}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["LEFT_GEAR_BOX"] = {
            args = {153}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["RIGHT_GEAR_BOX"] = {
            args = {154}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["WHEEL_FL"] = {
            critical_damage = 5,
            args = {267},
            construction = {durability = 10.0, skin = "Steel", spar = "Rod"},
            droppable = false,
        },
        ["WHEEL_L"] = {
            critical_damage = 5,
            args = {266},
            construction = {durability = 10.0, skin = "Steel", spar = "Rod"},
            droppable = false,
        },
        ["WHEEL_R"] = {
            critical_damage = 5,
            args = {137},
            construction = {durability = 10.0, skin = "Steel", spar = "Rod"},
            droppable = false,
        },
    }),

    DamageParts = {},
    AddPropAircraft = {},

    rotor_animation = {
        rotor_locations = {
            {pos = { 5.095, 2.989, 0.0}, pitch = -0.157079235},
            {pos = {-5.188, 4.424, 0.0}, pitch = -0.0698136985}
        },
        rotor_models = {
            --[[
                static, but works
            {
            modelRotorHub_EDM  		= "uh60l_main_rotor",
            modelRotorHubLod_FBX 	= "/models/uh60l_main_rotor_lod.fbx",
            boundRotorHub_FBX		= "/models/uh60l_main_rotor_bb.fbx",
            boundBlade_FBX			= "/models/uh60l_main_blade_bb.fbx",
            modelBlade_FBX 			=
            {
                "/models/uh60l_main_blade.fbx",
                "/models/uh60l_main_blade_damage1.fbx",
                "/models/uh60l_main_blade_damage2.fbx",
                "/models/uh60l_main_blade_damage3.fbx"
            },
            },
            ]]
            {
                -- modelRotorHub_EDM       = "CH-47F_bl1_rotor_hub",
                modelRotorHub_EDM       = "ch46d_rotor_head_front", -- works now
                -- modelRotorHubLod_FBX    = "/models/ch47f_rotor_hub_lod.FBX",
                modelRotorHubLod_FBX    = "/models/ch46d_rotor_head_front_lod.fbx", -- not textured, all black?
                -- boundRotorHub_FBX       = "/models/ch47f_rotor_hub_bound.FBX",
                boundRotorHub_FBX       = "/models/ch46d_rotor_head_front_bound.fbx",
                -- boundBlade_FBX          = "/models/ch47f_rotor_blade_bound.FBX",
                boundBlade_FBX          = "/models/ch46d_rotor_blade_bound.fbx",
                -- modelBlade_FBX          = {"/models/ch47f_rotor_blade.FBX"}, -- "/models/ch47f_rotor_blade_damage_1.FBX", "/models/ch47f_rotor_blade_damage_2.FBX" };
                modelBlade_FBX          = {"/models/ch46d_rotor_blade.fbx"},
            },
            {
                modelRotorHub_EDM       = "ch46d_rotor_head_rear",
                modelRotorHubLod_FBX    = "/models/ch46d_rotor_head_front_lod.fbx",
                boundRotorHub_FBX       = "/models/ch46d_rotor_head_front_bound.fbx",
                boundBlade_FBX          = "/models/ch46d_rotor_blade_bound.fbx",
                modelBlade_FBX          = {"/models/ch46d_rotor_blade.fbx"},
            },
        },
    },

    -- Copied from CH-47F in parts
    lights_data = {
        typename = "Collection",
        lights = {
            [WOLALIGHT_LANDING_LIGHTS] = {
                typename = "Collection",
                lights = {
                    { -- searchlight
                        typename = "Argument", argument = 209,
                        movable = true,
                    },
                },
            },
            [WOLALIGHT_TAXI_LIGHTS] = {
                typename = "Collection",
                lights = {
                    { -- searchlight
                        typename = "Argument", argument = 209,
                        movable = true,
                    },
                },
            },
            [WOLALIGHT_NAVLIGHTS] = {
                typename = "Collection",
                -- this strobe thing is not working, the lights are permanent on
                -- might need to be rigged differently in the model
                lights = {
                    { -- 0 -- Port POSN light
                        typename = "Argument", argument = 190,
                        controller = "Strobe", period = 0.73, reduced_flash_time = 0.5, power_up_t = 0.25, cool_down_t = 0.5, mode = 0,
                    },
                    { -- 1 -- Stbd. POSN light
                        typename = "Argument", argument = 191,
                        controller = "Strobe", period = 0.73, reduced_flash_time = 0.5, power_up_t = 0.25, cool_down_t = 0.5, mode = 0,
                    },
                    { -- 2 -- Aft POSN light
                        typename = "Argument", argument = 192,
                        controller = "Strobe", period = 0.73, reduced_flash_time = 0.5, power_up_t = 0.25, cool_down_t = 0.5, mode = 0,
                    },
                    --[[
                    { -- 3 -- Aft POSN light
                        typename = "Argument", argument = 193,
                        controller = "Strobe", period = 0.73, reduced_flash_time = 0.5, power_up_t = 0.25, cool_down_t = 0.5, mode = 0,
                    }
                    ]]
				    {typename = "strobelight", connector = "ch46_light_tail_red_2_strobe", argument = 193, period = 1.01, phase_shift = 0.5, color = {0.8,0,0}},
                    {typename = "omnilight", connector = "ch46_light_tail_red_2_omni", color = {0.8,0,0}},
                },
            },
            [WOLALIGHT_CABIN_NIGHT] = {
                typename = "Collection",
                lights = {
                    { -- 0 -- Consoles Backlight
                        typename = "omnilight", connector = "ch46_light_red_cabin", argument = 603, color = {0.8, 0, 0}, range = 3,
                    },
                    {
                        typename = "omnilight", connector = "ch46_light_red_passenger1", argument = 603, color = {0.8, 0, 0}, range = 5,
                    },
                    {
                        typename = "omnilight", connector = "ch46_light_red_passenger2", argument = 603, color = {0.8, 0, 0}, range = 5,
                    },
                    {
                        typename = "omnilight", connector = "ch46_light_red_passenger3", argument = 603, color = {0.8, 0, 0}, range = 5,
                    },
                    {
                        typename = "omnilight", connector = "ch46_light_red_passenger4", argument = 603, color = {0.8, 0, 0}, range = 5,
                    },
                },
            },
        }
    },
};
