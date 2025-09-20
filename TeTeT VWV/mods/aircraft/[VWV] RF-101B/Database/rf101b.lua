return {

    Name = 'vwv_rf101b',
    DisplayName = _('[VWV] RF-101B Voodoo'),
    DisplayNameShort = _('RF-101B'),
	HumanCockpit = false,
    Picture = "rf101b.png",
    Rate = "50",
    Shape = "rf101b",

    shape_table_data = {
        {
            file = 'rf101b',
            life = 20, -- lifebar
            vis = 3, -- visibility gain.
            desrt = 'su-25-oblomok', -- Name of destroyed object file name
            fire = {300, 2}, -- Fire on the ground after destoyed: 300sec 2m
            username = 'RF-101B',
            index = WSTYPE_PLACEHOLDER,
            classname = "lLandPlane",
            positioning = "BYNORMAL"
        },
        {
            name = "su-25-oblomok",
            file = "su-25-oblomok",
            fire = {240, 2}
        }
    },

    mapclasskey = "P0091000024",
    attribute = {
        wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER,
        "Fighters"
    },
    Categories = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    -- taken from Wikipedia, https://en.wikipedia.org/wiki/McDonnell_F-101_Voodoo
    M_empty = 12925,
    M_nominal = 20713,
    M_max = 23768,
    M_fuel_max = 7770,
    H_max = 17800, -- m  (Maximum Operational Ceiling)
    average_fuel_consumption = 0.150,
    CAS_min = 70, -- Minimum CAS speed (m/s) (for AI)
    V_opt = 180, -- Cruise speed (m/s) (for AI)
    V_take_off = 90, -- 81, -- Take off speed in m/s (for AI)
    V_land = 92, -- 81, -- Land speed in m/s (for AI)
    has_afteburner = true,
    has_speedbrake = true,
    has_differential_stabilizer	= false,
    radar_can_see_ground = false,

    nose_gear_pos = {5.5823, -1.8594, 0.00},
    --[[
    nose_gear_amortizer_direct_stroke = 0.1, -- down from nose_gear_pos !!!
    nose_gear_amortizer_reversal_stroke = -0.05, -- up
    nose_gear_amortizer_normal_weight_stroke = 0, -- up
    nose_gear_wheel_diameter = 0.5, -- in m
    ]]


    main_gear_pos = { -1.1888, -1.9202, 2.8767},
    --[[
    main_gear_amortizer_direct_stroke = 0, --  down from main_gear_pos !!!
    main_gear_amortizer_reversal_stroke = 0, --  up
    main_gear_amortizer_normal_weight_stroke = 0, -- down from main_gear_pos
    main_gear_wheel_diameter = 0.8, -- in m
    ]]

    AOA_take_off = 0.17, -- AoA in take off (for AI)
    stores_number = 4,
    bank_angle_max = 75, -- Max bank angle (for AI)
    Ny_min = -4, -- Min G (for AI)
    Ny_max = 7.5, -- Max G (for AI)
    V_max_sea_level = 350, -- Max speed at sea level in m/s (for AI)
    V_max_h = 680, -- Max speed at max altitude in m/s (for AI)

    thrust_sum_max = 11990,
    thrust_sum_ab = 16900,
    Vy_max = 195, -- Max climb speed in m/s (for AI)
    flaps_maneuver = 0.5,
    Mach_max = 1.72, -- Max speed in Mach (for AI)
    range = 2450, -- Max range in km (for AI)
    RCS = 3.0, -- Radar Cross Section m2
    Ny_max_e = 9, -- Max G (for AI)
    detection_range_max = 30,
    IR_emission_coeff = 0.6, --0.91, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
    IR_emission_coeff_ab = 2.4, -- 4, -- With afterburner
    tand_gear_max = 3.73, -- XX  1.732 FA18 3.73, 
    tanker_type = 0, -- F14=2/S33=4/ M29=0/S27=0/F15=1/ F16=1/To=0/F18=2/A10A=1/ M29K=4/F4=0/

    wing_area = 34.2, -- wing area in m2
    wing_span = 12.09, -- XX  wing spain in m
    wing_type = 0, -- 0=FIXED_WING/ 1=VARIABLE_GEOMETRY/ 2=FOLDED_WING/ 3=ARIABLE_GEOMETRY_FOLDED
    length = 20.55,
    height = 5.49,
    wing_tip_pos = { -3.8579, -0.33989, -6.00094 },

    -- EPLRS 						= true,--?
    TACAN_AA = true, -- ?
    -- launch_bar_connected_arg_value = 0.815, -- 0.885,--0.745

    mechanimations = {
--[[
        Door0 = {
            {
                Transition = {"Close", "Open"},
                Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0}}}},
                Flags = {"Reversible"}
            }, {
                Transition = {"Open", "Close"},
                Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0}}}},
                Flags = {"Reversible", "StepsBackwards"}
            },
            {
                Transition = {"Any", "Bailout"},
                Sequence = {{C = {{"JettisonCanopy", 0}}}}
            }
        },
        ServiceHatches = { -- Parkposition
            {
                Transition = {"Close", "Open"},
                Sequence = {
                    {C = {{"PosType", 3}, {"Sleep", "for", 30.0}}},
                    {C = {{"Arg", 24, "set", 1.0}}}
                }
            }, {
                Transition = {"Open", "Close"},
                Sequence = {
                    {C = {{"PosType", 6}, {"Sleep", "for", 5.0}}},
                    {C = {{"Arg", 24, "set", 0.0}}}
                }
            }
        },
]]
    }, -- end of mechanimations

    -- engines anmd crew copied and adjusted from F-4E
	engines_count				= 2, -- Engines count

	engines_nozzles = {
		[1] =
		{
			pos 		=  {-5.3624,	-0.29817,	0.69374}, -- nozzle coords
			elevation   =  -1.5, -- AFB cone elevation
			diameter	 = 1.0, -- AFB cone diameter
			exhaust_length_ab   = 11, -- lenght in m
			exhaust_length_ab_K = 0.8, -- AB animation
			afterburner_circles_count = 8,
			afterburner_circles_pos = {0.05, 0.8},
			afterburner_circles_scale = 1.0,
			-- afterburner_effect_texture = "afterburner_f-16c",
			smokiness_level = 0.7,
		},
		[2] =
		{
			pos 		=  {-5.3624,	-0.29817,	-0.69374}, -- nozzle coords
			elevation   =  -1.5, -- AFB cone elevation
			diameter	 = 1.0, -- AFB cone diameter
			exhaust_length_ab   = 11, -- lenght in m
			exhaust_length_ab_K = 0.8, -- AB animation
			afterburner_circles_count = 8,
			afterburner_circles_pos = {0.05, 0.8},
			afterburner_circles_scale = 1.0,
			-- afterburner_effect_texture = "afterburner_f-16c",
			smokiness_level = 0.7,
		},
	},
    -- Copied and adjusted from F-4E
	crew_size		= 2,
	crew_stations	= "HumanOrchestra",
	crew_members	=
	{
		-- Pilot
		[1] =
		{
			pilot_name				= "F-4E_Pilot",
			ejection_seat_name		= "F-4E_Seat_Pilot",
			drop_canopy_name		= "hb_f4e_pilotcanopy",
			drop_parachute_name		= "F-4E_Parachute_Pilot",
			bailout_arg 		 	= -1,
			role					= "pilot",
			role_display_name		= _("Pilot"),
			can_be_playable			= true,

			pos						= {6, 0.8, 0},
			canopy_pos				= {6, 0.8, 0},
			ejection_added_speed	= {-3, 15, 0},

			canopy_arg				= 50,
			canopy_args				= {50, 1},
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
			can_be_playable			= true,

			pos						= {3.7, 1, 0},
			canopy_pos				= {3.7, 1, 0},
			ejection_added_speed	= {-3, 15, 0},

			canopy_arg				= 50,
			canopy_args				= {50, 1},
			pilot_body_arg  	    = 50,
			ejection_order			= 1,
			g_suit					= 2.0,
		},
	},
    brakeshute_name = 3,
    is_tanker = false,
    ---air_refuel_receptacle_pos = 	{0,	0,	0},
    fires_pos = {
        { -0.6, 0.5, 0 },
        { 0, 0, 1 },
        { 0, 0, -1 },
        { -1, 0, 2 },
        { -1, 0, -2 },
        { -2, 0, 3 },
        { -2, 0, -3 },
        { -8, 0.15, 0 },
        { -8, 0.15, 0 },
        { -3.5, 0.2, 0.4 },
        { -3.5, 0.2, -0.4 }
    },

