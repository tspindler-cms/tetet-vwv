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
-- sh2f.rotor_animation.rotor_locations = {pos = { 0.5824, 1.7843, 0.0, pitch = 0.0}
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
sh2f.rotor_height 	= 1.08045	-- Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!) [meters]
sh2f.MOI = {6200, 24500, 19800} -- Increased inertia due to LAMPS gear/radar [Roll, Yaw, Pitch]

------------------------------------------------------------------------------------------------
-- SENSORS & ARMAMENT
------------------------------------------------------------------------------------------------
sh2f.RCS                = 15 	-- Higher RCS due to complex shape/stores
sh2f.radar_can_see_ground = true	-- Is AI radar able to see enemy surface entities (tanks, ships)?
sh2f.detection_range_max = 60   -- LN-66 Range (approx 30-40nm effective)
sh2f.IR_emission_coeff  = 0.4 	-- Two engines = more IR signature

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



--[[
return {
	Name 				=   'sh2f',
	DisplayName			= _('[VWV] SH-2F Seasprite'),
	DisplayNameShort	= _('SH-2F'),
	date_of_introduction= 1971.05,
	Picture 			=  current_mod_path..'/Textures/sh_2c_f.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "sh2f",
	WorldID				=  WSTYPE_PLACEHOLDER,
	defFuelRatio    	= 	0.8, -- fuel default in fractions of the full (1.0)
    livery_entry    	=  "sh2f",
	shape_table_data 	=
	{
		{
			file  	 = 'sh2f';
			life  	 = 5; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = ''; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destroyed: 300sec 2m
			username = 'sh2f';
			index    =  WSTYPE_PLACEHOLDER;
            classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap = true;
		},
		{
			name  = "";
			file  = "";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000021",
	attribute  			= {wsType_Air, wsType_Helicopter, wsType_Battleplane, WSTYPE_PLACEHOLDER ,"Attack helicopters",},
	-- Categories 			= {"{828CEADE-3F1D-40aa-93CE-8CDB73FE2710}", "Helicopter",},
	Categories  		= { },
	country_of_origin 	= "USA",

    -- TeTeT: Copied and adjusted from UH-1 core config
    -- adjustments from https://en.wikipedia.org/wiki/Kaman_SH-2_Seasprite or model
    length	= 11.68, --	17.62,
    height	= 4.14, --	4.41,
    rotor_height	= 3.47,
    rotor_diameter	= 13.41,
    blades_number	=	4,
    blade_area	=	6.2,
    rotor_RPM	=	324,
    engines_count	=	2,
    blade_chord	=	0.534,
    rotor_MOI	=	3000,
    rotor_pos = 	{0,	2.44,	0},
    thrust_correction	=	0.75,
    fuselage_Cxa0	=	0.47,
    fuselage_Cxa90	=	5.9,
    fuselage_area	=	5,
    centering	=	-0.1,
    tail_pos = 	{-8.525,	2.114,	0},
    tail_fin_area	=	1.2,
    tail_stab_area	=	1.7,
    M_empty	= 3193, --	2883,
    M_nominal	=	3158,
    M_max	=	4310,
    MOI = 	{2600,	12443,	13197},
    M_fuel_max	=	631,
    V_max	=	240,
    V_max_cruise	=	204,
    Vy_max	=	6.1,
    H_stat_max_L	=	2150,
    H_stat_max	=	1850,
    H_din_two_eng	=	3840,
    H_din_one_eng	=	1900,
    range	= 680, --	510,
    flight_time_typical	=	150,
    flight_time_maximum	=	192,
--    main_gear_pos = 	{-0.458,	-1.577,	1.332},
--    nose_gear_pos = 	{1.714,	-1.636,	1.33},
	nose_gear_pos 				= { -2.681, -1.70,	0}, -- nosegear coord
	main_gear_pos 				= {  2.113, -1.70,  1.114}, -- main gear coords

    lead_stock_main	=	-0.1,
    lead_stock_support	=	-0.1,
    stores_number	=	4,
    scheme	=	0,
    fire_rate	=	0,

    crew_members =
    {
        [1] =
        {
            ejection_seat_name	=	0,
            drop_canopy_name	=	0,
            pos = 	{2.3,0,	-0.5},
            canopy_args = {38, 1.0, 43, 5.0, 44, 5.0, 459, 10.0, 460, 1.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
            pilot_body_arg = 50,
            role = "pilot" -- left seat
        }, -- end of [1]
        [2] =
        {
            ejection_seat_name	=	0,
            drop_canopy_name	=	0,
            pos = 	{2.3,0,	 0.5},
            canopy_arg = 38,
            canopy_args = {38, 1.0, 43, 5.0, 44, 5.0, 459, 1.0, 460, 10.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
            pilot_body_arg = 472,
            role = "copilot" -- right seat
        }, -- end of [2]
        [3] =
        {
            ejection_seat_name	=	0,
            drop_canopy_name	=	0,
            pos = 	{2.3,0,	 0.5},
            canopy_arg = 38,
            canopy_args = {38, 1.0, 43, 5.0, 44, 5.0, 459, 1.0, 460, 10.0, 457, 0.1, 458, 0.1, 453, 0.5, 454, 0.5, 146, 1.0},
            pilot_body_arg = 473,
            role = "flight_officer" -- back seat
        }, -- end of [3]
    },
    mechanimations = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 1.0, "in", 2.0},},},}, Flags = {"Reversible"},},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 2.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
        },
            FoldableWings = {
               {Transition = {"Retract", "Extend"},  Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0},{"Arg", 999, "to", 0.0, "in", 3.0},}}}, Flags = {"Reversible"}},
               {Transition = {"Extend", "Retract"},  Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 5.0},{"Arg", 999, "to", 1.0, "in", 2.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
            },		
      --  Door1 = {DuplicateOf = "Door0"},
    }, -- end of mechanimations


