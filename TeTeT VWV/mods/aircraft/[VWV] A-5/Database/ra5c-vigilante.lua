local launch_bar_connected_arg_value_ = 1.0;
return {

	Name 				=   'vwv_ra-5',
	DisplayName			= _('[VWV] RA-5C Vigilante'),
	DisplayNameShort	= _('RA-5C'),
	Picture 			= "a5_vigilante.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "a5_vigilante",

	shape_table_data 	=
	{
		{
			file  	 	= 'a5_vigilante';
			life  	 	= 18; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'a5-vigilante'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'a5_vigilante';
			index    	=  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "a5-vigilante";
			file  = "a5-vigilante";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000025",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories 			= {},
	-------------------------
	M_empty 					= 14870, -- kg
	M_nominal 					= 21605, -- kg
	M_max 						= 28615, -- kg
	M_fuel_max 					= 10000, -- kg -- TeTeT: Trying to increase take-off weight
	H_max 					 	= 15900, -- m
	average_fuel_consumption 	= 0.005, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 60, -- minimal indicated airspeed*?
	-- M = 15600 lbs
	V_opt 						= 164,-- Cruise speed (for AI)*
	V_take_off 					= 91, -- Take off speed in m/s (for AI)*
	V_land 						= 82, -- Land speed in m/s (for AI)
	V_max_sea_level 			= 411, -- Max speed at sea level in m/s (for AI)
	V_max_h 					= 686, -- Max speed at max altitude in m/s (for AI)
	Vy_max 						= 41.1, -- Max climb speed in m/s (for AI)
	Mach_max 					= 2.0, -- Max speed in Mach (for AI)
	Ny_min 						= -3, -- Min G (for AI)
	Ny_max 						= 8.0,  -- Max G (for AI)
	Ny_max_e 					= 8.0, -- ?? Max G (for AI)
	AOA_take_off 				= 0.17, -- AoA in take off radians (for AI)
	bank_angle_max 				= 75, -- Max bank angle (for AI)
	has_afteburner	            = true,
	has_speedbrake	            = true,

	nose_gear_pos                            = {4.642, -1.9177, 0.000}, -- 15cm lower due to suspension
	nose_gear_amortizer_direct_stroke        = 0.300,
	nose_gear_amortizer_reversal_stroke      = -0.150,
	nose_gear_amortizer_normal_weight_stroke = 0.0,
    nose_gear_wheel_diameter                 = 0.7086,
    tand_gear_max = 3.73, -- math.rad(180.0), --	-5.54,

	-- Suspension disabled as it puts the nose wheel in the deck
    main_gear_pos                            = {-1.7407, -1.9529, 0.000}, -- 19cm lower due to suspension
    main_gear_amortizer_direct_stroke        = 0.000,
    main_gear_amortizer_reversal_stroke      = 0.000,
    main_gear_amortizer_normal_weight_stroke = 0.0,
    main_gear_wheel_diameter                 = 0.9225,

    wing_tip_pos = {-4.0, 0.9, 8.0},

	stores_number = 0,
	tanker_type	=	2,
	wing_area = 65.1,
	wing_span = 16.16,
	wing_type   = 2,-- FIXED_WING = 0/VARIABLE_GEOMETRY = 1/FOLDED_WING = 2/VARIABLE_GEOMETRY_FOLDED = 3
	thrust_sum_max	=	21400,
	thrust_sum_ab	=	28000,
	length = 23.32,
	height = 5.91,
	flaps_maneuver	=	1.0,
	range	=	2372,
	RCS	=	4.0,
	IR_emission_coeff	=	0.6,
	IR_emission_coeff_ab	=	2.5,

	engines_count				= 2, -- Engines count
	engines_nozzles = {
		[1] =
		{
			pos 		=  {-8.80, 0.40, 1.05}, -- nozzle coords
			elevation   =  1.0, -- AFB cone elevation
			diameter	 = 1.2, -- AFB cone diameter
			exhaust_length_ab   = 10, -- length in m
			exhaust_length_ab_K = 1.0, -- AB animation
			engine_number  = 1, --both to first engine
			smokiness_level = 0.1
		}, -- end of [1]
		[2] =
		{
			pos 		=  {-8.80, 0.40, -1.05}, -- nozzle coords
			elevation   =  1.0, -- AFB cone elevation
			diameter	 = 1.2, -- AFB cone diameter
			exhaust_length_ab   = 10, -- length in m
			exhaust_length_ab_K = 1.0, -- AB animation
			engine_number  = 2, --both to first engine
			smokiness_level = 0.1
		}, -- end of [2]
	}, -- end of engines_nozzles

	crew_size = 2,
	-- Shameless copy from F-4E
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

		--[[
		[1] = {
			role                = "pilot";
			pilot_name          = "F-4E_Pilot",
			ejection_seat_name  = "F-4E_Seat_Pilot",
			drop_canopy_name    = "a5_pilotcanopy",
			pos                 = {-2.500, -0.055, 0.000},
			canopy_pos          = {0.000, 0.000, 0.000},
			drop_parachute_name = "F-4E_Parachute_Pilot",
			canopy_arg			= 38,
			canopy_args			= {38, 1},
		}, -- end of [1]
		[2] = {
			role                = "instructor";
			pilot_name          = "F-4E_WSO",
			ejection_seat_name  = "F-4E_Seat_WSO",
			drop_canopy_name    = "a5_wsocanopy",
			pos                 = {-2.500, -0.055, 0.000},
			canopy_pos          = {0.000, 0.000, 0.000},
			drop_parachute_name = "F-4E_Parachute_WSO",
			canopy_arg			= 38,
			canopy_args			= {38, 1},
			ejection_order		= 1,
		}, -- end of [2]
		]]

	}, -- end of crew_members
	-- FIXME
	fires_pos =
		{
			[1] = 	{-2,	-0,		0.5},
			[2] = 	{-1,	-0,		2.237},
			[3] = 	{-1,	-0,		-2.237},
			[4] = 	{0.265,	-0,		1.5},
			[5] = 	{-2.6,	-0,		0.2},
			[6] = 	{0.5,	-0,		1.274},
			[7] = 	{0.5,	-0.3,	-1.274},
			[8] = 	{-1,	0,		0},
			[9] = 	{-3.5,	0,		0},
			[10] = 	{-2.5,	0,		0},
			[11] = 	{-1,	0,		0},
	}, -- end of fires_pos

	mechanimations = {
		-- FA-18C
		LaunchBar = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 1.0, "in", 4.5}}}}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 4.5}}}}},
			{Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 0.745, "in", 4.0}}}}},
			{Transition = {"Any", "Retract"},    Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 1.0}}}}},--4.5 LaunchBar Hoch from VSN F-4B
			{Transition = {"Stage", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 0.5}}}}}, -- in was 4.0
			{Transition = {"Extend", "Stage"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 1.0, "to", 0.745, "in", 1.0}}}}},
			{Transition = {"Stage", "Pull"},     Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 0.743, "in", 1.0}}}}},
			{Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 1.0, "in", 0.2}}}}},
		},
		Door0 = {
			{Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0},},},}, Flags = {"Reversible"},},
			{Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
			{Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
		},
		FoldableWings = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 10.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 10.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
		},
	},
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

	Guns = {
	},

	Pylons =  {
		-- We want to portray an RA-5C which is usually flown without pylons
		-- also we have no pylon on the model
		--[[
		pylon(1, 0, 0, 0, 0, {use_full_connector_position = false, connector = "pylon_1" , arg = 309 , arg_value = 0},
		{
		        { CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" },        --Mk-83
			    { CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" },        --Mk-84
			    { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}" },        --Smokewinder - red
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}" },        --Smokewinder - green
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}" },        --Smokewinder - blue
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}" },        --Smokewinder - white
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}" },        --Smokewinder - yellow
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}" },        --Smokewinder - orange
		}),
		pylon(2, 2, 0, 0, 0, {use_full_connector_position = true, connector = "pylon_2" , arg = 308 , arg_value = 0},
		{
			    { CLSID = "{RN-24}" },   --Nuke
                { CLSID = "{RN-28}" },  ---Nuke
				{ CLSID = "{0519A263-0AB6-11d6-9193-00A0249B6F00}" },        --Shpil-2M Laser Intelligence Pod
                { CLSID = "{0519A264-0AB6-11d6-9193-00A0249B6F00}" },        --L-081 Fantasmagoria ELINT pod
				{ CLSID = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}" },        --L005 Sorbtsiya ECM pod (right)
                { CLSID = "{44EE8698-89F9-48EE-AF36-5FD31896A82D}" },        --MPS-410
                { CLSID = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}" },        --L005 Sorbtsiya ECM pod (left)
				{ CLSID = "{8C3F26A2-FA0F-11d5-9190-00A0249B6F00}" },        --Sky-Shadow ECM Pod
		}),
		pylon(3, 2, 0, 0, 0, {use_full_connector_position = true, connector = "pylon_3" , arg = 310 , arg_value = 0},
		{
			    { CLSID = "{RN-24}" },   --Nuke
                { CLSID = "{RN-28}" },  ---Nuke
			    { CLSID = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}" },        --AN/AAQ-28 LITENING
				{ CLSID = "{B1EF6B0E-3D91-4047-A7A5-A99E7D8B4A8B}" },        --Mercury LLTV Pod
				{ CLSID = "{Goldeneye}" },        --Goldeneye
				{ CLSID = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}" },        --White Smoke 
				{ CLSID = "{E1F29B21-F291-4589-9FD8-3272EEC69506}" },        --Fuel tank 610 gal
				{ CLSID = "{F4920E62-A99A-11d8-9897-000476191836}" },        --Kopyo radar pod
		}),
		pylon(4, 1, 0, 0, 0, {use_full_connector_position = false, connector = "pylon_4" , arg = 309 , arg_value = 0},
		{
		        { CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" },        --Mk-83
			    { CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" },        --Mk-84
			    { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}" },        --Smokewinder - red
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}" },        --Smokewinder - green
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}" },        --Smokewinder - blue
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}" },        --Smokewinder - white
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}" },        --Smokewinder - yellow
                { CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}" },        --Smokewinder - orange
		}),
		]]
    },
    -- Tasks
    Tasks = {
		-- aircraft_task(CAP),
		-- aircraft_task(Escort),
		-- aircraft_task(FighterSweep),
		-- aircraft_task(GroundAttack),
		-- aircraft_task(CAS),
		-- aircraft_task(AFAC),
		-- aircraft_task(RunwayAttack),
		-- aircraft_task(AntishipStrike),
		-- aircraft_task(Intercept),
		aircraft_task(Reconnaissance),
    },
	DefaultTask = aircraft_task(Reconnaissance),
