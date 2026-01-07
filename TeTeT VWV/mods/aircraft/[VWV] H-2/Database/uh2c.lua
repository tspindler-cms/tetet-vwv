local uh2c = dofile(current_mod_path.."/Database/uh2_base.lua")

uh2c.Name 						= "uh2c"
uh2c.DisplayName 				= _("[VWV] UH-2C Seasprite")
uh2c.DisplayNameShort 			= _("UH-2C")
uh2c.date_of_introduction		= 1967.08
uh2c.Shape 						= "uh2c"
uh2c.livery_entry 				= "uh2c"
uh2c.shape_table_data[1].file		= "uh2c"
uh2c.shape_table_data[1].username 	= "uh2c"
-- uh2c.rotor_animation.rotor_models.modelRotorHub_EDM = "sh2f_rotor_hub"
-- uh2c.rotor_animation.rotor_locations = {pos = { 0.5824, 1.8477, 0.0}, pitch = -0.01}
-- uh2c.rotor_animation.tail_rotor.blades_count = 3
uh2c.attribute					= {wsType_Air, wsType_Helicopter, wsType_Battleplane, WSTYPE_PLACEHOLDER ,"Transport helicopters",}


uh2c.height 			= 4.40		-- Height increased slightly due to new engine doghouse/fairing

-- UH-2C Weights: Heavily modified from A model.
-- Empty: ~7,040 lbs (3193 kg)
-- MTOW: ~13,300 lbs (6033 kg)
uh2c.M_empty         	= 3193		-- Empty mass [kg] (~6,100 lbs)
uh2c.M_nominal       	= 4800		-- Normal mission mass [kg]
uh2c.M_max           	= 6033		-- Max Takeoff Weight (MTOW) [kg]

-- Speeds [km/h]
-- UH-2C gained speed despite drag due to 2x power.
uh2c.V_max           	= 265		-- Max speed (Vne): 143 kts [km/h]
uh2c.V_max_cruise    	= 241		-- Cruise speed: 130 kts [km/h]
	
-- Vertical Performance (Meters)
-- Twin engine greatly improved OGE and ceiling.
uh2c.H_stat_max_L    	= 3200		-- Hover OGE (Lightweight) [m]
uh2c.H_stat_max      	= 2200		-- Hover OGE (Max weight) [m]
uh2c.H_din_two_eng   	= 6858		-- Service Ceiling (22,500 ft) [m]
uh2c.H_din_one_eng   	= 3500		-- Single engine ceiling [m]

uh2c.flight_time_typical = 140		-- Flight time reduced slightly due to higher fuel burn of 2 engines
uh2c.flight_time_maximum = 190  
uh2c.range           	= 680		-- Ferry range [km] (Dropped from ~1000km on UH-2A due to consumption)

uh2c.Vy_max          	= 12.4		-- Max climb speed: ~2,440 ft/mi

--[[
	UH-2C Drag Updates:
	The UH-2C conversion involved bolting two engines to the roof
	in a "doghouse" structure. This significantly increased the
	frontal area compared to the sleek single-engine cowling of the A/B.
	
	Old S_ref (UH-2A): 5.5
	New S_ref (UH-2C): ~6.8 (Estimated for wider doghouse + intakes)
]]
uh2c.fuselage_area 		= 6.8		-- Frontal Reference Area (S_ref) [m^2]
uh2c.fuselage_Cxa0 		= 0.45		-- Slightly draggier than UH-2A due to interference drag of twin nacelles

-- Engine: 2x General Electric T58-GE-8B Turboshaft
-- The UH-2C used the same engines as the A, but two of them.
uh2c.engines_count		= 2

uh2c.engines_nozzles = {
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

--[[ Not needed?
uh2c.SFM_Data.engine.hMaxEng = 6.9		-- Increased safe altitude for twin engine ops [km]

--   Updated for Twin Engine thrust profile (~2500shp combined / ~20,000+ lbs lift)
uh2c.SFM_Data.engine.table_data = {
--   M     Thrust (Newtons) 
--   Updated for Twin Engine thrust profile (~2500shp combined / ~20,000+ lbs lift)
	{0.0,   72000.0},  -- Static Thrust (Combined effectively)
	{0.05,  68000.0},  
	{0.1,   54000.0},  
	{0.15,  46000.0},  
	{0.2,   32000.0},  -- Cruise (~130 kts)
	{0.25,  24000.0},  
	{0.3,   12000.0},  -- High Speed
	{0.4,    4000.0},  
	{0.5,    1500.0},  
	{0.6,       0.0},
	{1.0,       0.0},
}
]]
uh2c.rotor_height 	= 1.0804	-- [m] Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!)
uh2c.MOI = {5200, 27000, 33500}	-- [kg*m^2] Increased inertia due to higher mass [Roll, Yaw, Pitch]

uh2c.RCS                = 3.5 	-- [m^2] Based on a survey of official ED DCS model RCS values and interpolating for the UH-2C
uh2c.IR_emission_coeff  = 0.08 	-- Two engines = more IR signature; Su-27 ~= 5000 Watts/steradian; UH-2C = ~400 W/sr


return uh2c