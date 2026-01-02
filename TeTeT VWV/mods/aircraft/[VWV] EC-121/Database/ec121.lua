-- Lockheed EC-121 "Warning Star" (AEW&C)
-- Performance adjusted for Wright R-3350-34/42 Turbo-Compounds
-- Modified from L-1049G base
return
{
	Name 				= "vwv_ec-121",
	DisplayName			= _("[VWV] EC-121 Warning Star"),
	DisplayNameShort    = _("EC-121"),
	date_of_introduction= 1954.00, -- Introduction of military service
	HumanCockpit 		= false,

	Picture 			= current_mod_path..'/Textures/ec121_warning_star.png',
	Rate 				= 50, -- RewardPoint in Multiplayer (Higher value for AWACS HVAA)
	Shape 				= "ec121",
	WorldID             = WSTYPE_PLACEHOLDER,
	defFuelRatio    	= 0.5, 
	propellorShapeType  = "3ARG_PROC_BLUR",
    propellorShapeName  = "ec121_blade.fbx",
	
	shape_table_data 	=
	{
		{
			file  	 = "ec121";
			life  	 = 180; -- Increased structural health (military airframe)
			vis   	 = 3; 
			desrt    = "ec121_collision"; 
			fire  	 = { 500, 4}; 
			username = "vwv_ec-121";
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
	attribute = {wsType_Air, wsType_Airplane, wsType_Cruiser, WSTYPE_PLACEHOLDER, "AWACS", "All", "NonAndLightArmoredUnits", "NonArmoredUnits", "Air", "Planes"},
	Categories = { {
					-- CLSID = "{D2BC159C-5B7D-40cf-92CD-44DF3E99FAA9}",		-- I don't think these lines are needed.
					-- Name = "AWACS"
	} },


	-------------------------
	
	-- Corrected parameters for Lockheed EC-121 Warning Star
	
	-- WEIGHT PARAMETERS (kg)
	-- EC-121D Empty: ~80,600 lbs (36,560 kg) - Heavier due to radar/consoles
	-- EC-121D MTOW: 145,000 lbs (65,770 kg)

	M_empty = 36560,			-- Empty weight: ~36,560 kg / 80,600 lbs
	M_nominal = 58000,			-- Normal loaded: ~58,000 kg / 128,000 lbs
	M_max = 65770,				-- Max takeoff: ~65,770 kg / 145,000 lbs
	-- Max fuel increased for Tip Tanks (Total ~8,750 US Gal capacity potential, usually ~7,000 carried)
	M_fuel_max = 21000,			-- Max fuel: ~21,000 kg / 46,300 lbs 
	defFuelRatio = 0.6,			

	-- PERFORMANCE (EC-121 High Drag Configuration)
	-- Significant drag penalty from dorsal and ventral radomes
	H_max = 8230,				-- Service ceiling: ~27,000 ft (absolute ceiling, operational 20k)
	V_max_sea_level = 115,		-- Max speed SL: ~223 kts (Further reduced due to drag)
	V_max_h = 150,				-- Max speed altitude: ~290 kts / 335 mph
	V_opt = 115,				-- Cruise speed: ~223 kts / 255 mph (Loiter speed)
	V_take_off = 65,            -- Takeoff speed: ~126 kts (Heavier, increased from 120)
	V_land = 57,                -- Landing speed: ~111 kts (Increased slightly)
	CAS_min = 53,               -- Stall speed: ~103 kts (Increased from 99)
	Mach_max = 0.52,			-- Max Mach number
	range = 7400,				-- Max range: ~4,000 nm (reduced from 8,000 due to drag)
	Vy_max = 5.0,               -- Rate of climb: ~1,000 ft/min (Heavy & Draggy)

	-- ENGINE (4x Wright R-3350-34/42 Turbo-Compound)
	thrust_sum_max = 15500,     -- [kgf]
	thrust_sum_ab = 15500,      -- [kgf] 
	engines_count = 4,
	has_afteburner = false,
	has_speedbrake = false,
	has_thrustReverser = true,  
	average_fuel_consumption = 0.75,  -- Increased from 0.70 for military ops + drag
	
	-- AERODYNAMICS
	bank_angle_max = 25,   		-- Max bank angle (Reduced for stability/antenna stress)
	Ny_min = -0.5,         		
	Ny_max = 1.5,          		
	Ny_max_e = 2.5,        		-- Emergency G limit lower for heavy EC-121
	AOA_take_off = 0.14,   		

	-- DIMENSIONS
	wing_area = 153.7,     		
	wing_span = 38.47,     		
	length = 35.41,        		
	height = 7.54,         		-- Height to top of tail (Radomes add vertical profile)
	
	-- SENSORS
	RCS = 150, 					-- Radar Cross Section m^2 (Increased: Massive metal radomes)
	detection_range_max = 150, 	-- Max radar detection range (km)
	IR_emission_coeff = 1.3, 	
	IR_emission_coeff_ab = 0,
	radar_can_see_ground = false, -- Radar cannot detect ground moving targets
	
	-- STARTUP SEQUENCE
	engines_startup_sequence 	= { 2, 3, 1, 0 },
	engines_count				= 4, 
	sound_name					= "Aircrafts/Engines/RollsRoyceMerlin/Engine",

	wing_type 					= 0,
	wing_tip_pos 				= {-2.1478,	1.114, 18.5182}, 

	nose_gear_pos				= {14.6869, -3.483, 0},
	main_gear_pos 				= {1.6139, -3.6688, 4.1448},
	tand_gear_max				= math.tan(math.rad(60)),

	nose_gear_wheel_diameter 	= 0.755, 
	main_gear_wheel_diameter 	= 1.342, 
	
	stores_number				= 0,
	tanker_type 				= 0, 
	flaps_maneuver 				= 0.5, 
	brakeshute_name 			= 0, 
	is_tanker 					= false, 
	air_refuel_receptacle_pos 	= {0, 0, 0},
	
	

	-------------------------

	
	engines_nozzles = {
		[1] =
		{
			pos =     {4.0,  0, -9.0}, 
            elevation    		=   0.0, 
            diameter    		=   0.0, 
            exhaust_length_ab   =   2.25, 
            exhaust_length_ab_K =	0.607, 
            smokiness_level     =   0.1, -- Increased smoke for military R-3350s
			engine_number 		= 	1
		},
		[2] =
		{
			pos =     {4.55,  0, -4.2}, 
            elevation    		=	0.0, 
            diameter    		=	0.0, 
            exhaust_length_ab   =	2.25, 
            exhaust_length_ab_K =   0.607, 
            smokiness_level     =	0.1,
			engine_number 		= 	2
		},
		[3] =
		{
			pos =     {4.55,  0, 4.2}, 
            elevation    		=	0.0, 
            diameter    		=	0.0, 
            exhaust_length_ab   =	2.25, 
            exhaust_length_ab_K =	0.607, 
            smokiness_level     =	0.1,
			engine_number 		= 	3
		},
		[4] =
		{
			pos =     {4.0,  0, 9.0}, 
            elevation    		=	0.0, 
            diameter    		=	0.0, 
            exhaust_length_ab   =	2.25, 
            exhaust_length_ab_K =	0.607, 
            smokiness_level     =	0.1,
			engine_number 		= 	4
		},
	}, -- end of engines_nozzles
	
	
	
---------------------------------------------------------------------------------
--  Crew
---------------------------------------------------------------------------------
	-- EC-121 Crew was typically 18 to 31 depending on mission (2 Pilots, 2 Nav, 2 FE, Radio, ~20 Radar ops)
	-- DCS visual limits us, but we note the logic here.
	crew_size	 = 4,	-- Pilot, Co-Pilot, FE, Radar Officer (Generic logic)
	crew_members =
	{
			[1] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
				ejection_order   	= 1,
			}, 
			[2] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
				ejection_order   	= 2,
			}, 
			[3] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
				ejection_order   	= 3,
			},
            -- Added 4th logical seat for Radar Op
            [4] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65}, -- Placeholder pos
				ejection_order   	= 4,
			},
	}, 

	fires_pos =
	{
		[1] = 	{1.1, 1.7, 0.8},
		[2] = 	{1.1, 1.3, 0.9},
		[3] = 	{1.2, 1.2, 2.2},
		[4] = 	{1.2, 2.265, 2.3},
		[5] = 	{1.2, 2.5, 0},
		[6] = 	{1.2,	2.2, 0.5},
		[7] = 	{-7.3, 0.95, 0},
	}, 

	-- Countermeasures
	-- EC-121s did not typically carry flare/chaff dispensers in standard configs, 
    -- but late models (Vietnam era) operated in dangerous zones.
    -- Leaving at 0 for historical accuracy of the main fleet.
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0,
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0,
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,
	chaff_flare_dispenser 	=
	{
	}, 

	--sensors
	CanopyGeometry =
	{
		azimuth   = {-110.0, 110.0}, 
		elevation = {-30.0, 60.0} 
	},
    -- Added Generic Radar Definition for AI AWACS Logic
	Sensors = {
			RADAR = "AN/APY-1",
	},
	
	HumanRadio =
	{
		frequency = 127.5, 
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

    -- Updated Tasks for AWACS Role
	Tasks = {
		aircraft_task(AWACS),
		aircraft_task(Transport),
    },
	DefaultTask = aircraft_task(AWACS),

	SFM_Data = {
		aerodynamics = {
		
			-- AERODYNAMICS TABLE (EC-121 Warning Star)
			-- Adjusted for Large Radome Drag
			
			Cy0 = 0.02,		-- Increased from 0 to 0.02 (Cambered wing)
			Mzalfa = 6.6,
			Mzalfadt = 1.0,
			kjx = 2.95, 	-- Increased inertia moments for heavier airframe
			kjz = 0.00135,
			Czbe = -0.016, 	-- Directional stability
			cx_gear = 0.035,	
			cx_flap = 0.15,		
			cy_flap = 1.35,		
			cx_brk = 0.0,		
			
			
			table_data = {
				-- Cx0 increased ~35-40% over base L-1049G for massive radome drag
				-- Mach, Cx0,   Cya,   B,     B4,      Omxmax, Aldop, Cymax
				{0,    0.050, 0.088, 0.048, 0.00001, 0.5,    20,    1.32},
				{0.1,  0.050, 0.088, 0.048, 0.00001, 1.0,    20,    1.35},
				{0.15, 0.051, 0.089, 0.048, 0.00001, 1.5,    20,    1.37},
				{0.2,  0.052, 0.090, 0.049, 0.00001, 2.0,    20,    1.32},
				{0.25, 0.053, 0.091, 0.050, 0.00001, 2.5,    20,    1.32},
				{0.3,  0.055, 0.092, 0.051, 0.00001, 2.8,    20,    1.30},
				{0.35, 0.058, 0.093, 0.055, 0.00001, 3.0,    20,    1.28},
				{0.4,  0.063, 0.094, 0.062, 0.00001, 3.2,    20,    1.24},
				{0.45, 0.070, 0.095, 0.072, 0.001,   3.3,    20,    1.18},
				{0.5,  0.080, 0.096, 0.085, 0.005,   3.3,    20,    1.10},
				{0.55, 0.095, 0.096, 0.105, 0.02,    3.2,    19,    1.00},
				{0.6,  0.115, 0.095, 0.130, 0.05,    3.0,    18,    0.88},
	
			--[[ Less aggressive table for the drag increase
				-- Modified for EC-121 Drag Profile
                -- Cx0 (Drag) increased ~20% over L-1049G for radomes
				-- Mach, Cx0,   Cya,   B,     B4,   Omxmax, Aldop,  Cymax
				{0,    0.042, 0.088, 0.045, 0.00001, 0.5,    20,    1.25},
				{0.1,  0.042, 0.088, 0.045, 0.00001, 1.0,    20,    1.28},
				{0.15, 0.043, 0.089, 0.045, 0.00001, 1.5,    20,    1.30},
				{0.2,  0.043, 0.090, 0.046, 0.00001, 2.0,    20,    1.32},
				{0.25, 0.044, 0.091, 0.046, 0.00001, 2.5,    20,    1.32},
				{0.3,  0.045, 0.092, 0.047, 0.00001, 2.8,    20,    1.30},
				{0.35, 0.047, 0.093, 0.050, 0.00001, 3.0,    20,    1.28},
				{0.4,  0.051, 0.094, 0.055, 0.00001, 3.2,    20,    1.24},
				{0.45, 0.056, 0.095, 0.062, 0.001,   3.3,    20,    1.18},
				{0.5,  0.064, 0.096, 0.072, 0.005,   3.3,    20,    1.10},
				{0.55, 0.075, 0.096, 0.088, 0.02,    3.2,    19,    1.00},
				{0.6,  0.090, 0.095, 0.110, 0.05,    3.0,    18,    0.88},
			]]
			},
		},
		
		engine = {
			
			-- ENGINE TABLE (Wright R-3350-34/42 Turbo-Compound)
			-- Rated 3,400 HP Wet / 3,250 Dry
			-- Performance curve similar to civilian DA3, but usage differs
			
			
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
			dpdh_m = 4650,			 -- altitude coefficient for max thrust
			dpdh_f = 4650,			 -- altitude coefficient for max thrust
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
			-- POWER CURVE (Wright R-3350-34)
			-- Static boosted to realistic 38kN (3,400 HP)
			-- Curve steepened to match high-drag radome limit at speed
			-- Mach, Thrust (N) per engine
				{0.0,  38000},  -- Static (Wet Takeoff)
				{0.05, 36500},
				{0.1,  34200},
				{0.15, 31500},
				{0.2,  28500},  -- Climb power
				{0.25, 25200},
				{0.3,  21500},
				{0.35, 18000},  -- Cruise (Drag equilibrium)
				{0.4,  15100},  
				{0.45, 12500},
				{0.5,  9500},
				{0.6,  5000},
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
---  Damage Section (Unchanged from base mod logic)
-----------------------------------------------------------------------------------------------------

	Failures = {
	},

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

-- ============================================================
-- LIGHTS DEFINITION
-- ============================================================
-- See for proof of light positions: https://www.youtube.com/watch?v=totZ11dFvq0

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
						position = { 6.87, -1.47, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon",						-- Dorsal red beacon (top tip of central vertical stab)
						position = { -16.8178, 4.52, -0.01 },
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
						position = { 6.87, -1.47, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon",						-- Dorsal red beacon (top tip of central vertical stab)
						position = { -16.8178, 4.52, -0.01 },
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
