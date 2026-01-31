-- ===================================================================
-- IMPLEMENTATION NOTES (MIG-21MF "FISHBED-J")
-- ===================================================================
--[[
CONFIGURATION: MIKOYAN-GUREVICH MiG-21MF (NATO: Fishbed-J)
                with 1x Tumansky R-13-300 turbojet engine

1. GEOMETRY UPDATES:
   - Length: 14.5 m (Including pitot boom).
   - Wingspan: 7.15 m (Standard Delta).
   - Spine: Enlarged dorsal spine for fuel/avionics (distinguishes MF from PF/PFM).

2. MASS & BALANCE:
   - MTOW: 9,400 kg (With 3 drop tanks).
   - OEW: 5,350 kg.
   - Max Fuel: ~2,650 kg (Internal).

3. ENGINE (Tumansky R-13-300):
   - Dry Thrust: 4,070 kgf (~8,970 lbf).
   - Afterburner Thrust: 6,490 kgf (~14,300 lbf).
   - Note: Less powerful than the R-25 found in the MiG-21bis.
--]]

return {
    Name                    = "vwv_mig21mf",
    DisplayName             = _("[VWV] MiG-21MF 'Fishbed J'"),
    DisplayNameShort        = _("MiG-21MF"),
    HumanCockpit            = false,
    Picture                 = "mig21mf.png",
    Rate                    = "50",			-- [#] Multiplayer points
    Shape                   = "mig21mf",

    shape_table_data        = {
        {
            file            = "mig21mf",
            life            = 20,           -- [HitPoints] Lifebar
            vis             = 3,            -- [Scalar] Visibility gain
            desrt           = "mig21mf-oblomok",
            fire            = {300, 2},     -- [sec, m] Duration, size
            username        = "mig21mf",
            index           = WSTYPE_PLACEHOLDER,
            classname       = "lLandPlane",
            positioning     = "BYNORMAL"
        },
        {
            name            = "mig21mf-oblomok",
            file            = "mig21mf-oblomok",
            fire            = {240, 2}
        }
    },

    mapclasskey             = "P0091000024",
    attribute               = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},
    Categories              = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    -- ===================================================================
    -- MASS & DIMENSIONS (MiG-21MF)
    -- ===================================================================

    -- Mass Parameters
    M_empty                 = 5350,         -- [kg] Operational Empty Weight
    M_nominal               = 8200,         -- [kg] Normal Takeoff Weight (Clean + Internal Fuel)
    M_max                   = 9400,         -- [kg] Max Takeoff Weight (MTOW)
    M_fuel_max              = 2650,         -- [kg] Internal Fuel Capacity (Enlarged spine)

    -- Dimensions
    length                  = 14.50,        -- [m] Length including pitot
    height                  = 4.10,         -- [m] Gear extended
    wing_area               = 23.00,        -- [m^2] Wing area
    wing_span               = 7.15,         -- [m] Wing span
    wing_type               = 0,            -- [Enum] 0=FIXED_WING

    -- ===================================================================
    -- INERTIA & CG
    -- ===================================================================
    --[[
        MiG-21MF Inertia Tensor in TsAGI coordinate system {Roll, Yaw, Pitch}.
        The MiG-21 is a slender "pencil" fuselage with short wings.
        - Roll inertia (Ix) is very low.
        - Yaw (Iy) and Pitch (Iz) inertias are significantly higher and relatively similar.
    ]]

    -- Center of Mass
    center_of_mass          = {-0.2, -0.1, 0.0}, -- [m] Relative to model center (approx)

    -- Moment of Inertia
    moment_of_inertia       = {2500, 24000, 21000, -500}, -- [kg*m^2] {Roll, Yaw, Pitch, POI}

    -- ===================================================================
    -- PERFORMANCE PARAMETERS
    -- ===================================================================

    -- Speeds
    V_opt                   = 250,          -- [m/s TAS] Cruise speed
    V_take_off              = 95,           -- [m/s TAS] Takeoff speed (~185 kts)
    V_land                  = 85,           -- [m/s TAS] Landing speed (~165 kts)
    V_max_sea_level         = 361,          -- [m/s TAS] Max speed at Sea Level (Mach 1.06)
    V_max_h                 = 620,          -- [m/s TAS] Max speed at Altitude (Mach 2.05)
    CAS_min                 = 75,           -- [m/s TAS] Stall/Min controllable speed
    Mach_max                = 2.05,         -- [Mach] Maximum operational Mach

    -- Climb & Ceiling
    H_max                   = 17500,        -- [m] Service Ceiling
    Vy_max                  = 120,          -- [m/s] Max climb rate (Instantaneous can be higher)

    -- Range & Fuel
    range                   = 1100,         -- [km] Internal fuel range
    average_fuel_consumption= 0.85,         -- [kg/s] Average cruise flow

    -- Limits
    Ny_min                  = -3.0,         -- [G] Min G limit
    Ny_max                  = 7.0,          -- [G] Normal operational limit
    Ny_max_e                = 8.5,          -- [G] Structural limit
    bank_angle_max          = 75,           -- [deg] AI Bank limit

    -- Takeoff Geometry
    AOA_take_off            = math.rad(10), -- [rad] Rotation AoA (~10 deg)

    -- ===================================================================
    -- PROPULSION (Tumansky R-13-300)
    -- ===================================================================

    engines_count           = 1,
    thrust_sum_max          = 4160,         -- [kgf] Dry Thrust (Military Power)
    thrust_sum_ab           = 6526,         -- [kgf] Afterburner Thrust
    has_afteburner          = true,
    has_thrustReverser      = false,

    engines_nozzles = {
        [1] = {
			-- pos  = {-5.65, 0.26, 0.004707}, -- [m] Nozzle position
            pos      = {-7.4, 0.0779, 0.0}, -- [m] Nozzle position
            elevation           = 0.0,      -- [deg] Thrust vector elevation angle
            diameter            = 0.906,    -- [m] Nozzle diameter
            exhaust_length_ab   = 4.5,      -- [m] Flame length (R-13 is shorter than R-25's 6.5m CSR flame)
            exhaust_length_ab_K = 0.76,     -- [scalar] Flame expansion
            smokiness_level     = 0.6,      -- [scalar] Older engine, smokier than modern
            afterburner_circles_count = 4,  -- [int] R-13 typically shows 3-4 diamonds, fewer than the R-25's 6-7
        }
    },

    -- ===================================================================
    -- SYSTEM & EQUIPMENT
    -- ===================================================================

    has_speedbrake          = true,         -- [bool]
    has_differential_stabilizer = false,    -- [bool] Slab tail moves as one unit
    radar_can_see_ground    = true,         -- [bool] Aircraft sensors can detect ground/sea surface units
    RCS                     = 3.0,          -- [m^2] Radar Cross Section
    detection_range_max     = 30,           -- [km] RP-22 Sapfir-21 Radar range
    IR_emission_coeff       = 0.6,          -- [scalar] Dry thrust IR sig (Su-27 = 1.0)
    IR_emission_coeff_ab    = 2.4,          -- [scalar] Afterburner IR sig (Su-27 = 5.0)
    is_tanker               = false,
    tanker_type             = 0,
    crew_size               = 1,
    brakeshute_name         = 3,            -- [ID] ID for drag chute (arg 35)

    -- Gear Geometry
    -- Nose: 2.75m fwd, 1.52m down. Main: 2.07m aft, 1.67m down, 1.43m side
    nose_gear_pos           = {  2.7630, -1.66, 0.000 },
    main_gear_pos           = { -2.0735, -1.66, 1.427 },

    -- KT-102 Strut
    -- Unweighted (In Flight / Jacked): ~200 mm
    -- Nominal Weight (Static on Ground): 80 mm – 90 mm
    -- Maximum Weight (MTOW / Hard Braking): ~30 mm – 40 mm
    nose_gear_amortizer_direct_stroke           =  0.0,     -- [arg value] Full Strut Expansion (no weight on wheels) (EDM arg 1)
    nose_gear_amortizer_reversal_stroke         = -0.197983,-- [m] Full Strut Compression (maximum+ weight on wheels)
    nose_gear_amortizer_normal_weight_stroke    = -0.084143,-- [m] Strut Weight Compression (normal compression with weight on wheels; number is amount of "chrome showing")
    nose_gear_wheel_diameter                    =  0.48,    -- [m] Diameter of the nose gear wheel

    -- KT-26 Strut
    -- Unweighted (In Flight / Jacked): ~260 mm – 280 mm
    -- Nominal Weight (Static on Ground): 110 mm – 130 mm
    -- Maximum Weight (MTOW / Hard Landing): ~40 mm – 50 mm
    main_gear_amortizer_direct_stroke           =  0.0,     -- [arg value] Full Strut Expansion (no weight on wheels) (EDM doesn't have main gear compression args)
    main_gear_amortizer_reversal_stroke         =  0.0,     -- [m] Full Strut Compression (maximum+ weight on wheels)
    main_gear_amortizer_normal_weight_stroke    =  0.0,     -- [m] Strut Weight Compression (normal compression with weight on wheels; number is amount of "chrome showing")
    main_gear_wheel_diameter                    =  0.655,   -- [m] Diameter of the main gear wheel

    tand_gear_max           = math.tan(math.rad(35)),       -- [tan] Caster steering angle stop (35 deg)

    -- Control Surfaces
    flaps_maneuver          = 0.5,          -- [scalar] Flap efficiency/state for maneuvering
    wing_tip_pos            = { -3.85, -0.065, 3.55 },
    stores_number           = 5,            -- [int] 4 Wings + 1 Centerline

    -- Mechanical Animations
    mechanimations          = {},

    -- Crew
    crew_members = {
        [1] = {
            ejection_seat_name  = 9,
            drop_canopy_name    = 41,
            pos                 = {1.54, 0.6, 0},
            drop_parachute_name = "pilot_mig15_parachute",
			pilot_name	 		= "MiG-21_pilot",			-- Borrow ED's MiG-21bis pilot body
        }
    },

    -- Damage / Fires
    fires_pos = {
        {-0.6, 0.5, 0}, {0, 0, 1}, {0, 0, -1},
        {-1, 0, 2}, {-1, 0, -2}, {-2, 0, 3}, {-2, 0, -3},
        {-8, 0.15, 0}, {-3.5, 0.2, 0.4}, {-3.5, 0.2, -0.4}
    },

    -- Sensors
    Sensors = {
        RADAR               = "N-008",
        RWR                 = "Abstract RWR",
        -- IRST                = "OLS-27" 						-- MiG-21MF doesn't have IRST capability -- is this for playability reasons?
    },

    -- Radio (RSIU-5 aka R-802; 10 Watts)
    HumanRadio = {
        frequency           = 127.5,
        editable            = true,
        minFrequency        = 100.000,
        maxFrequency        = 150.000,
        modulation          = MODULATION_AM
    },

    -- ===================================================================
    -- FLIGHT MODEL DATA (SFM)
    -- ===================================================================
    SFM_Data = {
        aerodynamics = {
            -- Adopted from ED's MiG-21Bis (Delta Wing characteristics)
            Cy0             = 0.0,          -- [Coeff] Zero-AoA lift (symmetric airfoil)
            Mzalfa          = 4.2,          -- [Coeff] Pitch stability
            Mzalfadt        = 0.8,          -- [Coeff] Pitch damping
            kjx             = 2.7,          -- [Coeff] Roll inertia factor
            kjz             = 0.01,         -- [Coeff] Pitch inertia factor
            Czbe            = -0.014,       -- [Coeff] Directional stability

            cx_gear         = 0.035,        -- [Coeff] Gear drag
            cx_flap         = 0.040,        -- [Coeff] Flap drag
            cy_flap         = 0.300,        -- [Coeff] Flap lift
            cx_brk          = 0.070,        -- [Coeff] Airbrake drag

            table_data = {
                -- Aerodynamic Table Adapted from MiG-21Bis
                -- Uses specific delta wing lift slopes (Cya ~0.044) rather than generic (0.09)
                -- Cx0 (Col 2) set to 0.022 to represent MF Drag (slightly higher than Bis 0.0197)
                --       M      Cx0    Cya     B2      B4    Omxmax  Aldop   Cymax
                [1] = { 0.0,  0.0220, 0.044,  0.180,  0.20,   0.000,  16.6,   0.80 },
                [2] = { 0.2,  0.0220, 0.044,  0.180,  0.20,   1.500,  16.6,   0.80 },
                [3] = { 0.4,  0.0220, 0.044,  0.180,  0.20,   1.500,  16.6,   0.80 },
                [4] = { 0.6,  0.0220, 0.044,  0.180,  0.20,   1.500,  16.6,   0.80 },
                [5] = { 0.7,  0.0220, 0.044,  0.180,  0.20,   1.500,  16.6,   0.80 },
                [6] = { 0.8,  0.0220, 0.046,  0.170,  0.20,   1.500,  16.6,   0.83 },
                [7] = { 0.9,  0.0220, 0.050,  0.170,  0.20,   1.500,  16.6,   0.87 },
                -- Transonic Drag Rise begins
                [8] = { 1.0,  0.0400, 0.050,  0.220,  0.20,   1.500,  11.0,   0.51 },
                [9] = { 1.1,  0.0410, 0.048,  0.200,  0.20,   1.500,  9.00,   0.32 },
                [10]= { 1.2,  0.0400, 0.045,  0.220,  0.20,   1.500,  8.00,   0.28 },
                [11]= { 1.3,  0.0380, 0.042,  0.240,  0.20,   1.500,  8.00,   0.26 },
                [12]= { 1.5,  0.0340, 0.037,  0.280,  0.20,   1.500,  8.00,   0.24 },
                [13]= { 1.8,  0.0320, 0.031,  0.320,  0.20,   1.500,  8.00,   0.24 },
                [14]= { 2.0,  0.0310, 0.029,  0.380,  0.28,   1.500,  8.00,   0.24 },
                [15]= { 2.2,  0.0310, 0.026,  0.440,  0.30,   1.500,  8.00,   0.23 },
                [16]= { 2.5,  0.0300, 0.022,  0.500,  0.32,   1.500,  5.25,   0.22 },

        --[[
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
		]]
            },
        },

        engine = {
            typeng          = 1,            -- [Enum] 1=Turbojet
            Nmg             = 60.0,         -- [%] Idle RPM
            MinRUD          = 0,
            MaxRUD          = 1,
            MaksRUD         = 0.85,         -- [Scalar] Mil power detent
            ForsRUD         = 0.91,         -- [Scalar] AB detent

            hMaxEng         = 18.5,         -- [km] Max engine restart/ops altitude
            dcx_eng         = 0.0114,       -- [Coeff] Engine drag

            cemax           = 1.05,         -- [kg/kgf/h] TSFC Dry (Estimated for R-13)
            cefor           = 2.20,         -- [kg/kgf/h] TSFC Wet (Estimated for R-13)

            dpdh_m          = 3500,         -- [N/km] Power loss altitude factor (Dry)
            dpdh_f          = 6330,         -- [N/km] Power loss altitude factor (Wet)

            table_data = {
                -- R-13-300 Thrust Table (Relative to Bis R-25)
                --      M   Dry(N) Wet(N)
                [1] = {0.0, 40800, 64000},  -- Static (Matches Bis Mach 0)
                [2] = {0.2, 36000, 58400},
                [3] = {0.4, 32000, 56500},
                [4] = {0.6, 34000, 64700},
                [5] = {0.8, 36000, 71000},  -- R-13 optimization peak
                [6] = {0.9, 38000, 76000},
                [7] = {1.0, 39000, 81700},
                [8] = {1.2, 36000, 88600},
                [9] = {1.4, 28000, 90000},  -- R-13 tapering off earlier than R-25
                [10] ={1.6, 17600, 94000},
                [11] ={1.8, 10700, 98000},  -- Bis reaches ~106kN here; MF limited to ~98kN
                [12] ={2.0, 9400,  102000}, -- Bis reaches ~111kN here; MF limited to ~102kN
                [13] ={2.2, 5700,  100000},
            },
        },
    },

    -- ===================================================================
    -- DAMAGE MODEL
    -- ===================================================================
    Damage = verbose_to_dmg_properties({
        ["COCKPIT"]             = {critical_damage = 2,  args = {65}},
        ["NOSE_CENTER"]         = {critical_damage = 3,  args = {146}},
        ["NOSE_RIGHT_SIDE"]     = {critical_damage = 3,  args = {147}},
        ["NOSE_LEFT_SIDE"]      = {critical_damage = 3,  args = {150}},
        ["NOSE_BOTTOM"]         = {critical_damage = 3,  args = {148}},
        ["WING_L_OUT"]          = {critical_damage = 10, args = {223}, deps_cells = {"FLAP_L_IN", "WING_L_PART_OUT"}},
        ["WING_R_OUT"]          = {critical_damage = 10, args = {213}, deps_cells = {"FLAP_R_IN", "WING_R_PART_OUT"}},
        ["WING_L_PART_OUT"]     = {critical_damage = 3,  args = {221}},
        ["WING_R_PART_OUT"]     = {critical_damage = 3,  args = {231}},
        ["FLAP_L_IN"]           = {critical_damage = 4,  args = {227}},
        ["FLAP_R_IN"]           = {critical_damage = 4,  args = {217}},
        ["FUSELAGE_BOTTOM"]     = {critical_damage = 8,  args = {152}},
        ["FUSELAGE_CENTR_TOP"]  = {critical_damage = 8,  args = {151}},
        ["FIN_TOP"]             = {critical_damage = 4,  args = {244}},
        ["RUDDER"]              = {critical_damage = 2,  args = {247}},
        ["ENGINE_L"]            = {critical_damage = 4,  args = {167}},
        ["STABILIZER_L_IN"]     = {critical_damage = 3,  args = {235}},
        ["STABILIZER_R_IN"]     = {critical_damage = 3,  args = {233}},
    }),

    DamageParts = {},

    -- ===================================================================
    -- FAILURES & TASKS
    -- ===================================================================
    Failures = {
        {id = "asc",        label = _("ASC"),       enable = false, hh = 0, mm = 0, mmint = 1, prob = 100},
        {id = "autopilot",  label = _("AUTOPILOT"), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100},
        {id = "hydro",      label = _("HYDRO"),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100},
        {id = "l_engine",   label = _("ENGINE"),    enable = false, hh = 0, mm = 0, mmint = 1, prob = 100},
        {id = "radar",      label = _("RADAR"),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100},
    },

    Tasks = {
        aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
        aircraft_task(GroundAttack),
        aircraft_task(CAS),
		aircraft_task(AntishipStrike),
    },
    DefaultTask = aircraft_task(CAP),

    -- ===================================================================
    -- ARMAMENT & PYLONS
    -- ===================================================================

    Guns = {
        gun_mount("GSh_23_2", {count = 100}, {muzzle_pos_connector = "Cannon_left"}),
        gun_mount("GSh_23_2", {count = 100}, {muzzle_pos_connector = "Cannon_right"})
    },

    Pylons = {
        -- Outboard Port
        pylon(1, 0, 0, 0, 0, {use_full_connector_position = true, connector = "Pylon_5"}, {
            {CLSID = "FAB_50"},
			{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
			{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
			{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
			{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
			{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
			{CLSID = "FAB_100M"},
			{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
            {CLSID = "{PTB_490C_MIG21}"}, -- droptank
            {CLSID = "{R-13M}"},
            {CLSID = "{R-3R}"},
            {CLSID = "{R-3S}"},
            {CLSID = "{RS-2US}"},
			-- {CLSID = "CATM-9M"} -- CATM-9M
        }),
        -- Inboard Port
        pylon(2, 0, 0, 0, 0, {use_full_connector_position = true, connector = "Pylon_4"}, {
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
        }),
        -- Centerline
        pylon(3, 0, 0, 0, 0, {use_full_connector_position = true, connector = "Pylon_3"}, {
            {CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
			{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
			{CLSID = "{PTB_490_MIG21}"},
			{CLSID = "{PTB_490C_MIG21}"},
			{CLSID = "{PTB_800_MIG21}"},
        }),
        -- Inboard Stbd
        pylon(4, 0, 0, 0, 0, {use_full_connector_position = true, connector = "Pylon_2"}, {
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
        }),
        -- Outboard Stbd
        pylon(5, 0, 0, 0, 0, {use_full_connector_position = true, connector = "Pylon_1"}, {
            {CLSID = "FAB_50"},
			{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
			{CLSID = "B_8V20A_CM"}, -- B-8V20A - 20 S-8TsM
			{CLSID = "B_8V20A_OM"}, -- B-8V20A - 20 S-8OM
			{CLSID = "B-8M1 - 20 S-8OFP2"}, -- B-8M1 - 20 S-8OFP2
			{CLSID = "B-8V20A - 20 S-8OFP2"}, -- B-8V20A - 20 S-8OFP2
			{CLSID = "FAB_100M"},
			{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
			{CLSID = "{PTB_490C_MIG21}"}, -- droptank
			{CLSID = "{R-13M}"},
			{CLSID = "{R-3R}"},
			{CLSID = "{R-3S}"},
			{CLSID = "{RS-2US}"},
        }),
        -- SPRD (JATO)
        pylon(6, 0, -3.85, -0.37, 0.0, {use_full_connector_position = false"}, {
            {CLSID = "{SPRD}"},
        }),
    },

    -- ===================================================================
    -- LIGHTS
    -- ===================================================================
	--[[
		DCS World\Scripts\Aircrafts\_Common\Lights.lua
		
		WOLALIGHT_STROBES          = 1		-- White strobe anti-collision lights.
		WOLALIGHT_SPOTS            = 2		-- Take-off and landing high power headlights.
		WOLALIGHT_LANDING_LIGHTS   = 2		-- Take-off and landing high power headlights.
		WOLALIGHT_NAVLIGHTS        = 3		-- P-Z colored navigation (position) wingtip lights..
		WOLALIGHT_FORMATION_LIGHTS = 4		-- Formation / Logo lights.
		WOLALIGHT_TIPS_LIGHTS      = 5		-- Helicopter-specific: rotor anti-collision tips lights.
		WOLALIGHT_TAXI_LIGHTS      = 6		-- Taxi headlights.
		WOLALIGHT_BEACONS          = 7		-- Rotary anti-collision lights.
		WOLALIGHT_CABIN_BOARDING   = 8		-- Cabin incandescence illumination.
		WOLALIGHT_CABIN_NIGHT      = 9		-- Cabin night time (UV) illumination.
		WOLALIGHT_REFUEL_LIGHTS    = 10		-- Refuel apparatus illumination.
		WOLALIGHT_PROJECTORS       = 11		-- Search lights, direction-controlled.
		WOLALIGHT_AUX_LIGHTS       = 12		-- White anti-collision strobes & others
		WOLALIGHT_IR_FORMATION     = 13		-- IR formation strips. Currently not implemented due to engine NVG limitations.
		WOLALIGHT_CABIN_WORK	   = 14		-- Flight instrument illumination of pilots
	]]
    lights_data = {
        typename = "collection",
        lights = {
		--[[	No lights of any kind on this EDM
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
                                proto = lamp_prototypes.LFS_P_27_600,
                            },
                        },
                    },
                },
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
                                proto = lamp_prototypes.LFS_R_27_180,
                            },
                        },
                    },
                },
            },
		]]
        },
    },
}