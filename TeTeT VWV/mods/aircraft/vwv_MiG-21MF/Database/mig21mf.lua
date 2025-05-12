return {

    Name = 'vwv_mig21mf',
    DisplayName = _('[VWV] MiG-21MF "Fishbed J"'),
	HumanCockpit = false,
    Picture = "mig21mf.png",
    Rate = "50",
    Shape = "mig21mf", 

    shape_table_data = {
        {
            file = 'mig21mf',
            life = 20, -- lifebar
            vis = 3, -- visibility gain.
            desrt = 'mig21mf-oblomok', -- Name of destroyed object file name
            fire = {300, 2}, -- Fire on the ground after destoyed: 300sec 2m
            username = 'mig21mf',
            index = WSTYPE_PLACEHOLDER,
            classname = "lLandPlane",
            positioning = "BYNORMAL"
        },
        {
            name = "mig21mf-oblomok",
            file = "mig21mf-oblomok",
            fire = {240, 2}
        }
    },

    mapclasskey = "P0091000024",
    attribute = {
        wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER,
        "Fighters"
    },
    Categories = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    M_empty = 5690, -- https://mig-21.de/deutsch/technik.htm
    M_nominal = 8000, -- 5340, -- kg (Empty Plus Full Internal Fuel)
    M_max = 9872, -- https://mig-21.de/deutsch/technik.htm
    M_fuel_max = 2600, -- https://mig-21.de/deutsch/technik.htm
    H_max = 17700, -- m  (Maximum Operational Ceiling)
    average_fuel_consumption = 0.150,
    CAS_min = 70, -- Minimum CAS speed (m/s) (for AI)
    V_opt = 180, -- Cruise speed (m/s) (for AI)
    V_take_off = 90, -- 81, -- Take off speed in m/s (for AI)
    V_land = 92, -- 81, -- Land speed in m/s (for AI)
    has_afteburner = true,
    has_speedbrake = true,
    has_differential_stabilizer	= false,
    radar_can_see_ground = true,

    -- nose_gear_pos = {1.42, -2.20, 0}, -- nosegear coord---6.157,	-1.26,	0
    nose_gear_pos = {1.42, -1.45, 0.00}, -- nosegear coord---6.157,	-1.26,	0
    nose_gear_amortizer_direct_stroke = 0.1, -- down from nose_gear_pos !!!
    nose_gear_amortizer_reversal_stroke = -0.05, -- up
    nose_gear_amortizer_normal_weight_stroke = 0, -- up
    nose_gear_wheel_diameter = 0.5, -- in m

    -- main_gear_pos = {-2.14, -2.23, 0.00}, -- main gear coords	----1.184,	-1.26,	2.714
    main_gear_pos = {-2.14, -1.55, 0.00}, -- main gear coords	----1.184,	-1.26,	2.714
    main_gear_amortizer_direct_stroke = 0, --  down from main_gear_pos !!!
    main_gear_amortizer_reversal_stroke = 0, --  up
    main_gear_amortizer_normal_weight_stroke = 0, -- down from main_gear_pos
    main_gear_wheel_diameter = 0.8, -- in m

    AOA_take_off = 0.17, -- AoA in take off (for AI)
    stores_number = 4,
    bank_angle_max = 75, -- Max bank angle (for AI)
    Ny_min = -4, -- Min G (for AI)
    Ny_max = 7.5, -- Max G (for AI)
    V_max_sea_level = 350, -- Max speed at sea level in m/s (for AI)
    V_max_h = 680, -- Max speed at max altitude in m/s (for AI)

    thrust_sum_max = 7000,
    thrust_sum_ab = 11000,
    Vy_max = 195, -- Max climb speed in m/s (for AI)
    flaps_maneuver = 0.5,
    Mach_max = 2.05, -- Max speed in Mach (for AI)
    range = 1100, -- Max range in km (for AI)
    RCS = 3.0, -- Radar Cross Section m2
    Ny_max_e = 9, -- Max G (for AI)
    detection_range_max = 30,
    IR_emission_coeff = 0.6, --0.91, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
    IR_emission_coeff_ab = 2.4, -- 4, -- With afterburner
    tand_gear_max = 3.73, -- XX  1.732 FA18 3.73, 
    tanker_type = 0, -- F14=2/S33=4/ M29=0/S27=0/F15=1/ F16=1/To=0/F18=2/A10A=1/ M29K=4/F4=0/

    wing_area = 22.6, -- wing area in m2
    wing_span = 7.15, -- XX  wing spain in m
    wing_type = 0, -- 0=FIXED_WING/ 1=VARIABLE_GEOMETRY/ 2=FOLDED_WING/ 3=ARIABLE_GEOMETRY_FOLDED
    length = 14.5,
    height = 4.16,
    crew_size = 1,
    engines_count = 1,
    wing_tip_pos = { -3.19374, 0.10661, 3.83868 },

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

    engines_nozzles = {
        [1] = {
            -- pos = {-7.100, 0.10, 0.00},
            pos = { -5.64922, 0.26451, 0.00},
            elevation = -2.8, -- 3.7
            diameter = 0.965, -- 0.965
            exhaust_length_ab = 5.5,
            exhaust_length_ab_K = 0.76,
            smokiness_level = 0.75,
            afterburner_circles_count = 3,
        } -- end of [1]
    }, -- end of engines_nozzles
    crew_members = {
        [1] = {
            ejection_seat_name = 9,
            drop_canopy_name = 41,
            pos = {4.763, 0.862, 0},
            drop_parachute_name = "pilot_yak52_parachute"
        } -- end of [1]
    }, -- end of crew_members
    brakeshute_name = 3,
    is_tanker = false,
    ---air_refuel_receptacle_pos = 	{0,	0,	0},
    fires_pos = {
        [1] = {-0.664, -0.496, 0},
        [2] = {0.173, -0.307, 1.511},
        [3] = {0.173, -0.307, -1.511},
        [4] = {-0.82, 0.265, 2.774},
        [5] = {-0.82, 0.265, -2.774},
        [6] = {-0.82, 0.255, 4.274},
        [7] = {-0.82, 0.255, -4.274},
        [8] = {-4.899, -0.212, 0.611},
        [9] = {-4.899, -0.212, -0.611},
        [10] = {-0.896, 1.118, 0},
        [11] = {0.445, -0.436, 0}
    }, -- end of fires_pos

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
        -- gun_mount("GSh_23_2", {count = 250}, {muzzle_pos = {2.00, -0.550, -0.5}})
        gun_mount("GSh_23_2", {count = 250}, {muzzle_pos_connector = "GunPodMuzzle"})
    },
    -------------------------------------------------------------------------------
    Pylons = {
        -- not x y z in blender, but y z x maybe
        pylon(1, 0, -1.40844, -0.07162, -2.68404,
            {use_full_connector_position = false, connector = "pylon_1"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
                {CLSID = "{R-13M}"},
                {CLSID = "{R-3R}"},
                {CLSID = "{R-3S}"},
                {CLSID = "{RS-2US}"},
				-- {CLSID = "CATM-9M"} -- CATM-9M
        }), pylon(2, 0, -0.48246, -0.06790, -2.0856,
            {use_full_connector_position = false, connector = "pylon_2"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
                {CLSID = "{R-13M}"},
                {CLSID = "{R-3R}"},
                {CLSID = "{R-3S}"},
                {CLSID = "{RS-2US}"},
				-- {CLSID = "CATM-9M"} -- CATM-9M

        }), pylon(3, 0, -0.482458, -0.06790, 2.09747,
            {use_full_connector_position = false, connector = "pylon_3"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
                {CLSID = "{R-13M}"},
                {CLSID = "{R-3R}"},
                {CLSID = "{R-3S}"},
                {CLSID = "{RS-2US}"},
		}), pylon(4, 0, -1.40844, -0.07162, 2.69591,
			{use_full_connector_position = false, connector = "pylon_4"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
                {CLSID = "{R-13M}"},
                {CLSID = "{R-3R}"},
                {CLSID = "{R-3S}"},
                {CLSID = "{RS-2US}"},
		}), pylon(5, 0,  0.10, -0.45, 0.0,                       	--  	nr, x?, l, h!, w!
            {use_full_connector_position = true, connector = "pylon_5"}, {
                {CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
                {CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
                {CLSID = "PTB_490C_MIG21"},
        })
    },

    ------------------------------------------------------------------------------

    Tasks = {
        aircraft_task(CAP),
		aircraft_task(Escort),
		aircraft_task(FighterSweep),
        aircraft_task(Intercept),
		-- aircraft_task(Reconnaissance),
        aircraft_task(GroundAttack),
		aircraft_task(CAS),
        aircraft_task(AntishipStrike),
		-- aircraft_task(AFAC),
        -- aircraft_task(RunwayAttack)
    },
    DefaultTask = aircraft_task(CAP),

    -- Based on MiG-21Bis SFM data, improved with a script from PeeJott
    -- b = (0.8 * math.pow((mach / 0.9) - 1, 2.6) + 1) / (math.pi * 2.26 * 0.69)
	SFM_Data =
	{
		aerodynamics =
		{
			Cy0	=	0.10,
			Mzalfa	=	4.2,
			Mzalfadt	=	0.8,
			kjx	=	2.7,
			kjz	=	0.01,
			Czbe	=	-0.014,
			cx_gear	=	0.035,
			cx_flap	=	0.04,
			cy_flap	=	0.30,
			cx_brk	=	0.07,

			table_data =
			{
				-- Cy  = (CyAlpha_ * 57.3) * aoa;-> aoa in RAD
				-- Cx  = Cx0 + B2_ * Cy * Cy + B4_ * Cy * Cy * Cy * Cy;
				--   		M		Cx0			Cya			B2			B4	 		Omxmax	    Aldop	    Cymax
                -- Modified based on observations in MiG-17F, F-4E and F-5E tables, and PeeJott's formula for B2
                -- B2 min is 0.204, B4 min is 0.200 and raised from Mach 1 forward by +0.1
                [1] = {	    0.0	,	0.0250	,	0.0959	,	0.204	,	0.250	,	0.300	,	16.15	,	1.200	},
				[2] = {	    0.1	,	0.0255	,	0.0937	,	0.204	,	0.240	,	0.900	,	16.15	,	1.190	},
				[3] = {	    0.2	,	0.0260	,	0.0903	,	0.204	,	0.230	,	1.500	,	16.15	,	1.180	},
				[4] = {	    0.3	,	0.0265	,	0.0883	,	0.204	,	0.220	,	2.000	,	16.15	,	1.170	},
				[5] = {	    0.4	,	0.0270	,	0.0863	,	0.204	,	0.210	,	2.500	,	16.15	,	1.160	},
				[6] = {	    0.5	,	0.0278	,	0.0820	,	0.204	,	0.205	,	3.000	,	16.15	,	1.120	},
				[7] = {	    0.6	,	0.0285	,	0.0778	,	0.204	,	0.200	,	3.500	,	16.15	,	1.080	},
				[8] = {	    0.7	,	0.0303	,	0.0731	,	0.204	,	0.200	,	3.425	,	16.15	,	1.045	},
				[9] = {	    0.8	,	0.0320	,	0.0695	,	0.204	,	0.200	,	3.350	,	16.15	,	1.010	},
				[10] = {	0.9	,	0.0364	,	0.0645	,	0.204	,	0.200	,	3.275	,	16.15	,	0.975	},
				[11] = {	1.0	,	0.0500	,	0.0642	,	0.204	,	0.300	,	3.200	,	16.15	,	0.940	},
				[12] = {	1.1	,	0.0535	,	0.0525	,	0.207	,	0.305	,	2.950	,	14.87	,	0.725	},
				[13] = {	1.2	,	0.0530	,	0.0402	,	0.213	,	0.310	,	2.700	,	13.59	,	0.510	},
				[14] = {	1.3	,	0.0482	,	0.0338	,	0.223	,	0.313	,	2.600	,	13.59	,	0.440	},
				[15] = {	1.4	,	0.0410	,	0.0272	,	0.239	,	0.315	,	2.500	,	13.59	,	0.370	},
				[16] = {	1.5	,	0.0390	,	0.0266	,	0.261	,	0.318	,	2.400	,	13.59	,	0.360	},
				[17] = {	1.6	,	0.0370	,	0.0259	,	0.289	,	0.320	,	2.300	,	13.59	,	0.350	},
				[18] = {	1.7	,	0.0355	,	0.0259	,	0.324	,	0.323	,	2.200	,	13.59	,	0.350	},
				[19] = {	1.8	,	0.0340	,	0.0259	,	0.367	,	0.325	,	2.100	,	13.59	,	0.350	},
				[20] = {	1.9	,	0.0330	,	0.0259	,	0.418	,	0.328	,	2.000	,	13.59	,	0.350	},
				[21] = {	2.0	,	0.0320	,	0.0259	,	0.479	,	0.330	,	1.900	,	13.59	,	0.350	},
				[22] = {	2.1	,	0.0320	,	0.0259	,	0.549	,	0.335	,	1.800	,	13.59	,	0.350	},
				[23] = {	2.2	,	0.0320	,	0.0259	,	0.628	,	0.340	,	1.700	,	13.59	,	0.350	},
				[24] = {	2.3	,	0.0320	,	0.0259	,	0.719	,	0.370	,	1.600	,	13.59	,	0.350	},
				[25] = {	2.4	,	0.0320	,	0.0259	,	0.820	,	0.400	,	1.500	,	13.59	,	0.350	},
                [26] = {	3.0	,	0.0320	,	0.0259	,	1.682	,	0.400	,	1.500	,	13.59	,	0.350	}, -- guess for Mach 3.0
			},
		},
		engine =
		{
			Nmg	=	60, -- was 62
			MinRUD	=	0,--0.1
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			typeng	=	1,
			hMaxEng	=	19.5,--22,
			dcx_eng	=	0.0114,
			cemax	=	1.24,--1.2,
			cefor	=	2.56,--2.5,
			dpdh_m	=	3500,--4100 sto manje - jaci motor sa visinom, nema znacajnog efekta na malim visinama
			dpdh_f	=	6330,

            -- Reduce pfor and pmax by 5% in comparison to MiG21bis
			table_data =
			{
				[1]={	0.0	,	38950	,	67450	},
				[2]={	0.1	,	38475	,	68737	},
				[3]={	0.2	,	38475	,	70025	},
				[4]={	0.3	,	38475	,	71312	},
				[5]={	0.4	,	38950	,	76420	},
				[6]={	0.5	,	39425	,	72599	},
				[7]={	0.6	,	39900	,	77074	},
				[8]={	0.7	,	41800	,	80598	},
				[9]={	0.8	,	45600	,	85073	},
				[10]={	0.9	,	57000	,	89547	},
				[11]={	1.0	,	38000	,	98800	},
				[12]={	1.1	,	35625	,	100087	},
				[13]={	1.2	,	33250	,	101375	},
				[14]={	1.3	,	30875	,	103612	},
				[15]={	1.4	,	28500	,	106799	},
				[16]={	1.5	,	26125	,	109986	},
				[17]={	1.6	,	23750	,	112224	},
				[18]={	1.7	,	21375	,	114619	},
				[19]={	1.8	,	19000	,	116698	},
				[20]={	1.9	,	16625	,	119410	},
				[21]={	2.0	,	14250	,	122123	},
				[22]={	2.1	,	11875	,	123885	},
				[23]={	2.2	,	9500	,	125647	},
				[24]={	2.3	,	7125	,	120897	},
				[25]={	2.4	,	4750	,	116147	},
			},
		},
	},

	-- Blueprint taken from Damage.lua of ED, Fencer (Scripts/Aircraft/_Common/Damage.lua)
	Damage  = verbose_to_dmg_properties({
		["COCKPIT"]				= {critical_damage = 2,args =  { 65}},
		["NOSE_CENTER"]			= {critical_damage = 3,args =  {146}},
		["NOSE_RIGHT_SIDE"] 	= {critical_damage = 3,args =  {147}},
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3,args =  {150}},
		["NOSE_BOTTOM"]			= {critical_damage = 3,args =  {148}},
		["NOSE_TOP_SIDE"]		= {critical_damage = 3,args =  {147}},

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
		}),

    DamageParts = {
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
                                connector = "MAIN_SPOT_PTR",
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
