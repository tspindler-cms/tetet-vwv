-- Lockheed EC-121D "Warning Star" (AEW&C)
-- Performance adjusted for Wright R-3350-34/42 Turbo-Compounds
-- Modified from L-1049G base
return
{
	Name					= "vwv_ec-121",
	DisplayName				= _("[VWV] EC-121D Warning Star"),
	DisplayNameShort		= _("EC-121"),
	date_of_introduction	= 1954.00,							-- Introduction of military service
	HumanCockpit			= false,

	Picture					= current_mod_path..'/Textures/ec121_warning_star.png',
	Rate					= 50,								-- RewardPoint in Multiplayer (Higher value for AWACS HVAA)
	Shape					= "ec121",
	WorldID					= WSTYPE_PLACEHOLDER,
	propellorShapeType		= "3ARG_PROC_BLUR",
	propellorShapeName		= "ec121_blade.fbx",
	country_of_origin		= "USA",
	
	shape_table_data 		= {
		{
			file			= "ec121";
			life			= 180;								-- Increased structural health (military airframe)
			vis				= 3; 
			desrt			= "ec121_collision"; 
			fire			= { 500, 4}; 						-- [s], [m] Fire on the ground after destoyed: 500sec 4m
			username		= "vwv_ec-121";
			index			= WSTYPE_PLACEHOLDER;
			classname		= "lLandPlane";
			positioning		= "BYNORMAL";
			drawonmap		= true;
		},
		{
			name			= "ec121_collision";
			file			= "ec121_collision";
			fire			= { 500, 4};
		},
	},
	
	mapclasskey				= "P0091000056",
	attribute				= {wsType_Air, wsType_Airplane, wsType_Cruiser, WSTYPE_PLACEHOLDER, "AWACS", "All", "NonAndLightArmoredUnits", "NonArmoredUnits", "Air", "Planes"},
	Categories				= {
		{
			CLSID = "{D2BC159C-5B7D-40cf-92CD-44DF3E99FAA9}",	-- I don't think these lines are needed.
			Name = "AWACS",
		},
	},


	-- WEIGHT PARAMETERS

	M_empty					= 34000,							-- [kg] Empty weight: ~34,000 kg / 75,000 lbs
	M_nominal				= 58000,							-- [kg] Normal loaded: ~58,000 kg / 128,000 lbs
	M_max					= 65770,							-- [kg] Max takeoff: ~65,770 kg / 145,000 lbs
	M_fuel_max				= 21000,							-- [kg] Max fuel: ~21,000 kg / 46,300 lbs 
	defFuelRatio			= 0.6,								-- Spawn with 60% fuel by default

	-- PERFORMANCE (EC-121 High Drag Configuration)
	-- Significant drag penalty from dorsal and ventral radomes
	H_max					= 7620,								-- [m] Service ceiling: ~25,000 ft (absolute ceiling, operational 20k)
	V_max_sea_level			= 108,								-- [m/s TAS] Max speed SL: ~210 kts
	V_max_h					= 133.6,							-- [m/s TAS] Max speed altitude: ~481 kph / ~260 kts / 255 mph
	V_opt					= 113.9,							-- [m/s TAS] Cruise speed: ~410 kph / ~222 kts / 255 mph
	V_take_off				= 67,								-- [m/s TAS] Takeoff speed: ~130 kts 
	V_land					= 64,								-- [m/s TAS] Approach speed: ~125 kts
	CAS_min					= 54.5,								-- [m/s TAS] Stall speed (clean/idle): ~106 kts
	Mach_max				= 0.45,								-- [Mach] Max Mach number (MMO) - limited by radomes
	range					= 6843,								-- [km] Max range: ~4,250 nm
	Vy_max					= 4.87,								-- [m/s TAS] Rate of climb: ~960 ft/min

	-- ENGINE (4x Wright R-3350-34/42 Turbo-Compound)
	thrust_sum_max			= 15500,							-- [kgf] Total thrust from all 4 engines
	thrust_sum_ab			= 15500,							-- [kgf] 
	engines_count			= 4,								-- [#] Number of engines
	has_afteburner			= false,
	has_speedbrake			= false,
	has_thrustReverser		= true,  
	average_fuel_consumption= 0.56,								-- [kg/s] Average total fuel consumption at cruise
	
	-- AERODYNAMICS
	bank_angle_max			= 25,								-- [deg] Max bank angle (Reduced for stability/antenna stress)
	Ny_max					= 2.5,								-- [G] Positive G limit - Structural Design Limit
	Ny_min					= -1.0,								-- [G] Negative G limit
	Ny_max_e				= 3.0,								-- [G] Emergency G limit - Structural Yield Point (Bend/Break territory)
	AOA_take_off			= math.rad(8.5),					-- [rad] Takeoff rotation angle
	center_of_mass 			= {2.0, -0.65, 0.0},				-- [m] Center of mass coordinates
	moment_of_inertia	= {2.65e6, 7.2e6, 5.1e6},				-- [kg*m^2] {Roll, Yaw, Pitch}

	-- DIMENSIONS
	wing_area				= 153.7,							-- [m^2] Wing area: 1,654 sq ft
	wing_span				= 38.47,							-- [m] Wing span: 126 ft 2 in
	length					= 35.41,							-- [m] Length: 116 ft 2 in
	height					= 7.54,								-- [m] Height: 24 ft 9 in
	
	-- SENSORS
	RCS						= 150,								-- [m^2] Radar Cross Section m^2 (Increased: Massive metal radomes)
	detection_range_max		= 150,								-- [km] Max radar detection range
	IR_emission_coeff		= 4.4,								-- [proportion] Su-27 ~ 400 W/steradian; EC-121D ~1750 W/sr (all-aspect)
	IR_emission_coeff_ab	= 0,
	radar_can_see_ground	= false,							-- Radar cannot detect ground moving targets
	
	-- ENGINES
	sound_name				= "Aircrafts/Engines/PrattWhitneyR2800/Engine",

	wing_type				= 0,
	wing_tip_pos			= {-2.1478,	1.114, 18.5182}, 		-- [m] wingtip coords for visual effects

	nose_gear_pos			= {14.6869, -3.483, 0},
	main_gear_pos			= {1.6139, -3.65, 4.1448},
	tand_gear_max			= math.tan(math.rad(60)),			-- [tan] Maximum nosewheel steering angle

	nose_gear_wheel_diameter= 0.755,							-- [m] Nose wheel diameter
	main_gear_wheel_diameter= 1.342,							-- [m] Main gear wheel diameter
	
	stores_number			= 0,
	tanker_type				= 0,
	flaps_maneuver			= 0.6,								-- For the Lockheed L-1049G "Super G" Constellation, the standard flaps position for takeoff was 60% (https://www.thisdayinaviation.com/tag/lockheed-l1049h-super-constellation)
	brakeshute_name			= 0,
	is_tanker				= false,
	
	engines_startup_sequence	= { 2, 3, 1, 0 },
	engines_nozzles = {
		[1] = {	-- Port outboard (8 o'clock from rear)
			pos			= {3.94,  -0.815, -9.858},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 1
		},
		[2] = {	-- Port outboard (4 o'clock from rear)
			pos			= {3.91,  -0.732, -8.21},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 1
		},
		[3] = {	-- Port outboard (11 o'clock from rear)
			pos			= {3.93,  0.278, -9.665},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 1
		},
		[4] = {	-- Port inboard (8 o'clock from rear)
			pos			= {4.49,  -1.265, -4.966},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 2
		},
		[5] = {	-- Port inboard (4 o'clock from rear)
			pos			= {4.49,  -1.21, -3.31},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 2
		},
		[6] = {	-- Port inboard (11 o'clock from rear)
			pos			= {4.53,  -0.215, -4.725},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 2
		},
		[7] = {	-- Starboard inboard (8 o'clock from rear)
			pos			= {4.51,  -1.181, 3.295},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 3
		},
		[8] = {	-- Starboard inboard (4 o'clock from rear)
			pos			= {4.50,  -1.265, 4.975},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 3
		},
		[9] = {	-- Starboard inboard (11 o'clock from rear)
			pos			= {4.52,  -0.225, 4.715},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 3
		},
		[10] = {	-- Starboard outboard (8 o'clock from rear)
			pos			= {3.915,  -0.732, 8.21},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 4
		},
		[11] = {	-- Starboard outboard (4 o'clock from rear)
			pos			= {3.94,  -0.813, 9.857},	-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 4
		},
		[12] = {	-- Starboard outboard (11 o'clock from rear)
			pos			= {3.91,  0.299, 9.62},		-- [m] nozzle coords forward/back,up/down,left/right
			elevation			= 0.0,				-- [rad] AFB cone elevation
			diameter			= 0.14,				-- [m] AFB cone diameter
			exhaust_length_ab	= 2.25,				-- [m] length in m
			exhaust_length_ab_K	= 0.607,			-- AB animation
			smokiness_level		= 0.07,				-- Increased smoke for military engines
			engine_number		= 4
		},
	}, -- end of engines_nozzles
	
	
	
---------------------------------------------------------------------------------
--  Crew
---------------------------------------------------------------------------------
	-- EC-121 Crew was typically 18 to 31 depending on mission (2 Pilots, 2 Nav, 2 FE, Radio, ~20 Radar ops)
	crew_size				= 25,
	crew_members = {
			[1] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 1,
			}, 
			[2] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 2,
			}, 
			[3] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 3,
			},
			[4] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 4,
			},
			[5] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 5,
			},
			[6] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 6,
			},
			[7] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 7,
			},
			[8] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 8,
			},
			[9] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 9,
			},
			[10] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 10,
			},
			[11] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 11,
			},
			[12] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 12,
			},
			[13] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 13,
			},
			[14] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 14,
			},
			[15] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 15,
			},
			[16] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 16,
			},
			[17] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 17,
			},
			[18] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 18,
			},
			[19] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 19,
			},
			[20] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 20,
			},
			[21] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 20,
			},
			[22] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 20,
			},
			[23] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 20,
			},
			[24] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 20,
			},
			[25] =
			{
				pilot_name			= "pilot_p51",
				ejection_seat_name	= 0,
				drop_canopy_name	= 0,
				pos					= {3.2,	0.2,	-0.65},
				ejection_order		= 20,
			},
	},

	fires_pos =
	{
		[1] = 	{1.1, 1.7, 0.8},
		[2] = 	{1.1, 1.3, 0.9},
		[3] = 	{1.2, 1.2, 2.2},
		[4] = 	{1.2, 2.265, 2.3},
		[5] = 	{1.2, 2.5, 0},
		[6] = 	{1.2, 2.2, 0.5},
		[7] = 	{-7.3, 0.95, 0},
	}, 

	-- Countermeasures
	-- EC-121s did not typically carry flare/chaff dispensers in standard configs, 
	-- but late models (Vietnam era) operated in dangerous zones.
	-- Leaving at 0 for historical accuracy of the main fleet.
	SingleChargeTotal		= 0,
	CMDS_Incrementation		= 0,
	ChaffDefault			= 0,
	ChaffChargeSize			= 0,
	FlareDefault			= 0,
	FlareChargeSize			= 0,
	CMDS_Edit				= false,
	chaff_flare_dispenser	= {}, 

	--sensors
	CanopyGeometry =
	{
		azimuth				= {-110.0, 110.0}, 
		elevation			= {-30.0, 60.0} 
	},
	-- Added Generic Radar Definition for AI AWACS Logic
	Sensors = {
		RADAR				= "AN/APY-1",
	},
	
	HumanRadio = {
		frequency				= 127.5,			-- [MHz] Radio Freq
		editable				= true,
		minFrequency			= 118.000,
		maxFrequency			= 137.000,
		modulation				= MODULATION_AM
	},

	Guns = { },

	Pylons =  { },

	-- Updated Tasks for AWACS Role
	Tasks = {
		aircraft_task(AWACS),
		aircraft_task(Transport),
	},
	DefaultTask				= aircraft_task(AWACS),

	SFM_Data = {
		aerodynamics = {
			-- LOCKHEED EC-121 AERODYNAMICS (Fixed for 11.4 deg AoA Trap)
			Cy0					= 0.25,		-- Zero AoA lift coefficient: high camber NACA 23018 (root) and NACA 4412 (tip) airfoils
			Mzalfa				= 6.6,		-- Pitch stability
			Mzalfadt			= 1.3,		-- Pitch damping
			kjx					= 1.8,		-- Roll inertia
			kjz					= 0.6,		-- Pitch inertia
			Czbe				= -0.16,	-- Directional stability

			-- Drag & Lift Coefficients
			cx_gear				= 0.050,	-- Gear drag
			cx_flap				= 0.14,		-- Flap drag
			cy_flap				= 1.475,	-- Flap lift
			cx_brk				= 0.0,		-- No airbrakes on L-1049G

			table_data = {
				-- Mach, Cx0,   Cya,   B,     B4,   Omxmax, Aldop,  Cymax
				{0,    0.044, 0.085, 0.045, 0.0001, 0.4,    20,    1.95},
				{0.1,  0.044, 0.095, 0.045, 0.0001, 0.4,    20,    1.90},
				{0.2,  0.045, 0.095, 0.046, 0.0001, 0.4,    20,    1.60},
				{0.3,  0.048, 0.085, 0.047, 0.0001, 0.5,    20,    1.40}, 
				{0.4,  0.055, 0.085, 0.055, 0.0001, 0.5,    20,    1.24}, -- Cruise Drag: significantly higher
				{0.45, 0.065, 0.085, 0.062, 0.001,  0.5,    20,    1.18}, -- Drag wall starts earlier
				{0.5,  0.080, 0.085, 0.072, 0.005,  0.4,    20,    1.10}, 
				{0.6,  0.120, 0.085, 0.110, 0.05,   0.2,    18,    0.88},
			},
		},
		
		engine = {
			-- ENGINE TABLE (Wright R-3350-34/42 Turbo-Compound)
			-- Rated 3,400 HP
			
			type				= "Radial",
			typeng				= 2,
			name				= "PrattWhitneyR2800",			-- used to determine sounds
			
			-- Wright R-3350-34 Duplex-Cyclone Specs
			Nominal_RPM			= 2900,		-- [RPM] Takeoff RPM is 2,900 for Super G
			Nmg					= 20.68,	-- [%] Idle ~600 RPM / 2900 = ~20.7%
			Displ				= 54.8475,	-- [l] 3,347 cubic inches total displacement (units: liters)
			Stroke				= 0.160,	-- [m] 6.3125 inch stroke (meters)
			N_indic_0			= 2535380,		-- [W] Indicated power (3,400 hp = ~2.53 MW)
			V_pist_0			= 18,		-- Number of pistons/cylinders (whole number)
			cylinder_firing_order	= {1,12,5,16,9,2,13,6,17,10,3,14,7,18,11,4,15,8},
			
			-- Hamilton Standard 43H60 Propeller (16' 10" diameter) with 3x 6959A-0 hollow steel blades
			Init_Mom			= 1220,		-- [N*m] Starting torque (Clutch limit ~900 ft-lbs)
			D_prop				= 5.13,		-- [m] 16ft 10in diameter props (Hamilton Standard 16ft 10in Propeller)
			MOI_prop			= 560,		-- [kg*m^2] Propeller moment of inertia (for 16' 10" Hamilton Standard 43H60 w/ Hollow Steel Blades)
			k_gearbox			= 16/7,		-- [ratio] Engine/propeller gearbox ratio (inverse of reduction ratio; never less than 1.0 in DCS)
			prop_blades_count	= 3,		-- [#] Blades per engine
			prop_direction		= 1,		-- +1 for CCW when viewed from front, -1 for CW when viewed from front
			prop_pitch_min		= -16.0,	-- [deg] prop pitch min, degrees (negative allows for reverse thrust)
			prop_pitch_max		= 65.0,		-- [deg] prop pitch max, degrees 
			prop_pitch_feather	= 83.0,		-- [deg] prop pitch feather position, degrees if feather < prop_pitch_max no feathering available
			prop_locations = {
				{5.9, -0.37, -9.09}, {0.0, 0.0, 0.0},	-- Engine 1 (outboard port)
				{6.5, -0.85, -4.12}, {0.0, 0.0, 0.0},	-- Engine 2 (inboard port)
				{6.5, -0.85,  4.12}, {0.0, 0.0, 0.0},	-- Engine 3 (inboard starboard)
				{5.9, -0.37,  9.09}, {0.0, 0.0, 0.0},	-- Engine 4 (outboard starboard)
			},
			
			-- Engine performance (https://www.youtube.com/watch?v=1j9164wb6TE)
			hMaxEng				= 6.28,		-- [km] Engine critical altitude (20,600 ft)
			dcx_eng				= 0.013,	-- Engine drag coefficient
			cemax				= 0.42,		-- [kg/s] Max fuel consumption per engine
			cefor				= 0.42,		-- [kg/s] Afterburner fuel consumption per engine
			
			-- Thrust/Power Lapse
            -- Note: The type = "Piston" engine model in DCS uses the hMaxEng,
			-- MAX_Manifold_P, and k_boost parameters to calculate performance
			-- at altitude. Setting dpdh_m to 0 prevents the "simple" linear
			-- decay from overriding the complex piston physics
			dpdh_m				= 0,		-- set to zero so piston parameters are not overridden
			dpdh_f				= 0,		-- altitude coefficient for max thrust
			
			MAX_Manifold_P_1	= 149000,	-- [Pa] Manifold pressure for max continuous cruise (aka METO) (44.0 inHg)
			MAX_Manifold_P_2	= 176092,	-- [Pa] Manifold pressure for dry takeoff (52.0 inHg)
			MAX_Manifold_P_3	= 201490,	-- [Pa] Manifold pressure for wet takeoff or war emergency power (59.5 inHg)
			
			
			k_adiab_1			= 0.026,	-- Adiabatic efficiency (low blower)
			k_adiab_2			= 0.043,	-- Adiabatic efficiency (high blower)
										--[[	Real-World Equivalent: Compressor Adiabatic Efficiency (η_c​).

												Definition: Defines how much heat is added to the air during compression.
												_1 and _2 likely refer to the different supercharger gears
												(Low Blower / High Blower).

												Reality Check: Compressing air heats it up. Hotter air is less dense
												(less power) and causes detonation. A value closer to 1.0 implies a
												very efficient blower that adds minimal excess heat.
											]]
			
			k_after_cool		= 0.49,		-- [proportion] Intercooler/aftercooler effectiveness or efficiency 
											-- 		(% heat removed from air before entering cylinders)
										--[[	Reality Check: Crucial for high-altitude performance. If this value is low,
												the engine will overheat or detonate at high power settings (common in
												early war aircraft like the Spitfire V vs. the intercooled Spitfire IX).
											]]
												
			k_Eps				= 6.70,		-- [ratio] 	Cylinder compression ratio
											-- 			(volume ratio from bottom dead center to top dead center)
										--[[	Real-World Equivalent: Compression Ratio (ϵ).

												Definition: The ratio of the cylinder volume at bottom dead center to top
												dead center (e.g., 6.0:1 or 8.5:1).

												Reality Check: Higher k_Eps yields higher thermal efficiency (more power)
												but increases the risk of detonation (knocking), requiring higher octane fuel.
												This parameter directly feeds the thermal efficiency equation:
											
															η = 1 − ( 1 / ϵ^(γ−1) )​
											]]

			-- Engine Power/Torque multipliers
			Nu_0				= 1.00,		-- "Static Displacement" Factor (see [3] below)
			Nu_1				= 0.82,		-- "Turbo Boost" Factor (see [3] below)
			Nu_2				= 0.0022,	-- "High Speed Loss" Factor (see [3] below)
										--[[	Based on the comprehensive reverse-engineering and validation against
												official DCS modules (P-47, B-17, FW-190), here is the technical
												documentation for the Nu parameters within the DCS Standard Flight
												Model (SFM) Piston Engine (typeng = 2).
												
												1. Executive Summary

												In the DCS Standard Flight Model (SFM) for Piston Engines (typeng = 2),
												the Nu coefficients are Power/Torque Multipliers. They do not define
												propeller drag or efficiency in the traditional aerodynamic sense.

												They function as a transfer function that converts the raw
												"Thrust Potential" defined in the thrust table_data into the actual
												"Effective Thrust" applied to the airframe, based on RPM and Speed.
											
												2. The Equation (Conceptual)

												The physics engine calculates the final thrust vector roughly using
												this logic:
												
												Thrust_final​ = TableVal[M] * ( Nu_0 ​+ (Nu_ 1​ * RPM%​) − (Nu_2 * M^2) )

													M: Current airspeed (in Mach).
													
													TableVal: The raw force (Newtons) from your table_data at M.

													RPM%: Engine speed proportion (0.0 to 1.0).
										
												3. Parameter Definitions
												
												Nu_0: The "Static Displacement" Factor

													What it represents: The engine's Base Volumetric Efficiency or
																		Static Torque.

													Physical Analogy: 	Think of this as the size of the cylinders
																		(displacement). A big 520 cu in engine has
																		high "grunt" even at low RPM.

													Behavior:

														Higher Value (e.g., 2.0): Provides massive static pull.
														Essential for getting high-drag airframes moving on the runway.

														Lower Value (e.g., 1.2): Standard for low-drag airframes (Warbirds).

													Symptom of Tuning: 	If your plane is stuck at 16 knots on the runway
																		despite full throttle, then increase Nu_0.

												Nu_1: The "Turbo Boost" Factor (Linear)

													What it represents:	The Slope of the Power Curve. It defines how
																		much extra torque is generated as RPM increases.

													Physical Analogy: 	In a Turbocharged engine, this represents the
																		Boost Curve. As RPM rises, the turbo spins faster,
																		manifold pressure increases, and torque spikes
																		non-linearly.

													Behavior:

														High Value (e.g., 2.5): Simulates a high-boost turbocharger.
														Power output skyrockets at high RPM (2700), allowing the plane
														to push through high drag to reach cruise speeds (170 kts).

														Low Value (e.g., 0.75): Simulates a naturally aspirated or
														"choked" engine. Power flattens out early.

													Symptom of Tuning: 	If your plane accelerates well initially but hits
																		a "wall" at 97 knots (cruise speed too low),
																		then increase Nu_1.

												Nu_2: The "High Speed Loss" Factor (Quadratic)

													What it represents: Efficiency Loss due to compressibility or backpressure.

													Physical Analogy: 	Propeller tips hitting supersonic speeds (Mach 0.9+)
																		or intake choking.

													Behavior:

														0.0: 	No penalty. Ideal for General Aviation aircraft where prop tips
																stay subsonic.

														>0.002:	Adds a "Drag Wall" at high speeds. Used for WW2 fighters to
																prevent them from exceeding V_ne in a dive.

													Symptom of Tuning:	If your plane is overspeeding at altitude
																		(e.g., doing 300 kts when it should do 170),
																		then increase Nu_2.
												
												4. Visualizing the Curve

												To better understand Nu_1, imagine a graph of Thrust vs. RPM:

													Low Nu_1 (0.75):	The line is shallow. At 100% RPM, you only get ~75%
																		of the table's potential thrust.

													High Nu_1 (2.5):	The line is steep. At 100% RPM, you get 250% of the
																		table's potential thrust. (This is how we simulate
																		the massive power jump of a TSIO-520 turbo system).
												
												
												5. Summary Table for Modders
												
												  Parameter	   Function							Tuning Goal
												    -----	-----------------	--------------------------------------------
													Nu_0	Static Multiplier	Fixes "Stuck on Runway" / Taxi issues.
													Nu_1	RPM Multiplier		Fixes "Low Top Speed" / Simulates Turbo Boost.
													Nu_2	Drag Penalty		Fixes "Overspeeding" / Simulates Prop Drag.
										
										
												6. Why This Matters for the Cessna P210N

												Because the DCS SFM calculates airframe drag conservatively (often higher than
												reality for light aircraft), we use Nu_1 = 2.5 to force the engine to output
												the raw horsepower needed to overcome that drag and match the real-world
												cruise speed of 168 KTAS.
											]]
			
			N_fr_0				= 0.080,		-- Static Friction Coefficient (The "Stiction" Factor)
			N_fr_1				= 0.040,		-- Dynamic Friction Coefficient (The "Viscosity" Factor)
											--[[	Based on the analysis of the engine definition files for the P-51D,
													Spitfire, and B-17G, here is the technical explanation of N_fr_0 and N_fr_1.
													
													The "N_fr" Parameters: Engine Friction Coefficients

													In the DCS Standard Flight Model (SFM) Piston Engine (typeng = 2), the
													variables N_fr_0 and N_fr_1 parameterize the Mechanical Friction Power
													Loss of the engine.

													They represent the power consumed by the engine itself to turn its own
													internal components (pistons, crankshaft, valvetrain, accessories) before
													any power is delivered to the propeller shaft.
													
													
													1. The Formula (Conceptual)

													DCS calculates the Shaft Horsepower (SHP) available to the propeller
													using a formula similar to this:
													
																	N_shaft​ = N_indicated​ − N_friction​

													Where Friction Power (N_friction​) is calculated using N_indic_0
													(Reference Power) as a scalar:
													
															N_friction ​= N_indic_0​ * ( N_fr_0​ + (N_fr_1​ * RPM​%) )

														N_indic_0:	The engine's reference maximum Indicated Power
																	(in Watts). For the P-51D, this is
																	1,023,040 W (~1,370 HP).

														RPM%: 		Current RPM expressed as a proportion (0.0 to 1.0).
														
													
													2. Parameter Definitions
													
													N_fr_0:	Static Friction Coefficient (The "Stiction" Factor)

														What it represents:	The constant baseline friction present regardless
																			of RPM. This includes seal drag, oil viscosity
																			resistance at low speed, and the basic effort
																			required to turn the assembly.

														Effect in Simulation:

															Startup:	Determines how much torque the starter motor needs
																		to overcome to begin turning the engine. If this is
																		too high, the prop will twitch but not spin.

															Idle: 		Sets the "floor" for fuel consumption/manifold pressure
																		required to keep the engine running.

														Typical Values:

															0.072:	Standard for WWII Warbirds (P-51, Spitfire, B-17).

															0.045:	Typical for modern, lighter General Aviation engines
																	(like the Cessna 210).

													N_fr_1:	Dynamic Friction Coefficient (The "Viscosity" Factor)

														What it represents:	The linear increase in friction as RPM rises.
																			As the engine spins faster, pumping losses,
																			oil shear, and piston ring friction increase.

														Effect in Simulation:

															RPM Decay:	Determines how quickly the RPM drops when you chop
																		the throttle. High N_fr_1 makes the engine decelerate
																		aggressively (high compression braking).

															Top Speed Efficiency: At max RPM, this subtracts from your total power.

														Typical Values:

															0.02:	Standard for WWII Warbirds.

															0.01:	Typical for modern GA engines.
														
													
													3. Behind the Scenes: How DCS Uses It

													The "Idle" Equilibrium: When you pull the throttle to idle, the engine
													produces just enough Indicated Power (from combustion) to match the
													Friction Power (N_fr_0 + N_fr_1​).

														If N_fr is too high:
														The engine will die at idle because friction > combustion power.

														If N_fr is too low:
														The engine will "hang" at high RPM and take forever to spin down.

													Windmilling & Propeller Drag: 
														If the engine fails or is shut down in flight, these coefficients
														determine the resistance the airstream fights against to windmill
														the prop.

														High friction values =	Prop stops spinning sooner / creates
																				more drag if not feathered.

													Mechanical Efficiency Calculation:
														By summing these values, you can determine the modeled mechanical
														efficiency at 100% RPM.

														Warbird Example: 0.072 + 0.02 = 0.092 (9.2% Friction Loss).

														Result:	The engine is ~91% efficient mechanically, which is
																realistic for high-performance piston engines.


													Summary for Modders

														Increase N_fr_0 if:
															Your engine takes too long to stop after shutdown or
															idles too fast.

														Decrease N_fr_0 if:
															Your starter motor can't turn the prop.

														Increase N_fr_1 if:
															The RPM doesn't drop fast enough when you cut the throttle
															in the air.
												]]
			
			P_oil				= 482633,	-- [Pa] Oil pressure (70 psi +/- 5) 
			k_boost				= 3.0,		-- Supercharger boost factor/Boost scaling
										--[[	Real-World Equivalent: Charge density scalar.

												Definition: Likely a coefficient linking Manifold Pressure to actual
												air mass entering the cylinder (Volumetric Efficiency scalar).
												That is, how many times ambient pressure is the turbocharger
												capable of providing to the piston cylinders.]]
			k_cfug				= 0.003,	-- [coeff] Supercharger Centrifugal Compressor Pressure Rise
										--[[	Real-World Equivalent: Centrifugal Compressor Pressure Rise
												(proportional to RPM^2).

												Definition: Defines how much pressure the supercharger impeller
												generates based on its rotational speed.

												Reality Check: Centrifugal superchargers (like in the P-51 or F4U)
												generate boost exponentially with RPM. A higher k_cfug means the
												supercharger builds boost much faster as RPM climbs.
												
												Turbocharger: Unlike the centrifugal superchargers in WWII planes
												(where boost rises with RPM^2), the TSIO-520 uses a wastegate turbo.
												Set this to 0 or very low, and rely on MAX_Manifold_P limits to
												simulate the wastegate holding pressure constant.
											]]
			k_oil				= 3e-5,		-- Oil Drag/Viscocity factor
										--[[	Real-World Equivalent: Oil Shearing resistance.

												Definition: Likely models the parasitic loss caused by the oil pump
												and the viscosity of the oil, which changes with temperature.
											]]
			k_piston			= 3000,		-- Indicated Mean Effective Pressure (IMEP) scaler
										--[[	Real-World Equivalent: Mean Piston Speed or Indicated Mean Effective
												Pressure (IMEP) scaler.

												Definition: This likely scales the efficiency of the combustion cycle
												relative to the physical speed of the pistons.

												Reality Check: As piston speed increases, volumetric efficiency usually drops
												(less time to fill the cylinder). This parameter helps define the
												"torque peak" of the engine.
											]]
			k_reg				= 1e-5,		-- Regulator Gain/Response
										--[[	The "k_reg" Parameter: Manifold Pressure Regulator Gain

												In the DCS Standard Flight Model (SFM) Piston Engine (typeng = 2),
												k_reg (Coefficient of Regulation) defines the sensitivity and speed of the
												automatic boost regulator (wastegate controller) or the constant-speed
												propeller governor.

												It essentially sets the "Gain" (K) in the feedback loop that attempts to
												keep the Manifold Pressure (MP) or RPM constant as altitude and airspeed
												change.
												
												1. How It Works Behind the Scenes

												The engine simulation runs a continuous control loop (likely at 10 Hz or
												similar) to manage the turbocharger wastegate or throttle butterfly
												position.

												The Control Logic:

													Calculate Error:  The system compares the Target Pressure (set by the
																	  throttle lever position and MAX_Manifold_P) against
																	  the Current Pressure (what the engine is actually
																	  producing).
													
																	Error = Target_MP ​ − Current_MP​

													Apply Correction: The system calculates how much to open or close
																	  the wastegate/throttle to fix this error.
																	  
																	Correction Rate = Error * k_reg

													Update State:	  The actuator moves at this calculated rate.

													If k_reg is High: The actuator moves fast to correct small errors.

													If k_reg is Low:  The actuator moves slowly, taking its time to
																	  correct errors.
												
												2. Tuning Symptoms

												You can determine if your k_reg is wrong by observing the Manifold Pressure
												gauge during two specific maneuvers: Level Flight at Altitude and Rapid
												Throttle Changes.
												
												Scenario A: The Value is Too High (Over-Sensitive)

													Symptom: "Hunting" / Oscillation.

													Observation: You are flying level at 15,000 ft. You see the Manifold Pressure
													needle (and RPM) wobbling back and forth (e.g., 35" → 37" → 34" → 36").
													The engine sounds like it is "surging" (revving up and down rhythmically).

													Why: The regulator sees a 1" drop, panics, and slams the wastegate shut.
													The pressure spikes to +2". The regulator sees the spike, panics, and slams
													the wastegate open. It never settles.

													Fix: Lower k_reg.

												Scenario B: The Value is Too Low (Lazy)

													Symptom: "Droop" / Lag.

													Observation: You slam the throttle forward for takeoff. The Manifold Pressure
													rises sluggishly and takes 5–6 seconds to reach the redline. Or, as you climb,
													the Manifold Pressure slowly drifts downward, and the turbo can't seem to
													"keep up" with the thinning air.

													Why: The regulator sees the error, but the correction signal is so weak that
													the wastegate closes too slowly to catch up with the changing conditions.

													Fix: Increase k_reg.

												3. Empirical Tuning Procedure

												To tune this perfectly for a mod like the Cessna P210N, follow this test flight
												procedure:

													The "Slam" Test (Response Time):

														Setup: Fly at Sea Level, low power (20" MP).

														Action: Rapidly advance throttle to full.

														Ideal: The needle should shoot up and stop exactly at 36.5" instantly.

														Too High: The needle shoots past 36.5" to 40" (Overshoot), then drops back.

														Too Low: The needle crawls up and takes seconds to stabilize.

													The "Cruise" Test (Stability):

														Setup: Fly at Critical Altitude (e.g., 20,000 ft).

														Action: Set cruise power and wait.

														Ideal: The needle is rock solid.

														Too High: The needle wanders or oscillates (The "Hunting" you experienced).
												
												
												Summary:
												
														Parameter		Definition			Tuning Direction
														---------		----------			----------------
														
														k_reg			Regulator Gain		Hunting?  Decrease value.

																							Laggy?    Increase value.
											]]
			k_vel				= 0.017,	-- Ram Air Recovery factor
										--[[	Real-World Equivalent: Intake Ram Recovery Ratio.

												Definition: How effectively the aircraft speed (V) increases the
												air pressure at the supercharger intake (Ram Effect).

												Reality Check: At 400 mph, a well-designed intake (like the P-51's
												underbelly scoop) provides significant "free boost" simply from the
												air rushing in. A high k_vel models a highly efficient scoop.
											]]
			
			Startup_Prework		= 14.0,		-- [s]
			Startup_Ignition_Time	= 6.0,	-- [s]
			Shutdown_Duration	= 18.0,		-- [s]
			Startup_RPMs		= {
				{0.0, 0},
				{1.0, 40},    -- Initial turnover
				{3.0, 60},    -- Cranking speed
				{3.5, 120},   -- Ignition/First catch
				{4.5, 350},   -- Engine accelerating
				{6.0, 600}    -- Stabilized Idle (Matches Nmg)
			},
			
			MinRUD				= 0,
			MaxRUD				= 1,
			MaksRUD				= 1,
			ForsRUD				= 1,
	
			table_data = {
				-- POWER CURVE (Wright R-3350-34/42 Turbo-Compounds)
				--  Mach, Thrust (N) TOTAL
					{0.0,  151240},  -- [N] Static: Exact 34,000 lbf
					{0.05, 144430},
					{0.1,  136060},
					{0.15, 127685},
					{0.2,  120360},  -- [N] Climb entry
					{0.25, 104660},
					{0.3,   85820},
					{0.35,  73260},
					{0.4,   63840},  -- [N] Cruise
					{0.45,  54420},
					{0.5,   47100},  -- [N] V_max region
					{0.55,  35580},
					{0.6,   25120},
			},
		},
	},
	
----------------------------------------------------------------------------------------------------
---  Damage Section (Unchanged from base mod logic)
-----------------------------------------------------------------------------------------------------

	Failures = { },

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
		["wheel_front"]			= {critical_damage = 1},
		["wheel_left"]			= {critical_damage = 1},
		["wheel_right"]			= {critical_damage = 1},
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
						typename	= "Spot", position = { 14.72, -2.216,  0.189 },
						direction	= {azimuth = math.rad(0.0), elevation = math.rad(5.0)},
						proto		= lamp_prototypes.LFS_P_27_450, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					{
						typename	= "Spot", position = { 14.72, -2.216, -0.194 },
						direction	= {azimuth = math.rad(0.0), elevation = math.rad(5.0)},
						proto		= lamp_prototypes.LFS_P_27_450, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					
					-- Under wing lights outboard of outermost engines
					{
						typename	= "Spot",  position = { 0.90, -0.085, -12.15 }, 
						direction	= {azimuth = math.rad(0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto		= lamp_prototypes.LFS_P_27_450, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
					{
						typename	= "Spot",  position = { 0.90, -0.085, 12.15 },
						direction	= {azimuth = math.rad(-0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto		= lamp_prototypes.LFS_P_27_450, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
					
					-- Ice inspection lights
					{
						typename	= "Spot",  position = { 5.88, 0.68, -1.86 }, 
						direction	= {azimuth = math.rad(-115.0), elevation = math.rad(5.0)},-- Point back at left wing
						proto		= lamp_prototypes.LFS_R_27_130, angle_max = math.rad(30.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
						range		= 40,
					},
					{
						typename	= "Spot",  position = { 5.88, 0.68,  1.86 },
						direction	= {azimuth = math.rad(115.0), elevation = math.rad(5.0)},	-- Point back at right wing
						proto		= lamp_prototypes.LFS_R_27_130, angle_max = math.rad(30.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
						range		= 40,
					},
					
				},
			},
			[WOLALIGHT_TAXI_LIGHTS] = {
				typename = "Collection",
				lights = {
					-- Nosewheel lights
					{
						typename	= "Spot", position = { 14.72, -2.216,  0.189 },
						direction	= {azimuth = math.rad(0.0), elevation = math.rad(4.0)},
						proto		= lamp_prototypes.LFS_R_27_250, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					{
						typename	= "Spot", position = { 14.72, -2.216, -0.194 },
						direction	= {azimuth = math.rad(0.0), elevation = math.rad(4.0)},
						proto		= lamp_prototypes.LFS_R_27_250, angle_max = math.rad(40.0), angle_min = math.rad(0),
						cool_down_t = 0.5, exposure = {{0, 0.9, 1.0}}, movable = true,
					},
					
					-- Under wing lights outboard of outermost engines
					{
						typename	= "Spot",  position = { 0.90, -0.085, -12.15 }, 
						direction	= {azimuth = math.rad(0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto		= lamp_prototypes.LFS_R_27_250, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
					{
						typename	= "Spot",  position = { 0.90, -0.085, 12.15 },
						direction	= {azimuth = math.rad(-0.0), elevation = math.rad(5.0)},	-- Point down 5 deg, toe in 0 deg
						proto		= lamp_prototypes.LFS_R_27_250, angle_max = math.rad(21.0), angle_min = math.rad(0),
						cool_down_t = 0.8, exposure = {{0, 0.9, 1.0}},
					},
				},
			},
			
			
			[WOLALIGHT_BEACONS] = {
				-- DCS seems to only turn this collection on during startup of the engines then turns them off when it's time to taxi.
				typename = "Collection",
				lights = { 
					{
						typename			= "RotatingBeacon", 					-- Ventral red beacon
						position			= { 6.87, -1.47, 0.000 },
						proto				= lamp_prototypes.MSL_3_2,
						color				= {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity	= math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename			= "RotatingBeacon",						-- Dorsal red beacon (top tip of central vertical stab)
						position			= { -16.8178, 4.52, -0.01 },
						proto				= lamp_prototypes.MSL_3_2,
						color				= {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity	= math.rad(240.0),					-- 40-45 rpm
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
						typename			= "RotatingBeacon", 					-- Ventral red beacon
						position			= { 6.87, -1.47, 0.000 },
						proto				= lamp_prototypes.MSL_3_2,
						color				= {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity	= math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename			= "RotatingBeacon",						-- Dorsal red beacon (top tip of central vertical stab)
						position			= { -16.8178, 4.52, -0.01 },
						proto				= lamp_prototypes.MSL_3_2,
						color				= {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity	= math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{	-- Port (left) side position light (red)
						typename			= "Spot", position = { 1.602, 1.282, -19.075 },
						direction			= {azimuth = math.rad(-90.0), elevation = math.rad(0)},
						proto				= lamp_prototypes.BANO_7M_red, angle_max = math.rad(180.0),
						color				= {1.0, 15/255, 0, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
					},
					{ 	-- Red omni for scattering off the fuselage
						typename			= "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position			= { 1.602, 1.282, -19.075 },
						color				= {1.0, 15/255, 0, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
						range				= 3.0,
					},
					{	-- Starboard (right) side position light (green)
						typename			= "Spot", position = { 1.602, 1.282, 19.075 },
						direction			= {azimuth = math.rad(90.0), elevation = math.rad(0)},
						proto				= lamp_prototypes.BANO_7M_green, angle_max = math.rad(180.0),
						color				= {0.0, 1.0, 65/255, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
					},
					{ 	-- Green omni for scattering off the fuselage
						typename			= "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position			= { 1.602, 1.282, 19.075 },
						color				= {0.0, 1.0, 65/255, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
						range				= 3.0,
					},
					{	-- Aft white nav light
						typename			= "Spot", position = { -18.183, 1.523, 0 },
						proto				= lamp_prototypes.ANO_3_Bl,
						direction			= {azimuth = math.rad(180.0)},
						angle_max			= math.rad(165.0),
						power_up_t			= 0.35, cool_down_t = 0.45,
					},
					{ 	-- White omni for scattering off the fuselage
						typename			= "Omni",
						proto				= lamp_prototypes.HS_2A,
						position			= { -18.183, 1.523, 0 },
						power_up_t			= 0.35, cool_down_t = 0.45,
						range				= 3.0,
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
						typename			= "Spot", position = { 1.602, 1.282, -19.075 },
						direction			= {azimuth = math.rad(-90.0), elevation = math.rad(0)},
						proto				= lamp_prototypes.BANO_7M_red, angle_max = math.rad(180.0),
						color				= {1.0, 15/255, 0, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
					},
					{ 	-- Red omni for scattering off the fuselage
						typename			= "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position			= { 1.602, 1.282, -19.075 },
						color				= {1.0, 15/255, 0, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
						range				= 3.0,
					},
					{	-- Starboard (right) side position light (green)
						typename			= "Spot", position = { 1.602, 1.282, 19.075 },
						direction			= {azimuth = math.rad(90.0), elevation = math.rad(0)},
						proto				= lamp_prototypes.BANO_7M_green, angle_max = math.rad(180.0),
						color				= {0.0, 1.0, 65/255, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
					},
					{ 	-- Green omni for scattering off the fuselage
						typename			= "Omni",
						-- proto = lamp_prototypes.HS_2A,
						position			= { 1.602, 1.282, 19.075 },
						color				= {0.0, 1.0, 65/255, 0.12},
						power_up_t			= 0.35, cool_down_t = 0.45,
						range				= 3.0,
					},
					{	-- Aft white nav light
						typename			= "Spot", position = { -18.183, 1.523, 0 },
						proto				= lamp_prototypes.ANO_3_Bl,
						direction			= {azimuth = math.rad(180.0)},
						angle_max			= math.rad(165.0),
						power_up_t			= 0.35, cool_down_t = 0.45,
					},
					{ 	-- White omni for scattering off the fuselage
						typename			= "Omni",
						proto				= lamp_prototypes.HS_2A,
						position			= { -18.183, 1.523, 0 },
						power_up_t			= 0.35, cool_down_t = 0.45,
						range				= 3.0,
					},
				},
			},
		},
	},
}
