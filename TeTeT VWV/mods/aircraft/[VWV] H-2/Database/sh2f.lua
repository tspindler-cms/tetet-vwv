local sh2f = dofile(current_mod_path.."/Database/uh2_base.lua")

----------------------------------------------------------------------------------------------------
-- KAMAN SH-2F SEASPRITE (LAMPS Mk I) DEFINITION FILE
-- Updated: December 2025
-- Ref: Real-world data for Twin-Engine T58-GE-8F configuration
----------------------------------------------------------------------------------------------------

sh2f.Name 						= "sh2f"
sh2f.DisplayName 				= _('[VWV] SH-2F Seasprite')
sh2f.DisplayNameShort 			= _('SH-2F')
sh2f.date_of_introduction		= 1973.05	-- Operational introduction of the F model
sh2f.Shape 						= "sh2f"
sh2f.livery_entry 				= "sh2f"
sh2f.shape_table_data[1].file		= "sh2f"
sh2f.shape_table_data[1].username 	= "sh2f"
-- sh2f.rotor_animation.rotor_models.modelRotorHub_EDM = "sh2f_rotor_hub"
-- sh2f.rotor_animation.rotor_locations = {pos = { 0.5824, 1.7843, 0.0, pitch = math.rad(-4.0), roll = math.rad(-2.0)} }
sh2f.rotor_animation.tail_rotor.blades_count = 4
sh2f.mapclasskey = "P0091000021"
sh2f.attribute = {wsType_Air, wsType_Helicopter, wsType_Battleplane, WSTYPE_PLACEHOLDER, "Attack helicopters", "Transport helicopters", }


------------------------------------------------------------------------------------------------
-- DIMENSIONS & GEOMETRY [m]
------------------------------------------------------------------------------------------------
sh2f.length 		= 11.68		-- Slightly longer due to avionics/sensors [m][=
sh2f.height 		= 4.40		-- Height increased slightly due to new engine doghouse/fairing [m]

------------------------------------------------------------------------------------------------
-- WEIGHT PARAMETERS [kg]
------------------------------------------------------------------------------------------------
-- SH-2F LAMPS I is significantly heavier than the utility UH-2A
sh2f.M_empty        = 3193		-- Empty mass [kg] (~7,040 lbs) - Radar, Sonar, 2nd Engine
sh2f.M_nominal      = 4800		-- Normal mission mass [kg] (ASW Patrol)
sh2f.M_max          = 6033		-- Max Takeoff Weight (MTOW) [kg]
sh2f.M_fuel_max     = 816		-- Internal fuel [kg] (Main internal capacity similar, aux tanks often used)

------------------------------------------------------------------------------------------------
-- PERFORMANCE
------------------------------------------------------------------------------------------------
-- Speeds [km/h] - SH-2F is draggy but has more power
sh2f.V_max           = 265		-- Max speed (Vne): 143 kts [km/h]
sh2f.V_max_cruise    = 230		-- Cruise speed: ~124 kts [km/h]

-- Vertical Performance (Meters)
sh2f.H_stat_max_L    = 3200		-- Hover OGE (Lightweight) [m] - improved by 2nd engine
sh2f.H_stat_max      = 1600		-- Hover OGE (Max weight) [m]
sh2f.H_din_two_eng   = 6850		-- Service Ceiling (~22,500 ft) [m]
sh2f.H_din_one_eng   = 2800		-- Single Engine Service Ceiling

sh2f.flight_time_typical = 140	-- Higher fuel burn with 2 engines [min]
sh2f.flight_time_maximum = 190		  
sh2f.range           = 670		-- Operational Radius decreased vs UH-2A ferry range [km]

sh2f.Vy_max          = 12.4		-- Max climb speed: ~2,440 ft/min


------------------------------------------------------------------------------------------------
-- AERODYNAMICS & DRAG
------------------------------------------------------------------------------------------------
--[[
	Updated for SH-2F Seasprite (LAMPS Mk I)
	
	Changes from UH-2A:
	1. LN-66 HP Radar Radome (Chin mounted) - Large drag penalty
	2. MAD Bird & Towing gear (Right side)
	3. Sonobuoy Launcher (Left side)
	4. ESM antennas
	
	New Area Estimation:
	Base (5.5) + Radome (0.5) + External Gear (0.4) = ~6.4 m^2
]]
sh2f.fuselage_area 	= 6.4	-- Frontal Reference Area (S_ref) [m^2]
--[[
	Drag Coefficient Update:
	The chin radome is aerodynamically blunt.
	f (Flat plate) increases to ~2.9 m^2
	
	C_x = 2.9 / 6.4 = ~0.45
]]
sh2f.fuselage_Cxa0 	= 0.45	-- 0 degree AoA drag coefficient (Draggier than UH-2A)

------------------------------------------------------------------------------------------------
-- ENGINE & FUEL SYSTEMS
------------------------------------------------------------------------------------------------
-- Engine: 2x General Electric T58-GE-8F Turboshafts
sh2f.engines_count			= 2

sh2f.engines_nozzles = {
	[1] = { -- STARBOARD ENGINE
		pos = {-0.1963, 0.95, 1.3},	
		elevation 			= -5.0,		
		azimuth 			= -30.0,	-- Angled out 45 degrees in actuality
		diameter 			= 0.37,		
		exhaust_length_ab 	= 1.1,
		exhaust_length_ab_K = 0.35,
		smokiness_level 	= 0.08,
		engine_number 		= 1,
	}, 
	[2] = { -- PORT ENGINE
		pos = {-0.1963, 0.95, -1.3},	
		elevation 			= -5.0,		
		azimuth 			= 30.0,
		diameter 			= 0.37,
		exhaust_length_ab 	= 1.1,
		exhaust_length_ab_K = 0.35,
		smokiness_level 	= 0.08,
		engine_number 		= 2,
	},
}

-- General Electric T58-GE-8F Ratings (Per Engine)
-- Max Takeoff (5 min): 			1,007 kW (1,350 shp)
-- Max Continuous: 					932 kW (1,250 shp)
sh2f.engine_data.power_take_off	=	1007	-- Max takeoff power - 1350 shp [kW]
sh2f.engine_data.power_max		=	932		-- Max continuous power - 1250 shp [kW]
sh2f.engine_data.power_WEP		=	1007	-- Emergency power [kW]

-- T58-GE-8F Power vs Altitude Coefficients
sh2f.engine_data.power_TH_k	= {
	[1] = { 3.40,  -92.00,  932.0},	-- Max Continuous
	[2] = { 4.30, -115.00,  1007.0},-- Takeoff 
	[3] = {-0.81,  -60.30,  850.0}, -- Cruise
	[4] = {-1.30,  -28.17,  650.0}, -- Idle/Descent
}

sh2f.engine_data.SFC_k	= {0.0, -1.150e-005, 0.3900} -- Slightly higher SFC for older -8F at power

sh2f.SFM_Data.engine.name 	= "T58-GE-8F"

--[[ Not needed?
sh2f.SFM_Data.engine.hMaxEng = 5.5		-- Increased safe altitude for twin engine ops [km]

sh2f.SFM_Data.engine.cemax   = 0.110 	-- Takeoff flow [kg/s] (Per engine logic handled by SFM usually, but tuning here for twin)
sh2f.SFM_Data.engine.cefor   = 0.110


--   Updated for Twin Engine thrust profile (~2500shp combined / ~20,000+ lbs lift)
sh2f.SFM_Data.engine.table_data = {
--   M    Thrust (Newtons) 
--   MTOW SH-2F: ~5,800 kg (~57,000 N).
--   Static Thrust (2 engines) ~1.3x MTOW = ~74,000 N
	{0.0,   74000.0},  
	{0.05,  71000.0},  
	{0.1,   63000.0},  
	{0.15,  51000.0},  
	{0.2,   32000.0},  
	{0.25,  24000.0},  
	{0.3,   14000.0},  
	{0.4,    5000.0},  
	{0.5,    2000.0},  
	{1.0,       0.0},
}
]]
------------------------------------------------------------------------------------------------
-- ROTOR & PHYSICS
------------------------------------------------------------------------------------------------
sh2f.rotor_height 	= 1.08045	-- [m] Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!)
sh2f.MOI = {5400, 29500, 3600}	-- [kg*m^2] Increased inertia due to LAMPS gear/radar {Roll, Yaw, Pitch}

