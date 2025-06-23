local vwv_mig17f = {

    Name = 'vwv_mig17f', -- AG
    DisplayName = _('[VWV] MiG-17F "Fresco C"'),

    Picture = "mig17f.png",
    Rate = "50",
    Shape = "mig17f", -- AG

    shape_table_data = {
        {
            file = 'mig17f', -- AG
            life = 20, -- lifebar
            vis = 3, -- visibility gain.
            desrt = 'mig17f-oblomok', -- Name of destroyed object file name
            fire = {300, 2}, -- Fire on the ground after destoyed: 300sec 2m
            username = 'mig17f', -- AG
            index = WSTYPE_PLACEHOLDER,
            classname = "lLandPlane",
            positioning = "BYNORMAL"
        },
        {
            name = "mig17f-oblomok",
            file = "mig17f-oblomok",
            fire = {240, 2}
        }
    },

    mapclasskey = "P0091000024",
    attribute = {
        wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER,
        "Fighters", "Datalink", "Link16"
    },
    Categories = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    M_empty = 3798, -- kg  with pilot and nose load, F15
    M_nominal = 5340, -- kg (Empty Plus Full Internal Fuel)
    M_max = 6072, -- kg (Maximum Take Off Weight)
    M_fuel_max = 1140, -- kg (Internal Fuel Only)
    H_max = 18000, -- m  (Maximum Operational Ceiling)
    average_fuel_consumption = 0.150,
    CAS_min = 70, -- Minimum CAS speed (m/s) (for AI)
    V_opt = 180, -- Cruise speed (m/s) (for AI)
    V_take_off = 81, -- Take off speed in m/s (for AI)
    V_land = 81, -- Land speed in m/s (for AI)
    has_afteburner = false,
    has_speedbrake = true,
    radar_can_see_ground = true,

    -- nose_gear_pos = {1.42, -2.20, 0}, -- nosegear coord---6.157,	-1.26,	0 
    nose_gear_pos = {1.42, -2.00, 0}, -- nosegear coord---6.157,	-1.26,	0 
    nose_gear_amortizer_direct_stroke = 0, -- down from nose_gear_pos !!!
    nose_gear_amortizer_reversal_stroke = 0, -- up 
    nose_gear_amortizer_normal_weight_stroke = 0, -- up 
    nose_gear_wheel_diameter = 0.754, -- in m

    -- main_gear_pos = {-2.14, -2.23, 0.00}, -- main gear coords	----1.184,	-1.26,	2.714 
    main_gear_pos = {-2.14, -2.03, 0.00}, -- main gear coords	----1.184,	-1.26,	2.714 
    main_gear_amortizer_direct_stroke = 0, --  down from main_gear_pos !!!
    main_gear_amortizer_reversal_stroke = 0, --  up 
    main_gear_amortizer_normal_weight_stroke = 0, -- down from main_gear_pos
    main_gear_wheel_diameter = 0.972, -- in m

    AOA_take_off = 0.16, -- AoA in take off (for AI)
    stores_number = 9,
    bank_angle_max = 75, -- Max bank angle (for AI)
    Ny_min = -3, -- Min G (for AI)
    Ny_max = 8, -- Max G (for AI)
    V_max_sea_level = 340, -- Max speed at sea level in m/s (for AI)
    V_max_h = 340, -- Max speed at max altitude in m/s (for AI)
    wing_area = 22.6, -- wing area in m2
    thrust_sum_max = 16240, -- thrust in kgf (64.3 kN)
    thrust_sum_ab = 24400, -- thrust in kgf (95.1 kN)
    Vy_max = 275, -- Max climb speed in m/s (for AI)
    flaps_maneuver = 0.5,
    Mach_max = 1.15, -- Max speed in Mach (for AI)
    range = 2540, -- Max range in km (for AI)
    RCS = 2, -- Radar Cross Section m2
    Ny_max_e = 9, -- Max G (for AI)
    detection_range_max = 250,
    IR_emission_coeff = 0.91, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
    IR_emission_coeff_ab = 4, -- With afterburner
    tand_gear_max = 3.73, -- XX  1.732 FA18 3.73, 
    tanker_type = 0, -- F14=2/S33=4/ M29=0/S27=0/F15=1/ F16=1/To=0/F18=2/A10A=1/ M29K=4/F4=0/
    wing_span = 9.628, -- XX  wing spain in m
    wing_type = 1, -- 0=FIXED_WING/ 1=VARIABLE_GEOMETRY/ 2=FOLDED_WING/ 3=ARIABLE_GEOMETRY_FOLDED
    length = 11.09,
    height = 3.80,
    crew_size = 1, -- XX
    engines_count = 1, -- XX
    wing_tip_pos = {-4.207, -0.086, 5.782},

    -- EPLRS 						= true,--?
    TACAN_AA = true, -- ?
    launch_bar_connected_arg_value = 0.815, -- 0.885,--0.745

    mechanimations = {
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
        FoldableWings = {
            {
                Transition = {"Retract", "Extend"},
                Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0}}}},
                Flags = {"Reversible"}
            }, {
                Transition = {"Extend", "Retract"},
                Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 5.0}}}},
                Flags = {"Reversible", "StepsBackwards"}
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
        LaunchBar = {
            {
                Transition = {"Retract", "Extend"},
                Sequence = {
                    {
                        C = {
                            {"ChangeDriveTo", "HydraulicGravityAssisted"},
                            {"VelType", 3}, {"Arg", 85, "to", 0.881, "in", 4.4}
                        }
                    }
                }
            }, {
                Transition = {"Retract", "Stage"},
                Sequence = {
                    {
                        C = {
                            {"ChangeDriveTo", "HydraulicGravityAssisted"},
                            {"VelType", 3}, {"Arg", 85, "to", 0.815, "in", 4.4}
                        }
                    }
                }
            }, {
                Transition = {"Any", "Retract"},
                Sequence = {
                    {
                        C = {
                            {"ChangeDriveTo", "Hydraulic"}, {"VelType", 2},
                            {"Arg", 85, "to", 0.000, "in", 4.5}
                        }
                    }
                }
            }, {
                Transition = {"Extend", "Stage"},
                Sequence = {
                    {
                        C = {
                            {"ChangeDriveTo", "Mechanical"},
                            {"Sleep", "for", 0.000}
                        }
                    },
                    {C = {{"Arg", 85, "from", 0.881, "to", 0.766, "in", 0.600}}},
                    {C = {{"Arg", 85, "from", 0.766, "to", 0.753, "in", 0.300}}},
                    {C = {{"Sleep", "for", 0.45}}},
                    {
                        C = {
                            {
                                "Arg", 85, "from", 0.753, "to", 0.784, "in",
                                0.1, "sign", 2
                            }
                        }
                    },
                    {C = {{"Arg", 85, "from", 0.784, "to", 0.881, "in", 1.0}}}
                }
            }, {
                Transition = {"Stage", "Pull"},
                Sequence = {
                    {
                        C = {
                            {"ChangeDriveTo", "Mechanical"}, {"VelType", 2},
                            {
                                "Arg", 85, "from", 0.881, "to",
                                launch_bar_connected_arg_value_, "in", 0.15
                            }
                        }
                    }, {
                        C = {
                            {"ChangeDriveTo", "Mechanical"}, {"VelType", 2},
                            {"Arg", 85, "to", 0.78, "speed", 0.1}
                        }
                    }, {
                        C = {
                            {"ChangeDriveTo", "Mechanical"}, {"VelType", 2},
                            {"Arg", 85, "to", 0.7792, "speed", 0.02}
                        }
                    }
                }
            }, {
                Transition = {"Stage", "Extend"},
                Sequence = {
                    {
                        C = {
                            {"ChangeDriveTo", "HydraulicGravityAssisted"},
                            {"VelType", 3},
                            {"Arg", 85, "from", 0.815, "to", 0.881, "in", 0.2}
                        }
                    }
                }
            }
        }
    }, -- end of mechanimations

    engines_nozzles = {
        [1] = {
            pos = {-7.100, 0.10, 0.00},
            elevation = -2.8, -- 3.7
            diameter = 0.965, -- 0.965
            exhaust_length_ab = 5.5,
            exhaust_length_ab_K = 0.76,
            smokiness_level = 0.5
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
    brakeshute_name = 0,
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
        SingleChargeTotal = 96,
        chaff = {default = 48, increment = 24, chargeSz = 1},
        flare = {default = 48, increment = 24, chargeSz = 1}
    },

    CanopyGeometry = {
        azimuth = {-145.0, 145.0}, -- pilot view horizontal (AI)
        elevation = {-50.0, 90.0} -- pilot view vertical (AI)
    },

    Sensors = {RADAR = "N-011M", IRST = "OLS-27", RWR = "Abstract RWR"},

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

        gun_mount("GSh_23_2", {count = 250}, {muzzle_pos = {2.00, -0.550, -0.5}}),
        gun_mount("GSh_23_2", {count = 250}, {muzzle_pos = {1.85, -0.650, -0.3}}),
        gun_mount("M_39", {count = 250}, {muzzle_pos = {1.95, -0.60, 0.40}})

    },
    -------------------------------------------------------------------------------
    Pylons = {
        pylon(1, 0, 1.2, 2.50, -1.60,
            {use_full_connector_position = false, connector = "pylon_1"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
				-- {CLSID = "CATM-9M"} -- CATM-9M
        }), pylon(2, 0, 1.2, 2.40, -1.75,
            {use_full_connector_position = false, connector = "pylon_2"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
				-- {CLSID = "CATM-9M"} -- CATM-9M

        }), pylon(3, 0, 0.00, 0.00, 0.000,
            {use_full_connector_position = false, connector = "pylon_3"}, {
                { CLSID = "PTB400_MIG15" ,attach_point_position = {0.00, 0.25 ,0 }},
        }), pylon(4, 0, 0.00, 0.00, 0.00,
            {use_full_connector_position = false, connector = "pylon_4"}, {
                { CLSID = "PTB400_MIG15" ,attach_point_position = {0.00, 0.25 ,0 }},
        })
    },

    ------------------------------------------------------------------------------

    Tasks = {
        aircraft_task(CAP),
		aircraft_task(Escort),
		aircraft_task(FighterSweep),
        aircraft_task(Intercept),
		aircraft_task(Reconnaissance),
        aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(AFAC),
        aircraft_task(RunwayAttack),
        aircraft_task(AntishipStrike),
    },
    DefaultTask = aircraft_task(CAP),

    -- Based on the MiG-15 SFM
    SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0	=	0.0668, -- zero AoA lift coefficient*
			Mzalfa	=	4.355, -- coefficients for pitch agility
			Mzalfadt	=	0.8,  -- coefficients for pitch agility
			kjx	=	2,--2.3, -- Inertia parametre X - Dimension (clean) airframe drag coefficient at X (Top) Simply the wing area in square meters (as that is a major factor in drag calculations)
			kjz	=	0.01,--0.0011, -- Inertia parametre Z - Dimension (clean) airframe drag coefficient at Z (Front) Simply the wing area in square meters (as that is a major factor in drag calculations)
			Czbe	=	-0.014, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear	=	0.02, -- coefficient, drag, gear ??
			cx_flap	=	0.06, -- coefficient, drag, full flaps
			cy_flap	=	0.35, -- coefficient, normal force, lift, flaps
			cx_brk	=	0.026, -- coefficient, drag, breaks
            -- Reduced Omxmax by 0.1 to 0.2 up to M 0.7
			table_data = 
			{	--      M		Cx0*	 	Cya*		B2		 	B4	 		Omxmax		Aldop*		Cymax*
				{ 0.0,	0.018	,	0.067	,	0.074	,	0.01 	,	0.272	,	17.3	,	1.1},		
				{ 0.1,	0.018	,	0.067	,	0.074	,	0.01 	,	0.272	,	17.3	,	1.1},
				{ 0.2,	0.0172	,	0.067	,	0.074	,	0.01	,	0.641	,	17.3	,	1.1},
				{ 0.3,	0.0165	,	0.067	,	0.074	,	0.01    ,	0.989	,	17.3	,	1.1},
				{ 0.4,	0.016	,	0.0682	,	0.074	,	0.01  	,	1.289	,	17.3	,	1.1},
				{ 0.5,	0.016	,	0.0708	,	0.074	,	0.01 	,	1.289	,	16.9	,	1.075},
				{ 0.6,	0.016	,	0.0746	,	0.074	,	0.01 	,	1.008	,	16.2	,	1.031},
				{ 0.7,	0.016	,	0.0798	,	0.074	,	0.01 	,	0.175	,	15.3	,	0.974},
				{ 0.8,	0.0168	,	0.0850	,	0.08 	,	0.01 	,	0.103	,	13.9	,	0.882},
				{ 0.86,	0.018	,	0.0822	,	0.082	,	0.11		,	0.028	,	12.8	,	0.815},
				{ 0.9,	0.0232	,	0.076	,	0.088	,	0.36 	,	0.008   ,	11.6	,	0.737},
				{ 0.94,	0.0402	,	0.0737	,	0.125	,	0.43	   ,	0.006	,	9.8	,	0.625},
				{ 1,	    0.0598	,	0.0735	,	0.15 	,	0.56   	,	0.004	,	8	,	0.511},
				{ 1.04,	0.063	,	0.0744	,	0.23 	,	0.84 	,	0.002	,	7.4	,	0.469},
				{ 1.2,	0.0642	,	0.0760	,	0.26 	,	1   	,	0.001 	,	6.7	,	0.425},
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
            Nominal_RPM = 11600.0,
			Nmg	=	21.5, -- RPM at idle
            Startup_Prework = 28.0,
            Startup_Duration = 21.0,
            Shutdown_Duration = 62.0,
			MinRUD	=	0, -- Min state of the РУД
			MaxRUD	=	1, -- Max state of the РУД
			MaksRUD	=	1, -- Military power state of the РУД
			ForsRUD	=	1, -- Afterburner state of the РУД
			type	=	"TurboJet",
			hMaxEng	=	19, -- Max altitude for safe engine operation in km
			dcx_eng	=	0.0134, -- Engine drag coeficient
			cemax	=	1.24, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	1340, --  altitude coefficient for max thrust
			dpdh_f	=	1340, --  altitude coefficient for AB thrust
            -- add 2000 to Pmax and Pfor
			table_data = 
			{		--   M			Pmax		 Pfor	
				{ 0.0	,	28000	,	28000	},
				{ 0.1	,	28000	,	28000	},
				{ 0.2	,	26430	,	26430	},
				{ 0.3	,	25040	,	25040	},
				{ 0.4	,	24090	,	24090	},
				{ 0.5	,	23490	,	23490	},
				{ 0.6	,	23310	,	23310	},
				{ 0.7	,	23400	,	23400   },
				{ 0.8	,	24090	,	24090	},
				{ 0.86  ,	24780	,	24780	},
				{ 0.9	,	25300	,	25300	},
				{ 0.94  ,	25650	,	25650	},
				{ 1	    ,	26260	,	26260	},
				{ 1.04  ,	26600	,	26600	},
				{ 1.1	,	27640	,	27640	},

			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},

	-- Blueprint taken from Damage.lua of ED, Fencer (Scripts/Aircraft/_Common/Damage.lua)
	Damage  = verbose_to_dmg_properties({
		-- ["COCKPIT"]				= {critical_damage = 2,args =  { 65}},
		["NOSE_CENTER"]			= {critical_damage = 3,args =  {146}},
		["NOSE_RIGHT_SIDE"] 	= {critical_damage = 3,args =  {147}},
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3,args =  {150}},
		["NOSE_BOTTOM"]			= {critical_damage = 3,args =  {148}},
		["NOSE_TOP_SIDE"]		= {critical_damage = 3,args =  {147}},

		["WING_L_OUT"]			= {critical_damage = 10,args =  {223},deps_cells = {"FLAPS_L_IN","WING_L_PART_OUT"}},
		["WING_R_OUT"]			= {critical_damage = 10,args =  {213},deps_cells = {"FLAPS_R_IN","WING_R_PART_OUT"}},
		["WING_L_PART_OUT"]		= {critical_damage = 3, args =  {221}},
		["WING_R_PART_OUT"]		= {critical_damage = 3, args =  {231}},
		["FLAPS_L_IN"]			= {critical_damage = 4, args =  {227}},
		["FLAPS_R_IN"]			= {critical_damage = 4, args =  {217}},

		-- ["FUSELAGE_BOTTOM"]		= {critical_damage = 8, args =  {152}},
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
        [1] = "mig17f-oblomok-wing-r", -- wing R
        [2] = "mig17f-oblomok-wing-l" -- wing L

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
}

add_aircraft(vwv_mig17f)
