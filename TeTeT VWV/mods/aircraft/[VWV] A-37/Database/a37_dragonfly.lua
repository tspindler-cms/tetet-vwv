---------------------------------------------------------------------------------------------------------------------
--- a_37_dragonfly by Hawkeye60
---------------------------------------------------------------------------------------------------------------------

function Gatling_Effect(rotate_arg_, bar_)
	return { name = "GatlingEffect", arg = rotate_arg_, barrels_n = bar_}
end

local a37_dragonfly =  {

	Name 				=   'a_37_dragonfly',
	DisplayName			= _('[VWV] A-37 Dragonfly'),
	DisplayNameShort	= _('A-37'),

	HumanCockpit 		= true,
	HumanCockpitPath    = current_mod_path..'/Cockpit/',

	Picture 			= current_mod_path..'/Textures/a_37_dragonfly.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "a_37_dragonfly",

	shape_table_data 	= 
	{
		{
			file  	 = 'a_37_dragonfly';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'a_37_dragonfly_collision'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'a_37_dragonfly';
			index    =  WSTYPE_PLACEHOLDER;
		},
		{
			name  = "a_37_dragonfly_collision";
			file  = "a_37_dragonfly_collision";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000025",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},

----------------------------------------------------------------------------------------------------------

	-------------------------
	M_empty 					= 2903, -- kg
	M_nominal 					= 6055, -- kg
	M_max 						= 7257, -- kg
	M_fuel_max 					= 2500, -- kg --2225
	H_max 					 	= 13000, -- m
	average_fuel_consumption 	= 0.85, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 56, -- if this is not OVERAL FLIGHT TIME, but jus LOITER TIME, than it sholud be 10-15 minutes.....CAS capability in minute (for AI)
	V_opt 						= 125,-- Cruise speed (for AI)
	V_take_off 					= 53, -- Take off speed in m/s (for AI)
	V_land 						= 50, -- Land speed in m/s (for AI)
	V_max_sea_level 			= 361, -- Max speed at sea level in m/s (for AI)
	V_max_h 					= 541.7, -- Max speed at max altitude in m/s (for AI)
	Vy_max 						= 22, -- Max climb speed in m/s (for AI)
	Mach_max 					= 1.8, -- Max speed in Mach (for AI)
	Ny_min 						= -4, -- Min G (for AI)
	Ny_max 						= 8.0,  -- Max G (for AI)
	Ny_max_e 					= 8.0,  -- Max G (for AI)
	AOA_take_off 				= 0.157, -- AoA in take off (for AI)
	bank_angle_max 				= 60, -- Max bank angle (for AI)
	has_afteburner 				= false, -- AFB yes/no
	has_speedbrake 				= false, -- Speedbrake yes/no
    wing_tip_pos                     = {-1.6, -0.09, 5.5},

	nose_gear_pos 				= {1.643,	-1.89,	0}, -- nosegear coord
	main_gear_pos 				= {-0.664,	-1.911,	1.953}, -- main gear coords

	tand_gear_max 				= 0.577,
	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
	wing_area 					= 37.3, -- wing area in m2
	wing_span 					= 18.06, -- wing spain in m
	wing_type 					= 0,
	thrust_sum_max	=	12000,
	thrust_sum_ab	=	19580,
	length 						= 10.87, -- full lenght in m
	height 						= 3.5, -- height in m
	flaps_maneuver 				= 0.5, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
	range 						= 1520, -- Max range in km (for AI)
	RCS 						= 2.5, -- Radar Cross Section m2
    IR_emission_coeff	=	0.58,
	IR_emission_coeff_ab	=	2.5,


	--nose_gear_wheel_diameter 	= 0.275, -- in m
	--main_gear_wheel_diameter 	= 0.725, -- in m

	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords
	engines_count				= 2, -- Engines count
	engines_nozzles =
		{
			[1] =
			{
				pos = 	{-3.039,	0.15,	-1.69},
				elevation	=	0,
				diameter	=	1.523,
				exhaust_length_ab	=	11.794,
				exhaust_length_ab_K	=	0.76,
				smokiness_level     = 	0.3,
			},
			[2] =
			{
				pos = 	{-3.039,	0.15,	1.69},
				elevation	=	0,
				diameter	=	1.523,
				exhaust_length_ab	=	11.794,
				exhaust_length_ab_K	=	0.76,
				smokiness_level     = 	0.3,
			},
	},
	crew_size = 2,
	--[[ Original setup, only works for one pilot
	crew_members =
		{
			[1] =
			{
				ejection_seat_name	=	17,
				drop_canopy_name	=	24,
				pos = 	{0.34, -0.140, 2},
			},
			[2] =
			{
				ejection_seat_name	=	18,
				drop_canopy_name	=	24,
				pos = 	{0.34, -0.140, -1},
			},
		}, -- end of crew_members
	]]
	-- Shameless copy from F-4E
	--[[
	crew_members = {
		[1] =
		{
			pilot_name				= "F-4E_Pilot",
			ejection_seat_name		= "F-4E_Seat_Pilot",
			drop_canopy_name		= "hb_f4e_pilotcanopy",
			drop_parachute_name		= "F-4E_Parachute_Pilot",
			bailout_arg 		 	= -1,
			role					= "pilot",
			role_display_name		= _("Pilot"),
			can_be_playable			= false,

			pos						= {5, 0.8, 0},
			canopy_pos				= {5, 0.8, 0},
			ejection_added_speed	= {-3, 15, 0},

			canopy_arg				= 38,
			canopy_args				= {38, 1},
			pilot_body_arg			= 50,
			ejection_order			= 2,
			g_suit					= 2.0,
		},
		-- WSO
		[2] =
		{
			pilot_name				= "F-4E_WSO",
			ejection_seat_name		= "F-4E_Seat_WSO",
			drop_canopy_name		= "hb_f4e_wsocanopy",
			drop_parachute_name		= "F-4E_Parachute_WSO",
			bailout_arg 		 	= -1,
			role					= "instructor",
			role_display_name		= _("WSO"),
			can_be_playable			= false,

			pos						= {3.7, 1, 0},
			canopy_pos				= {3.7, 1, 0},
			ejection_added_speed	= {-3, 15, 0},
			--canopy_ejection_dir		= {-1, 1.0, 0.0},

			canopy_arg				= 38,
			canopy_args				= {38, 1},
			pilot_body_arg  	    = 701,
			ejection_order			= 1,
			g_suit					= 2.0,
		},
	},
	]]
	-- Shameless copy from p-51
	crew_members = {
		[1] = {
			role                = "pilot";
			pilot_name          = 56,
			ejection_seat_name  = 0,
			drop_canopy_name    = 57,
			pos                 = {-1.460, -0.045, 0.000},
			canopy_pos          = {0.000, 0.000, 0.000},
			drop_parachute_name = "pilot_p51_parachute",
		}, -- end of [1]
			[2] = {
			role                = "pilot";
			pilot_name          = 56,
			ejection_seat_name  = 0,
			drop_canopy_name    = 57,
			pos                 = {-1.460, -0.045, 0.000},
			canopy_pos          = {0.000, 0.000, 0.000},
			drop_parachute_name = "pilot_p51_parachute",
		}, -- end of [2]
    }, -- end of crew_members

	fires_pos =
		{
			[1] = 	{-2,	-1.60,	0.5},
			[2] = 	{0,  	-1,	    2.237},
			[3] = 	{0,	    -1,	    -2.237},
			[4] = 	{0.26,	-1,	   1.5},
			[5] = 	{-0.26,	-1,	   -1.5},
			[6] = 	{0.5,	-1,	   4.274},
			[7] = 	{0.5,	-1,	   -4.274},
			[8] = 	{-5,	-1,	0},
			[9] = 	{-5,	-1,	0},
			[10] = 	{-5,	-1,	0},
			[11] = 	{-5,	-1,	0},
		}, -- end of fires_pos

	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0,
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0,
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,

	--sensors
	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = {
		OPTIC = "Merkury LLTV", -- For night goggles imitation
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},

	Guns =  {
	          gun_mount("M_197", { count = 800},{muzzle_pos_connector = "POINT_MGUN_11", effects = {Gatling_Effect(351,6), fire_effect(350)}}), --D
			  gun_mount("M_197", { count = 800},{muzzle_pos_connector = "POINT_MGUN_21", effects = {Gatling_Effect(351,6), fire_effect(350),smoke_effect()}}), --G
			  gun_mount("M_197", { count = 800},{muzzle_pos_connector = "POINT_MGUN_12", effects = {Gatling_Effect(351,6), fire_effect(350),smoke_effect()}}), --D
			  gun_mount("M_197", { count = 800},{muzzle_pos_connector = "POINT_MGUN_22", effects = {Gatling_Effect(351,6), fire_effect(350)}}), --G
			},


	Pylons =
    {
		-- Parameter 2 = Internal or External pylon, so if its set to 2 it fires the Argument #26
        pylon(1, 0,  0.0000, 0.0009, 0.0000,
	    { use_full_connector_position = false, connector = "PYLON_1", },
            {
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
            }
        ),
        pylon(2, 0,  0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_2",  },
            {
			    { CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
            }
        ),
        pylon(3, 0,  0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_3", },
            {
                { CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
            }
        ),
        pylon(4, 0,  0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_4",  },
            {
                { CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
            }
        ),
        pylon(5, 0,  0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_5", },
            {
                { CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
            }
        ),
        pylon(6, 0,  0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_6", },
            {
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
            }
        ),
        pylon(7, 0,  0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_7", },
            {
			    { CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{DDCE7D70-5313-4181-8977-F11018681662}" }, -- LAU-131-WTU1B
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
            }
        ),
        pylon(8, 0, 0.0000, 0.0009, 0.0000,
		{ use_full_connector_position = false, connector = "PYLON_8",},
            {
			    { CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
				{ CLSID = "{mk77mod1}" }, -- Napalm from A-4E-C
				{ CLSID = "{M260_HYDRA_WP}"                },        --M260 - 7 2.75' rockets MK156 WP
                { CLSID = "{M260_HYDRA}"                },        --M260 - 7 2.75' rockets MK156
				{ CLSID = "{D22C2D63-E5C9-4247-94FB-5E8F3DE22B71}" }, -- LAU-131-MK1
				{ CLSID = "{319293F2-392C-4617-8315-7C88C22AF7C4}" }, -- LAU-131-MK5
				{ CLSID = "{1CA5E00B-D545-4ff9-9B53-5970E292F14D}" }, -- LAU-131-MK61
				{ CLSID = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}" }, -- LAU-131-M151
				{ CLSID = "{2AF2EC3F-9065-4de5-93E1-1739C9A71EF7}" }, -- LAU-131-MK156
				{ CLSID = "{MK_77}" }, -- MK_77
				{ CLSID = "{DAD45FE5-CFF0-4a2b-99D4-5D044D3BC22F}" }, -- LAU-131-M257
				{ CLSID = "{6D6D5C07-2A90-4a68-9A74-C5D0CFFB05D9}" }, -- LAU-131-W274
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
            }
        ),
        pylon(9, 1, 0.0000, 0.0009, 0.0000,
	    { use_full_connector_position = false, connector = "PYLON_9",arg = 199,arg_value = 0.0},
            {
				{ CLSID = "dragonfly_fuel_tanks",arg = 199,arg_value = 1.0 }, -- dragonfly_fuel_tanks
            }
        ),
    },

-----------------------------------------------------------------------------------	

	Tasks =
	{
		aircraft_task(GroundAttack),
		aircraft_task(RunwayAttack),
		aircraft_task(AntishipStrike),
		aircraft_task(CAS),
    },
	DefaultTask = aircraft_task(CAS),

	sounderName = "Aircraft/Planes/a_37_dragonfly",

	SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0	=	0.0668, -- zero AoA lift coefficient*
			Mzalfa	=	4.355, -- coefficients for pitch agility
			Mzalfadt	=	0.8,  -- coefficients for pitch agility
			kjx	=	2,--2.3, -- Inertia parametre X - Dimension (clean) airframe drag coefficient at X (Top) Simply the wing area in square meters (as that is a major factor in drag calculations)
			kjz	=	0.01,--0.0011, -- Inertia parametre Z - Dimension (clean) airframe drag coefficient at Z (Front) Simply the wing area in square meters (as that is a major factor in drag calculations)
			Czbe	=	-0.014, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear	=	0.008, -- coefficient, drag, gear ??
			cx_flap	=	0.08, -- coefficient, drag, full flaps
			cy_flap	=	0.26, -- coefficient, normal force, lift, flaps
			cx_brk	=	0.08, -- coefficient, drag, breaks
			table_data = 
			{	--      M		Cx0*	 	Cya*		B2		 	B4	 		Omxmax		Aldop*		Cymax*
				[1 ] = { 0,		0.01089	,	0.0669	,	0.0182	,	0.2298	,	0.41	,	16.2	,	1.154},
				[2 ] = { 0.1,	0.01089	,	0.0669	,	0.0182	,	0.2298	,	0.41	,	16.2	,	1.154},
				[3 ] = { 0.2,	0.01086	,	0.0669	,	0.0182	,	0.2296	,	0.81	,	16.2	,	1.154},
				[4 ] = { 0.4,	0.01080	,	0.0669	,	0.0183	,	0.2294	,	1.62	,	16.2	,	1.154},
				[5 ] = { 0.6,	0.01074	,	0.0674	,	0.0194	,	0.2245	,	2.43	,	16.0	,	1.145},
				[6 ] = { 0.65,	0.01083	,	0.0690	,	0.0229	,	0.2113	,	2.63	,	14.9	,	1.096},
				[7 ] = { 0.7,	0.01091	,	0.0722	,	0.0303	,	0.2111	,	2.82	,	11.8	,	0.921},
				[8 ] = { 0.75,	0.01089	,	0.0709	,	0.0424	,	0.3165	,	2.98	,	10.0	,	0.777},
				[9 ] = { 0.8,	0.01089	,	0.0689	,	0.0510	,	0.3826	,	2.47	,	9.9		,	0.749},
				[10] = { 0.9,	0.02070	,	0.0661	,	0.0554	,	0.4359	,	0.60	,	10.1	,	0.731},
				[11] = { 0.95,	0.0510	,	0.0643	,	0.0526	,	0.4836	,	1.31	,	10.2	,	0.717},
				[12] = { 1.0,	0.0682	,	0.0631	,	0.0514	,	0.5218	,	0.42	,	10.2	,	0.707},
				[13] = { 1.1,	0.0718	,	0.0621	,	0.0547	,	0.5431	,	0.71	,	10.3	,	0.701},
				[14] = { 1.2,	0.0718	,	0.0620	,	0.0559	,	0.5453	,	0.73	,	10.3	,	0.701},
				[15] = { 1.3,	0.0718	,	0.0620	,	0.0572	,	0.5447	,	0.78	,	10.3	,	0.701},
				-- Approximately
				[16] = { 2.0,	0.0718	,	0.0620	,	0.0572	,	0.5447	,	0.73	,	10.3	,	0.701},
				[17] = { 2.5,	0.0718	,	0.0620	,	0.0572	  ,	0.5447	,	0.71	,	10.3	,	0.701},
				[18] = { 3.9,	0.0718	,	0.0620	,	0.0572	,	0.5447	,	0.42	,	10.3	,	0.701},
			}, -- end of table_data
			-- M - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
			-- B2 - Polar 2nd power coeff
			-- B4 - Polar 4th power coeff
			-- Omxmax - roll rate, rad/s
			-- Aldop - Alfadop Max AOA at current M - departure threshold
			-- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	35, -- RPM at idle
			MinRUD	=	0, -- Min state of the з▓з╡зе
			MaxRUD	=	1, -- Max state of the з▓з╡зе
			MaksRUD	=	1, -- Military power state of the з▓з╡зе
			ForsRUD	=	1, -- Afterburner state of the з▓з╡зе
			typeng	=	1, -- 0 - engine with high bypass ratio, 1 - jet engine
			hMaxEng	=	19, -- Max altitude for safe engine operation in km
			dcx_eng	=	0.0134, -- Engine drag coeficient
			cemax	=	1.24, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	9670, --  altitude coefficient for max thrust
			dpdh_f	=	79670, --  altitude coefficient for AB thrust
			table_data = 
			{		--   M			Pmax		 Pfor	
				[1 ] = { 0		,	56296	,	56296	},
				[2 ] = { 0.2	,	55072	,	55072	},
				[3 ] = { 0.3	,	53551	,	53551	},
				[4 ] = { 0.4	,	53088	,	53088	},
				[5 ] = { 0.5	,	55981	,	52981	},
				[6 ] = { 0.55	,	55011	,	55011	},
				[7 ] = { 0.6	,	59088	,	59088	},
				[8 ] = { 0.65	,	59212	,	59212	},
				[9 ] = { 0.7	,	59377	,	59377	},
				[10] = { 0.75	,	59579	,	59579	},
				[11] = { 0.8	,	53810	,	53810	},
				[12] = { 0.9	,	55350	,	55350	},
				[13] = { 1		,	55953	,	55953	},
				[14] = { 1.1	,	55552	,	55552	},
				[15] = { 1.2	,	55885	,	55885	},
				[16] = { 1.3	,	56085	,	56085	},
				[17] = { 1.4	,	55969	,	55969	},
				-- Approximately
				[18] = { 2.5	,	100		,	100	},		
			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},
---------------------------------------------------------------------------
-----------------------------------
--- MULTICREW DAMAGE - 01/05/19 ---
-----------------------------------

		Damage = verbose_to_dmg_properties(
	{
--MUSO
		["NOSE_CENTER"]    		= {critical_damage = 3,  args = {146}}, --[0] PUNTA MUSO

		["NOSE_BOTTOM"]			= {critical_damage = 3, args = {148}, deps_cells = {"FRONT_GEAR_BOX"}}, --[59]	
		["NOSE_RIGHT_SIDE"]		= {critical_damage = 3, args = {149}, deps_cells = {"PITOT"}}, --[2] aggiunto + D_C PITOT DX		
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3, args = {150}, deps_cells = {"PITOT"}}, --[1] aggiunto + D_C PITOT SX

		["PITOT"]				= {critical_damage = 3}, --[60]
--CABINA
		--canopy
		["COCKPIT"]			 	= {critical_damage = 7, args = {65}, deps_cells = {"CREW_1", "CREW_2"}}, --[3] (FORI DI PROIETTILE SU TETTUCCIO) AGGIUNTA INFLUENZA SU CREW_1 E 2 --> PILOTA DECEDUTO
		--pilota
		["CREW_1"] 				= {critical_damage = 4, args = {663}}, --[90] aggiunto --> VISIBILITA' PILOTA MORTO, DIPENDENTE DA "COCKPIT" (su C-101 arg 400 e 401)
		--seggiolino pilota
		["ARMOR_PLATE_LEFT"]	= {critical_damage = 6, deps_cells = {"CREW_1"}}, --[96]
		--istruttore
		["CREW_2"] 				= {critical_damage = 4, args = {664}}, --[91] ""
		--seggiolino istruttore
		["ARMOR_PLATE_RIGHT"]	= {critical_damage = 6, deps_cells = {"CREW_2"}}, --[97]		
		["CABIN_BOTTOM"]		= {critical_damage = 3, args = {297}, deps_cells = {"AIR_BRAKE_L"}}, --[6]		
		["CABIN_RIGHT_SIDE"]	= {critical_damage = 5, args = {298}, deps_cells = {"ARMOR_PLATE_LEFT", "ARMOR_PLATE_RIGHT"}}, --[5]		
		["CABIN_LEFT_SIDE"]  	= {critical_damage = 5, args = {299}, deps_cells = {"ARMOR_PLATE_LEFT", "ARMOR_PLATE_RIGHT"}}, --[4]

		["AIR_BRAKE_L"]			= {critical_damage = 2,  args = {183}}, --[19]		
--TANICA (probabilmente da sostituire con x_ray)
		["FUEL_TANK_F"]			= {critical_damage = 8,  args = {147}, deps_cells = {"ARMOR_PLATE_RIGHT"}},--[61] TANICA INTERNA DIETRO BACKSEAT
--SEMIALA DX
		["WING_R_OUT"]			= {critical_damage = 8,  args = {213}, deps_cells = {"AILERON_R"}}, --[24]
		["WING_R_CENTER"]		= {critical_damage = 9,  args = {214}, deps_cells = {"FLAP_R", "AILERON_R", "WING_R_OUT"}}, --[30]		
		["WING_R_IN"]			= {critical_damage = 10, args = {215}, deps_cells = {"WING_R_CENTER", "FLAP_R", "AILERON_R", "WING_R_OUT"}}, --[36]
		["AILERON_R"]			= {critical_damage = 3,  args = {216}}, --[26]
		["FLAP_R"]				= {critical_damage = 4,  args = {217}}, --[32]
--SEMIALA SX
		["WING_L_OUT"]			= {critical_damage = 8,  args = {223}, deps_cells = {"AILERON_L"}}, --[23]
		["WING_L_CENTER"]		= {critical_damage = 9,  args = {224}, deps_cells = {"FLAP_L", "AILERON_L", "WING_L_OUT"}}, --[29]
		["WING_L_IN"]			= {critical_damage = 10, args = {225}, deps_cells = {"WING_L_CENTER", "FLAP_L", "AILERON_L", "WING_L_OUT"}}, --[35]		
		["AILERON_L"]			= {critical_damage = 3,  args = {226}}, --[25]
		["FLAP_L"]				= {critical_damage = 4,  args = {227}}, --[31]
--FUSOLIERA CENTRALE
		["FUSELAGE_BOTTOM"]  	= {critical_damage = 5,  args = {152}}, --[82]	
		["FUSELAGE_RIGHT_SIDE"]	= {critical_damage = 4,  args = {153}, deps_cells = {"ENGINE"}}, --[10]		
		["FUSELAGE_LEFT_SIDE"]	= {critical_damage = 4,  args = {154}, deps_cells = {"ENGINE"}}, --[9]
--MOTORE (probabilmente da sostituire con x_ray)
		["ENGINE"]				= {critical_damage = 3}, --[11]
--DERIVA
		["TAIL_BOTTOM"]			= {critical_damage = 4,  args = {156}}, --[58]
		["TAIL_RIGHT_SIDE"]		= {critical_damage = 4,  args = {157}}, --[57]
		["TAIL_LEFT_SIDE"]		= {critical_damage = 4,  args = {158}}, --[56]
		["TAIL"]				= {critical_damage = 20, args = {159}},	--[55]CONETTO SOTTO CODA

		["STABILIZATOR_R"]		= {critical_damage = 7,  args = {233}, deps_cells = {"ELEVATOR_R", "ELEVATOR_R_OUT"}}, --[48]
		["ELEVATOR_R"]			= {critical_damage = 4,  args = {238}, deps_cells = {"ELEVATOR_R_OUT"}}, --[52]
		["ELEVATOR_R_OUT"]		= {critical_damage = 2,  args = {237}}, --[50] trim elevatore DX

		["STABILIZATOR_L"]		= {critical_damage = 7,  args = {235}, deps_cells = {"ELEVATOR_L", "ELEVATOR_L_OUT"}}, --[47]
		["ELEVATOR_L"]			= {critical_damage = 4,  args = {240}, deps_cells = {"ELEVATOR_L_OUT"}}, --[51]
		["ELEVATOR_L_OUT"]		= {critical_damage = 2,  args = {239}},	--[49] trim elevatore SX	

		["FIN_L_TOP"]			= {critical_damage = 5,	 args = {242}, deps_cells = {"RUDDER"}}, --[39]
		["FIN_L_BOTTOM"]		= {critical_damage = 7,	 args = {246}, deps_cells = {"FIN_L_TOP", "RUDDER"}}, --[41]
		["RUDDER"]				= {critical_damage = 3,  args = {248}}, --[53]

--CARRELLI
		--COLLISION_SHELL
		["FRONT_GEAR_BOX"]		= {critical_damage = 3,  args = {265}, deps_cells = {"WHEEL_F"}}, --[8] DANNI AI PORTELLI CARRELLO (FINO A SCOMPARSA)
		["RIGHT_GEAR_BOX"]		= {critical_damage = 5,  args = {266}, deps_cells = {"WHEEL_R"}}, --[16] ""
		["LEFT_GEAR_BOX"]		= {critical_damage = 5,  args = {267}, deps_cells = {"WHEEL_L"}}, --[15] ""
		--COLLISION_LINE
		["WHEEL_F"]				= {critical_damage = 4,  args = {134}}, --[83] scoppio pneumatico ruotino
		["WHEEL_R"]				= {critical_damage = 4,  args = {135}}, --[85] scoppio pneumatico ruota DX
		["WHEEL_L"]				= {critical_damage = 4,  args = {136}}, --[84] scoppio pneumatico ruota SX
	}),-- end of Damage

	DamageParts =
	{
	},

	lights_data = {
		typename = "collection",
		lights = {
			[1] = {typename = "collection",lights = {}},
			[2] = {typename = "collection",
					lights = {-- Landing light
						{typename = "spotlight",
						connector = "MAIN_SPOT_PTR_02",
						argument = 209,
						dir_correction = {elevation = math.rad(-1)}
						},
						{-- Landing/Taxi light
						typename = "spotlight",
						connector = "MAIN_SPOT_PTR_01",
						argument = 208,
						dir_correction = {elevation = math.rad(3)}
						}
					}
				},
			[3] = {typename = "collection",
					lights = {-- Left Position Light (red)
						{typename = "omnilight",
						connector = "BANO_1",
						color = {0.99, 0.11, 0.3},
						pos_correction = {0, 0, -0.2},
						argument = 190
						},
						-- Right Position Light (green)
						{typename = "omnilight",
						connector = "BANO_2",
						color = {0, 0.894, 0.6},
						pos_correction = {0, 0, 0.2},
						argument = 191
						},
						-- Tail Position Light (white)
						{typename = "omnilight",
						connector = "BANO_0",
						color = {1, 1, 1},
						pos_correction = {0, 0, 0},
						argument = 192
						}
					}
				},
			[4] = {typename = "collection",lights = {}},
			[5] = {typename = "collection",lights = {}},
	}}, -- end lights_data
---				Countries = {"USA"},
}

add_aircraft(a37_dragonfly)
