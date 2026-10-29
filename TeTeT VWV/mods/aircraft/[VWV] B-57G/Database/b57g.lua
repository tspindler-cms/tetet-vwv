return {

	Name 				=   'vwv_b-57g',
	DisplayName			= _('[VWV] B-57G'),
	DisplayNameShort	= _('B-57G'),
	Picture 			= "b57g.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "b57g",

	shape_table_data 	=
	{
		{
			file  	 	= 'b57g';
			life  	 	= 20; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'b57g-dstr'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'b57g';
			index    	=  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "b57g-dstr";
			file  = "b57g";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000025",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_F_Bomber, WSTYPE_PLACEHOLDER, "Bombers",},
	Categories 			= {},
	-------------------------
	-- center_of_mass = {0.0, 0.0, 0.0},
	M_empty 					= 13600, -- kg, approximate B-57G
	M_nominal 					= 18000, -- kg
	M_max 						= 25000, -- kg
	M_fuel_max 					= 5500, -- kg
	H_max 					 	= 13700, -- m
	average_fuel_consumption 	= 0.004, -- relative, same scale as the RA-5C template
	CAS_min 					= 50, -- minimal indicated airspeed*?
	-- M = 15600 lbs
	V_opt 						= 190,-- Cruise speed (for AI)*
	V_take_off 					= 69.44, -- Take off speed in m/s (for AI)
	V_land 						= 68, -- m/s
	V_max_sea_level 			= 250, -- Max speed at sea level in m/s (for AI)
	V_max_h 					= 240, -- Max speed at max altitude in m/s (for AI)
	Vy_max 						= 17, -- Max climb speed in m/s (for AI)
	Mach_max 					= 0.82, -- Max speed in Mach (for AI)
	Ny_min 						= -2, -- Min G (for AI)
	Ny_max 						= 4.5,  -- Max G (for AI)
	Ny_max_e 					= 5.0, -- ?? Max G (for AI)
	AOA_take_off 				= 0.12, -- AoA in take off radians (for AI), ~6.9 deg
	bank_angle_max 				= 60, -- Max bank angle (for AI)
	has_afteburner	            = false,
	has_speedbrake	            = true,

	tand_gear_max = 0.57735026919, -- tan(30 deg), nose steering arg 2
	nose_gear_pos                            = {6.295, -1.525, 0.000}, -- extended tire; the wheel shell is parented to the oleo and stays on this contact
	nose_gear_amortizer_direct_stroke        =  0.200, -- compression, wheel 20 cm up
	nose_gear_amortizer_reversal_stroke      =  0.010, -- reference is already fully extended
	nose_gear_amortizer_normal_weight_stroke =  0.080, --- static sag. Zero sat on the extension stop, so touchdown kicked the aircraft back up
	nose_gear_wheel_diameter                 = 0.650, -- arg 76

	main_gear_pos                            = {2.030, -1.477, 2.454}, -- extended tire; the wheel shell is parented to the oleo and stays on this contact
	main_gear_amortizer_direct_stroke        =  0.300, -- compression, wheel 30 cm up
	main_gear_amortizer_reversal_stroke      =  0.010,
	main_gear_amortizer_normal_weight_stroke =  0.120, -- static sag, same reason as the nose
	main_gear_wheel_diameter                 = 1.040, -- arg 77, both mains

    wing_tip_pos = {2.0, 0.67, 9.6}, -- right tip

	stores_number = 4,
	tanker_type	=	0, -- no air-to-air refueling
	wing_area = 89.2,
	wing_span = 19.2,
	wing_type   = 0,-- FIXED_WING = 0/VARIABLE_GEOMETRY = 1/FOLDED_WING = 2/VARIABLE_GEOMETRY_FOLDED = 3
	thrust_sum_max	=	6550, -- kgf, two J65-W-5 at 7,220 lbf each
	thrust_sum_ab	=	6550,
	length = 21.29,
	height = 4.70,
	flaps_maneuver	=	0.5,
	range	=	3700,
	RCS	=	10.0,
	IR_emission_coeff	=	0.5,
	IR_emission_coeff_ab	=	0.5,

	engines_count				= 2, -- Engines count
	engines_nozzles = {
		[1] =
		{
			pos 		=  {-1.993, -0.007, 3.12}, -- right nacelle
			elevation   =  0.0, -- AFB cone elevation
			diameter	 = 0.55, -- AFB cone diameter
			exhaust_length_ab   = 0, -- length in m
			exhaust_length_ab_K = 0.0, -- AB animation
			engine_number  = 1,
			smokiness_level = 0.35
		}, -- end of [1]
		[2] =
		{
			pos 		=  {-1.993, -0.007, -3.12}, -- left nacelle
			elevation   =  0.0, -- AFB cone elevation
			diameter	 = 0.55, -- AFB cone diameter
			exhaust_length_ab   = 0, -- length in m
			exhaust_length_ab_K = 0.0, -- AB animation
			engine_number  = 2,
			smokiness_level = 0.35
		}, -- end of [2]
	}, -- end of engines_nozzles

	crew_size = 2,
	crew_stations = "HumanOrchestra",
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

			pos						= {8.270, 0.300, -0.048}, -- Pilot Main body center; Blender (x, z, -y)
			canopy_pos				= {8.270, 0.300, -0.048},
			ejection_added_speed	= {-3, 15, 0},

			canopy_arg				= 38,
			canopy_args				= {38, 0.9},
			pilot_body_arg			= 50,
			ejection_order			= 2,
			g_suit					= 2.0,
		},
		-- Navigator
		[2] =
		{
			pilot_name				= "F-4E_WSO",
			ejection_seat_name		= "F-4E_Seat_WSO",
			drop_canopy_name		= "hb_f4e_wsocanopy",
			drop_parachute_name		= "F-4E_Parachute_WSO",
			bailout_arg 		 	= -1,
			role					= "instructor",
			role_display_name		= _("Navigator"),
			can_be_playable			= false,

			pos						= {6.818, 0.414, -0.032}, -- CoPilot Main body center, the rear seat
			canopy_pos				= {6.818, 0.414, -0.032},
			ejection_added_speed	= {-3, 15, 0},

			canopy_arg				= 38,
			canopy_args				= {38, 0.9},
			pilot_body_arg  	    = 701,
			ejection_order			= 1,
			g_suit					= 2.0,
		},

	}, -- end of crew_members
	-- Fixed slots: 1 fuselage, 2/3 inner wing, 4/5 mid wing, 6/7 outer wing, 8/9 engines.
	-- 10/11 are the outer-engine pair; this twin has none, so they reuse the nacelles.
	-- Wing stations from the model: tips z=±9.6, pylons z=±5.91/±6.69, nozzles z=±3.12.
	fires_pos =
		{
			[1]  = { 2.00,  0.25,  0.00}, -- fuselage fuel, wing carry-through
			[2]  = { 2.20,  0.30,  1.70}, -- right inner wing, inboard of the nacelle
			[3]  = { 2.20,  0.30, -1.70}, -- left inner wing
			[4]  = { 2.22,  0.15,  6.30}, -- right mid wing, between the pylons
			[5]  = { 2.22,  0.15, -6.30}, -- left mid wing
			[6]  = { 2.40,  0.55,  8.40}, -- right outer wing, inboard of the tip
			[7]  = { 2.40,  0.55, -8.40}, -- left outer wing
			[8]  = {-1.993, -0.007,  3.12}, -- right engine nozzle
			[9]  = {-1.993, -0.007, -3.12}, -- left engine nozzle
			[10] = {-1.993, -0.007,  3.12}, -- right nacelle again
			[11] = {-1.993, -0.007, -3.12}, -- left nacelle again
	}, -- end of fires_pos

	-- Args 0, 3 and 5 also drive the doors and main-gear side stays.
	-- Wheel spin is 76 (nose) and 77 (mains). Compression is 1, 4 and 6. Steering is 2.
	-- Arg 38 at 1 hides the canopy. Bailout sets that argument itself.
	-- Close/Open/Board are what let the crew climb out after the aircraft is parked.
	doors_transmission = "Mechanical",
	doors_movement = 2,
	mechanimations = {
		Door0 = {
			{Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 2.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 2.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
			{Transition = {"Open", "Board"},  Sequence = {{C = {{"Sleep", "for", 45.0}}}}},
			{Transition = {"Board", "Open"},  Sequence = {{C = {{"Sleep", "for", 0.0}}}}},
			{Transition = {"Any", "Bailout"}, Sequence = {{C = {{"Arg", 38, "set", 1.0}}}}},
		},
		Door1 = {DuplicateOf = "Door0"},

		CentralStrut = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 0, "from", 0.0, "to", 1.0, "in", 8.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 0, "from", 1.0, "to", 0.0, "in", 8.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Any", "Retract"},    Sequence = {{C = {{"Arg", 0, "to", 0.0, "in", 8.0}}}}},
		},
		RightStrut = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 3, "from", 0.0, "to", 1.0, "in", 8.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 3, "from", 1.0, "to", 0.0, "in", 8.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Any", "Retract"},    Sequence = {{C = {{"Arg", 3, "to", 0.0, "in", 8.0}}}}},
		},
		LeftStrut = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 5, "from", 0.0, "to", 1.0, "in", 8.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 5, "from", 1.0, "to", 0.0, "in", 8.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Any", "Retract"},    Sequence = {{C = {{"Arg", 5, "to", 0.0, "in", 8.0}}}}},
		},

	},
	LandRWCategories =
    {
        [1] =
        {
			Name = "Aircraft",
        },
    }, -- end of LandRWCategories
	TakeOffRWCategories =
    {
        [1] =
        {
            Name = "Aircraft",
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
	-- The laser flags on the turret sensors are not enough on their own.
	-- laserEquipment is what lets the AI self-designate for its own bombs.
	Sensors = {
		OPTIC = {"B-57G LLLTV", "B-57G FLIR"},
	},
	laserEquipment = {
		laserRangefinder = true,
		laserDesignator = true,
	},

	Guns = {
	},

	-- Four wing racks measured from b57g-dcs.blend object "rack".
	-- Blender +X/+Z/+Y (forward/up/left) converted to DCS +X/+Y/+Z (forward/up/right).
	-- Point is the centre of the four sway-brace lugs under each rack.
	Pylons =  {
		pylon(1, 0, 2.215,  0.002, -6.690, {use_full_connector_position = false}, -- left outboard
		{
			{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
			{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" }, -- GBU-12
			{ CLSID = "{mk77mod0}" }, -- Mk-77 mod 0, from the A-4E-C mod
			{ CLSID = "{m36}" }, -- M36 incendiary
			{ CLSID = "{m36_rack}" }, -- two M36 on the twin saddle
			{ CLSID = "<CLEAN>" },
		}),
		pylon(2, 0, 2.215, -0.078, -5.910, {use_full_connector_position = false}, -- left inboard
		{
			{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
			{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" }, -- GBU-12
			{ CLSID = "{mk77mod0}" }, -- Mk-77 mod 0
			{ CLSID = "{m36}" }, -- M36 incendiary
			{ CLSID = "{m36_rack}" },
			{ CLSID = "<CLEAN>" },
		}),
		pylon(3, 0, 2.215, -0.078,  5.910, {use_full_connector_position = false}, -- right inboard
		{
			{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
			{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" }, -- GBU-12
			{ CLSID = "{mk77mod0}" }, -- Mk-77 mod 0
			{ CLSID = "{m36}" }, -- M36 incendiary
			{ CLSID = "{m36_rack}" },
			{ CLSID = "<CLEAN>" },
		}),
		pylon(4, 0, 2.215,  0.002,  6.690, {use_full_connector_position = false}, -- right outboard
		{
			{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" }, -- Mk-82
			{ CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}" }, -- GBU-12
			{ CLSID = "{mk77mod0}" }, -- Mk-77 mod 0
			{ CLSID = "{m36}" }, -- M36 incendiary
			{ CLSID = "{m36_rack}" },
			{ CLSID = "<CLEAN>" },
		}),
    },
    -- Tasks
    Tasks = {
		aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(RunwayAttack),
		aircraft_task(Reconnaissance),
    },
	DefaultTask = aircraft_task(GroundAttack),
-----------------------------------------------------------------------------------------
	-- Straight, thick wing (AR about 4.1, almost no sweep). The RA-5C/F-4 polar
	-- kept a swept-wing lift slope and a fighter induced-drag polar, so rotation
	-- never produced enough lift before drag ate the thrust.
	-- Cy = Cy0 + Cya(Mach) * alpha_deg + cy_flap * flap_fraction, then limited by Cymax.
	-- At 19 t, 10 deg and 64 m/s this is about Cy 0.93 clean. Full flaps add cy_flap on top of that.
	SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0			=	0.05,      -- zero AoA lift coefficient
			Mzalfa		=	6.0,  -- coefficients for pitch agility
			Mzalfadt	=	1.0,    -- coefficients for pitch agility
			kjx			=	4.0,
			kjz			=	0.00125,
			Czbe		=	-0.012, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear		=	0.030,    -- coefficient, drag, gear
			cx_flap		=	0.080,   -- coefficient, drag, full flaps. Gives the flare something to slow down with
			cy_flap		=	0.350,    -- coefficient, normal force, lift, flaps. Landing uses full flaps; takeoff uses flaps_maneuver
			cx_brk		=	0.08,   -- coefficient, drag, breaks
			table_data  =
			{	--      M		Cx0		 Cya		B	        B4	      Omxmax	Aldop	Cymax
				[1] = 	{0,	    0.022,	0.090,	    0.085,	    0.012,	    0.8,	16,	    1.80},
				[2] = 	{0.2,	0.022,	0.090,	    0.085,	    0.012,	    1.0,	16,	    1.75},
				[3] = 	{0.4,	0.022,	0.090,	    0.085,	    0.014,	    1.15,	16,	    1.60},
				[4] = 	{0.6,	0.024,	0.088,	    0.090,	    0.018,	    1.20,	15,	    1.30},
				[5] = 	{0.7,	0.030,	0.082,	    0.110,	    0.030,	    1.10,	13,	    1.10},
				[6] = 	{0.75,	0.042,	0.074,	    0.140,	    0.050,	    0.95,	12,	    0.95},
				[7] = 	{0.8,	0.060,	0.064,	    0.180,	    0.080,	    0.80,	11,	    0.80},
				[8] = 	{0.85,	0.090,	0.050,	    0.240,	    0.120,	    0.60,	10,	    0.65},
				[9] = 	{0.9,	0.120,	0.040,	    0.320,	    0.180,	    0.45,	9,	    0.50},
			}, -- end of table_data

			-- M - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - lift slope per degree of AOA. Higher Cya is more lift at a given AOA.
			-- B - Polar quad coeff
			-- B4 - Polar 4th power coeff
			-- Omxmax - roll rate, rad/s
			-- Aldop - Alfadop Max AOA at current M - departure threshold
			-- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
		}, -- end of aerodynamics
		engine =
		{
			Nmg	    =	40, -- flight idle, percent RPM. 67 was the RA-5C figure and held the approach at about 140 knots
			MinRUD	=	0, -- Min state of the throttle
			MaxRUD	=	1, -- Max state of the throttle
			MaksRUD	=	1.0, -- Military power state of the throttle
			ForsRUD	=	1.0, -- Afterburner state of the throttle
			typeng	=	0,
	-- 			--[[
	-- 				E_TURBOJET = 0
	-- 				E_TURBOJET_AB = 1
	-- 				E_PISTON = 2
	-- 				E_TURBOPROP = 3
	-- 				E_TURBOFAN = 4
	-- 				E_TURBOSHAFT = 5
	-- 			--]]

			hMaxEng	=	14,     -- Max altitude for safe engine operation in km
			dcx_eng	=	0.0144, -- Engine drag coefficient
			cemax	=	1.0,   -- not used for fuel calculation, only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	1.0,   -- not used for fuel calculation, only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	3800,   -- altitude coefficient for MIL thrust; N per 1000 m, same fraction as the old per-engine figure
			dpdh_f	=	3800,  -- altitude coefficient for AB thrust; N per 1000 m
			table_data =
			{   --                  M		    Pmax		Pfor
				-- Pmax is total thrust for both J65-W-5s, newtons. SFM does not multiply by engines_count.
				-- 7,220 lbf each is 32,100 N; 64,200 N matches thrust_sum_max = 6550 kgf.
				[	1	]	=	{	0.00	,	64200	,	64200	},
				[	2	]	=	{	0.20	,	66000	,	66000	},
				[	3	]	=	{	0.40	,	69000	,	69000	},
				[	4	]	=	{	0.60	,	70000	,	70000	},
				[	5	]	=	{	0.70	,	68000	,	68000	},
				[	6	]	=	{	0.80	,	62000	,	62000	},
				[	7	]	=	{	0.85	,	54000	,	54000	},
				[	8	]	=	{	0.90	,	44000	,	44000	},
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
                        { -- left leading edge, just outboard of the nacelle
                            typename = "Spot", position = {3.900, 0.174, -4.231}, dir_correction = {elevation = math.rad(-8.0)},
                            proto = lamp_prototypes.LFS_P_27_200, angle_max = math.rad(40.0),
                            power_up_t = 0.9,
                        },
                        { -- right leading edge, just outboard of the nacelle
                            typename = "Spot", position = {3.900, 0.174, 4.231}, dir_correction = {elevation = math.rad(-8.0)},
                            proto = lamp_prototypes.LFS_P_27_200, angle_max = math.rad(40.0),
                            power_up_t = 0.9,
                        },
                    },
                },
                [WOLALIGHT_TAXI_LIGHTS] = {
                    typename = "collection",
                    lights = {
                        { -- left leading edge, same station as the landing light
                            typename = "Spot", position = {3.900, 0.174, -4.231}, dir_correction = {elevation = math.rad(-8.0)},
                            proto = lamp_prototypes.LFS_P_27_200, angle_max = math.rad(50.0),
                            power_up_t = 0.9,
                        },
                        { -- right leading edge, same station as the landing light
                            typename = "Spot", position = {3.900, 0.174, 4.231}, dir_correction = {elevation = math.rad(-8.0)},
                            proto = lamp_prototypes.LFS_P_27_200, angle_max = math.rad(50.0),
                            power_up_t = 0.9,
                        },
                    },
                },
                [WOLALIGHT_NAVLIGHTS] = {
                    typename = "collection",
                    lights = {
                        { typename = "omnilight", connector = "Light_Nav_Left_Red",    color = {0.99, 0.11, 0.3, 0.333}, argument = 190 },
                        { typename = "omnilight", connector = "Light_Nav_Right_Green", color = {0.0, 0.894, 0.6, 0.333}, argument = 191 },
                        { typename = "omnilight", connector = "Light_Nav_Tail_White",  color = {1.0, 1.0, 1.0, 0.333},  argument = 192 },
                    },
                },
		}
    }, -- end lights_data
}
