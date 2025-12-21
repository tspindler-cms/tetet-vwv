-- L-1049G "Super G" Super Constellation
-- Performance adjusted for Wright R-3350-DA3/EA2 Turbo-Compounds (3,400 HP)
return
{
	Name 				=   'vwv_l-1049',
	DisplayName			= _('[VWV] L-1049 Super Constellation'),
	DisplayNameShort    = _('L-1049'),

	HumanCockpit 		= false,

	Picture 			= current_mod_path..'/Textures/ec121_warning_star.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "ec121",
	propellorShapeType  = "3ARG_PROC_BLUR",
    propellorShapeName  = "ec121_blade.fbx",
	shape_table_data 	=
	{
		{
			file  	 = "ec121";
			life  	 = 150; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = "ec121_collision"; -- Name of destroyed object file name
			fire  	 = { 500, 4}; -- Fire on the ground after destoyed: 500sec 4m
			username = "ec121";
			index    =  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "ec121_collision";
			file  = "ec121_collision";
			fire  = { 500, 4};
		},
	},
	mapclasskey = "P0091000056",
	attribute = {wsType_Air, wsType_Airplane, wsType_Cruiser, WSTYPE_PLACEHOLDER, "Transports", "All", "NonAndLightArmoredUnits", "NonArmoredUnits", "Air", "Planes"},
	Categories = {  },

	-------------------------
	
	
	-- Corrected parameters for Lockheed L-1049G "Super G"
	
	-- WEIGHT PARAMETERS (kg)
	-- L-1049G Empty: ~73,000 lbs (33,115 kg)
	-- L-1049G MTOW: 137,500 lbs (62,370 kg)

	-- WEIGHT PARAMETERS (kg)
	M_empty = 33115,			-- Empty weight: ~33,115 kg / 73,000 lbs
	M_nominal = 54431,			-- Normal loaded: ~54,431 kg / 120,000 lbs
	M_max = 62370,				-- Max takeoff: ~62,370 kg / 137,500 lbs
	M_fuel_max = 17850,			-- Max fuel: ~17,850 kg / 39,300 lbs / 6,550 US Gal
	defFuelRatio = 0.5,			-- Spawn with 50% fuel by default

	-- PERFORMANCE (L-1049G Clean Configuration)
	H_max = 7620,				-- Service ceiling: ~25,000 ft
	V_max_sea_level = 145,		-- Max speed SL: ~280 kts / 325 mph
	V_max_h = 166,				-- Max speed altitude: ~323 kts / 370 mph
	V_opt = 136,				-- Cruise speed: ~265 kts / 305 mph
	V_take_off = 50,			-- Takeoff speed: ~97 kts (lighter empty weight)
	V_land = 45,				-- Landing speed: ~87 kts
	CAS_min = 40,				-- Stall speed: ~78 kts
	Mach_max = 0.58,			-- Max Mach number
	range = 8300,				-- Max range: ~4,480 nm (ferry)
	Vy_max = 8.2,				-- Rate of climb: ~1,620 ft/min (lighter airframe)

	-- ENGINE (Four Wright R-3350-DA3/EA2, ~3,400 HP Wet/Takeoff)
	-- Increased thrust slightly to account for EA2 power vs older C-models
	thrust_sum_max = 104000, 
	thrust_sum_ab = 104000,
	engines_count = 4,
	has_afteburner = false,
	has_speedbrake = false,
	has_thrustReverser = true, -- Reversible pitch props
	average_fuel_consumption = 0.54, 

	-- AERODYNAMICS
	bank_angle_max = 30,   		-- Max bank angle (large transport)
	Ny_min = -0.5,         		-- Negative G limit
	Ny_max = 2.5,          		-- Positive G limit (transport category)
	Ny_max_e = 3.0,        		-- Emergency G limit
	AOA_take_off = 0.14,   		-- Takeoff AoA

	-- DIMENSIONS
	wing_area = 153.7,     		-- Wing area: 1,654 sq ft (Corrected for G model)
	wing_span = 38.47,     		-- Wing span: 126 ft 2 in
	length = 35.41,        		-- Length: 116 ft 2 in
	height = 7.54,         		-- Height: 24 ft 9 in

	-- SENSORS
	RCS = 100, 					-- Radar Cross Section m^2
	detection_range_max = 40, 	-- The max range enemy AI can visually see this aircraft in clear weather (km)
	IR_emission_coeff = 1.2, 	-- Piston engines have moderate IR signature
	IR_emission_coeff_ab = 0,
	
	-- STARTUP SEQUENCE
	engines_startup_sequence 	= { 2, 3, 1, 0 },
	engines_count				= 4, -- Engines count
	sound_name					= "Aircrafts/Engines/RollsRoyceMerlin/Engine",

	wing_type 					= 0,
	wing_tip_pos 				= {-2.1478,	1.114, 18.5182}, -- wingtip coords for visual effects

	nose_gear_pos				= {14.6869, -3.483, 0},
	main_gear_pos 				= {1.6139, -3.6688, 4.1448},
	tand_gear_max				=	math.tan(math.rad(60)),

	nose_gear_wheel_diameter 	= 0.755, -- in m
	main_gear_wheel_diameter 	= 1.342, -- in m
	
	stores_number				= 0,
	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
	flaps_maneuver 				= 0.5, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords

	engines_nozzles = {
		[1] =
		{
			pos =     {4.0,  0, -9.0}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=   0.0, -- AFB cone elevation
            diameter    		=   0.0, -- AFB cone diameter
            exhaust_length_ab   =   2.25, -- lenght in m
            exhaust_length_ab_K =	0.607, -- AB animation
            smokiness_level     =   0.05,
			engine_number 		= 	1
		},
		[2] =
		{
			pos =     {4.55,  0, -4.2}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=	0.0, -- AFB cone elevation
            diameter    		=	0.0, -- AFB cone diameter
            exhaust_length_ab   =	2.25, -- lenght in m
            exhaust_length_ab_K =   0.607, -- AB animation
            smokiness_level     =	0.05,
			engine_number 		= 	2
		},
		[3] =
		{
			pos =     {4.55,  0, 4.2}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=	0.0, -- AFB cone elevation
            diameter    		=	0.0, -- AFB cone diameter
            exhaust_length_ab   =	2.25, -- lenght in m
            exhaust_length_ab_K =	0.607, -- AB animation
            smokiness_level     =	0.05,
			engine_number 		= 	3
		},
		[4] =
		{
			pos =     {4.0,  0, 9.0}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=	0.0, -- AFB cone elevation
            diameter    		=	0.0, -- AFB cone diameter
            exhaust_length_ab   =	2.25, -- lenght in m
            exhaust_length_ab_K =	0.607, -- AB animation
            smokiness_level     =	0.05,
			engine_number 		= 	4
		},
	}, -- end of engines_nozzles
---------------------------------------------------------------------------------
--  Crew
---------------------------------------------------------------------------------

	crew_size	 = 3,	-- Typical civilian cockpit (Pilot, Co-Pilot, Flight Engineer)
	crew_members =
	{
			[1] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
				ejection_order   	= 1,
			}, -- end of [1]
			[2] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
				ejection_order   	= 2,
			}, -- end of [2]
			[3] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
				ejection_order   	= 3,
			}, -- end of [3]
	}, -- end of crew_members

	fires_pos =
	{
		[1] = 	{1.1, 1.7, 0.8},
		[2] = 	{1.1, 1.3, 0.9},
		[3] = 	{1.2, 1.2, 2.2},
		[4] = 	{1.2, 2.265, 2.3},
		[5] = 	{1.2, 2.5, 0},
		[6] = 	{1.2,	2.2, 0.5},
		[7] = 	{-7.3, 0.95, 0},
	}, -- end of fires_pos

	-- Countermeasures (Removed for Civilian Airliner)
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0,
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0,
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,
	chaff_flare_dispenser 	=
	{
	}, -- end of chaff_flare_dispenser

	--sensors
	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry =
	{
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = {
	},
	HumanRadio =
	{
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 137.000,
		modulation = MODULATION_AM
	},

	Guns =
	{
    },

	Pylons =  {
	},

	Tasks = {
		aircraft_task(Transport),
    },
	DefaultTask = aircraft_task(Transport),

	SFM_Data = {
		aerodynamics = {
		
			-- AERODYNAMICS TABLE (L-1049G Super G)
			-- Adjusted for cleaner airframe (No radomes)
			
			Cy0 = 0,
			Mzalfa = 6.6,
			Mzalfadt = 1.0,
			kjx = 2.85,
			kjz = 0.00125,
			Czbe = -0.012,
			cx_gear = 0.025,       -- Gear drag
			cx_flap = 0.12,        -- Large flaps for transport
			cy_flap = 1.4,         -- Good flap effectiveness
			cx_brk = 0.06,         -- Airbrake drag
			
			
			table_data = {
				-- Mach, Cx0, Cya, B, B4, Omxmax, Aldop, Cymax
				-- Reduced Cx0 values by ~15% to account for removal of radar pods
				{0,    0.021, 0.088, 0.038, 0.00001, 0.5,  20, 1.25},
				{0.1,  0.021, 0.088, 0.038, 0.00001, 1.0,  20, 1.28},
				{0.15, 0.021, 0.089, 0.038, 0.00001, 1.5,  20, 1.30},
				{0.2,  0.021, 0.090, 0.038, 0.00001, 2.0,  20, 1.32},
				{0.25, 0.021, 0.091, 0.038, 0.00001, 2.5,  20, 1.32},
				{0.3,  0.021, 0.092, 0.038, 0.00001, 2.8,  20, 1.30},
				{0.35, 0.022, 0.093, 0.040, 0.00001, 3.0,  20, 1.28},
				{0.4,  0.023, 0.094, 0.043, 0.00001, 3.2,  20, 1.24},
				{0.45, 0.025, 0.095, 0.048, 0.001,   3.3,  20, 1.18},
				{0.5,  0.028, 0.096, 0.055, 0.005,   3.3,  20, 1.10},
				{0.55, 0.032, 0.096, 0.065, 0.02,    3.2,  19, 1.00},
				{0.6,  0.040, 0.095, 0.080, 0.05,    3.0,  18, 0.88},
				{0.65, 0.050, 0.093, 0.100, 0.10,    2.7,  17, 0.72},
				{0.7,  0.065, 0.090, 0.125, 0.18,    2.3,  16, 0.55},
			},
		},
		
		engine = {
			
			-- ENGINE TABLE (Wright R-3350-DA3/EA2 Turbo-Compound)
			-- Rated 3,400 HP Wet
			-- 18-cylinder radial with power recovery turbines
			
			Nominal_RPM = 2400,      -- Increased Takeoff RPM for Super G
			Nmg = 27.27,             -- Idle RPM % (~600 RPM)
			MinRUD = 0,
			MaxRUD = 1.0,
			MaksRUD = 1.0,
			ForsRUD = 1.0,
			type = "Radial",
			
			hMaxEng = 12.5,          -- Engine altitude limit
			dcx_eng = 0.013,         -- Engine drag coefficient
			cemax = 0.38,            -- Adjusted SFC for higher power
			cefor = 0.38,
			dpdh_m = 1800,
			dpdh_f = 1800,
			k_adiab_1 = 0.029,
			k_adiab_2 = 0.0562,
			MAX_Manifold_P_1 = 430000,  -- Increased Manifold Pressure for EA2
			MAX_Manifold_P_2 = 430000,
			MAX_Manifold_P_3 = 510000,
			k_after_cool = 0.49,
			Displ = 54.86,           -- 3,347 cubic inches total displacement
			k_Eps = 5.5,             -- Efficiency factor
			Stroke = 0.159,          -- 6.3125 inch stroke
			V_pist_0 = 12.0,         -- Compression ratio
			Nu_0 = 1.35,
			Nu_1 = 1.0,
			Nu_2 = 0.001,
			N_indic_0 = 2200000,     -- Indicated power (adjusted for 3,400 HP per engine)
			N_fr_0 = 0.072,
			N_fr_1 = 0.02,
			Init_Mom = 220,
			D_prop = 4.90,           -- 16 ft 2 in diameter props (Hamilton Standard)
			MOI_prop = 45,           -- Large prop moment of inertia
			k_gearbox = 1.778,
			P_oil = 495438,          -- Oil pressure
			k_boost = 3,
			k_cfug = 0.003,
			k_oil = 0.00004,
			k_piston = 3300,
			k_reg = 0.003,
			k_vel = 0.017,
			
			-- Propeller parameters
			cylinder_firing_order = {1,12,5,16,9,2,13,6,17,10,3,14,7,18,11,4,15,8},		-- https://www.enginehistory.org/Piston/Wright/Kuhns/CurtissWrightTC18/TurboCompounds.shtml
			prop_blades_count = 3,
			prop_locations = {
				{5.9, -0.37, -9.09}, {0.0, 0.0, 0.0},  -- Engine 1 (outer left)
				{6.5, -0.85, -4.12}, {0.0, 0.0, 0.0},  -- Engine 2 (inner left)
				{6.5, -0.85,  4.12}, {0.0, 0.0, 0.0},  -- Engine 3 (inner right)
				{5.9, -0.37,  9.09}, {0.0, 0.0, 0.0},  -- Engine 4 (outer right)
			},
			prop_pitch_min = 23.0,
			prop_pitch_max = 65.0,
			prop_pitch_feather = 91.0,
			
			Startup_Prework = 12,
			Startup_Ignition_Time = 3.5,
			Shutdown_Duration = 4.8,
			Startup_RPMs = {{0, 0}, {1, 66}, {2.99, 66}, {3, 85}, {4, 600}},
	
	
			-- Power Curve for 3,400 HP R-3350-DA3/EA2
			table_data = {
				-- Mach, Thrust (N) per engine x4 = total
				-- Increased static and low-speed thrust slightly for EA2 engines
				{0,    104000},  -- ~23,400 lbs static thrust
				{0.05, 101000},
				{0.10, 95000},
				{0.15, 88000},
				{0.20, 80000},   -- Rotation
				{0.25, 71000},   -- Climb
				{0.30, 62000},
				{0.35, 54000},
				{0.40, 46000},   -- Cruise
				{0.45, 39000},
				{0.50, 33000},   -- Max Speed
				{0.55, 28000},
				{0.60, 24000},
			},
		},
	},

--[[
To break the entries down:

eg oh58d_cells_properties[0] = {critical_damage = 4, args = {161},deps_cells = {11,12},droppable=false}
   ----------green------- loc   ----------red------  ---blue----  ------yellow--------
Green is the model name and part# as referenced in the list at top of the damage.lua

Red, amount of damage it can sustain before something falls off or
you get shot down. Some parts will have an extra section named deps_cells,
I think these parts fall off when the particular part reaches its critical
damage amount unless droppable = false.
Blue is 3D model argument # of the damage part
Yellow is the damage cells affected by damage on this location
	--]]
----------------------------------------------------------------------------------------------------
---  Damage Section
-----------------------------------------------------------------------------------------------------

	Failures = {
	},

    -- Blueprint taken from Damage.lua of ED, Fencer (Scripts/Aircraft/_Common/Damage.lua)
	Damage = verbose_to_dmg_properties({
		["COCKPIT"]				= {critical_damage = 2, args =  { 65}},
		["NOSE_CENTER"]			= {critical_damage = 3, args =  {146}},

		["WING_L_OUT"]			= {critical_damage = 10,args =  {223},deps_cells = {"FLAP_L_IN","WING_L_PART_OUT"}},
		["WING_R_OUT"]			= {critical_damage = 10,args =  {213},deps_cells = {"FLAP_R_IN","WING_R_PART_OUT"}},
		["WING_L_PART_OUT"]		= {critical_damage = 3, args =  {221}},
		["WING_R_PART_OUT"]		= {critical_damage = 3, args =  {231}},
		["FLAP_L_IN"]			= {critical_damage = 4, args =  {227}},
		["FLAP_R_IN"]			= {critical_damage = 4, args =  {217}},

		["FUSELAGE_BOTTOM"]		= {critical_damage = 8, args =  {152}},
		["FUSELAGE_CENTR_TOP"]	= {critical_damage = 8, args =  {151}},
		["FUSELAGE_CENTR_L"]	= {critical_damage = 4, args =  {154}},
		["FUSELAGE_CENTR_R"]	= {critical_damage = 4, args =  {153}},

		["FIN_TOP"]				= {critical_damage = 4, args =  {244}},
		["RUDDER"]				= {critical_damage = 2, args =  {247}},

		["ENGINE_L"]			= {critical_damage = 4, args =  {167}},
		["ENGINE_R"]			= {critical_damage = 4, args =  {161}},

		["STABILIZER_L_IN"]		= {critical_damage = 3, args =  {235}},
		["STABILIZER_R_IN"]		= {critical_damage = 3, args =  {233}},
		["wheel_front"]     = {critical_damage = 1},
		["wheel_left"]      = {critical_damage = 1},
		["wheel_right"]     = {critical_damage = 1},
	}),


	DamageParts = { },

----------------------------------------------------------------------------------------------------
---  End Damage Section
-----------------------------------------------------------------------------------------------------
    lights_data = {
        typename = "Collection",
        lights = {
            [WOLALIGHT_LANDING_LIGHTS] = {
                typename = "Collection",
                lights = {
					--{typename = "strobelight", connector = "EC-121 Light Collison White Top", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
					--{typename = "strobelight", connector = "EC-121 Light Collison White Bottom", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
                },
            },
            [WOLALIGHT_TAXI_LIGHTS] = {
                typename = "Collection",
                lights = {
					--{typename = "strobelight", connector = "EC-121 Light Collison White Top", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
					--{typename = "strobelight", connector = "EC-121 Light Collison White Bottom", argument = 209, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
                },
            },
            [WOLALIGHT_NAVLIGHTS] = {
                typename = "Collection",
                lights = {
				    {typename = "strobelight", connector = "EC-121 Light Nav Green", argument = 193, period = 1.01, phase_shift = 0.5, color = {0,0.8,0}},
					{typename = "strobelight", connector = "EC-121 Light Nav Red", argument = 193, period = 1.01, phase_shift = 0.5, color = {0.8,0,0}},
					{typename = "strobelight", connector = "EC-121 Light Nav White", argument = 193, period = 1.01, phase_shift = 0.5, color = {0.1,0.1,0.1}},
					{typename = "omnilight", connector = "EC-121 Light Nav Green Omni", argument = 193, color = {0,0.8,0}},
					{typename = "omnilight", connector = "EC-121 Light Nav Red Omni", argument = 193, color = {0.8,0,0}},
					{typename = "omnilight", connector = "EC-121 Light Nav White Omni", argument = 193, color = {0.1,0.1,0.1}},
                },
            },
		}
	},

}
