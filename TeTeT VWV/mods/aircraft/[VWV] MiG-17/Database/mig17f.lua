-- ===================================================================
-- IMPLEMENTATION NOTES (MiG-17F "FRESCO C")
-- ===================================================================
--[[
CONFIGURATION: MIKOYAN-GUREVICH MiG-17F (NATO: Fresco-C)
                with 1x Klimov VK-1F centrifugal-flow turbojet

1. GEOMETRY & MASS:
   - Length: 11.26 m.
   - Wingspan: 9.628 m (Sweep 45 deg).
   - MTOW: 6,075 kg.
   - Empty: 3,930 kg.

2. ENGINE (Klimov VK-1F):
   - Dry Thrust: 2,600 kgf (~25.5 kN).
   - Afterburner Thrust: 3,380 kgf (~33.1 kN).
   - Notes: First Soviet fighter with afterburner.

3. PERFORMANCE:
   - Max Speed (SL): 1,100 km/h (Mach 0.9).
   - Max Speed (Alt): 1,145 km/h.
   - Climb: 65 m/s.

4. ARMAMENT:
   - 1x N-37D (37mm) - Starboard.
   - 2x NR-23 (23mm) - Port.
   - 2x Underwing pylons (Bombs/Fuel only).
--]]

local function nr23(tbl)
	tbl.category 				= CAT_GUN_MOUNT 
	tbl.name 	 				= "NR-23"
	tbl.display_name			= "NR-23"
	tbl.supply = {
		shells 					= {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  					= {{1,2,2,1,2,2}}, 
		count  					= 80,
	}
	if tbl.mixes then 
	   tbl.supply.mixes 		= tbl.mixes
	   tbl.mixes	    		= nil
	end
	tbl.gun = {
		max_burst_length 		= 80,
		rates 			 		= {850},
		recoil_coeff 	 		= 1,
		barrels_count 	 		= 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    		= tbl.rates
	   tbl.rates	    		= nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204
	tbl.muzzle_pos				= tbl.muzzle_pos or {0,0,0}
	tbl.azimuth_initial 		= tbl.azimuth_initial or 0   
	tbl.elevation_initial 		= tbl.elevation_initial or 0   
	if tbl.effects == nil then
		tbl.effects = {
			{ name = "FireEffect", 		arg = tbl.effect_arg_number or 436 },
			{ name = "HeatEffectExt", 	shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
			{ name = "SmokeEffect"}
		}
	end
	return declare_weapon(tbl)
end

local function n37(tbl)
	tbl.category 				= CAT_GUN_MOUNT 
	tbl.name 	 				= "N-37"
	tbl.display_name			= "N-37"
	tbl.supply 	 = {
		shells 					= {"N37_37x155_HEI_T", "N37_37x155_API_T"},
		mixes  					= {{1,1,1,2}},
		count  					= 40,
	}
	if tbl.mixes then 
	   tbl.supply.mixes 		= tbl.mixes
	   tbl.mixes	    		= nil
	end
	tbl.gun = {
		max_burst_length 		= 40,
		rates 			 		= {400},
		recoil_coeff 	 		= 1,
		barrels_count 	 		= 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    		= tbl.rates
	   tbl.rates	    		= nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,3,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 203
	tbl.muzzle_pos				= tbl.muzzle_pos or {0,0,0}
	tbl.azimuth_initial 		= tbl.azimuth_initial or 0   
	tbl.elevation_initial 		= tbl.elevation_initial or 0   
	if tbl.effects == nil then
		tbl.effects = {
			{ name = "FireEffect", 		arg = tbl.effect_arg_number or 436 },
			{ name = "HeatEffectExt", 	shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
			{ name = "SmokeEffect"}
		}
	end
	return declare_weapon(tbl)
end

local vwv_mig17f = {

	Name						= 'vwv_mig17f',
	DisplayName					= _('[VWV] MiG-17F "Fresco C"'),
	date_of_introduction		= 1952.10,
	Picture						= "mig17f.png",
	Rate						= "50",
	Shape						= "mig17f",
	country_of_origin 			= "SUN",	-- USSR

	shape_table_data = {
		{
			file				= 'mig17f',
			life				= 20,				-- [hitpoints] Lifebar
			vis					= 3,				-- [scalar] Visibility gain
			desrt				= 'mig17f-oblomok',
			fire				= {300, 2},			-- [sec, m] Fire duration, size
			username			= 'mig17f',
			index				= WSTYPE_PLACEHOLDER,
			classname			= "lLandPlane",
			positioning			= "BYNORMAL"
		},
		{
			name				= "mig17f-oblomok",
			file				= "mig17f-oblomok",
			fire				= {240, 2}
		}
	},

	mapclasskey					= "P0091000024",
	attribute					= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},
	Categories					= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

	-- ===================================================================
	-- MASS & DIMENSIONS
	-- ===================================================================
	
	-- Mass Parameters
	M_empty						= 3930,				-- [kg] Operational Empty Weight
	M_nominal					= 5340,				-- [kg] Normal Takeoff Weight (Clean + Internal Fuel)
	M_max						= 6075,				-- [kg] Max Takeoff Weight (MTOW)
	M_fuel_max					= 1170,				-- [kg] Internal Fuel Capacity (~1400 Liters)
	
	-- Dimensions
	length						= 11.264,			-- [m] Overall length
	height						= 3.80,				-- [m] Height
	wing_area					= 22.6,				-- [m^2] Wing area
	wing_span					= 9.628,			-- [m] Wing span
	wing_type					= 0,				-- [enum] 0=FIXED
	wing_tip_pos				= {-2.74, -0.664, 4.83},

	-- ===================================================================
	-- INERTIA & CG
	-- ===================================================================

	-- Center of Mass
	center_of_mass				= {0.07, -0.44, 0.0},	-- [m] Relative to model origin (Approximate)
	
	-- Moment of Inertia (Estimated for swept wing fighter)
	moment_of_inertia			= {12000, 48000, 42000, -1000},	-- [kg*m^2] {Roll, Yaw, Pitch, POI}

	-- ===================================================================
	-- PERFORMANCE PARAMETERS
	-- ===================================================================

	-- Speeds
	V_opt						= 200,				-- [m/s TAS] Cruise speed (for AI)
	V_take_off					= 78,				-- [m/s TAS] Take off speed (~150 kts)
	V_land						= 75,				-- [m/s TAS] Land speed (~145 kts)
	V_max_sea_level				= 305,				-- [m/s TAS] Max speed at sea level (~1100 km/h)
	V_max_h						= 318,				-- [m/s TAS] Max speed at altitude (~1145 km/h)
	CAS_min						= 55,				-- [m/s TAS] Stall speed
	Mach_max					= 1.15,				-- [Mach] Dive limit
	
	-- Climb & Ceiling
	H_max						= 16600,			-- [m] Service Ceiling
	Vy_max						= 65,				-- [m/s] Max climb rate (~12800 ft/min)
	
	-- Range & Fuel
	range						= 970,				-- [km] Max range on internal fuel
	average_fuel_consumption	= 0.175,			-- [kg/sec] Cruise consumption (~630 kg/h)

	-- Limits
	Ny_min						= -3,				-- [G] Min G
	Ny_max						= 8,				-- [G] Max G
	Ny_max_e					= 8,				-- [G] Structural Limit
	bank_angle_max				= 85,				-- [deg] Max bank angle (AI)
	AOA_take_off				= math.rad(9),		-- [rad] AoA rotation

	-- ===================================================================
	-- PROPULSION (Klimov VK-1F)
	-- ===================================================================
	
	-- AI Summary
	thrust_sum_max				= 2600,				-- [kgf] Dry Thrust (Military Power)
	thrust_sum_ab				= 3380,				-- [kgf] Afterburner Thrust
	
	engines_count				= 1,
	
	engines_nozzles = {
		[1] = {
			pos					= {-4.71, -0.455, 0},
			elevation			= -1.5,				-- [deg] Thrust line inclination
			diameter			= 0.60,				-- [m] Nozzle diameter (55 cm constricted, 63 cm in AB)
			exhaust_length_ab	= 5.0,				-- [m] AB flame length
			exhaust_length_ab_K	= 2.75,				-- [scalar] Expansion coeff (AB length checked with: https://www.youtube.com/watch?v=NZ1FqQ8kka4)
			smokiness_level		= 0.4,				-- [scalar] Early turbojet smokiness
		}
	}, 

	-- ===================================================================
	-- SYSTEMS & EQUIPMENT
	-- ===================================================================

	crew_size					= 1,
	has_afteburner				= true,
	has_speedbrake				= true,
	radar_can_see_ground		= true,				-- [bool] AI can/cannot detect ground/sea surface units
	RCS							= 2.5,				-- [m^2] Radar Cross Section
	detection_range_max			= 30,				-- [km] Max detection range (eyeballs)
	IR_emission_coeff			= 0.27,				-- [scalar] Dry
	IR_emission_coeff_ab		= 1.30,				-- [scalar] Wet
	stores_number				= 4,
	tanker_type					= 0,
	TACAN_AA					= false,
	brakeshute_name				= 0,				-- [id] No brake chute on early F models (optional on later)

	-- Gear Geometry
	nose_gear_pos				= {2.723, -2.047, -0.005},
	nose_gear_wheel_diameter	= 0.48,				-- [m]

	main_gear_pos				= {-0.238, -2.067, 2.015},
	main_gear_wheel_diameter	= 0.812,			-- [m]
	
	tand_gear_max				= math.tan(math.rad(60)), -- [tan] Nose steering angle

	-- Control Surfaces
	flaps_maneuver				= 10/60,			-- [scalar] Combat/Land flap settings

	-- ===================================================================
	-- FLIGHT MODEL DATA (SFM)
	-- ===================================================================
	SFM_Data = {
		aerodynamics = {			
			Cy0					= 0.0668,			-- [coeff] Zero AoA lift (Symm airfoil) (0.022?)
			Mzalfa				= 4.450,			-- [coeff] Pitch stability
			Mzalfadt			= 0.8,				-- [coeff] Pitch damping
			kjx					= 2.25,				-- [coeff] Roll inertia
			kjz					= 0.014,			-- [coeff] Pitch inertia
			Czbe				= -0.014,			-- [coeff] Yaw stability
			
			cx_gear				= 0.025,			-- [coeff] Gear drag
			cx_flap				= 0.065,			-- [coeff] Flap drag
			cy_flap				= 0.35,				-- [coeff] Flap lift
			cx_brk				= 0.032,			-- [coeff] Airbrake drag
			
			table_data = {
				-- M:       Mach Number
                -- Cx0:     Zero-lift drag coefficient (Parasitic + Wave Drag)
                -- Cya:     Normal force coefficient slope (Lift efficiency)
                -- B:       Induced drag coefficient (2nd order)
                -- B4:      Induced drag coefficient (4th order)
                -- Omxmax:  Max roll rate (approximate rad/s)
                -- Aldop:   Max Angle of Attack (Stall angle in degrees)
                -- Cymax:   Max Lift Coefficient

                -- M    Cx0     Cya    B      B4    Omxmax  Aldop  Cymax
                -- LOW SPEED
                { 0.0,  0.022,  0.076, 0.090, 0.02, 0.400,  18.0,  1.15 }, 
                { 0.1,  0.022,  0.076, 0.090, 0.02, 0.400,  18.0,  1.15 },
                { 0.2,  0.022,  0.076, 0.090, 0.02, 0.850,  18.0,  1.15 },

                -- CRUISE (Increased B from 0.075 to 0.090 to punish high weight)
                { 0.3,  0.025,  0.072, 0.100, 0.02, 1.400,  18.0,  1.15 },
                { 0.4,  0.025,  0.072, 0.100, 0.02, 1.600,  18.0,  1.15 },
                { 0.5,  0.028,  0.072, 0.110, 0.02, 1.600,  17.5,  1.12 },
                
                -- THE PROBLEM ZONE (Floating occurred here)
                { 0.6,  0.040,  0.070, 0.200, 0.10, 1.500,  17.0,  1.08 },
                { 0.7,  0.045,  0.065, 0.250, 0.12, 1.100,  16.5,  1.02 },

                -- TRANSONIC ONSET (Mach 0.80)
                { 0.8,  0.050,  0.055, 0.220, 0.15, 0.600,  15.0,  0.94 }, 
                
                -- MACH 0.86 "THE TRAP"
                { 0.86, 0.075,  0.048, 0.350, 0.40, 0.400,  14.0,  0.80 },

                -- MACH "WALL" (Mach 0.90 - 0.98)
                { 0.9,  0.095,  0.050, 0.450, 0.60, 0.250,  12.5,  0.80 },
                { 0.94, 0.120,  0.040, 0.500, 0.90, 0.150,  11.0,  0.72 }, 
                { 0.98, 0.150,  0.035, 0.600, 1.20, 0.100,  10.0,  0.65 },

                -- SUPERSONIC (Mach 1.05+)
                { 1.05, 0.180,  0.030, 0.700, 1.50, 0.050,  9.0,   0.55 },
                { 1.2,  0.200,  0.025, 0.800, 1.80, 0.020,  8.5,   0.45 },
			}, 
		}, 

		engine = {
			typeng				= 1,				-- [enum] 1=Turbojet
			Nominal_RPM			= 11560.0,
			Nmg					= 22.0,				-- [%] RPM at idle
			Startup_Duration	= 35.0,
			Shutdown_Duration	= 62.0,
			MinRUD				= 0,				-- [0-1] Min throttle
			MaxRUD				= 1,				-- [0-1] Max throttle
			MaksRUD				= 0.9,				-- [0-1] Mil power (Dry Max)
			ForsRUD				= 1.0,				-- [0-1] Afterburner state
			
			hMaxEng				= 17,				-- [km] Max engine alt
			dcx_eng				= 0.0134,			-- [coeff] Engine drag
			cemax				= 1.05,				-- [kg/kgf/h] SFC (Dry)
			cefor				= 2.05,				-- [kg/kgf/h] SFC (AB)
			dpdh_m				= 2100,				-- [N/km] Thrust loss/km (Dry)
			dpdh_f				= 6000,				-- [N/km] Thrust loss/km (AB)

			table_data = {
				-- Klimov VK-1F Thrust Table in Newtons
				-- Dry: ~25.5 kN (26000 N), Wet: ~33.1 kN (33800 N)
				--	M	Pmax (N)	Pfor (N)	
				{ 0.0,	26000,		33800	},
				{ 0.1,	26000,		33800	},
				{ 0.2,	25500,		33200	}, -- 15bis is 24430 (17F intake slightly better at speed)
				{ 0.3,	25000,		32800	},
				{ 0.4,	24800,		32500	},
				{ 0.5,	24800,		32800	},
				{ 0.6,	25000,		33500	},
				{ 0.7,	25500,		34200	},
				{ 0.8,	26000,		35000	},
				{ 0.86,	26500,		35800	},
				{ 0.9,	27000,		36500	}, -- 15bis is 23300. 17F maintains thrust better at transonic.
				{ 0.94,	27500,		37200	},
				{ 1,	28000,		38000	},
				{ 1.04,	28500,		38500	},
				{ 1.1,	29000,		39000	},
			},
		}, 
	},

	-- ===================================================================
	-- DAMAGE MODEL
	-- ===================================================================

	Damage  = verbose_to_dmg_properties({
		["NOSE_CENTER"]			= {critical_damage = 3,  args = {146}},
		["NOSE_RIGHT_SIDE"] 	= {critical_damage = 3,  args = {147}},
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3,  args = {150}},
		["NOSE_BOTTOM"]			= {critical_damage = 3,  args = {148}},
		["NOSE_TOP_SIDE"]		= {critical_damage = 3,  args = {147}},

		["WING_L_OUT"]			= {critical_damage = 10, args = {223}, deps_cells = {"FLAPS_L_IN","WING_L_PART_OUT"}},
		["WING_R_OUT"]			= {critical_damage = 10, args = {213}, deps_cells = {"FLAPS_R_IN","WING_R_PART_OUT"}},
		["WING_L_PART_OUT"]		= {critical_damage = 3,  args = {221}},
		["WING_R_PART_OUT"]		= {critical_damage = 3,  args = {231}},
		["FLAPS_L_IN"]			= {critical_damage = 4,  args = {227}},
		["FLAPS_R_IN"]			= {critical_damage = 4,  args = {217}},

		["FUSELAGE_CENTR_TOP"]	= {critical_damage = 8,  args = {151}},

		["FIN_TOP"]				= {critical_damage = 4,  args = {244}},
		["RUDDER"]				= {critical_damage = 2,  args = {247}},

		["ENGINE_L"]			= {critical_damage = 4,  args = {167}},

		["STABILIZER_L_IN"]		= {critical_damage = 3,  args = {235}},
		["STABILIZER_R_IN"]		= {critical_damage = 3,  args = {233}},
	}),

	DamageParts = {
		[1] = "mig17f-oblomok-wing-r",
		[2] = "mig17f-oblomok-wing-l"
	},

	-- ===================================================================
	-- ANIMATIONS & FAILURES
	-- ===================================================================
	
	flaps_transmission          = "Hydraulic",
	undercarriage_transmission  = "Hydraulic",
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
				Transition = {"Any", "Bailout"}, Sequence = {
					{C = {{"Arg", 38, "to", 1.0, "in", 0.2}}},
					{C = {{"Sleep", "for", 0.3}}},
					{C = {{"TearCanopy", 0}}},
					{C = {{"JettisonCanopy", 0}}},
				},
			},
		},
	}, 

	Failures = {
		{ id = 'asc',		label = _('ASC'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'autopilot',	label = _('AUTOPILOT'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hydro',		label = _('HYDRO'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'l_engine',	label = _('L-ENGINE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'r_engine',	label = _('R-ENGINE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'radar',		label = _('RADAR'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'mlws',		label = _('MLWS'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'rws',		label = _('RWS'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ecm',		label = _('ECM'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hud',		label = _('HUD'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'mfd',		label = _('MFD'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 }
	},

	HumanRadio = {
		frequency			= 127.5,
		editable			= true,
		minFrequency		= 100.000,
		maxFrequency		= 150.000,
		modulation			= MODULATION_AM
	},

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
	
	-- ===================================================================
	-- WEAPONS & SENSORS
	-- ===================================================================

	CanopyGeometry = {
		azimuth				= {-145.0, 145.0},
		elevation			= {-20.0, 90.0}
	},

	Sensors = {
		RWR 				= "Abstract RWR"
	},

	Guns = {
		n37({	-- STARBOARD 37mm
			muzzle_pos			= {4.337, -0.9807, 0.289},
			ejector_pos			= {-2.84, -1.148, -0.06},
			ejector_dir 		= {0, 2/3, 0},
		}),
		nr23({	-- PORT FRONT 23mm
			muzzle_pos			= {4.3763, -0.9285, -0.3986},
			mixes				= {{2,1,1,1}},							-- HEI, AP, AP, AP, [... recycle]
			ejector_pos			= {-2.35, -1.108, -0.24},
			ejector_dir 		= {0, 1/2, 0},
		}),	
		nr23({	-- PORT REAR 23mm
			muzzle_pos			= {4.1255, -1.034, -0.2784},
			mixes				= {{1,1,2,1}},							-- AP, AP, HEI, AP, [... recycle]
			ejector_pos			= {-2.5, -1.142, -0.10},
			ejector_dir 		= {0, 1/2, 0},
		}),
	},

	Pylons = {
		pylon(1, 0, -0.342, -0.85655, -2.4722,
			{use_full_connector_position = false, connector = "pylon_3"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, 	-- FAB-250
				{CLSID = "B_8V20A_CM"}, 								-- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, 								-- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, 						-- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, 						-- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, 	-- UPK-23-250
				{CLSID = "PTB400_MIG15", attach_point_position = {0.00, 0.25 ,0 }},
		}), 
		pylon(2, 0, -0.3145, -0.8505, 2.468,
			{use_full_connector_position = false, connector = "pylon_4"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, 	-- FAB-250
				{CLSID = "B_8V20A_CM"}, 								-- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, 								-- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, 						-- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, 						-- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, 	-- UPK-23-250
				{CLSID = "PTB400_MIG15", attach_point_position = {0.00, 0.25 ,0 }},
		}), 
	},

	-- ===================================================================
	-- MISC SYSTEMS (LIGHTS, CREW, ETC)
	-- ===================================================================

	crew_members = {
		[1] = {
			ejection_seat_name	= 9,
			drop_canopy_name	= 41,
			pos					= {2.27, -0.253, 0},
			drop_parachute_name	= "pilot_mig15_parachute",
			g_suit 			    = 0.4,				-- [scalar] Early G-Suit effectiveness
		}
	}, 

	is_tanker					= false,
	sounderName 				= "Aircraft/Planes/MiG15bis",

	fires_pos = {
		[1]  = {-0.664, -0.496, 0},
		[2]  = {0.173, -0.307, 1.511},
		[3]  = {0.173, -0.307, -1.511},
		[4]  = {-0.82, 0.265, 2.774},
		[5]  = {-0.82, 0.265, -2.774},
		[6]  = {-0.82, 0.255, 4.274},
		[7]  = {-0.82, 0.255, -4.274},
		[8]  = {-4.899, -0.212, 0.611},
		[9]  = {-4.899, -0.212, -0.611},
		[10] = {-0.896, 1.118, 0},
		[11] = {0.445, -0.436, 0}
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
	},
}

add_aircraft(vwv_mig17f)