-----------------------------------------------------------------------------------------
    -- Based on F-4E by Heatblur
	SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0			=	0.1671,      -- zero AoA lift coefficient
			Mzalfa		=	4.355,  -- coefficients for pitch agility
			Mzalfadt	=	0.8,    -- coefficients for pitch agility
			kjx			=	2.75,
			kjz			=	0.00125,
			Czbe		=	-0.016, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear		=	0.0268,    -- coefficient, drag, gear
			cx_flap		=	0.02,   -- coefficient, drag, full flaps
			cy_flap		=	0.36,    -- coefficient, normal force, lift, flaps
			cx_brk		=	0.06,   -- coefficient, drag, breaks
			-- Copied from F-4E
			table_data  =
			{	--      M		Cx0		 Cya		B	        B4	      Omxmax	Aldop	Cymax
				[1] = 	{0,	    0.018,	0.037,	    0.162,	    0.285,	    0.36,	16,	    1.3},
				[2] = 	{0.2,	0.020,	0.047,	    0.162,	    0.285,	    0.573,	16,	    1.3},
				[3] = 	{0.5,	0.022,	0.069,	    0.162,	    0.285,	    3.584,	16,	    1.3},
				[4] = 	{0.6,	0.025,	0.070,	    0.162,	    0.285,	    5.162,	16,	    1.3},
				[5] = 	{0.7,	0.025,	0.072,	    0.162,	    0.285,	    5.103,	16,	    1.15},
				[6] = 	{0.8,	0.025,	0.074,	    0.162,	    0.285,	    4.957,	16,	    1.15},
				[7] = 	{0.9,	0.025,	0.076,	    0.163,	    0.286,	    4.752,	16,	    1.15},
				[8] = 	{0.95,	0.025,	0.078,	    0.164,	    0.288,	    4.662,	16,	    1.08},
				[9] = 	{1,	    0.031,	0.080,	    0.169,	    0.297,	    4.534,	16,	    1.08},
				[10] = 	{1.05,	0.035,	0.081,	    0.211,	    0.371,	    4.490,	16,	    1.06},
				[11] = 	{1.1,	0.037,	0.079,	    0.217,	    0.381,	    4.131,	15,	    1.04},
				[12] = 	{1.2,	0.039,	0.054,	    0.262,	    0.460,	    3.319,	14,	    1.02},
				[13] = 	{1.3,	0.039,	0.051,	    0.301,	    0.528,	    2.853,	13,	    1},
				[14] = 	{1.5,	0.040,	0.045,	    0.363,	    0.638,	    2.023,	12,	    0.9},
				[15] = 	{1.7,	0.040,	0.040,	    0.332,	    0.584,	    1.480,	11,	    0.7},
				[16] = 	{1.8,	0.040,	0.037,	    0.332,	    0.584,	    1.287,	10, 	0.64},
				[17] = 	{2,	    0.040,	0.032,	    0.332,	    0.6,	    1.128,	10,	    0.52},
				[18] = 	{2.2,	0.040,	0.029,	    0.5,	    0.7,	    1.1,	9,	    0.4},
				[19] = 	{2.5,	0.040,	0.024,	    0.7,	    0.7,	    1.1,	9,	    0.4},
				[20] = 	{3, 	0.040,	0.024,	    1.0,	    0.7,	    1.1,	9,	    0.4},
				[21] = 	{3.9,	0.040,	0.024,	    1.0,	    0.7,	    1,1,	9,	    0.4},
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
			Nmg	    =	65, -- RPM at idle
			MinRUD	=	0, -- Min state of the throttle
			MaxRUD	=	1, -- Max state of the throttle
			MaksRUD	=	0.60, -- Military power state of the throttle
			ForsRUD	=	0.71, -- Afterburner state of the throttle
			typeng	=	1,
	-- 			--[[
	-- 				E_TURBOJET = 0
	-- 				E_TURBOJET_AB = 1
	-- 				E_PISTON = 2
	-- 				E_TURBOPROP = 3
	-- 				E_TURBOFAN = 4
	-- 				E_TURBOSHAFT = 5
	-- 			--]]

			hMaxEng	=	16,     -- TeTeT: Reduced for RA-5C, Max altitude for safe engine operation in km
			dcx_eng	=	0.0144, -- Engine drag coefficient
			cemax	=	1.24,   -- not used for fuel calculation, only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56,   -- not used for fuel calculation, only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	7000,   -- altitude coefficient for MIL thrust; Mirage F1 lua: "Loss of thrust in N per 1000 m"
			dpdh_f	=	12300,  -- altitude coefficient for AB thrust;  Mirage F1 lua: "Loss of thrust in N per 1000 m"
			table_data =
			{   --                  M		    Pmax		Pfor
				[	1	]	=	{	0.00	,	085601 * 1,	109246 * 1	}, -- TeTeT: reduce power for land based take-off
				[	2	]	=	{	0.40	,	108407 * 1,	175289 * 1	},
				[	3	]	=	{	0.45	,	107830 * 1,	176658 * 1	},
				[	4	]	=	{	0.50	,	107313 * 1,	178098 * 1	},
				[	5	]	=	{	0.55	,	109942 * 1,	182689 * 1	},
				[	6	]	=	{	0.60	,	112600 * 1,	187315 * 1	},
				[	7	]	=	{	0.65	,	115365 * 1,	192049 * 1	},
				[	8	]	=	{	0.70	,	118323 * 1,	196979 * 1	},
				[	9	]	=	{	0.75	,	121085 * 1,	201713 * 1	},
				[	10	]	=	{	0.80	,	123231 * 1,	205831 * 1	},
				[	11	]	=	{	0.85	,	125332 * 1,	209906 * 1	},
				[	12	]	=	{	0.90	,	127416 * 1,	213964 * 1	},
				[	13	]	=	{	0.95	,	129373 * 1,	217904 * 1	},
				[	14	]	=	{	1.00	,	131219 * 1,	221870 * 1	},
				[	15	]	=	{	1.05	,	132884 * 1,	227581 * 1	},
			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},

	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = verbose_to_dmg_properties({
        ["COCKPIT"]             = {critical_damage = 2,args =  { 65}},
        ["NOSE_CENTER"]         = {critical_damage = 3,args =  {146}},

        ["WING_L_OUT"]          = {critical_damage = 10,args =  {223},deps_cells = {"FLAP_L_IN","WING_L_PART_OUT"}},
        ["WING_R_OUT"]          = {critical_damage = 10,args =  {213},deps_cells = {"FLAP_R_IN","WING_R_PART_OUT"}},
        ["WING_L_PART_OUT"]     = {critical_damage = 3, args =  {221}},
        ["WING_R_PART_OUT"]     = {critical_damage = 3, args =  {231}},
        ["FLAP_L_IN"]           = {critical_damage = 4, args =  {227}},
        ["FLAP_R_IN"]           = {critical_damage = 4, args =  {217}},

        ["FUSELAGE_BOTTOM"]     = {critical_damage = 8, args =  {152}},
        ["FUSELAGE_CENTR_TOP"]  = {critical_damage = 8, args =  {151}},
		["FUSELAGE_AFT"]        = {critical_damage = 2, args =  {155}},

        ["FIN_TOP"]             = {critical_damage = 3, args =  {244}},
		["FIN_BOTTOM"]          = {critical_damage = 3, args =  {245}},

		["ENGINE_L"]            = {critical_damage = 4, args =  {167}},
        ["ENGINE_R"]            = {critical_damage = 4, args =  {161}},

        ["STABILIZER_L_IN"]     = {critical_damage = 3, args =  {235}},
        ["STABILIZER_R_IN"]     = {critical_damage = 3, args =  {233}},

		["WHEEL_FRONT"]         = {critical_damage = 1, args =  {246}},
		["WHEEL_LEFT"]          = {critical_damage = 1, args =  {247}},
		["WHEEL_RIGHT"]         = {critical_damage = 1, args =  {248}},
	}),

	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	DamageParts =
	{
	},

	 lights_data = {
            typename = "collection",
            lights = {
                [WOLALIGHT_LANDING_LIGHTS] = {
                    typename = "collection",
                    lights = {
                        {
                            typename = "collection",
                            lights = {
                                {
                                    typename = "Spot", position = {4.6, -0.7814, 0}, argument = 208,   dir_correction = {elevation = math.rad(-6.0)},
                                    proto = lamp_prototypes.LFS_P_27_200, angle_max = math.rad(50.0), angle_max = math.rad(40.0),
                                    exposure = {{5, 0.090, 0.095}}, movable = true, power_up_t = 0.9,
                                },
                                {
                                    typename = "Spot", position = {4.823, -1.3195, 0}, 
                                    proto = lamp_prototypes.LFS_P_27_200, range = 18.0, angle_max = math.rad(180.0), angle_max = math.rad(180.0),
                                    exposure = {{5, 0.090, 0.095}}, movable = true, power_up_t = 0.9,
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
                                   typename = "Spot", position = {4.6, -0.7814, 0}, argument = 208,   dir_correction = {elevation = math.rad(-6.0)}, 
                                    proto = lamp_prototypes.LFS_P_27_200, angle_max = math.rad(50.0), angle_max = math.rad(40.0),
                                    exposure = {{5, 0.090, 0.095}}, movable = true, power_up_t = 0.9,
                                },
                                {
                                    typename = "Spot", position = {4.823, -1.3195, 0},
                                    proto = lamp_prototypes.LFS_P_27_200, range = 18.0, angle_max = math.rad(180.0), angle_max = math.rad(180.0),
                                    exposure = {{5, 0.090, 0.095}}, movable = true, power_up_t = 0.9,
                                },
                            },
                        },
                    },
                },
			[3] = { typename = "collection", -- nav lights
				lights = {
					{typename = "argumentlight",argument = 49}, -- nav lights red, green, white
				},
			},
			--[[
			[4] = { typename = "collection", -- top nav light
				lights = {
					{typename = "argnatostrobelight",connector = "RED_BEACON R",argument = 83,period = 2.0,color = {1.0, 0.0, 0.0},phase_shift = 0.0},
					{typename = "argnatostrobelight",connector = "RED_BEACON R",argument = 802,period = 2.0,color = {1.0, 0.0, 0.0},phase_shift = 0.0},
                    {typename = "argumentlight",argument = 200},
				},
			},
			]]
		}
    }, -- end lights_data
}
