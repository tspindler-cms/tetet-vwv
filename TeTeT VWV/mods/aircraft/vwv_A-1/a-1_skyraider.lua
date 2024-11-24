dofile(current_mod_path.."/a-1_skyraider_damage.lua")

local vwv_a1_skyraider =  {

	Name 				=  'vwv_a1_skyraider',
	DisplayName			= _('A-1H Skyraider'),
	DisplayNameShort	= _('A-1H'),
	Cannon = "yes",

	Picture 			= "a_1_skyraider.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "a_1_skyraider",

	shape_table_data 	=
	{
		{
			file  	 	= 'a_1_skyraider',
			life  	 	= 30, -- lifebar
			vis   	 	= 3, -- visibility gain.
			desrt    	= 'a_1_skyraider_destroyed', -- Name of destroyed object file name
			fire  	 	= { 200, 1},
			username	= 'a_1_skyraider'
		},
		{
			name  = "a_1_skyraider_destroyed",
			file  = "a_1_skyraider_destroyed",
			fire  = { 240, 2}
		},
	},

	mapclasskey = "P0091000025",
	index       =  WSTYPE_PLACEHOLDER,
	attribute   =   {wsType_Air, wsType_Airplane, wsType_Fighter, a_1_skyraider, "Battleplanes", "Refuelable"},
	Categories  =   {},
	M_empty				=	3429,
	M_nominal			=	5213,
	M_max				=	10975,
	M_fuel_max			=  	1036,
	H_max				=	8685,
	average_fuel_consumption	=	0.03,
	CAS_min				=	50,
	V_opt				=	165,
	V_take_off			=	70,
	V_land				=	60, -- 62,
	has_afteburner			=	false,
	has_speedbrake			=	true,
	has_differential_stabilizer 	= 	false,


	-- main_gear_pos 			= 	{ -2.30, -1.42,   0.0},--from neg 1.4
	main_gear_pos 			= 	{ -2.30, -1.28,   0.0},--from neg 1.4
	-- nose_gear_pos 			= 	{   1.3, -2.05,   0.0},--from neg 1.25
	nose_gear_pos 			= 	{   1.3, -1.52,   0.0},--from neg 1.25

	nose_gear_wheel_diameter	=	0.754,
	main_gear_wheel_diameter	=	0.872,

	nose_gear_amortizer_direct_stroke   		= -1.000,   -- down from nose_gear_pos !!! 
	nose_gear_amortizer_reversal_stroke  		= -1.0,  -- up
	nose_gear_amortizer_normal_weight_stroke 	= -0.015,  -- -0.20,   --  -0.050-0.325, hiking
	nose_gear_hiking				=  0.0,

	main_gear_amortizer_direct_stroke	 	=   0, --  down from main_gear_pos !!!
	main_gear_amortizer_reversal_stroke  	    	=  -0.1, --  -1.0, --  -1
	main_gear_amortizer_normal_weight_stroke    	=   -0.015,--  -0.05

	wing_tip_pos = {-0.82, 0.400,     7.5},

	radar_can_see_ground	=	true,
	AOA_take_off		=	0.16,
	stores_number		=	15,
	bank_angle_max		=	20, -- 60
	Ny_min			=	-1,
	Ny_max			=	3,
	tand_gear_max		=	3.3577,
	V_max_sea_level		= 145.0,
	V_max_h			=	  165.0,
	wing_area		=	37.1,
	wing_span		=	15.24,
	wing_type 		= 	2,
	thrust_sum_max		=	7000,
	thrust_sum_ab		=	8100,
	Vy_max			=	10.8,
	length			=	15.96,
	height			=	5.28,
	flaps_maneuver		=	1,
	Mach_max		=	2.0,
	range			=	2540,
	RCS			=	5,
	Ny_max_e		=	7,
	detection_range_max	=	250,
	IR_emission_coeff	=	0.591,
	IR_emission_coeff_ab	=	2.50,
	engines_count		=	1,

	mechanimations = {
		Door0 = {
			{Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0},},},}, Flags = {"Reversible"},},
			{Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
			{Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
		},
		FoldableWings = {
				{Transition 		= {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 10.0}}}}, Flags = {"Reversible"}},
				{Transition 		= {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 10.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
		},
    }, -- end of mechanimations
	LandRWCategories =
    {
        [1] =
		{
			Name = "AircraftCarrier",
        },
        [2] =
        {
			Name = "AircraftCarrier With Catapult",
        },
        [3] =
        {
			Name = "AircraftCarrier With Tramplin",
        },
    }, -- end of LandRWCategories
    TakeOffRWCategories =
        {
        [1] =
        {
			Name = "AircraftCarrier",
        },
        [2] =
        {
			Name = "AircraftCarrier With Catapult",
        },
        [3] =
        {
            Name = "AircraftCarrier With Tramplin",
        },
    }, -- end of TakeOffRWCategories

	engines_nozzles =
	{
		[1] =
		{
			pos 		=  {4.3,	0.24,	-0.672}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 0, -- AFB cone diameter
			exhaust_length_ab	=	0,
			exhaust_length_ab_K	=	0.35,
			smokiness_level     = 	0.1,
		},
	}, -- end of engines_nozzles

	crew_size	 = 1,

	crew_members =
	{
			[1] =
		{
			ejection_seat_name		= "AV8BNA_Pilot_seat",
			pilot_name		   		= "AV8BNA_Pilot",
			drop_canopy_name		= "AV8BNA_Canopy",
			drop_parachute_name		= "AV8BNA_Parachute",
			pos 					= {3.43, 0.703, 0.0},
			g_suit					= 2.0,
            bailout_arg 			= -1,
			}, -- end of [1]
	}, -- end of crew_members

	fires_pos =
	{
		[1] = 	{-2.117,	-0.9,	0},
		[2] = 	{0.500,	0.213,	0},
		[3] = 	{0.500,	0.213,	-2.182},
		[4] = 	{-0.82,	0.265,	2.774},
		[5] = 	{-0.82,	0.265,	-2.774},
		[6] = 	{-0.82,	0.255,	2.7274},
		[7] = 	{-0.82,	0.255,	-2.7274},
		[8] = 	{0.5,	-0.5,	2.7578},
		[9] = 	{0.5,	-0.5,	-2.578},
		[10] = 	{0.50,	0.084,	2.754},
		[11] = 	{0.50,	0.084,	-2.7534},
	}, -- end of fires_pos

	Countermeasures = {
		ECM = "AN/ALQ-165"
	},

	passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 480,
		chaff = {default = 240, increment = 1, chargeSz = 1},
		flare = {default = 240,  increment = 1, chargeSz = 1},
	},

	chaff_flare_dispenser 	= {
		{ dir =  {0, -1, 0}, pos =   {-3.027,  0.35, -0.3}, }, -- Chaff L
		{ dir =  {0, -1, 0}, pos =   {-3.727,  0.35, 0.3}, },  -- Chaff R
	    { dir =  {0, -1,  0}, pos =  {-3.032,  0.35, -0.32}, }, -- Flares L	
		{ dir =  {0, -1,  0}, pos =  {-3.732,  0.35,  0.32}, }, -- Flares R
	},

	Failures = {
			{ id = 'asc', 		label = _('ASC'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'eos',  		label = _('EOS'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			--{ id = 'mlws',  	label = _('MLWS'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},

----------------------------------------------------------- Guns from VWV F-8-----------------------------------------------------------------------------
	Guns = {
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.61,  -0.775,-0.488},
			muzzle_pos_connector	= "gunpoint_1",
			supply_position			= {2.8753, 0, -0.2},	-- approx
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
			muzzle_pos_connector	= "gunpoint_2",
			supply_position			= {2.8753, 0,  0.2},	-- approx
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
			muzzle_pos_connector	= "gunpoint_3",
			supply_position			= {2.8753, 0, -0.2},	-- approx
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
			muzzle_pos_connector	= "gunpoint_4",
			supply_position			= {2.8753, 0,  0.2},	-- approx
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
----------------------------------------------------------------------Pylons---------------------------------------------------------------------------------------------------------------
	Pylons =     {

        pylon(1, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_1", arg = 308, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
		   }
        ),

        pylon(2, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_2", arg = 309, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),

       pylon(3, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_3", arg = 310, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),

      pylon(4, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_4", arg = 311, FiX = 0, FiY = 0, FiZ = 2},
           {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
	}
        ),

       pylon(5, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_5", arg = 312, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),

       pylon(6, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_6", arg = 313, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),

        pylon(7, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_14", arg = 314, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.500, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.4500, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.500, -.12 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.35, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.5, .1 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.5, .1 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}",attach_point_position = {.500, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.45, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {.450, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,attach_point_position = {.450, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,attach_point_position = {.3, -.15 ,0 }},--Mk-84 - 2000lb GP Bomb LD		
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.5, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares

				{ CLSID = "{AV8BNA_AERO1D}" 	,attach_point_position = {.600, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{DFT-150gal}"		,attach_point_position = {.700, .1 ,0 }},
				{ CLSID = "{DFT-150gal_EMPTY}"	,attach_point_position = {.700, .1 ,0 }},

				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.4500, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}" ,attach_point_position = {0.0, -.13 ,0 }},--LAU-10 pod - 4 x Zuni HE
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.13 ,0 }},--Hawkeye 5 inch unguided rocket
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				{ CLSID = "DIS_mk46torp", attach_point_position = {0.2, -0.07, 0}}, --Torpedo
				{ CLSID = "{toilet_bomb}", attach_point_position = {0.55, -0.3, 0}}, -- Toilet Bomb
			}
        ),

        pylon(8, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_13", arg = 314},
            {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.00, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.00, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.00, -.12 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.00, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.08, .08 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.08, .08 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)

				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}"	,attach_point_position = {.00, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" 	,attach_point_position = {.00, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets

				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" 	,attach_point_position = {.0, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" 	,attach_point_position = {.0, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"	,attach_point_position = {.0, -.15 ,0 }},--Mk-84 - 2000lb GP Bomb LD				

				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.00, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{AV8BNA_AERO1D}" ,attach_point_position = {.00, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				{ CLSID = "DIS_mk46torp", attach_point_position = {0, -0.07, 0}}, --Torpedo
			}
        ),

        pylon(9, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_15", arg = 314, FiX = 0, FiY = 0, FiZ = 2},
           {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.500, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.4500, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.500, -.12 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.35, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.5, .1 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.5, .1 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}",attach_point_position = {.500, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.45, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {.450, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,attach_point_position = {.450, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,attach_point_position = {.3, -.15 ,0 }},--Mk-84 - 2000lb GP Bomb LD		
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.5, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				
				{ CLSID = "{AV8BNA_AERO1D}" 	,attach_point_position = {.600, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{DFT-150gal}"		,attach_point_position = {.700, .1 ,0 }},
				{ CLSID = "{DFT-150gal_EMPTY}"	,attach_point_position = {.700, .1 ,0 }},
				
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.4500, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}" ,attach_point_position = {0.0, -.13 ,0 }},--LAU-10 pod - 4 x Zuni HE
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.13 ,0 }},--Hawkeye 5 inch unguided rocket
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				{ CLSID = "DIS_mk46torp", attach_point_position = {0.2, -0.07, 0}}, --Torpedo
				{ CLSID = "{toilet_bomb}", attach_point_position = {0.55, -0.3, 0}}, -- Toilet Bomb
		   }
        ),
			
       pylon(10, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_7", arg = 315, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
		   }
        ),
			
       pylon(11, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_8", arg = 316, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),
			
        pylon(12, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_9", arg = 317, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),
			
        pylon(13, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_10", arg = 318, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),
			
        pylon(14, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_11", arg = 319, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
		   }
        ),
			
        pylon(15, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_12", arg = 320, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
 			}
        ),

	},
   		
	
	Tasks = {
		aircraft_task(GroundAttack),
      	aircraft_task(CAS),
       	aircraft_task(AFAC),
		aircraft_task(RunwayAttack),
		aircraft_task(AntishipStrike),
    },	
	DefaultTask = aircraft_task(CAS),

	--[[
	SFM_Data = {
		aerodynamics = 
		{
			Cy0	=	0,
			Mzalfa	=	6,
			Mzalfadt	=	1,
			kjx = 2.95,
			kjz = 0.00125,
			Czbe = -0.016,
			cx_gear = 0.0268,
			cx_flap = 0.06,
			cy_flap = 0.4,
			cx_brk = 0.085,
			table_data = 
			{
			--      M	 Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax
				{0.0,	0.0185,		0.055,		0.08,		0.22,	0.65,	25.0,	1.2 	},
				{0.2,	0.0185,		0.055,		0.08,		0.22,	1.80,	30.0,	1.2     },
				{0.4,	0.0519,		0.055,		0.08,	   	0.22,	3.00,	30.0,	1.2     },
				{0.6,	0.0510,		0.055,		0.05,		0.28,	4.20,	28.0,	1.2     },
				{0.7,	0.0510,		0.055,		0.05,		0.28,	4.20,	27.0,	1.15    },
				{0.8,	0.115,		0.055,		0.05,		0.28,	4.20,	25.7,	1.1     },
				{0.9,	0.200,		0.058,		0.09,		0.20,	4.20,	23.1,	1.07    },
				{1.0,	0.200,		0.062,		0.17,		0.15,	4.20,	18.9,	1.04    },
				{1.1,	0.200,		0.062,	   	0.235,		0.09,	3.78,	17.4,	1.02    },
				{1.2,	0.200,		0.062,	   	0.285,		0.08,	2.94,	17.0,	1.00 	},		
				{1.3,	0.200,		0.06,	   	0.29,		0.10,	2.10,	16.0,	0.92 	},				
				{1.4,	0.200,		0.056,	   	0.3,		0.136,	1.80,	15.0,	0.80 	},					
				{1.6,	0.200,		0.052,	   	0.34,		0.21,	1.08,	13.0,	0.7 	},					
				{1.8,	0.0400,		0.042,	   	0.34,		2.43,	0.96,	12.0,	0.55 	},		
				{2.2,	0.0400,		0.037,	   	0.49,		3.5,	0.84,	 10.0,	0.37 	},					
				{2.5,	0.0400,		0.033,		0.6,		4.7,	0.84,	 9.0,	0.3 	},		
				{3.9,	0.0400,		0.023,		0.9,		6.0,	0.84,	 7.0,	0.2		},				
			}
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			typeng	=	3,
			hMaxEng	=	19.5,
			dcx_eng	=	0.0114,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	7000,
			dpdh_f	=	9000.0,
			table_data = {
			--   M		Pmax		 Pfor
				{0.0,	65000,		112000},
				{0.2,	64000,		100000},
				{0.4,	62000,		105000},
				{0.6,	63000,		107000},
				{0.7,	65000,		110000},
				{0.8,	65000,		120000},
				{0.9,	65000,		135000},
				{1.0,	67000,		150000},
				{1.1,	63000,		158000},
				{1.2,	 94000,		168000},
				{1.3,	 84000,		185000},
				{1.4,	 71000,		100000},
				{1.6,	 34000,		118000},
				{1.8,	 19000,		137000},
				{2.2,	 17000,		170000},
				{2.5,	 19000,		190000},
				{3.9,	 82000,		110000},
				}                 
		}, -- end of engine
	},
	]]

	-- new SFM data, based on DC-3 mod, kudos Hawkeye60
	SFM_Data = {
        aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
        {
            Cy0            =    0.0,  -- zero AoA lift coefficient
            Mzalfa         =    4.3,   -- 3.4,  -- coefficients for pitch agility
            Mzalfadt       =    0.8,    -- coefficients for pitch agility
            kjx            =    2.25,    
            kjz            =    0.00125,
            Czbe           =    -0.012, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
            cx_gear        =    0.02,  -- 0.0330,    -- coefficient, drag, gear - less drag to allow for good take-off when heavy
            cx_flap        =    0.01,  -- 0.033,   -- coefficient, drag, full flaps - less drag to allow for good take-off when heavy
            cy_flap        =    0.9,   -- 0.28,    -- coefficient, normal force, lift, flaps - very efficient flaps to allow for take-off with max weight
            cx_brk         =    0.06,   -- coefficient, drag, breaks
            table_data  =
            {
            --   M        Cx0        Cya        B        B4            Omxmax    Aldop    Cymax
--[[                {0,      0.0249,    0.117,     0.056,    0.000089,    0.11,    17,        1.40}, --0
                {0.1,    0.0249,    0.117,     0.056,    0.000089,    0.25,    18,        1.65}, --76.7269mph
                {0.2,    0.0249,    0.116,     0.056,    0.000089,    0.25,    18,        1.65}, --153.454 mph
                {0.3,    0.0249,    0.1163,    0.054,    0.000089,    0.25,    17,        1.6}, --230.2 mph
                {0.4,    0.0259,    0.1176,    0.048,    0.000192,    0.20,    16,        1.44}, --306.908
                {0.5,    0.0269,    0.1179,    0.030,    0.000593,    0.18,    10,        1.0}, --383.635
                {0.6,    0.0289,    0.1183,    0.028,    0.0032,      0.1,      9,        0.9}, --460.361
                {0.7,    0.047,     0.1185,    0.149,    0.19,        0.1,      6,        0.8}, --537.088
                {0.8,    0.064,     0.1186,    0.17,     0.4,         0.1,      3,        0.6}, --613.815
                {0.9,    0.0995,    0.1185,    0.175,    2.7925,      0.1,      3,        0.4}, --690.542
                {1,      0.146,     0.1184,    0.2,      3.19,        0.1,      1,        0.2}, --767.269
]]
--[[
{ 0, 0.0217, 0.076, 0.075, 0, 0.01, 20, 1.58 }, 
{ 0.2, 0.0217, 0.076, 0.075, 0, 0.933, 20, 1.58 }
 ]]
--[[                {0,      0.010,    0.117,     0.056,    0.000089,    0.11,    17,        2.00}, --0
                {0.1,    0.012,    0.117,     0.056,    0.000089,    0.25,    18,        1.85}, --76.7269mph
                {0.2,    0.013,    0.116,     0.056,    0.000089,    0.25,    18,        1.65}, --153.454 mph
]]				
				{0,      0.010,    0.517,     0.056,    0.000089,    0.25,    20,        0.00}, --0
				{0.1,    0.012,    0.212,     0.055,    0.000089,    0.85,    20,        0.2}, --76.7269mph
				{0.2,    0.013,    0.454,     0.055,    0.000089,    0.95,    20,        1.2}, --153.454 mph				
                {0.3,    0.014,    0.4163,    0.054,    0.000089,    1.25,    17,        1.6}, --230.2 mph
                {0.4,    0.016,    0.4176,    0.048,    0.000192,    1.20,    16,        1.44}, --306.908
                {0.5,    0.020,    0.4179,    0.030,    0.000593,    1.18,    10,        1.0}, --383.635
                {0.6,    0.021,    0.4180,    0.029,    0.0004,      1.15,     9,        0.9}, --460.361
                {0.7,    0.021,    0.4183,    0.028,    0.00032,     0.14,     9,        0.85}, --537.088
                {0.8,    0.064,    0.4186,    0.17,     0.4,         0.1,      3,        0.6}, --613.815
                {0.9,    0.0995,    0.4185,    0.175,    2.7925,      0.1,      3,        0.4}, --690.542
                {1,      0.146,     0.4184,    0.2,      3.19,        0.1,      1,        0.2}, --767.269
            }, -- end of table_data
            -- M - Mach number
            -- Cx0 - Coefficient, drag, profile, of the airplane
            -- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
            -- B - Polar quad coeff
            -- B4 - Polar 4th power coeff
            -- Omxmax - roll rate, rad/s
            -- Aldop - Alfadop Max AOA at current M - departure threshold
            -- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
        }, -- end of aerodynamics
        engine =
        {
            Nominal_RPM =  2700.0,
            Nmg         =    23.077, -- RPM at idle
            MinRUD      =     0, -- Min state of the throttle
            MaxRUD      =     1, -- Max state of the throttle
            MaksRUD     =     1, -- Military power state of the throttle
            ForsRUD     =     1, -- Afterburner state of the throttle
			typeng	=	3,
            -- type   =  "Radial", -- use 3 for carrier take-off
			Startup_Prework = 12,
			Startup_RPMs = {
				{0, 0},
				{1, 66},
				{4.6, 66},
				{5, 300},
				{5.5, 450},
				{7, 500},
				{9, 800},
				{12, 600},
			},
			Startup_Ignition_Time = 7,
			Shutdown_Duration = 6.8,
            cylinder_firing_order = {1, 10, 5, 14, 9, 4, 13, 8, 3, 12, 7, 2, 11, 6},
            --    E_TURBOJET = 0
            --    E_TURBOJET_AB = 1
            --    E_PISTON = 2
            --    E_TURBOPROP = 3
            --    E_TURBOFAN    = 4
            --    E_TURBOSHAFT = 5
            hMaxEng    =    12.5, -- Max altitude for safe engine operation in km
            dcx_eng    =    0.015, -- Engine drag coeficient
            cemax      =    0.37, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
            cefor      =    0.37, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
            dpdh_m     =    1800, --  altitude coefficient for max thrust 2100?
            dpdh_f     =    1800, --  altitude coefficient for AB thrust

            table_data =
            {
                [1] =     {0,      26395.9    ,26395.9},
                [2] =     {0.1,    26393.8    ,26393.8},
                [3] =     {0.2,    12995.6    ,12995.6},
                [4] =     {0.3,    11800.8    ,11800.8},
                [5] =     {0.4,    10673.3    ,10673.3},
                [6] =     {0.5,    10254.2    ,10254.2},
                [7] =     {0.6,    10029.2    ,10029.2},
                [8] =     {0.7,    10012.3    ,10012.3},
                [9] =     {0.8,     6719.3    , 6719.3},
                [10] =    {0.9,     4650      , 4650},

--[[                [1] =     {0,      10395.9   ,10395.9},
                [2] =     {0.1,    10393.8   ,10393.8},
                [3] =     {0.2,    9995.6    ,9995.6},
                [4] =     {0.3,    9800.8    ,9800.8},
                [5] =     {0.4,    9673.3    ,9673.3},
                [6] =     {0.5,    9254.2    ,9254.2},
                [7] =     {0.6,    9029.2    ,9029.2},
                [8] =     {0.7,    8312.3    ,8312.3},
                [9] =     {0.8,    5719.3    ,5719.3},
                [10] =    {0.9,    3650      ,3650},
]]	
            },			
            -- M - Mach number
            -- Pmax - Engine thrust at military power
            -- Pfor - Engine thrust at AFB
			-- Some settings from P47D-40
			k_adiab_1 = 0.0275,
			k_adiab_2 = 0.0275,
			MAX_Manifold_P_1 = 108300,
			MAX_Manifold_P_2 = 155774,
			MAX_Manifold_P_3 = 196410,
			k_after_cool = 0.38,
            Displ = 45.9,
			k_Eps = 4.75,
            Stroke = 0.152,
            V_pist_0 = 15,
			Nu_0 = 1.2,
			Nu_1 = 0.91,
			Nu_2 = 0.0015,
			N_fr_0 = 0.078,
			N_fr_1 = 0.002,
			N_indic_0 = 1993576.4,
            Init_Mom            = 220,
            D_prop              = 3.51, --dia of propeller in metres
            MOI_prop = 88,
            k_gearbox = 2,
            P_oil = 495438,
            k_boost             = 3, --type of boost ??
            k_cfug              = 0.003,
            k_oil = 4e-05,
            k_piston            = 3000,
            k_reg               = 0.003,
            k_vel               = 0.017,		
				prop_pitch_min		= 23.0,	-- prop pitch min, degrees 
				prop_pitch_max		= 65.0,	-- prop pitch max, degrees 
				prop_pitch_feather	= 80.0,	-- prop pitch feather position, degrees if feather < prop_pitch_max no feathering available
                prop_blades_count   = 4,
                prop_locations      = {
                    {2.211, -0.014, 0.000}, {0.0, 0.0, math.rad(-1.87)},
                },			
		}, -- end of engine
    }, -- end of SFM_Data

	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
		[0] =  {critical_damage = 20, args = {296}},  -- pilot area
		[1] =  {critical_damage = 20, args = {297}},  -- copilot area
		[2] =  {critical_damage = 20, args = {146}},  -- nose bottom
		[3] =  {critical_damage = 20, args = {235}},   -- elevator left
		[4] =  {critical_damage = 20, args = {233}},   -- elevator right
		[5] =  {critical_damage = 20, args = {213}},  -- pod left
		[6] =  {critical_damage = 20, args = {223}},  -- pod right
		[7] =  {critical_damage = 20, args = {159}},   -- Vertical stabilizer
		[8] =  {critical_damage = 20, args = {152}},  -- fuselage bottom
		[9] =  {critical_damage = 20, args = {154}},  -- cabin left
		[10] =  {critical_damage = 20, args = {153}}, -- cabin right
		[11] =  {critical_damage = 20, args = {156}}, -- under tail	
		[12] =  {critical_damage = 20, args = {157}}, -- fuselage rear left
		[13] =  {critical_damage = 20, args = {158}}, -- fuselage rear right
		[12] =  {critical_damage = 20, args = {260}},  -- copilot area
		[13] =  {critical_damage = 20, args = {261}},  -- nose bottom
		[14] =  {critical_damage = 20, args = {262}},   -- elevator left
		[15] =  {critical_damage = 20, args = {263}},   -- elevator right
		[16] =  {critical_damage = 20, args = {264}},  -- pod left
		[17] =  {critical_damage = 20, args = {265}},  -- pod right
		[18] =  {critical_damage = 20, args = {266}},   -- Vertical stabilizer

		-- Undercarriage
		["WHEEL_REAR"] = {
			critical_damage = 2, args = {134}, damage_boundary = 1.0,
			construction = {durability = 0.15, skin = "Rubber", refractory = true},
			innards = {
				{id = "XUCShockC", skin = "Steel", wall = 0.010},
			},
		},
		["WHEEL_R"] = {
			critical_damage = 3, args = {135}, damage_boundary = 1.0,
			construction = {durability = 0.25, skin = "Rubber", refractory = true},
			innards = {
				{id = "XUCShockRH", skin = "Steel", wall = 0.009},
			},
		},
		["WHEEL_L"] = {
			critical_damage = 3, args = {136}, damage_boundary = 1.0,
			construction = {durability = 0.25, skin = "Rubber", refractory = true},
			innards = {
				{id = "XUCShockLH", skin = "Steel", wall = 0.009},
			},
		},
	},
	
	DamageParts = 
	{  
		
		
	},
	
	lights_data = {
		typename = "collection",
		lights = {
			[WOLALIGHT_NAVLIGHTS] = {
				typename = "Collection",
				lights = {
					[1] = {
						typename = "collection",
						lights = {
			{
				typename  = "omnilight",
				connector = "BANO_0",
				color     = {1.0, 1.0, 1.0, 0.333},
				position  = {-8.880, 0.687, 0.000},
				argument  = 192,
				movable   = false,
			},					
			{
				typename  = "omnilight",
				connector = "BANO_1",
				color     = {0.99, 0.11, 0.3, 0.333},
				position  = {-0.406, -0.480, -3.901},
				argument  = 190,
				movable   = false,
			},
			{
				typename  = "omnilight",
				connector = "BANO_2",
				color     = {0.0, 0.894, 0.6, 0.333},
				position  = {-0.406, -0.480,  3.901},
				argument  = 191,
				movable   = false,
			},
					{ 
						typename = "argumentlight", argument = 0,
					},
					{ 
						typename = "argumentlight", argument = 3,
					},
					{ 
						typename = "argumentlight", argument = 5,
					},		
						},
					},
				
				},
			},--must be collection
			[WOLALIGHT_SPOTS] = {
				typename = "collection",
				lights = {
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR", argument = 208,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR", argument = 208,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
				},
			},
			[WOLALIGHT_TAXI_LIGHTS] = {
				typename = "collection",
				lights = {
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR", argument = 209,
								proto = lamp_prototypes.FPP_7,
								movable = true,
								intensity_max = 0
							},
							{
								typename = "spotlight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
								intensity_max = 0
							},
							{
								typename = "omnilight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
								intensity_max = 0
							},
						},
					},
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR", argument = 209,
								proto = lamp_prototypes.FPP_7,
								movable = true,
								intensity_max = 0
							},
							{
								typename = "spotlight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
								intensity_max = 0
							},
							{
								typename = "omnilight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
								intensity_max = 0
							},
						},
					},
				},
			},
			[WOLALIGHT_STROBES] = {
				typename = "collection",
				lights = {
					{
						typename = "Collection",
						lights = {
							{
								typename = "RotatingBeacon",position  = {-4.206, 3.615,  0.00}, connector = "RED_BEACON",color = {0.8, 0.0, 0.0}, argument = 193,
								proto = lamp_prototypes.MSL_4,
							},
							{
								typename  = "omnilight",position  = {-4.206, 3.615,  0.00},connector = "BANO_1",color  = {0.8, 0.0, 0.0},
								movable   = false,
							},						
						},
					},
				},
			},
			[WOLALIGHT_FORMATION_LIGHTS] = {
				typename = "collection",
				lights = {
					{
						typename = "argumentlight", argument = 200,position  = {-1.206, 0.615,  -4.00}
					},
					{
						typename = "argumentlight", argument = 201,position  = {-1.206, 0.615,  4.00}
					},
					{
						typename = "argumentlight", argument = 202,
					},
					{
						typename = "argumentlight", argument = 203,
					},
				},
			},
		}, 
	},
}

add_aircraft(vwv_a1_skyraider)