--    effects_presets = {
--        {
--            effect = "OVERWING_VAPOR",
--            file = current_mod_path .. "/Effects/VSN_F4E_overwingVapor.lua"
--        }
--    },

    chaff_flare_dispenser = {
        [1] = {dir = {0, 1, 0}, pos = {-5.776, 1.4, -0.422}}, -- end of [1]
        [2] = {dir = {0, 1, 0}, pos = {-5.776, 1.4, 0.422}} -- end of [2]
    }, -- end of chaff_flare_dispenser

    -- Countermeasures
    passivCounterm = {
        CMDS_Edit = true,
        SingleChargeTotal = 0,
        chaff = {default = 0, increment = 0, chargeSz = 0},
        flare = {default = 0, increment = 0, chargeSz = 0}
    },

    CanopyGeometry = {
        azimuth = {-145.0, 145.0}, -- pilot view horizontal (AI)
        elevation = {-50.0, 90.0} -- pilot view vertical (AI)
    },

    Sensors = {RADAR = "N-008", IRST = "OLS-27", RWR = "Abstract RWR"},

    Failures = {
        {
            id = 'asc',
            label = _('ASC'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'autopilot',
            label = _('AUTOPILOT'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'hydro',
            label = _('HYDRO'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'l_engine',
            label = _('L-ENGINE'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'r_engine',
            label = _('R-ENGINE'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'radar',
            label = _('RADAR'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        },
        -- { id = 'eos',  		label = _('EOS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        -- { id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        {
            id = 'mlws',
            label = _('MLWS'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'rws',
            label = _('RWS'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'ecm',
            label = _('ECM'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'hud',
            label = _('HUD'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }, {
            id = 'mfd',
            label = _('MFD'),
            enable = false,
            hh = 0,
            mm = 0,
            mmint = 1,
            prob = 100
        }
    },
    HumanRadio = {
        frequency = 127.5, -- Radio Freq
        editable = true,
        minFrequency = 100.000,
        maxFrequency = 156.000,
        modulation = MODULATION_AM
    },

    Guns = {
    },
    -------------------------------------------------------------------------------
    -- Pylon definitions
    Pylons = {
    },


    ------------------------------------------------------------------------------

    Tasks = {
		aircraft_task(Reconnaissance),
    },
    DefaultTask = aircraft_task(Reconnaissance),

	SFM_Data =
	{
        -- copied from F-8/MiG-19
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
        -- copied from F-4E
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

			hMaxEng	=	18,     -- Max altitude for safe engine operation in km
			dcx_eng	=	0.0144, -- Engine drag coefficient
			cemax	=	1.24,   -- not used for fuel calculation, only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56,   -- not used for fuel calculation, only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	7000,   -- altitude coefficient for MIL thrust; Mirage F1 lua: "Loss of thrust in N per 1000 m"
			dpdh_f	=	12300,  -- altitude coefficient for AB thrust;  Mirage F1 lua: "Loss of thrust in N per 1000 m"
			table_data =
			{   --                  M		    Pmax		Pfor
                [	1	]	=	{	0.00	,	105601 * 0.9,	159246 * 0.8	},
                [	2	]	=	{	0.40	,	108407 * 0.9,	175289 * 0.8	},
                [	3	]	=	{	0.45	,	107830 * 0.9,	176658 * 0.8	},
                [	4	]	=	{	0.50	,	107313 * 0.9,	178098 * 0.8	},
                [	5	]	=	{	0.55	,	109942 * 0.9,	182689 * 0.8	},
                [	6	]	=	{	0.60	,	112600 * 0.9,	187315 * 0.8	},
                [	7	]	=	{	0.65	,	115365 * 0.9,	192049 * 0.8	},
                [	8	]	=	{	0.70	,	118323 * 0.9,	196979 * 0.8	},
                [	9	]	=	{	0.75	,	121085 * 0.9,	201713 * 0.8	},
                [	10	]	=	{	0.80	,	123231 * 0.9,	205831 * 0.8	},
                [	11	]	=	{	0.85	,	125332 * 0.9,	209906 * 0.8	},
                [	12	]	=	{	0.90	,	127416 * 0.9,	213964 * 0.8	},
                [	13	]	=	{	0.95	,	129373 * 0.9,	217904 * 0.8	},
                [	14	]	=	{	1.00	,	131219 * 0.9,	221870 * 0.8	},
                [	15	]	=	{	1.05	,	132884 * 0.9,	227581 * 0.8	},
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

            [WOLALIGHT_NAVLIGHTS] = {typename = "argumentlight", argument = 49},

            [WOLALIGHT_SPOTS] = {
                typename = "collection",
                lights = {
                    [1] = {
                        typename = "Collection",
                        lights = {
                            {
                                typename = "Spot",
                                connector = "MAIN_SPOT_PTR",
                                dir_correction = {elevation = math.rad(8.0)},
                                argument = 51,
                                proto = lamp_prototypes.LFS_P_27_600
                            }
                        }
                    }
                }
            },
            [WOLALIGHT_TAXI_LIGHTS] = {
                typename = "collection",
                lights = {
                    [1] = {
                        typename = "Collection",
                        lights = {
                            {
                                typename = "Spot",
                                connector = "MAIN_SPOT_PTR_2",
                                dir_correction = {elevation = math.rad(8.0)},
                                argument = 51,
                                proto = lamp_prototypes.LFS_R_27_180
                            }
                        }
                    }
                }
            }
        }
    }
};
