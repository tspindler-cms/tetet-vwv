--[[
==============================================================================
MiG-17F "Fresco C" Performance Adjustment Patch
Dec 29, 2025
==============================================================================

CHANGE LOG:
1. Code Organization:
   - Parameters grouped by function (Mass, Speed, Dimensions, etc.)
   - Vertical alignment applied to assignments and comments using tabs.

2. Mass & Balance:
   - M_empty: 3930 kg (Pilot + Oil + Unusable fuel).
   - M_nominal: 5350 kg (Standard combat takeoff).
   - M_max: 6075 kg (MTOW).
   - M_fuel_max: 1170 kg.

3. Engine & Performance:
   - Converted SFM thrust tables to Newtons (N).
   - Adjusted fuel consumption to 0.175 kg/sec.
   - Updated AI thrust summaries (kgf).
   - Updated aero tables.

4. Weapons:
   - Gun positions adjusted to model.
   - Gun types corrected to match real-world.
   - Countermeasures removed for realism.
   - Removed extra hard points - MiG-17F only had two.
   
==============================================================================
]]

local function nr23(tbl)
	-- Shamelessly stolen from ED's MiG-15bis declaration file.
	
	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "NR-23"
	tbl.display_name	= "NR-23"
	tbl.supply 	 = 
	{
		shells = {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 80,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 80,
		rates 			 = {850},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204		-- shell_50cal
	tbl.muzzle_pos				= tbl.muzzle_pos 		 or {0,0,0}
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

local function n37(tbl)
	-- Shamelessly stolen from ED's MiG-15bis declaration file.
	
	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "N-37"
	tbl.display_name	= "N-37"
	tbl.supply 	 = 
	{
		shells = {"N37_37x155_HEI_T", "N37_37x155_API_T"},
		mixes  = {{1,1,1,2}}, --  Calculated by weight (55 kg)
		count  = 40,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 40,
		rates 			 = {400},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,3,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 203		-- shell_30mm
	tbl.muzzle_pos				= tbl.muzzle_pos 		 or {0,0,0}
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

local vwv_mig17f = {

	Name				= 'vwv_mig17f',
	DisplayName			= _('[VWV] MiG-17F "Fresco C"'),
	date_of_introduction= 1952.10,
	Picture				= "mig17f.png",
	Rate				= "50",
	Shape				= "mig17f",
	country_of_origin 	= "SUN",	-- USSR
	--------------------------------------------------------------------------------
	-- SHAPE & DESTRUCTION
	--------------------------------------------------------------------------------
	shape_table_data = {
		{
			file		= 'mig17f',				-- AG
			life		= 20,					-- lifebar
			vis			= 3,					-- visibility gain.
			desrt		= 'mig17f-oblomok',		-- Name of destroyed object file name
			fire		= {300, 2},				-- Fire on the ground after destoyed: 300sec 2m
			username	= 'mig17f',				-- AG
			index		= WSTYPE_PLACEHOLDER,
			classname	= "lLandPlane",
			positioning	= "BYNORMAL"
		},
		{
			name		= "mig17f-oblomok",
			file		= "mig17f-oblomok",
			fire		= {240, 2}
		}
	},

	mapclasskey			= "P0091000024",
	attribute			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},
	Categories			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

	--------------------------------------------------------------------------------
	-- MASS & FUEL
	--------------------------------------------------------------------------------
	M_empty				= 3930,					-- [kg] Empty weight (F15 ref approx)
	M_nominal			= 5350,					-- [kg] Nominal Takeoff Weight (Empty + Internal Fuel + Pilot + Ammo)
	M_max				= 6075,					-- [kg] Maximum Takeoff Weight
	M_fuel_max			= 1170,					-- [kg] Internal Fuel Only
	average_fuel_consumption	= 0.175,		-- [kg/sec] Average Cruise Consumption (~630 kg/h)

	--------------------------------------------------------------------------------
	-- SPEEDS & LIMITS (AI)
	--------------------------------------------------------------------------------
	CAS_min				= 70,					-- [m/s TAS] Minimum CAS speed (for AI)
	V_opt				= 180,					-- [m/s TAS] Cruise speed (for AI)
	V_take_off			= 81,					-- [m/s TAS] Take off speed (for AI)
	V_land				= 81,					-- [m/s TAS] Land speed (for AI)
	V_max_sea_level		= 305,					-- [m/s TAS] Max speed at sea level (~1100 km/h)
	V_max_h				= 318,					-- [m/s TAS] Max speed at altitude (~1145 km/h)
	Vy_max				= 65,					-- [m/s] Max climb speed (approx 12800 ft/min)
	Mach_max			= 1.15,					-- [Mach] Max speed limit (dive)

	--------------------------------------------------------------------------------
	-- PERFORMANCE & ENVELOPE
	--------------------------------------------------------------------------------
	H_max				= 16600,				-- [m] Maximum Operational Ceiling
	range				= 2000,					-- [km] Max range with drop tanks
	Ny_min				= -3,					-- [G] Min G (for AI)
	Ny_max				= 8,					-- [G] Max G (for AI)
	Ny_max_e			= 8,					-- [G] Max G sustainable
	AOA_take_off		= math.rad(9),			-- [rad] AoA in take off (for AI)
	bank_angle_max		= 85,					-- [deg] Max bank angle (for AI)
	flaps_maneuver		= 10/60,				-- Takeoff flaps = 20 deg; landing = 60 deg, but fighter should not use flaps in dogfight, so 10/60

	--------------------------------------------------------------------------------
	-- DIMENSIONS & GEOMETRY
	--------------------------------------------------------------------------------
	length				= 11.264,				-- [m] Overall length
	height				= 3.80,					-- [m] Height
	wing_area			= 22.6,					-- [m^2] Wing area
	wing_span			= 9.628,				-- [m] Wing span
	wing_type			= 0,					-- 0=FIXED, 1=VAR_GEO, 2=FOLDED, 3=VAR_FOLD
	wing_tip_pos		= {-2.74, -0.664, 4.83},
	tand_gear_max		= math.tan(math.rad(60)),	-- Maximum nose wheel steering angle

	--------------------------------------------------------------------------------
	-- GEAR CONFIGURATION
	--------------------------------------------------------------------------------
	nose_gear_pos						= {2.723, -2.047, -0.005},	-- [m] {x, y, z}
	-- nose_gear_amortizer_direct_stroke	= 0,				-- down from nose_gear_pos
	-- nose_gear_amortizer_reversal_stroke	= 0,				-- up
	-- nose_gear_amortizer_normal_weight_stroke= 0,				-- up
	nose_gear_wheel_diameter			= 0.48,					-- [m]

	main_gear_pos						= {-0.238, -2.067, 2.015},		-- [m] {x, y, z}
	-- main_gear_amortizer_direct_stroke	= 0,				-- down from main_gear_pos
	-- main_gear_amortizer_reversal_stroke	= 0,				-- up
	-- main_gear_amortizer_normal_weight_stroke= 0,				-- down from main_gear_pos
	main_gear_wheel_diameter			= 0.812,				-- [m]

	--------------------------------------------------------------------------------
	-- SYSTEMS & SENSORS
	--------------------------------------------------------------------------------
	crew_size				= 1,
	has_afteburner			= true,
	has_speedbrake			= true,
	radar_can_see_ground	= false,				-- Radar cannot detect ground/surface warfare units
	RCS						= 2,					-- [m^2] Radar Cross Section
	detection_range_max		= 30,					-- [km] Max detection range (eyeballs)
	IR_emission_coeff		= 0.27,					-- Normal engine
	IR_emission_coeff_ab	= 1.30,					-- With afterburner
	stores_number			= 4,
	tanker_type				= 0,
	TACAN_AA				= false,

	--------------------------------------------------------------------------------
	-- ENGINE & THRUST (AI SUMMARY)
	--------------------------------------------------------------------------------
	thrust_sum_max			= 2650,					-- [kgf] Dry Thrust (approx 26.0 kN)
	thrust_sum_ab			= 3450,					-- [kgf] Afterburner Thrust (approx 33.8 kN)
	engines_count			= 1,
	
	engines_nozzles = {
		[1] = {
			pos					= {-4.71, -0.458, -0.003289},
			elevation			= -1.5,		-- Engine thrust line inclined by 1.5 degrees rel. to longitudinal axis
			diameter			= 0.60,		-- 55 cm constricted, 63 cm in AB
			exhaust_length_ab	= 5.0,
			exhaust_length_ab_K	= 2.75,		-- AB length checked with: https://www.youtube.com/watch?v=NZ1FqQ8kka4
			smokiness_level		= 0.1,
		}
	}, 


	--------------------------------------------------------------------------------
	-- AERODYNAMICS (SFM)
	--------------------------------------------------------------------------------
	SFM_Data = {
		aerodynamics = {			
			-- [Baseline: MiG-15bis | Adjusted for MiG-17F]
			Cy0			= 0.0668,			-- [coeff] zero AoA lift coefficient Same as MiG-15
			Mzalfa		= 4.450,			-- [coeff] Increased stability (Longer fuselage: 11.2m vs 10.1m)
			Mzalfadt	= 0.8,				-- [coeff] Same pitch damping
			kjx			= 2.25,				-- [N/A] Roll inertia (Slightly heavier wings)
			kjz			= 0.014,			-- [N/A] Pitch inertia (Increased for fuselage length)
			Czbe		= -0.014,			-- [coeff] Yaw stability
			
			cx_gear		= 0.025,			-- [coeff] Slightly higher drag (larger gear doors/struts)
			cx_flap		= 0.065,			-- [coeff] Fowler flaps similar to MiG-15
			cy_flap		= 0.35,				-- [coeff] Lift similar
			cx_brk		= 0.032,			-- [coeff] Adjusted from MiG-15's 0.026 for slightly larger area
			
			table_data = {
				-- Aerodynamic Drag Polar Table
				-- M: Mach, Cx0: Zero-lift drag, Cya: Normal force coeff, B/B4: Polar shape
				-- Omxmax: Roll rate, Aldop: Max AoA, Cymax: Max Lift
				
				-- [MiG-15 vs 17F Comparison Note]
				-- Low speed Cx0 is similar.
				-- High speed Cx0 (Drag Rise) is delayed on 17F due to 45 deg sweep.
				-- Omxmax (Roll) is maintained better at speed due to hydro-boosters.
				
				-- M     Cx0     Cya      B      B4     Omxmax  Aldop   Cymax
				{ 0.0,	0.018,	0.067,	0.074,	0.01,	0.272,	17.3,	1.1   },		
				{ 0.1,	0.018,	0.067,	0.074,	0.01,	0.272,	17.3,	1.1   },
				{ 0.2,	0.0172,	0.067,	0.074,	0.01,	0.641,	17.3,	1.1   },
				{ 0.3,	0.0165,	0.067,	0.074,	0.01,	0.989,	17.3,	1.1   },
				{ 0.4,	0.016,	0.0682,	0.074,	0.01,	1.289,	17.3,	1.1   },
				{ 0.5,	0.016,	0.0708,	0.074,	0.01,	1.289,	16.9,	1.075 },
				{ 0.6,	0.016,	0.0746,	0.074,	0.01,	1.008,	16.2,	1.031 },
				{ 0.7,	0.016,	0.0798,	0.074,	0.01,	0.450,	15.3,	0.974 }, -- 17F roll better than 15
				{ 0.8,	0.0168,	0.0850,	0.08,	0.01,	0.300,	13.9,	0.882 }, -- 15bis drops to 0.103 here
				{ 0.86,	0.018,	0.0822,	0.082,	0.11,	0.200,	12.8,	0.815 }, -- 15bis drops to 0.028 here!
				{ 0.9,	0.022,	0.076,	0.088,	0.36,	0.100,	11.6,	0.737 }, -- Drag (Cx0) start rise delayed vs 15bis (0.0232)
				{ 0.94,	0.030,	0.0737,	0.125,	0.43,	0.050,	9.8,	0.625 }, -- 15bis is 0.0402 (Wall hit). 17F is cleaner.
				{ 1,	0.048,	0.0735,	0.15,	0.56,	0.020,	8,		0.511 }, -- 15bis is 0.0598
				{ 1.04,	0.060,	0.0744,	0.23,	0.84,	0.010,	7.4,	0.469 },
				{ 1.2,	0.0642,	0.0760,	0.26,	1,		0.005,	6.7,	0.425 },
			}, 
		}, 

		engine = {
			Nominal_RPM		= 11560.0,
			Nmg				= 22.0,				-- [%] RPM at idle
			Startup_Duration	= 35.0,
			Shutdown_Duration	= 62.0,
			MinRUD			= 0,				-- [0-1] Min throttle
			MaxRUD			= 1,				-- [0-1] Max throttle
			MaksRUD			= 0.9,				-- [0-1] Mil power (Dry Max)
			ForsRUD			= 1.0,				-- [0-1] Afterburner state
			typeng			= 1,				-- E_TURBOJET_AB 
			-- type			= "TurboJet",
			hMaxEng			= 17,				-- [km] Max engine alt
			dcx_eng			= 0.0134,			-- [coeff] Engine drag
			cemax			= 1.05,				-- [kg/kgf/h] SFC (Dry)
			cefor			= 2.05,				-- [kg/kgf/h] SFC (AB)
			dpdh_m			= 1340,				-- [N/km] Thrust loss/km (Dry)
			dpdh_f			= 1750,				-- [N/km] Thrust loss/km (AB)

			table_data = {
				-- Klimov VK-1F Thrust Table in Newtons
				-- Dry: ~26.0 kN (26000 N), Wet: ~33.8 kN (33800 N)
				-- [MiG-15bis Dry Thrust Baseline: 26000 N]
				-- [MiG-17F Adds ~30% for Afterburner]
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

	--------------------------------------------------------------------------------
	-- ANIMATIONS
	--------------------------------------------------------------------------------
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

	--------------------------------------------------------------------------------
	-- DAMAGE MODEL
	--------------------------------------------------------------------------------
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

	--------------------------------------------------------------------------------
	-- WEAPONS & COUNTERMEASURES
	--------------------------------------------------------------------------------
--[[
	REALISM NOTE: The MiG-17F did not have countermeasures.
	
	chaff_flare_dispenser = {
		[1] = {dir = {0, 1, 0}, pos = {-5.776, 1.4, -0.422}},
		[2] = {dir = {0, 1, 0}, pos = {-5.776, 1.4, 0.422}}
	},

	passivCounterm = {
		CMDS_Edit		= true,
		SingleChargeTotal	= 96,
		chaff			= {default = 48, increment = 24, chargeSz = 1},
		flare			= {default = 48, increment = 24, chargeSz = 1}
	},
]]

	CanopyGeometry = {
		azimuth		= {-145.0, 145.0},
		elevation	= {-20.0, 90.0}
	},

	Sensors = {
		-- RADAR = "N-008",
		RWR = "Abstract RWR"
	},

	Guns = {
		-- gun_mount("GSh_23_2", {count = 250}, {muzzle_pos = {4.3763 -0.9285, -0.3986}}),
		-- gun_mount("GSh_23_2", {count = 250}, {muzzle_pos = {4.1255, -1.034, -0.2784}}),
		-- gun_mount("M_39",     {count = 250}, {muzzle_pos = {4.337, -0.9807, 0.289}})
		n37({	-- HEI, HEI, HEI, AP, [... recycle]
			muzzle_pos			= {4.337, -0.9807, 0.289},
			ejector_pos			= {-2.84, -1.148, -0.06},
			-- ejector_dir 		= {0.0,-1.0,0.0},
			ejector_dir 		= {0, 2/3, 0},
			}),
		nr23({	-- HEI, AP, AP, AP, [... recycle]
			muzzle_pos			= {4.3763, -0.9285, -0.3986},
			mixes				= {{2,1,1,1}},				-- HEI, AP, AP, AP, [... recycle]
			ejector_pos			= {-2.35, -1.108, -0.24},
			-- ejector_dir 		= {0.0,-1.0,0.0},
			ejector_dir 		= {0, 1/2, 0},
			}),	-- FRONT
		nr23({	-- HEI, AP, AP, AP, [... recycle]
			muzzle_pos			= {4.1255, -1.034, -0.2784},
			mixes				= {{1,1,2,1}},				-- AP, AP, HEI, AP, [... recycle]
			ejector_pos			= {-2.5, -1.142, -0.10},
			-- ejector_dir 		= {0.0,-1.0,0.0},
			ejector_dir 		= {0, 1/2, 0},
			}),	-- REAR
	},

	Pylons = {
		-- MiG-17F only had two pylons. Fuel load, or weapons, never mixed.
		pylon(1, 0, -0.342, -0.85655, -2.4722,
			{use_full_connector_position = false, connector = "pylon_3"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, 							-- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, 							-- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, 					-- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, 					-- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
				{CLSID = "PTB400_MIG15", attach_point_position = {0.00, 0.25 ,0 }},
		}), 
		pylon(2, 0, -0.3145, -0.8505, 2.468,
			{use_full_connector_position = false, connector = "pylon_4"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, -- FAB-250
				{CLSID = "B_8V20A_CM"}, 							-- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, 							-- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, 					-- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, 					-- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, -- UPK-23-250
				{CLSID = "PTB400_MIG15", attach_point_position = {0.00, 0.25 ,0 }},
		}), 
		
	--[[ This is the original and incorrect.
	
		pylon(1, 0, 0.00, 0.00, 0.000,
			{use_full_connector_position = false, connector = "pylon_3"}, {
				{ CLSID = "PTB400_MIG15" ,attach_point_position = {0.00, 0.25 ,0 }},
		}), 
		pylon(2, 0, 1.2, 2.50, -1.60,
			{use_full_connector_position = false, connector = "pylon_1"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, 	-- FAB-250
				{CLSID = "B_8V20A_CM"}, 				-- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, 				-- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, 			-- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, 			-- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, 	-- UPK-23-250
		}), 
		pylon(3, 0, 1.2, 2.40, -1.75,
			{use_full_connector_position = false, connector = "pylon_2"}, {
				{CLSID = "FAB_50"},
				{CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}"}, 	-- FAB-250
				{CLSID = "B_8V20A_CM"}, 				-- B-8V20A - 20 S-8TsM
				{CLSID = "B_8V20A_OM"}, 				-- B-8V20A - 20 S-8OM
				{CLSID = "B-8M1 - 20 S-8OFP2"}, 			-- B-8M1 - 20 S-8OFP2
				{CLSID = "B-8V20A - 20 S-8OFP2"}, 			-- B-8V20A - 20 S-8OFP2
				{CLSID = "FAB_100M"},
				{CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}"}, 	-- UPK-23-250
		}), 
		pylon(4, 0, 0.00, 0.00, 0.00,
			{use_full_connector_position = false, connector = "pylon_4"}, {
				{ CLSID = "PTB400_MIG15" ,attach_point_position = {0.00, 0.25 ,0 }},
		})
	]]
	},

	--------------------------------------------------------------------------------
	-- AVIONICS & FAILURES
	--------------------------------------------------------------------------------
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
		frequency	= 127.5,
		editable	= true,
		minFrequency	= 100.000,
		maxFrequency	= 150.000,
		modulation	= MODULATION_AM
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
	
	--------------------------------------------------------------------------------
	-- MISC SYSTEMS (LIGHTS, CREW, ETC)
	--------------------------------------------------------------------------------

	crew_members = {
		[1] = {
			ejection_seat_name	= 9,
			drop_canopy_name	= 41,
			pos					= {2.27, -0.253, 0},
			drop_parachute_name	= "pilot_mig15_parachute",
			g_suit 			    = 0.8,		--  G suit effectiveness: 0.0 to 1.0 (1.0 = modern g-suits)
		}
	}, 

	brakeshute_name		= 0,
	is_tanker			= false,
	
	sounderName = "Aircraft/Planes/MiG15bis",

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