------------------------------------------------------------------------------------------------
-- SENSORS & ARMAMENT
------------------------------------------------------------------------------------------------
sh2f.RCS                = 15 	-- Higher RCS due to complex shape/stores
sh2f.radar_can_see_ground = true	-- Is AI radar able to see enemy surface entities (tanks, ships)?
sh2f.detection_range_max = 60   -- LN-66 Range (approx 30-40nm effective)
sh2f.IR_emission_coeff  = 0.06 	-- Two engines = more IR signature; Su-27 ~= 5000 Watts/steradian; SH-2F = ~300 W/sr

sh2f.Pylons = {
	pylon(1, 0, 0.00, 0.00, 0.00,
		  {use_full_connector_position = true, connector = "Pylon_1",
		  FiX = 0, FiY = 0, FiZ = 0},
		{
			{   CLSID = "{SH2F_MAD}",connector = "Pylon_1", attach_point_position = {0.0, 0.0, 0}}
		}
	),
	pylon(2, 0, 0.00, 0.00, 0.00,
		 {use_full_connector_position = true, connector = "Pylon_2",
		 FiX = 0, FiY = 0, FiZ = 0},
		{
			{ CLSID = "{SH2F_FUEL_TANK_120R}" , connector = "Pylon_2", attach_point_position = {0.0, 0.0, 0}}
		}
	),
	pylon(3, 0, 0.00, 0.00, 0.00,
		 {use_full_connector_position = true, connector = "Pylon_3",
		 FiX = 0, FiY = 0, FiZ = 0},
		{
			{ CLSID = "{SH2F_FUEL_TANK_120L}" , connector = "Pylon_3", attach_point_position = {0.0, 0.0, 0}}
		}
	),
	pylon(4, 0, 0.00, 0.00, 0.00,
		 {use_full_connector_position = true, connector = "Pylon_4",
		 FiX = 0, FiY = 0, FiZ = 0},
		{
			{ CLSID = "DIS_mk46torp" , connector = "Pylon_4", attach_point_position = {0.0, 0.0, 0}}
		}
	),
}

sh2f.Tasks = {
	aircraft_task(AntishipStrike),
	aircraft_task(Transport),
	aircraft_task(Reconnaissance),
}
sh2f.DefaultTask = aircraft_task(AntishipStrike)


return sh2f