-- L-1049G "Super G" Super Constellation
-- Performance adjusted for Wright R-3350-DA3 Turbo-Compounds (3,400 HP)
return
{
	Name 				= 'vwv_l-1049',
	DisplayName			= _('[VWV] L-1049 Super Constellation'),
	DisplayNameShort    = _('L-1049'),
	date_of_introduction= 1950.10,
	HumanCockpit 		= false,

	Picture 			= current_mod_path..'/Textures/ec121_warning_star.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "ec121",
	WorldID             = WSTYPE_PLACEHOLDER,
	defFuelRatio    	= 0.8, -- fuel default in fractions of the full (1.0)
	propellorShapeType  = "3ARG_PROC_BLUR",
    propellorShapeName  = "ec121_blade.fbx",
	shape_table_data 	=
	{
		{
			file  	 = "ec121";
			life  	 = 150; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = "c-130-oblomok"; -- Name of destroyed object file name
			fire  	 = { 500, 4}; -- Fire on the ground after destoyed: 500sec 4m
			username = "vwv_l-1049";
			index    =  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "c-130-oblomok";
			file  = "c-130-oblomok";
			fire  = { 500, 4};
		},
	},
	mapclasskey = "P0091000029",
	attribute = {wsType_Air, wsType_Airplane, wsType_Cruiser, WSTYPE_PLACEHOLDER, "Transports",},
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
	V_max_sea_level = 128,		-- Max speed SL: ~250 kts (reduced from 145)
	V_max_h = 166,				-- Max speed altitude: ~323 kts / 370 mph
	V_opt = 136,				-- Cruise speed: ~265 kts / 305 mph
	V_take_off = 58,            -- Takeoff speed: ~113 kts (increased from 55)
	V_land = 52,                -- Landing speed: ~101 kts (increased from 50)
	CAS_min = 48,               -- Stall speed: ~93 kts (increased from 45)
	Mach_max = 0.58,			-- Max Mach number
	range = 8700,				-- Max range: ~4,700 nm (ferry)
	Vy_max = 6.5,               -- Rate of climb: ~1,280 ft/min (reduced from 8.2)

	-- ENGINE (4x Wright R-3350-DA3 Turbo-Compound)
	-- 4 engines * ~7,000 lbs (31.1kN) = ~28,000 lbs total = 12,700 kgf
	thrust_sum_max = 12700,     -- kgf (reduced from 17236)
	thrust_sum_ab = 12700,      -- kgf (reduced from 17236)
	-- thrust_sum_max = 17236, 	-- kgf
	-- thrust_sum_ab = 17236,	  	-- kgf (with afterburners)
	engines_count = 4,
	has_afteburner = false,
	has_speedbrake = false,
	has_thrustReverser = true,  -- Reversible pitch props
	average_fuel_consumption = 0.68,  -- Increased from 0.54 (more realistic for piston

	-- AERODYNAMICS
	bank_angle_max = 30,   		-- Max bank angle (large transport)
	Ny_min = -0.5,         		-- Negative G limit
	Ny_max = 1.5,          		-- Positive G limit (transport category)
	Ny_max_e = 3.0,        		-- Emergency G limit
	AOA_take_off = 0.14,   		-- Takeoff AoA

	-- DIMENSIONS
	wing_area = 153.7,     		-- Wing area: 1,654 sq ft
	wing_span = 38.47,     		-- Wing span: 126 ft 2 in
	length = 35.41,        		-- Length: 116 ft 2 in
	height = 7.54,         		-- Height: 24 ft 9 in

	-- SENSORS
	RCS = 100, 					-- Radar Cross Section m^2
	detection_range_max = 40, 	-- The max range enemy AI can visually see this aircraft in clear weather (km)
	IR_emission_coeff = 1.2, 	-- Piston engines have moderate IR signature
	IR_emission_coeff_ab = 0,
	radar_can_see_ground = false, -- Radar can detect ground units
	
	-- STARTUP SEQUENCE
	engines_startup_sequence 	= { 2, 3, 1, 0 },
	engines_count				= 4, -- Engines count
	sound_name					= "Aircrafts/Engines/RollsRoyceMerlin/Engine",

	wing_type 					= 0,
	wing_tip_pos 				= {-2.1478,	1.114, 18.5182}, -- wingtip coords for visual effects

	nose_gear_pos				= {14.6869, -3.483, 0},
	main_gear_pos 				= {1.6139, -3.6688, 4.1448},
	tand_gear_max				= math.tan(math.rad(60)),

	nose_gear_wheel_diameter 	= 0.780, -- in m
	main_gear_wheel_diameter 	= 1.28, -- in m
	
	stores_number				= 0,
	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
	flaps_maneuver 				= 0.6, -- For the Lockheed L-1049 Super G Constellation, the standard flaps position for takeoff was 60% (https://www.thisdayinaviation.com/tag/lockheed-l1049h-super-constellation)
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords

	engines_nozzles = {
		[1] =
		{
			pos =     {4.0,  0, -9.0}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=   0.0, -- AFB cone elevation
            diameter    		=   0.0, -- AFB cone diameter
            exhaust_length_ab   =   2.25, -- length in m
            exhaust_length_ab_K =	0.607, -- AB animation
            smokiness_level     =   0.05,
			engine_number 		= 	1
		},
		[2] =
		{
			pos =     {4.55,  0, -4.2}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=	0.0, -- AFB cone elevation
            diameter    		=	0.0, -- AFB cone diameter
            exhaust_length_ab   =	2.25, -- length in m
            exhaust_length_ab_K =   0.607, -- AB animation
            smokiness_level     =	0.05,
			engine_number 		= 	2
		},
		[3] =
		{
			pos =     {4.55,  0, 4.2}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=	0.0, -- AFB cone elevation
            diameter    		=	0.0, -- AFB cone diameter
            exhaust_length_ab   =	2.25, -- length in m
            exhaust_length_ab_K =	0.607, -- AB animation
            smokiness_level     =	0.05,
			engine_number 		= 	3
		},
		[4] =
		{
			pos =     {4.0,  0, 9.0}, -- nozzle coords forward/back,up/down,left/right
            elevation    		=	0.0, -- AFB cone elevation
            diameter    		=	0.0, -- AFB cone diameter
            exhaust_length_ab   =	2.25, -- length in m
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
	CanopyGeometry =
	{
		azimuth   = {-110.0, 110.0}, -- pilot view horizontal (AI)
		elevation = {-30.0, 60.0} -- pilot view vertical (AI)
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
			
			Cy0 	= 0.02,		-- Positive lift at zero AoA
			Mzalfa 	= 6.6,		-- Pitch stability
			Mzalfadt = 1.0,		-- Pitch damping
			kjx 	= 2.85,		-- Roll inertia
			kjz 	= 0.00125,	-- Pitch inertia
			Czbe 	= -0.012,	-- Directional stability
			
			-- Drag & Lift Coefficients
			cx_gear = 0.035,	-- Gear drag (increased from 0.025)
			cx_flap = 0.15,		-- Flap drag (increased from 0.12)
			cy_flap = 1.35,		-- Flap effectiveness (reduced from 1.4 - large wing, moderate effectiveness)
			cx_brk = 0.0,		-- No airbrakes on L-1049G
			
			
			table_data = {
				-- Proposed v2.3.1 table
				-- Mach, Cx0,   Cya,   B,     B4,   Omxmax, Aldop,  Cymax
				{0,    0.024, 0.088, 0.045, 0.00001, 0.5,    20,    1.25},
				{0.1,  0.024, 0.088, 0.045, 0.00001, 1.0,    20,    1.28},
				{0.15, 0.025, 0.089, 0.045, 0.00001, 1.5,    20,    1.30},
				{0.2,  0.025, 0.090, 0.046, 0.00001, 2.0,    20,    1.32},
				{0.25, 0.026, 0.091, 0.046, 0.00001, 2.5,    20,    1.32},
				{0.3,  0.027, 0.092, 0.047, 0.00001, 2.8,    20,    1.30},
				{0.35, 0.029, 0.093, 0.050, 0.00001, 3.0,    20,    1.28},
				{0.4,  0.032, 0.094, 0.055, 0.00001, 3.2,    20,    1.24},
				{0.45, 0.037, 0.095, 0.062, 0.001,   3.3,    20,    1.18},
				{0.5,  0.044, 0.096, 0.072, 0.005,   3.3,    20,    1.10},
				{0.55, 0.053, 0.096, 0.088, 0.02,    3.2,    19,    1.00},
				{0.6,  0.078, 0.095, 0.110, 0.05,    3.0,    18,    0.88},
				
			--[[	v2.3.0 table
				-- Mach, Cx0, Cya, B, B4, Omxmax, Aldop, Cymax
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
			]]
			},
		},
		
		engine = {
			
			-- ENGINE TABLE (Wright R-3350-DA3 Turbo-Compound)
			-- Rated 3,400 HP Wet
			-- 18-cylinder radial with power recovery turbines
			
			Nominal_RPM = 2900,      -- Takeoff RPM is 2,900 for Super G
			Nmg = 20.68,             -- Idle ~600 RPM / 2900 = ~20.7%
			MinRUD = 0,
			MaxRUD = 1.0,
			MaksRUD = 1.0,
			ForsRUD = 1.0,
			type = "Radial",
			typeng = 2,
			
			hMaxEng = 12.5,          -- Engine altitude limit (km)
			dcx_eng = 0.013,         -- Engine drag coefficient
			cemax = 0.42,            -- Max fuel consumption per engine (kg/s) (increased from 0.38)
			cefor = 0.42,			 -- Afterburner fuel consumption per engine (kg/s)
			
			-- Thrust/Power Lapse
            -- Note: The type = "Piston" engine model in DCS uses the hMaxEng,
			-- MAX_Manifold_P, and k_boost parameters to calculate performance
			-- at altitude. Setting dpdh_m to 0 prevents the "simple" linear
			-- decay from overriding the complex piston physics
			dpdh_m = 0,			 	 -- set to zero so piston parameters are not overridden
			dpdh_f = 0,			 	 -- altitude coefficient for max thrust
			
			
			k_adiab_1 = 0.029,		 -- Adiabatic coefficient
			k_adiab_2 = 0.0562,		 -- Second adiabatic coefficient
			MAX_Manifold_P_1 = 149000,  -- Manifold pressure for max continuous cruise (aka METO) (Pascals) 
			MAX_Manifold_P_2 = 176092,  -- Manifold pressure for dry takeoff (Pascals) 
			MAX_Manifold_P_3 = 201490,  -- Manifold pressure for wet takeoff or war emergency power (Pascals)
			k_after_cool = 0.49,	 -- Aftercooling coefficient
			Displ = 54.8475,         -- 3,347 cubic inches total displacement (units: liters)
			k_Eps = 6.7,             -- Cylinder compression ratio
			Stroke = 0.159,          -- 6.3125 inch stroke (meters)
			V_pist_0 = 18,           -- Number of pistons/cylinders (whole number)
			Nu_0 = 1.35,			 -- Efficiency factor
			Nu_1 = 1.0,				 -- Efficiency factor
			Nu_2 = 0.001,			 -- Efficiency factor
			N_indic_0 = 2423525,     -- Indicated power (watts)
			N_fr_0 = 0.072,			 -- Friction
			N_fr_1 = 0.02,			 -- Friction velocity
			Init_Mom = 4067,		 -- Starting torque (Newton-meters) [R-3350 breakaway torque (~3,000 ft-lbs)]
			D_prop = 4.63,           -- 15 ft 2 in diameter props (Hamilton Standard - matches 3D model)
			MOI_prop = 68,           -- Propeller moment of inertia (estimate) (kg*m^2)
			k_gearbox = 16/7,		 -- Engine/propeller gearbox ratio (inverse of reduction ratio; never less than 1.0 in DCS)
			P_oil = 495438,          -- Oil pressure
			k_boost = 3,			 -- Supercharger boost factor
			k_cfug = 0.003,			 -- Centrifugal factor
			k_oil = 0.00004,		 -- Oil factor
			k_piston = 3300,		 -- Piston factor
			k_reg = 0.003,			 -- Regulation 
			k_vel = 0.017,			 -- Velocity factor
			
			-- Propeller parameters
			cylinder_firing_order = {1,12,5,16,9,2,13,6,17,10,3,14,7,18,11,4,15,8},	-- https://www.enginehistory.org/Piston/Wright/Kuhns/CurtissWrightTC18/TurboCompounds.shtml
			
			prop_locations = {
				{5.9, -0.37, -9.09}, {0.0, 0.0, 0.0},  -- Engine 1 (outer left)
				{6.5, -0.85, -4.12}, {0.0, 0.0, 0.0},  -- Engine 2 (inner left)
				{6.5, -0.85,  4.12}, {0.0, 0.0, 0.0},  -- Engine 3 (inner right)
				{5.9, -0.37,  9.09}, {0.0, 0.0, 0.0},  -- Engine 4 (outer right)
			},
			
			prop_blades_count = 3,
			prop_direction = 1,	 -- +1 for CCW when viewed from front, -1 for CW when viewed from front
			prop_pitch_min = -16.0,	 -- prop pitch min, degrees (negative allows for reverse thrust)
			prop_pitch_max =  65.0,	 -- prop pitch max, degrees 
			prop_pitch_feather = 83.0, -- prop pitch feather position, degrees if feather < prop_pitch_max no feathering available
			
			Startup_Prework = 12,			-- (seconds)
			Startup_Ignition_Time = 3.5,	-- (seconds)
			Shutdown_Duration = 4.8,		-- (seconds)
			Startup_RPMs = {{0, 0}, {1, 66}, {2.99, 66}, {3, 85}, {4, 600}},
	
	
			table_data = {
				-- Proposed v2.3.1 engine thrust curve
				-- Power Curve for 3,400 HP R-3350-DA3
				-- Static thrust approx 7,000 lbs (31.1 kN) per engine at sea level
				-- Mach, Thrust (N) TOTAL
					{0.0,  124400},  -- Static (was 31100)
					{0.05, 122000},
					{0.1,  116800},
					{0.15, 110000},
					{0.2,  102000},  -- Climb power
					{0.25,  92800},
					{0.3,   83200},
					{0.35,  74000},  -- Cruise regime
					{0.4,   64800},
					{0.45,  55200},
					{0.5,   44800},  -- Max speed
					{0.55,  34000},
					{0.6,   24000},
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
]]

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
----------------------------------------------------------------------------------------------------

	-- ============================================================
	-- LIGHTS DEFINITION
	-- ============================================================
	
	--[[
		--------------------------------------------------------------
		------------------  HawaiianRyan overhaul  -------------------
		--------------------------------------------------------------
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
        typename = "Collection",
        lights = {
            [WOLALIGHT_LANDING_LIGHTS] = {
                typename = "Collection",
                lights = {
					-- Nosewheel lights
					{
						typename = "Spot", position = { 14.72, -2.216,  0.189 },
						direction = {azimuth = math.rad(0.0), elevation = math.rad(5.0)},
						proto = lamp_prototypes.LFS_P_27_450, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					{
						typename = "Spot", position = { 14.72, -2.216, -0.194 },
						direction = {azimuth = math.rad(0.0), elevation = math.rad(5.0)},
						proto = lamp_prototypes.LFS_P_27_450, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					
					-- Under wing lights outboard of outermost engines
					{
						typename = "Spot",  position = { 0.90, -0.085, -12.15 }, 
						direction = {azimuth = math.rad(0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto = lamp_prototypes.LFS_P_27_450, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
					{
						typename = "Spot",  position = { 0.90, -0.085, 12.15 },
						direction = {azimuth = math.rad(-0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto = lamp_prototypes.LFS_P_27_450, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
					
					-- Ice inspection lights
					{
						typename = "Spot",  position = { 5.88, 0.68, -1.86 }, 
						direction = {azimuth = math.rad(-115.0), elevation = math.rad(5.0)},-- Point back at left wing
						proto = lamp_prototypes.LFS_R_27_130, angle_max = math.rad(30.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
						range = 40,
					},
					{
						typename = "Spot",  position = { 5.88, 0.68,  1.86 },
						direction = {azimuth = math.rad(115.0), elevation = math.rad(5.0)},	-- Point back at right wing
						proto = lamp_prototypes.LFS_R_27_130, angle_max = math.rad(30.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
						range = 40,
					},
					
                },
            },
            [WOLALIGHT_TAXI_LIGHTS] = {
                typename = "Collection",
                lights = {
					-- Nosewheel lights
					{
						typename = "Spot", position = { 14.72, -2.216,  0.189 },
						direction = {azimuth = math.rad(0.0), elevation = math.rad(4.0)},
						proto = lamp_prototypes.LFS_R_27_250, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					{
						typename = "Spot", position = { 14.72, -2.216, -0.194 },
						direction = {azimuth = math.rad(0.0), elevation = math.rad(4.0)},
						proto = lamp_prototypes.LFS_R_27_250, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					
					-- Under wing lights outboard of outermost engines
					{
						typename = "Spot",  position = { 0.90, -0.085, -12.15 }, 
						direction = {azimuth = math.rad(0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto = lamp_prototypes.LFS_R_27_250, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
					{
						typename = "Spot",  position = { 0.90, -0.085, 12.15 },
						direction = {azimuth = math.rad(-0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto = lamp_prototypes.LFS_R_27_250, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
                },
            },
			
			
			[WOLALIGHT_BEACONS] = {
				-- DCS seems to only turn this collection on during startup of the engines then turns them off when it's time to taxi.
				typename = "Collection",
				lights = {
					{
						typename = "RotatingBeacon", 						-- Ventral red beacon
						position = { 5.54, -1.508, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon",						-- Dorsal red beacon
						position = { 0.075, 2.08, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
				},
			},
			
			[WOLALIGHT_STROBES] = {
				-- For white anti-collision strobes, but the L-1049G didn't have these. Only started appearing in the late 1960s.
				typename = "Collection",
				lights = { },
			},
			
			[WOLALIGHT_FORMATION_LIGHTS] = {	-- Keeps them on the whole time.
				-- Red beacon lights. Old aircraft have rotating/oscillating ones. Modern aircraft flash.
				typename = "Collection",
				lights = {
					{
						typename = "RotatingBeacon", 						-- Ventral red beacon
						position = { 5.54, -1.508, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon",						-- Dorsal red beacon
						position = { 0.075, 2.08, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{	-- Port (left) side position light (red)
						typename = "Spot", position = { 1.602, 1.282, -19.075 },
						direction = {azimuth = math.rad(-90.0), elevation = math.rad(0)},
						proto = lamp_prototypes.BANO_7M_red, angle_max = math.rad(180.0),
						color = {1.0, 15/255, 0, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
					},
					{ 	-- Red omni for scattering off the fuselage
                        typename = "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position = { 1.602, 1.282, -19.075 },
						color = {1.0, 15/255, 0, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
						range = 3.0,
					},
					{	-- Starboard (right) side position light (green)
						typename = "Spot", position = { 1.602, 1.282, 19.075 },
						direction = {azimuth = math.rad(90.0), elevation = math.rad(0)},
						proto = lamp_prototypes.BANO_7M_green, angle_max = math.rad(180.0),
						color = {0.0, 1.0, 65/255, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
					},
					{ 	-- Green omni for scattering off the fuselage
                        typename = "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position = { 1.602, 1.282, 19.075 },
						color = {0.0, 1.0, 65/255, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
						range = 3.0,
					},
					{	-- Aft white nav light
						typename = "Spot", position = { -18.183, 1.523, 0 },
						proto = lamp_prototypes.ANO_3_Bl,
						direction = {azimuth = math.rad(180.0)},
						angle_max = math.rad(165.0),
						power_up_t = 0.35, cool_down_t = 0.45,
					},
					{ 	-- White omni for scattering off the fuselage
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						position = { -18.183, 1.523, 0 },
						power_up_t = 0.35, cool_down_t = 0.45,
						range = 3.0,
					},
				},
			},
			
			[WOLALIGHT_NAVLIGHTS] = {
                -- 	The argument lights are permanently bright which is a 3D model thing and has to be fixed there.
				-- 	The lights defined below will bounce off nearby objects, but you cannot observe them directly
				-- 	so they don't become balls of light at a distance -- only the 3D model can do that.
                typename = "Collection",
				lights = {
					-- {typename = "Argument", argument = 190}, 				-- Left nagivation light (red)
					-- {typename = "Argument", argument = 191}, 				-- Right navigation light (green)
					-- {typename = "Argument", argument = 192}, 				-- White tail lights
					
					{	-- Port (left) side position light (red)
						typename = "Spot", position = { 1.602, 1.282, -19.075 },
						direction = {azimuth = math.rad(-90.0), elevation = math.rad(0)},
						proto = lamp_prototypes.BANO_7M_red, angle_max = math.rad(180.0),
						color = {1.0, 15/255, 0, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
					},
					{ 	-- Red omni for scattering off the fuselage
                        typename = "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position = { 1.602, 1.282, -19.075 },
						color = {1.0, 15/255, 0, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
						range = 3.0,
					},
					{	-- Starboard (right) side position light (green)
						typename = "Spot", position = { 1.602, 1.282, 19.075 },
						direction = {azimuth = math.rad(90.0), elevation = math.rad(0)},
						proto = lamp_prototypes.BANO_7M_green, angle_max = math.rad(180.0),
						color = {0.0, 1.0, 65/255, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
					},
					{ 	-- Green omni for scattering off the fuselage
                        typename = "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position = { 1.602, 1.282, 19.075 },
						color = {0.0, 1.0, 65/255, 0.12},
						power_up_t = 0.35, cool_down_t = 0.45,
						range = 3.0,
					},
					{	-- Aft white nav light
						typename = "Spot", position = { -18.183, 1.523, 0 },
						proto = lamp_prototypes.ANO_3_Bl,
						direction = {azimuth = math.rad(180.0)},
						angle_max = math.rad(165.0),
						power_up_t = 0.35, cool_down_t = 0.45,
					},
					{ 	-- White omni for scattering off the fuselage
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						position = { -18.183, 1.523, 0 },
						power_up_t = 0.35, cool_down_t = 0.45,
						range = 3.0,
					},
                },
            },
		},
	},
}