Pylons =     {
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
    },
	    sound_name         = "Aircraft/Planes/[VWV] Kaman",	
		sound_name	=	"Aircrafts/Engines/RotorCH53",
    RCS	=	10,
    detection_range_max	=	11,
    IR_emission_coeff	=	0.2,
    Vy_land_max	=	12.8,
    Ny_max	=	1.7,
    radar_can_see_ground	=	true,
    engine_data =
    {
        power_take_off	=	1044,
        power_max	=	1044,
        power_WEP	=	1044,
        power_TH_k =
        {
            [1] = 	{-1.8859,	17.806,	1030},
            [2] = 	{-2.2584,	20.573,	1030},
            [3] = 	{-0.9078,	-3.1185,	1051.6},
            [4] = 	{-0.2853,	-0.614,	786.19},
        }, -- end of power_TH_k
        SFC_k = 	{0,	-0.000312128,	0.63},
        power_RPM_k = 	{-0.0778,	0.2506,	0.8099},
        power_RPM_min	=	9.1384,
        sound_name	=	"Aircrafts/Engines/EngineGE",
    }, -- end of engine_data
	SFM_Data = {
		aerodynamics =
		{
			Cy0			=	0,
			Mzalfa		=	4.355,
			Mzalfadt	=	0.8,
			kjx			=	2.75,
			kjz			=	0.00125,
			Czbe		=	-0.016,
			cx_gear		=	0.0268,
			cx_flap		=	0.05,
			cy_flap		=	0.52,
			cx_brk		=	0.06,
			table_data =
			{
				[1] = 	{0,	0.0165,	0.07,	0.132,	0.032,	0.5,	30,	1.2},
				[2] = 	{0.2,	0.0165,	0.07,	0.132,	0.032,	1.5,	30,	1.2},
				[3] = 	{0.4,	0.0165,	0.07,	0.133,	0.032,	2.5,	30,	1.2},
				[4] = 	{0.6,	0.0165,	0.073,	0.133,	0.043,	3.5,	30,	1.2},
				[5] = 	{0.7,	0.017,	0.076,	0.134,	0.045,	3.5,	28.666666666667,	1.18},
				[6] = 	{0.8,	0.024,	0.079,	0.137,	0.052,	3.5,	27.333333333333,	1.16},
				[7] = 	{0.9,	0.041,	0.083,	0.143,	0.058,	3.5,	26,	1.14},
				[8] = 	{1,	0.062,	0.085,	0.18,	0.1,	3.5,	24.666666666667,	1.12},
				[9] = 	{1.05,	0.061,	0.0855,	0.1975,	0.095,	3.5,	24,	1.11},
				[10] = 	{1.1,	0.06,	0.086,	0.215,	0.09,	3.15,	18,	1.1},
				[11] = 	{1.2,	0.051,	0.083,	0.228,	0.12,	2.45,	17,	1.05},
				[12] = 	{1.3,	0.046,	0.077,	0.237,	0.17,	1.75,	16,	1},
				[13] = 	{1.49,	0.044,	0.062,	0.251,	0.2,	1.5125,	13.15,	0.905},
				[14] = 	{1.5,	0.043903225806452,	0.061483870967742,	0.25064516129032,	0.2058064516129,	1.5,	13,	0.9},
				[15] = 	{1.7,	0.041967741935484,	0.051161290322581,	0.24354838709677,	0.32193548387097,	0.9,	12,	0.7},
				[16] = 	{1.8,	0.041,	0.046,	0.24,	0.38,	0.86,	11.4,	0.64},
				[17] = 	{2,	0.042,	0.039,	0.222,	2.5,	0.78,	10.2,	0.52},
				[18] = 	{2.2,	0.041,	0.034,	0.227,	3.2,	0.7,	9,	0.4},
				[19] = 	{2.5,	0.039,	0.033,	0.25,	4.5,	0.7,	9,	0.4},
				[20] = 	{3.9,	0.035,	0.033,	0.35,	6,	0.7,	9,	0.4},
			}, -- end of table_data
		}, -- end of aerodynamics
		engine =
		{
			Nmg		=	35, -- RPM at idle
			Startup_Duration = 53.0,
			Shutdown_Duration = 42.0,			
			MinRUD	=	0, -- Min state of the РУД
			MaxRUD	=	1, -- Max state of the РУД
			MaksRUD	=	1, -- Military power state of the РУД
			ForsRUD	=	1, -- Afterburner state of the РУД
			type	=	"TurboShaft",
            name = "T55-GA-714A",			
			hMaxEng	=	19, -- Max altitude for safe engine operation in km
			dcx_eng	=	0.0134, -- Engine drag coeficient
			cemax	=	1.24, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	2.56, -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	1340, --  altitude coefficient for max thrust
			dpdh_f	=	1340, --  altitude coefficient for AB thrust
			table_data =
			{		--   M			Pmax		 Pfor
				{ 0.0	,	26000	,	26000	},
				{ 0.1	,	26000	,	26000	},
				{ 0.2	,	24430	,	24430	},
				{ 0.3	,	23040	,	23040	},
				{ 0.4	,	22090	,	22090	},
				{ 0.5	,	21490	,	21490	},
				{ 0.6	,	21310	,	21310	},
				{ 0.7	,	21400	,	21400	},
				{ 0.8	,	22090	,	22090	},
				{ 0.86	,	22780	,	22780	},
				{ 0.9	,	23300	,	23300	},
				{ 0.94	,	23650	,	23650	},
				{ 1		,	24260	,	24260	},
				{ 1.04	,	24600	,	24600	},
				{ 1.1	,	25640	,	25640	},
				
				
			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},	
    cannon_sight_type	=	0,
    fires_pos =
    {
        [1] = 	{0,	0.7,	0},
        [2] = 	{-0.6,	1.1,	0},
        [3] = 	{0,	0,	0},
        [4] = 	{-6.8,	0.8,	0},
        [5] = 	{-0.623,	-0.746,	0},
        [6] = 	{0,	0,	0},
        [7] = 	{0,	0,	0},
        [8] = 	{0,	0,	0},
        [9] = 	{0,	0,	0},
        [10] = 	{0,	0,	0},
        [11] = 	{0,	0,	0},
    }, -- end of fires_pos

    chaff_flare_dispenser =
    {
        [1] =
        {
            dir = 	{-0.98,	-0.174,	-0.087},
            pos = 	{-7.7,	-0.25,	-0.5},
        }, -- end of [1]
        [2] =
        {
            dir = 	{-0.98,	-0.174,	0.087},
            pos = 	{-7.7,	-0.25,	0.5},
        }, -- end of [2]
    }, -- end of chaff_flare_dispenser

    cargo_max_weight = 5000, -- maximum weight of extended cargo
    cargo_radius_in_menu = 2000, -- radius, when cargo displays in menu
    helicopter_hook_pos={0.0, -0.84, 0.0},
    h_max_gear_hook=2.4,

    AddPropAircraft = {
        {
            id = "FoldRotor",
            control = 'checkbox' ,
            label = _('Fold Main Rotor'),
            defValue = false,
            weightWhenOn = 0,
            arg = 8,
            wCtrl = 150
        }
    },

    -- TeTeT: additional settings
	Tasks = {
        aircraft_task(AntishipStrike),
        aircraft_task(Transport),
        aircraft_task(Reconnaissance),
    },
    DefaultTask = aircraft_task(AntishipStrike),
	LandRWCategories =
    {
        [1] =
        {
           Name = "HelicopterCarrier",
        },
        [2] =
        {
           Name = "AircraftCarrier",
        },
        [3] =
        {
            Name = "AircraftCarrier With Catapult",
        },
        [4] =
        {
            Name = "AircraftCarrier With Tramplin",
        },
    },

	TakeOffRWCategories =
    {
        [1] =
        {
            Name = "HelicopterCarrier",
        },
        [2] =
        {
           Name = "AircraftCarrier",
        },
        [3] =
        {
            Name = "AircraftCarrier With Catapult",
        },
        [4] =
        {
            Name = "AircraftCarrier With Tramplin",
        },
    },

	takeoff_and_landing_type = "VTOL",
	
    rotor_animation = {
        rotor_locations	= {{pos = { 0.5824, 1.7843, 0.0}}},		
        rotor_models = {
            {
                modelRotorHub_EDM       = "sh2f_rotor_hub", -- works now
                modelRotorHubLod_FBX    = "/models/sh2f_rotor_hub_lod.fbx", -- not textured, all black?
                boundRotorHub_FBX       = "/models/sh2f_rotor_hub_bound.fbx",
                boundBlade_FBX          = "/models/ch46d_rotor_blade_bound.fbx",
                modelBlade_FBX          = {"/models/sh2f_rotor_blade.fbx"},
            },
        },
        tail_rotor = {
				blades_count	= 4,
				modelBlade_FBX	= "/models/sh2f_blade.fbx",
				rotor_direction	= -1,
				rotor_locations = {{pos = {-7.2187, 1.4516, -0.4933}, pitch = 0.0, yaw = math.rad(90)}},
        },		
    },	
    lights_data = {
        typename = "Collection",
        lights = {
            [WOLALIGHT_LANDING_LIGHTS] = {
                typename = "Collection",
                lights = {
                },
            },
            [WOLALIGHT_TAXI_LIGHTS] = {
                typename = "Collection",
                lights = {
                },
            },
        [WOLALIGHT_NAVLIGHTS] = {
            typename = "collection",
            lights = {
                [1] = {
                    typename = "Collection",
                    lights = {
					{  	typename = 'omnilight',  
							connector = "zuoyijian1", 
							argument = 190, 
							color = {255,0,0},
							range = 10,
							brightness = 65,proto = { color = {1, 1, 1, 0.012 * math.sqrt(1000)}, range = 40.0, angle_max = math.rad(40.0), angle_min = math.rad(40.0)},
					}, -- left tip	 左翼尖1
					{  	typename = 'omnilight',  
							connector = "zuoyijian2", 
							argument = 190, 
							color = {255,0,0},
							range = 10,
							brightness = 65,proto = { color = {1, 1, 1, 0.012 * math.sqrt(1000)}, range = 40.0, angle_max = math.rad(40.0), angle_min = math.rad(40.0)},
					}, -- left tip	 左翼尖2
					
					{  	typename = 'omnilight',  
							connector = "youyijian1", 
							argument = 191, 
							color = {0,255,18},
							range = 10,
							brightness = 65,proto = { color = {1, 1, 1, 0.012 * math.sqrt(1000)}, range = 40.0, angle_max = math.rad(40.0), angle_min = math.rad(40.0)},
					},  --right tip   右翼尖1
					{  	typename = 'omnilight',  
							connector = "youyijian2", 
							argument = 191, 
							color = {0,255,18},
							range = 10,
							brightness = 65,proto = { color = {1, 1, 1, 0.012 * math.sqrt(1000)}, range = 40.0, angle_max = math.rad(40.0), angle_min = math.rad(40.0)},
					},  --right tip   右翼尖2
	                {
                        typename = "Spot", connector = "BANO_0", dir_correction = {azimuth = math.rad(180.0)}, argument = 192,
                            proto = lamp_prototypes.HS_2A, angle_max = math.rad(180.0), angle_min = math.rad(170.0),proto = { color = {1, 1, 1, 0.012 * math.sqrt(1000)}, range = 40.0, angle_max = math.rad(40.0), angle_min = math.rad(40.0), controller = "Strobe", period = 1.33333,},
                    },	
                    },
                },
            },
        },
            [WOLALIGHT_CABIN_NIGHT] = {
                typename = "Collection",
                lights = {
                },
            },
        }
    },
};
]]