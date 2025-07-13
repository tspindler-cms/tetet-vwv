local launch_bar_connected_arg_value_ = 0.87;
local crusader = {

	Name 				= 'vwv_crusader',
	DisplayName			= _('[VWV] F-8E Crusader'),
	DisplayNameShort    = _('F-8E'),
	--HumanCockpit 		= true,
	--HumanCockpitPath	= current_mod_path..'/Cockpit/',
	Picture 			= "crusader.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "crusader",

	shape_table_data 	=
	{
		{
			file  	 	= 'crusader';
			life  	 	= 20; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'crusader-oblomok'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'crusader';
			index    	=  WSTYPE_PLACEHOLDER;
			classname   = "lLandPlane";
			positioning = "BYNORMAL";
		},
		{
			name  = "crusader-oblomok";
			file  = "crusader-oblomok";
			fire  = { 240, 2};
		},

	},
	CanopyGeometry = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_BAD, LOOK_BAD),
	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER,
        "Multirole fighters", "Refuelable",},
	Categories= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	M_empty 					= 8528, -- kg
	M_nominal 					= 12624, -- kg
	M_max 						= 15422, -- kg
	M_fuel_max 					= 4096, -- kg
	H_max 					 	= 15240, -- m
	average_fuel_consumption 	= 0.005, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 60, -- minimal indicated airspeed*?
	-- M = 15600 lbs
	V_opt 						= 164,-- Cruise speed (for AI)*
	V_take_off 					= 73, -- Take off speed in m/s (for AI)*	(122)
	V_land 						= 78, -- Land speed in m/s (for AI) (152kn - final approach, 126kn - touchdown)
	V_max_sea_level 			= 335, -- Max speed at sea level in m/s (for AI) (589kn)
	V_max_h 					= 549, -- Max speed at max altitude in m/s (for AI)	(522kn)
	Vy_max 						= 180.72, -- Max climb speed in m/s (for AI)	(9000ft/min)
	Mach_max 					= 1.8, -- Max speed in Mach (for AI)	???
	Ny_min 						= -3, -- Min G (for AI)
	Ny_max 						= 8.0,  -- Max G (for AI)
	Ny_max_e 					= 8.0, -- ?? Max G (for AI)
	AOA_take_off 				= 0.17, -- AoA in take off radians (for AI)
	bank_angle_max 				= 75, -- Max bank angle (for AI)
	has_afteburner	            = true,
	has_speedbrake	            = true,
	radar_can_see_ground	    = true,	

	nose_gear_pos = { 3.8555, -2.2115, 0 },
	nose_gear_wheel_diameter = 0.433769,

	nose_gear_amortizer_direct_stroke        = -0.1,
	nose_gear_amortizer_reversal_stroke      = -0.1,
	nose_gear_amortizer_normal_weight_stroke = -0.015,

	-- main_gear_pos = { -2.5327, -1.9686, -1.4374 },
	main_gear_pos = { -2.5327, -1.9686, 0 },
	main_gear_wheel_diameter = 0.602213,

	main_gear_amortizer_direct_stroke        =  0.1,
	main_gear_amortizer_reversal_stroke      = -0.1,
	main_gear_amortizer_normal_weight_stroke =  0.0,

	wing_tip_pos =          {-5.214,-0.7, 5.35},-- wingtip coords for visual effects  -- was -10.214, by Toan, 28-12

	stores_number	=	7,
	tand_gear_max	=	-5.54,   -- 83° tangent maximum yaw angle of front wheel, by Toan, 15-01-2024
	tanker_type	=	2,
	wing_area	=	34.8,
	wing_span	=	10.72,
	wing_type   = 2,-- FIXED_WING = 0/VARIABLE_GEOMETRY = 1/FOLDED_WING = 2/ARIABLE_GEOMETRY_FOLDED = 3
	thrust_sum_max	=	11400,
	thrust_sum_ab	=	18000,
	length	=	16.61,
	height	=	4.8,
	flaps_maneuver	=	1.0,
	range	=	2372,
	crew_size	=	1,
	RCS	=	4.0,
	IR_emission_coeff	=	0.6,
	IR_emission_coeff_ab	=	2.5,
	-- Overwing vapor effect by Toan
	effects_presets = {
		{effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/crusader_overwingVapor.lua"},

        -- you must create a folder Effects in the F-8 Mod folder ---------------------------------------
        -- inside the Effects folder copy the crusader_overwingVapor.lua, by Toan, 05-01-2024 -----------
        -- also, you must put in the Shapes folder the crusader_vapor.owv file, by Toan, 06-01-2024 -----
    },  -- end of Overwing vapor effect

	-- Afterburner effect by Toan
    engines_count    = 1, -- added by Toan, otherwise smoke doesn't work, 27-12-2023 ----------------------
	engines_nozzles = {
        [1] =
        {
            pos            = {-9.2,    -0.5,    0}, -- nozzle coords -- was -0.8, by Toan, 27-12-2023 ---------
            elevation           = 0, -- AFB cone elevation -------- was -0.1, by Toan, 29-12-2023 ---------
            diameter            = 0.6, -- AFB cone diameter ------- was 0.6, by Toan, 03-01-2024 ----------
            exhaust_length_ab   = 4.0, -- lenght in m ------------- was 4, by Toan, 03-01-2024 ------------
            exhaust_length_ab_K = 0.707, -- AB animation
            smokiness_level     = 0.5, ---------------------------- update by Toan, 27-12-2023 ------------ 
            afterburner_circles_count = 3, ------------------------ 0 if no AB, by Toan, 01-01-2024 -------
        }, -- end of [1]
    }, -- end of engines_nozzles

	crew_members =
	{
		[1] =
		{
			ejection_seat_name = "pilot_f86_seat",
			drop_canopy_name   = 0,
			pilot_name		   = "pilot_f86",
			pos 	   =  {1.7, 0.5 ,	0},
			canopy_arg = 38,
			canopy_pos = {1.607000 ,1.181,0},
			canopy_ejection_dir = {-1.0,0.2,0},
			g_suit = 0.7,
		}, -- end of [1]
	}, -- end of crew_members

	brakeshute_name	=	0,
	is_tanker	=	false,
	air_refuel_receptacle_pos = 	{0.75,	-0.25,	-0.3},	---?

	fires_pos =
	{
		[1] = 	{-0.40,		-0.46,	 0.0},		-- Fuselage					10 - fuselage right
		[2] = 	{-1.114,	-0.29,	 0.901},	-- Wing inner Right
		[3] = 	{-1.268,	-0.29,	-1.162},	-- Wing inner Left
		[4] = 	{ 0.215,	-0.26,	 1.195},	-- Wing middle Right
		[5] = 	{-1.582,	-0.26,	-1.687},	-- Wing middle Left
		[6] = 	{-0.80,		-0.26,	 2.2},		-- Wing outer Right
		[7] = 	{-1.0,		-0.29,	-0.806},	-- Wing outer Left
		[8] = 	{0.0,		 0.0,	 0.0},		-- Engine (inner Right)
		[9] = 	{-7.75,		 0.3,	 0.0},		-- Engine (inner Left)
	}, -- end of fires_pos

	Countermeasures = {
		ECM = "AN/ALQ-126"
	},

	passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 240,
		chaff = {default = 120, increment = 8, chargeSz = 1},
		flare = {default = 120, increment = 8, chargeSz = 1},
	},

	chaff_flare_dispenser 	= {
		{ dir =  {0, -1, 0}, pos =  {-1.1850,  -1.72, -0.878}, }, -- Flares 
		{ dir =  {0, -1, 0}, pos =  {-1.1850,  -1.72, 0.878}, }, -- Flares 
	},

	mechanimations = {
		--[[
		-- F-18C launchbar
		LaunchBar = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 1.0, "in", 4.5}}}}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 4.5}}}}},
			{Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 0.745, "in", 4.0}}}}},
			{Transition = {"Stage", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 4.0}}}}},
			-- this stage is causing the front wheel to sink into the flight deck
			{Transition = {"Extend", "Stage"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 1.0, "to", 0.745, "in", 1.0}}}}},
			-- {Transition = {"Extend", "Stage"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.0, "to", 0.0, "in", 0.0}}}}},
			{Transition = {"Stage", "Pull"},     Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 0.743, "in", 1.0}}}}},
			{Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 1.0, "in", 0.2}}}}},
		},
		]]
		--[[
		-- LaunchBar copied from A-4E-C for testing purposes
		-- Does not work with the model
        LaunchBar = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.881, "in", 4.4}}}}},
            {Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.815, "in", 4.4}}}}},
            {Transition = {"Any", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 4.5}}}}},
            -- {Transition = {"Extend", "Stage"},   Sequence = {
                    -- {C = {{"ChangeDriveTo", "Mechanical"}, {"Sleep", "for", 0.000}}},
                    -- {C = {{"Arg", 85, "from", 0.881, "to", 0.766, "in", 0.600}}},
                    -- {C = {{"Arg", 85, "from", 0.766, "to", 0.753, "in", 0.200}}},
                    -- {C = {{"Sleep", "for", 0.15}}},
                    -- {C = {{"Arg", 85, "from", 0.753, "to", 0.784, "in", 0.1, "sign", 2}}},
                    -- {C = {{"Arg", 85, "from", 0.784, "to", 0.881, "in", 1.0}}},
                --},
            -- },
            {Transition = {"Extend", "Stage"},   Sequence = {
                    {C = {{"ChangeDriveTo", "Mechanical"}, {"Sleep", "for", 0.000}}},
                    {C = {{"Arg", 85, "from", 1, "to", 1, "in", 0.600}}},
                    {C = {{"Arg", 85, "from", 1, "to", 1, "in", 0.200}}},
                    {C = {{"Sleep", "for", 0.15}}},
                    {C = {{"Arg", 85, "from", 1, "to", 1, "in", 0.1, "sign", 2}}},
                    {C = {{"Arg", 85, "from", 1, "to", 1, "in", 1.0}}},
                },
            },
            {Transition = {"Stage", "Pull"},  Sequence = {
                -- {C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85,"from", 0.881, "to", launch_bar_connected_arg_value_, "in", 0.27}}},
				{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85,"from", 1, "to", 1, "in", 0}}},
            }},
            {Transition = {"Stage", "Extend"},   Sequence = {
				{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "from", 0.815, "to", 0.881, "in", 0.2}}}
			}},
        },
		]]
        FoldableWings = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 15.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
        },
    }, -- end of mechanimations
	launch_bar_connected_arg_value = launch_bar_connected_arg_value_;
	LandRWCategories =
    {
        [1] =
        {
			Name = "AircraftCarrier With Arresting Gear",
        },
    }, -- end of LandRWCategories
	TakeOffRWCategories =
    {
        [1] =
        {
            Name = "AircraftCarrier With Catapult",
        },
    }, -- end of TakeOffRWCategories

	--sensors
	detection_range_max		 = 40,
	CanopyGeometry = {
		azimuth = {-145.0, 145.0},
		elevation = {-50.0, 90.0}
    },

	Sensors = {
		RADAR = "AN/APQ-153",
		-- IRST = "OLS-27",
		OPTIC = "Harrier GR_5 FLIR", -- {"TADS DTV", "TADS DVO", "TADS FLIR"},
		RWR = "Abstract RWR"
	},

	Failures = {
			{ id = 'asc', 		label = _('ASC'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'eos',  		label = _('EOS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			--{ id = 'mlws',  	label = _('MLWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },		
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},

	-- Guns from Beldin
	Guns = {
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.61,  -0.775,-0.488},
			muzzle_pos_connector	= "gunpoint_01",
			supply_position			= {4.8753, 0, -0.2},	-- approx
			drop_cartridge			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_1",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg = 432,duration = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 327  , add_speed = {0, -3, 10}},
			},
		}),			-- LEFT
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.61,  -0.773, 0.499},
			muzzle_pos_connector	= "gunpoint_02",
			supply_position			= {4.8753, 0,  0.2},	-- approx
			drop_cartridge 			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_2",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg 				= 433, duration  = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 328, add_speed = {0,  3, 10}},
			},
		}),
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.94,  -0.914,-0.488},
			muzzle_pos_connector	= "gunpoint_03",
			supply_position			= {4.8753, 0, -0.2},	-- approx
			drop_cartridge			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_1",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg = 432,duration = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 327  , add_speed = {0, -3, 10}},
			},
		}),			-- LEFT
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.94,  -0.912, 0.499},
			muzzle_pos_connector	= "gunpoint_03",
			supply_position			= {4.8753, 0,  0.2},	-- approx
			drop_cartridge 			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_2",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg 				= 433, duration  = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 328, add_speed = {0,  3, 10}},
			},
		})
	},
	ammo_type_default = 2, -- interface to set desired ammunition mix in ME (DCSCORE-1104)
	ammo_type ={_("HEI High Explosive Incendiary"),
				_("CM Combat Mix"),
				_("AP Armor Piercing"),
				_("TP Target Practice"),
	},


	Pylons = {
		pylon(1, 0, 1.2, 2.50, -1.60,
			{
				arg = 308, arg_value = 0.0,
				use_full_connector_position = false, connector = "pylon_1",
			},
			{
				{ CLSID = "LAU3_HE151" }, --LAU-3 HE M151
				{ CLSID = "LAU3_HE5" }, --LAU-3 HEAT Mk5
				{ CLSID = "{BRU33_2*LAU10}"},
				-- { CLSID = "{BRU41_6X_MK-82}" },
				{ CLSID = "{BRU33_2X_MK-82}" },
				{ CLSID = "{BRU33_2X_MK-82_Snakeye}" },
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}"},--single Zuni
				-- { CLSID = "{C40A1E3A-DD05-40D9-85A4-217729E37FAE}" },--Walleye
				{ CLSID = "{BRU-42_2*Mk-82SNAKEYE_LEFT}" },-- 2 ea MK82 SE on TER
				{ CLSID = "{BRU-42_2*Mk-82_LEFT}" },--2 ea MK82 on TER
				{ CLSID = "{SB_F8_BRU_41A_M82_4 Lt}" },--4 each MK82 on MER  needs weapons declaration at end of this lua
				{ CLSID = "{SB_F8_BRU_41A_M82SE_4 Lt}" },--4 each MK82SE on MER  needs weapons declaration at end of this lua
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" }, -- M117 750LBS
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" }, --Mk84
				{ CLSID = "{DFT-300gal_LR}" },
				{ CLSID = "{DFT-300gal_LR_EMPTY}" },
						-- { CLSID = "{DFT-300gal_LR}",attach_point_position = { -0.10, -0.008, 0.0}}, --another posibility to fix 300 gal tank position/angle ?
				{ CLSID = "{DFT-150gal}" },
				{ CLSID = "{DFT-150gal_EMPTY}" },
				{ CLSID = "<CLEAN>", arg_value = 1.0},
			}
		),
		pylon(2, 0, 1.2, 2.40, -1.75,
			{
				use_full_connector_position = false, connector = "pylon_3",
			},
			{
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
				{ CLSID = "{F8_AIM-9C}" ,attach_point_position = {0.7,  0.05, 0.0}}, --AIM-9C
				{ CLSID = "{F8_AIM-9D}" ,attach_point_position = {0.7,  0.11, 0.0}}, --AIM-9D
				{ CLSID = "{AIM-9J}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9J
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}",attach_point_position = {0.5,  0.05, 0.0}}, -- LAU-10 Zuni
			}
		),
		pylon(3, 0, 1.2, 1.34, 1.75,
			{
				use_full_connector_position = false, connector = "pylon_6",
			},
			{
				{ CLSID = "{AIM-9B}" ,attach_point_position = {-0.4,  -0.05, 0.0}}, --AIM-9B
				{ CLSID = "{F8_AIM-9C}" ,attach_point_position = {-0.2,  -0.05, 0.0}}, --AIM-9C
				{ CLSID = "{F8_AIM-9D}" ,attach_point_position = {-0.2,  -0.05, 0.0}}, --AIM-9D
				{ CLSID = "{AIM-9J}" ,attach_point_position = {-0.4,  -0.05, 0.0}}, --AIM-9J
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}",attach_point_position = {-0.4,  -0.05, 0.0}}, -- LAU-10 Zuni
			}
		),
		pylon(4, 0, 1.2, 1.34, 1.60,
			{
				use_full_connector_position = false, connector = "pylon_4",
			},
			{
				{ CLSID = "{AIM-9B}" ,attach_point_position = {-0.4,  -0.05, 0.0}}, --AIM-9B
				{ CLSID = "{F8_AIM-9C}" ,attach_point_position = {-0.2,  -0.05, 0.0}}, --AIM-9C
				{ CLSID = "{F8_AIM-9D}" ,attach_point_position = {-0.2,  -0.05, 0.0}}, --AIM-9D
				{ CLSID = "{AIM-9J}" ,attach_point_position = {-0.4,  -0.05, 0.0}}, --AIM-9J
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}",attach_point_position = {-0.4,  -0.05, 0.0}}, -- LAU-10 Zuni
			}
		),
		pylon(5, 0, 1.2, 1.34, 1.75,
			{
				use_full_connector_position = false, connector = "pylon_5",
			},
			{
				{ CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
				{ CLSID = "{F8_AIM-9C}" ,attach_point_position = {0.7,  0.05, 0.0}}, --AIM-9C
				{ CLSID = "{F8_AIM-9D}" ,attach_point_position = {0.7,  0.11, 0.0}}, --AIM-9D
				{ CLSID = "{AIM-9J}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9J
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}",attach_point_position = {0.5,  0.05, 0.0}}, -- LAU-10 Zuni
			}
		),
		pylon(6, 0, 1.2, 1.34, 1.60,
			{
				use_full_connector_position = false, connector = "pylon_2",
				arg = 309, arg_value = 0
			},
			{
				{ CLSID = "LAU3_HE151" }, --LAU-3 HE M151
				{ CLSID = "LAU3_HE5" }, --LAU-3 HEAT Mk5
				{ CLSID = "{BRU33_2*LAU10}"},
				-- { CLSID = "{BRU41_6X_MK-82}" },
				{ CLSID = "{BRU33_2X_MK-82}" },
				{ CLSID = "{BRU33_2X_MK-82_Snakeye}" },
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}"},--single Zuni
				-- { CLSID = "{C40A1E3A-DD05-40D9-85A4-217729E37FAE}" },--Walleye
				{ CLSID = "{BRU-42_2*Mk-82SNAKEYE_RIGHT}" },-- 2 ea MK82 SE on TER
				{ CLSID = "{BRU-42_2*Mk-82_RIGHT}" },--2 ea MK82 on TER
				{ CLSID = "{SB_F8_BRU_41A_M82_4 Rt}" },--4 each MK82 on MER  needs weapons declaration at end of this lua
				{ CLSID = "{SB_F8_BRU_41A_M82SE_4 Rt}" },--4 each MK82SE on MER  needs weapons declaration at end of this lua
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" }, -- M117 750LBS			
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" }, --Mk84
				{ CLSID = "{DFT-300gal_LR}" },
				{ CLSID = "{DFT-300gal_LR_EMPTY}" },
						-- { CLSID = "{DFT-300gal_LR}",attach_point_position = { -0.10, -0.008, 0.0}}, --another posibility to fix 300 gal tank position/angle ?
				{ CLSID = "{DFT-150gal}" },
				{ CLSID = "{DFT-150gal_EMPTY}" },
				{ CLSID = "<CLEAN>", arg_value = 1.0},
			}
		),
	},

	Tasks = {
        aircraft_task(CAP),
		aircraft_task(Escort),
		aircraft_task(FighterSweep),
		aircraft_task(Intercept),
		aircraft_task(Reconnaissance),
		aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(AntishipStrike),
    },
	DefaultTask = aircraft_task(CAP),
	Countries = {"USA"},

	-- based on MiG-19 SFM
	SFM_Data =
	{
		aerodynamics =
		{
			Cy0	        =   0, -- zero AoA lift coefficient*
			Mzalfa	    =   3.500, -- coefficients for pitch agility
			Mzalfadt	=   0.800, -- coefficients for pitch agility
			kjx	        =   2.150, -- Inertia parametre X - Dimension (clean) airframe drag coefficient at X (Top) Simply the wing area in square meters (as that is a major factor in drag calculations)
			kjz	        =   0.015, -- Inertia parametre Z - Dimension (clean) airframe drag coefficient at Z (Front) Simply the wing area in square meters (as that is a major factor in drag calculations)
			Czbe	    =  -0.016, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear	    =   0.020, -- coefficient, drag, gear ??
			cx_flap	    =   0.125, -- coefficient, drag, full flaps
			cy_flap	    =   0.350, -- coefficient, normal force, lift, flaps
			cx_brk	    =   0.040, -- coefficient, drag, breaks
			-- Increased Cx0 by 0.01
			-- Reduced Cya by 0.005
			table_data  =
			{
                --M     Cx0*	 	Cya*	B2		B4	 	Omxmax	Aldop*	Cymax*
                {0.00,	0.03400,	0.0620,	0.125,	0.070,	0.3500,	22.0,	1.100},
                {0.20,	0.03400,	0.0620,	0.125,	0.070,	0.7000,	22.0,	1.100},
                {0.40,	0.03400,	0.0632,	0.125,	0.120,	1.1000,	22.0,	1.050},
                {0.60,	0.03400,	0.0696,	0.130,	0.140,	1.7204,	21.5,	1.000},
                {0.70,	0.02800,	0.0748,	0.130,	0.140,	2.1299,	21.0,	0.990},
                {0.80,	0.02500,	0.0800,	0.120,	0.230,	2.4261,	20.5,	0.980},
                {0.90,	0.02550,	0.0710,	0.135,	0.170,	2.6090,	20.0,	0.960},
                {1.00,	0.04700,	0.0705,	0.160,	0.135,	2.6786,	17.0,	0.950},
                {1.05,	0.04750,	0.0694,	0.185,	0.080,	2.6709,	16.0,	0.940},
                {1.10,	0.05000,	0.0710,	0.185,	0.080,	2.6348,	14.0,	0.930},
                {1.20,	0.05000,	0.0710,	0.190,	0.120,	2.4777,	14.0,	0.700},
                {1.30,	0.05000,	0.0710,	0.210,	0.120,	2.2073,	14.0,	0.600},
                {1.40,	0.05000,	0.0710,	0.220,	0.120,	1.8236,	14.0,	0.500},
                {1.50,	0.05000,	0.0710,	0.280,	0.120,	1.3265,	14.0,	0.475},
			}, -- end of table_data
            -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
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
			Nmg		=	50,		-- RPM at idle
			MinRUD	=	0,		-- Min state of the РУД
			MaxRUD	=	1,		-- Max state of the РУД
			MaksRUD	=	0.85,	-- Military power state of the РУД
			ForsRUD	=	0.91,	-- Afterburner state of the РУД
			typeng	=	1,		-- 0 - engine with high bypass ratio, 1 - jet engine
			hMaxEng	=	19,		-- Max altitude for safe engine operation in km
			dcx_eng	=	0.0150,	-- Engine drag coeficient
			cemax	=	1.24,	-- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56,	-- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	1600,	-- altitude coefficient for max thrust
			dpdh_f	=	2500,	-- altitude coefficient for AB thrust
			-- +15k Pmax and Pfor
			table_data =
			{         --   M    Pmax    Pfor
				[1] = 	{0.00,	56141,	66049},
				[2] = 	{0.1,	54118,	64639},
				[3] = 	{0.2,	62742,	63546},
				[4] = 	{0.3,	51890,	62930},
				[5] = 	{0.4,	51429,	62952},
				[6] = 	{0.5,	51358,	62973},
				[7] = 	{0.6,	51421,	62995},
				[8] = 	{0.7,	51481,	63174},
				[9] = 	{0.8,	51931,	63355},
				[10] = 	{0.9,	52385,	63535},
				[11] = 	{1.0,	52966,	63715},
				[12] = 	{1.3,	53677,	63896},
				[13] = 	{1.5,	54445,	64574},
				[14] = 	{1.7,	49445,	59574},
				[15] = 	{1.9,	44445,	54574},
				[16] = 	{2.5,	39445,	44574},
			}, -- end of table_data
		}, -- end of engine
	},-- end of SFM_Data

	-- Blueprint taken from Damage.lua of ED, Fencer (Scripts/Aircraft/_Common/Damage.lua)
	Damage = verbose_to_dmg_properties({
		["COCKPIT"]				= {critical_damage = 2, args =  { 65}},
		["NOSE_CENTER"]			= {critical_damage = 3, args =  {146}},
		["NOSE_RIGHT_SIDE"] 	= {critical_damage = 3, args =  {147}},
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3, args =  {150}},
		["NOSE_BOTTOM"]			= {critical_damage = 3, args =  {148}},
		["NOSE_TOP_SIDE"]		= {critical_damage = 3, args =  {147}},

		["WING_L_OUT"]			= {critical_damage = 10,args =  {223},deps_cells = {"FLAP_L_IN","WING_L_PART_OUT"}},
		["WING_R_OUT"]			= {critical_damage = 10,args =  {213},deps_cells = {"FLAP_R_IN","WING_R_PART_OUT"}},
		["WING_L_PART_OUT"]		= {critical_damage = 3, args =  {221}},
		["WING_R_PART_OUT"]		= {critical_damage = 3, args =  {231}},
		["FLAP_L_IN"]			= {critical_damage = 4, args =  {227}},
		["FLAP_R_IN"]			= {critical_damage = 4, args =  {217}},

		["FUSELAGE_BOTTOM"]		= {critical_damage = 8, args =  {152}},
		["FUSELAGE_CENTR_TOP"]	= {critical_damage = 8, args =  {151}},
		-- ["FUSELAGE_CENTR_L"]	= {critical_damage = 4, args =  {154}},
		-- ["FUSELAGE_CENTR_R"]	= {critical_damage = 4, args =  {153}},

		["FIN_TOP"]				= {critical_damage = 4, args =  {244}},
		["RUDDER"]				= {critical_damage = 2, args =  {247}},

		["ENGINE_L"]			= {critical_damage = 4, args =  {167}},
		-- ["ENGINE_R"]			= {critical_damage = 3, args =  {161}},

		["STABILIZER_L_IN"]		= {critical_damage = 3, args =  {235}},
		["STABILIZER_R_IN"]		= {critical_damage = 3, args =  {233}},
		["Front Wheel Out"]     = {critical_damage = 1},
		["Left Wheel Out"]      = {critical_damage = 1},
		["Right Wheel Out"]     = {critical_damage = 1},
		}),
	DamageParts =
	{
		[1] = "crusader-oblomok",
		[2] = "crusader-oblomok",
	},

	lights_data = {
	typename = "collection",
	lights = {
	[1] = { typename = "collection",
							lights = {-- Landing light
									  {typename = "spotlight",
									   connector = "MAIN_SPOT_PTR_02",
									   argument = 209,
									   dir_correction = {elevation = math.rad(-1)},
									   intensity_max = 0
									  },
									  {-- Landing/Taxi light
									   typename = "spotlight",
									   connector = "MAIN_SPOT_PTR_01",
									   argument = 208,
									   dir_correction = {elevation = math.rad(3)},
									   intensity_max = 0
									  }
							}
						},
    [2]	= {	typename = "collection",
								lights = {-- Left Position Light (red)
								{typename = "omnilight",
								 connector = "BANO_1",
								 color = {0.99, 0.11, 0.3},
								 pos_correction  = {0.1, 0, -0.2},
								 argument  = 190
								},
								 -- Right Position Light (green)
								{typename = "omnilight",
								connector = "BANO_2",
								color = {0, 0.894, 0.6},
								pos_correction = {0.1, 0, 0.2},
								argument  = 191
								},
								-- Tail Position Light (white)
								{typename = "omnilight",
								connector = "BANO_0",
								color = {1, 1, 1},
								pos_correction  = {0, 0, 0},
								argument  = 192
								}}
							},

	[3]	= {typename = "collection",
			lights = {
						{typename = "collection",
						lights = {{
								-- Right Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(150), elevation = math.rad(5)},
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {
								-- Left Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(-150), elevation = math.rad(5)},
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {typename  = "argumentlight", argument = 212},
						},
					},
					{typename = "collection",
						lights = {{
								-- Left Nose Floodlight
								typename  = "spotlight",
								position  = {0, -0.3, -5.80},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0, angle_max = 0.45,
								direction = {azimuth = math.rad(45)},
								argument = 211,
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {
								-- Right Nose Floodlight
								typename = "spotlight",
								position  = {0, -0.3, 5.80},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(-45)},
								argument = 210,
								dont_change_color = false,
								angle_change_rate = 0
							   }
						}
					},
					-- UARRSI light
					{
						typename = "omnilight", position  = {6.5, 0.4, 0}, color = {6, 6, 2}
					}
				  },
			}
		}
	},
}

-- Overwing vapor effect by Toan -------------------------------------------------------------------
effects_presets = {
	{effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/crusader_overwingVapor.lua"},

	-- you must create a folder Effects in the F-8 Mod folder ---------------------------------------
	-- inside the Effects folder copy the crusader_overwingVapor.lua, by Toan, 05-01-2024 --------
}  -- end of Overwing vapor effect -----------------------------------------------------------------

add_aircraft(crusader)
