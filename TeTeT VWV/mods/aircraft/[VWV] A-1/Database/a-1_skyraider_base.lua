--[[
============================================================================================================
MOD: Douglas A-1H Skyraider
REVISION: Performance Update based on Real World Data (R-3350-26WA Engine, ~2700 HP)
UPDATES:
  1. Corrected Empty, Nominal, and Max Masses (previously too light).
  2. Adjusted Thrust Sum and Propeller Diameter.
  3. Normalized Thrust Tables (removed AB disparity).
  4. Refined V_max and stall speeds.
  5. Extensive overhaul of piston engine performance parameters with documentation in code.
  6. Updated guns parameters and casing ejection metadata.
  7. Removed unrealistic countermeasures and ECM jammers.
  8. Expanded radio band coverage to match real-world employment during the Vietnam War.
  9. Extensive investigative deep dive into DCS's piston engine and propeller theory
	 modeling with associated documentation in the code comments (below: SFM_Data.engine table).
============================================================================================================
]]

return {

-- ============================================================================================================
-- SECTION: IDENTITY & UI
-- ============================================================================================================

	Name					=	'vwv_a1_skyraider',
	DisplayName				=	_('[VWV] A-1H Skyraider'),
	DisplayNameShort		=	_('A-1H'),
	date_of_introduction	= 	1945.11,
	Picture					=	"a_1_skyraider.png",
	Rate					=	40,									-- [points] RewardPoint in Multiplayer
	Shape					=	"a_1_skyraider",
	mapclasskey				=	"P0091000025",
	index					=	WSTYPE_PLACEHOLDER,
	WorldID             	= 	WSTYPE_PLACEHOLDER,
	defFuelRatio        	= 	0.8,
	attribute				=	{wsType_Air, wsType_Airplane, wsType_Fighter, a_1_skyraider, "Battleplanes"},
	Categories				=	{},

-- ============================================================================================================
-- SECTION: GEOMETRY & VISUALS
-- ============================================================================================================

	shape_table_data 		=
	{
		{
			file			=	'a_1_skyraider',
			life			=	25,									-- [hitpoints] Lifebar
			vis				=	3,									-- [factor] Visibility gain
			desrt			=	'a_1_skyraider_destroyed',			-- [filename] Name of destroyed object file name
			fire			=	{ 200, 1},
			username		=	'a_1_skyraider'
		},
		{
			name			=	"a_1_skyraider_destroyed",
			file			=	"a_1_skyraider_destroyed",
			fire			=	{ 240, 2}
		},
	},

	propellorBlurShapeName	=	"3ARG_PROC_BLUR",
	propellorShapeName		=	"F4U-1D_Prop_Blade.FBX",

	-- Gear Positions (Note: Coordinates depend on 3D model pivot, left as provided)
	
	-- main_gear_pos			=	{  1.2713,	-1.688,   2.2984},
	-- nose_gear_pos			=	{ -5.674,	-0.4222-0.6,  0.0238},		-- Note: A-1 is a taildragger
	
	main_gear_pos			=	{  1.32,	-1.55,   2.2984},
	nose_gear_pos			=	{ -5.73,	-0.37-0.56,  0.0238},		-- Note: A-1 is a taildragger

	nose_gear_wheel_diameter	=	0.241,							-- [m]
	main_gear_wheel_diameter	=	0.804,							-- [m]

	tand_gear_max			=   math.tan(math.rad(170)),			-- Tail wheel steering angle

	wing_tip_pos			=	{-0.377, 0.6975, 7.708},
	wing_area				=	37.1,								-- [m2] Approx 400 sq ft
	wing_span				=	15.24,								-- [m] 50 ft
	wing_type				=	2,									-- [enum] Foldable wing
	length					=	11.84,								-- [m] Corrected from 15.96 (38ft 10in)
	height					=	4.77,								-- [m] Approx 15 ft 8 in
	RCS						=	5,									-- [m2] Radar Cross Section
	
	CanopyGeometry = {
        azimuth = {-140.0, 140.0},
        elevation = {-10.0, 90.0},
    },

-- ============================================================================================================
-- SECTION: MASS & LOADING
-- ============================================================================================================

	M_empty					=	5429,								-- [kg] ~11,968 lbs (Real World Empty)
	M_nominal				=	8165,								-- [kg] ~18,000 lbs (Combat Weight)
	M_max					=	11340,								-- [kg] ~25,000 lbs (Max Takeoff)
	M_fuel_max				=	1036,								-- [kg] Internal Fuel (approx 380 gal)
	average_fuel_consumption=	0.03,								-- [kg/s] Approx

-- ============================================================================================================
-- SECTION: SPEEDS & FLIGHT PARAMETERS
-- ============================================================================================================

	V_max_sea_level			=	143.0,								-- [m/s TAS] ~278 kts / 320 mph
	V_max_h					=	145.0,								-- [m/s TAS] ~281 kts (Speed does not increase drastically with alt for this airframe)
	V_opt					=	165,								-- [m/s TAS] Cruise/Optimum
	V_take_off				=	50,									-- [m/s TAS] ~97 kts
	V_land					=	45,									-- [m/s TAS] ~87 kts
	Mach_max				=	0.75,								-- [Mach] Safe limit
	H_max					=	8685,								-- [m] Ceiling ~28,500 ft
	
	CAS_min					=	40.1,								-- [m/s TAS] Stall speed
	AOA_take_off			=	math.rad(2),						-- [rad]
	bank_angle_max			=	60,									-- [deg]
	Ny_min					=	-1,									-- [G] Min G
	Ny_max					=	2,									-- [G] Max G (structural)
	Ny_max_e				=	3,									-- [G] Ultimate
	range					=	2540,								-- [km] Ferry range
	
	has_afteburner			=	false,
	has_speedbrake			=	true,
	has_differential_stabilizer = false,
	flaps_maneuver			=	1,

	thrust_sum_max			=	3600,								-- [kgf] Static thrust (Approx 8000 lbs). Used for UI/AI.
	thrust_sum_ab			=	3600,								-- [kgf] No Afterburner
	
	radar_can_see_ground	=	true,
	detection_range_max		=	60,									-- Max detection range of ground units
	IR_emission_coeff		=	0.3,
	IR_emission_coeff_ab	=	0.3,

-- ============================================================================================================
-- SECTION: SYSTEMS & COCKPIT
-- ============================================================================================================

	crew_size				=	1,
	crew_members =
	{
		[1] =
		{
			ejection_seat_name		=	"F-4E_Seat_Pilot",
			pilot_name				=	"F-4E_Pilot",
			drop_canopy_name		=	"hb_f4e_pilotcanopy",
			drop_parachute_name		=	"F-4E_Parachute_Pilot",
			pos						=	{0.61, 1.93, 0.0},
			canopy_pos				= 	{0.61, 1.93, 0.0},
			bailout_arg				=	-1,
			role					= 	"pilot",
			role_display_name		= 	_("Pilot"),
			ejection_added_speed	= 	{-3, 12, 0},
			canopy_arg           	= 	38,
			canopy_args				= 	{38, 1},
			pilot_body_arg		 	= 	38,
		},
	},
	
	LandRWCategories =
	{
		[1] = { Name = "AircraftCarrier", },
		[2] = { Name = "AircraftCarrier With Arresting Gear", },
	},
	TakeOffRWCategories =
	{
		[1] = { Name = "AircraftCarrier", },
		[2] = { Name = "AircraftCarrier With Catapult", },
	},

	engines_count				=	1,
	engines_nozzles =
	{
	[1] =
		{	-- Port wing leading edge (bottom exhaust)
			engine_number		= 	1,
			pos					=	{2.34, 0.343, -0.684},
			elevation			=  -0,		-- 0 degrees exhaust depression (negative: exhaust vector below longitudinal axis)
			azimuth             = 	5,		-- 5 degrees (positive: exhaust vector points away from longitudinal axis)
			diameter			=	0.22,
			exhaust_length_ab	=	2,
			exhaust_length_ab_K	=	0.7,
			smokiness_level		=	0.2,
		},
	[2] =
		{	-- Port upper exhaust
			engine_number		= 	1,
			pos					=	{2.34, 1.092, -0.608},
			elevation			=	5,		-- 5 degrees exhaust inclination (positive: exhaust vector above longitudinal axis)
			azimuth             = 	5,		-- 5 degrees (positive: exhaust vector points away from longitudinal axis)
			diameter			=	0.22,
			exhaust_length_ab	=	2,
			exhaust_length_ab_K	=	0.7,
			smokiness_level		=	0.2,
		},
	[3] =
		{	-- Stbd wing leading edge (bottom exhaust)
			engine_number		= 	1,
			pos					=	{2.34, 0.343, 0.704},
			elevation			=  	0,		-- 0 degrees exhaust depression (negative: exhaust vector below longitudinal axis)
			azimuth             =  -5,		-- 5 degrees (negative: exhaust vector points away from longitudinal axis)
			diameter			=	0.22,
			exhaust_length_ab	=	2,
			exhaust_length_ab_K	=	0.7,
			smokiness_level		=	0.2,
		},
	[4] =
		{	-- Port upper exhaust
			engine_number		= 	1,
			pos					=	{2.34, 1.092, 0.640},
			elevation			=	5,		-- 5 degrees exhaust inclination (positive: exhaust vector above longitudinal axis)
			azimuth             = 	-5,		-- 5 degrees (positive: exhaust vector points away from longitudinal axis)
			diameter			=	0.22,
			exhaust_length_ab	=	2,
			exhaust_length_ab_K	=	0.7,
			smokiness_level		=	0.2,
		},
	},

	fires_pos =
	{
		[1] = 	{-2.117,	-0.9,	0},
		[2] = 	{0.500,		0.213,	0},
		[3] = 	{0.500,		0.213,	-2.182},
		[4] = 	{-0.82,		0.265,	2.774},
		[5] = 	{-0.82,		0.265,	-2.774},
		[6] = 	{-0.82,		0.255,	2.7274},
		[7] = 	{-0.82,		0.255,	-2.7274},
		[8] = 	{0.5,		-0.5,	2.7578},
		[9] = 	{0.5,		-0.5,	-2.578},
		[10] = 	{0.50,		0.084,	2.754},
		[11] = 	{0.50,		0.084,	-2.7534},
	},

	Countermeasures = { },

	passivCounterm = {
		CMDS_Incrementation = 0,
		ChaffDefault        = 0,
		ChaffChargeSize     = 0,
		FlareDefault        = 0,
		FlareChargeSize     = 0,
		
		CMDS_Edit			=	false,
		SingleChargeTotal	=	0,
		chaff				=	{default = 0, increment = 0, chargeSz = 0},
		flare				=	{default = 0, increment = 0, chargeSz = 0},
	},

	chaff_flare_dispenser 	= {	},

	Failures = {
			{ id = 'asc', 		label = _('ASC'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'eos',  		label = _('EOS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
	},

	HumanRadio = {
		frequency		=	251.0,
		editable		=	true,
		minFrequency	=	30.000,
		maxFrequency	=	399.975,
		modulation		=	MODULATION_AM,
		rangeFrequency 	= {
			{min =  30.0, max =  79.95, modulation	= MODULATION_FM},
			{min = 225.0, max = 399.975, modulation	= MODULATION_AM},
		},
	},

-- ============================================================================================================
-- SECTION: WEAPONS & PYLONS
-- ============================================================================================================
	
	stores_number			=	15,
	ammo_type_default		=	2,									-- interface to set desired ammunition mix in ME (DCSCORE-1104)
	ammo_type				=	{
								_("HEI High Explosive Incendiary"),
								_("CM Combat Mix"),
								_("AP Armor Piercing"),
								_("TP Target Practice"),
								},
	
	Cannon = "yes",
	Guns = {
		gun_mount("M_39",		-- Port outboard
			{ count = 280 },
			{
				-- muzzle_pos				= {5.61, -0.775, -0.488},
				muzzle_pos_connector	= "gunpoint_1",
				supply_position			= {2.8753, 0, -0.2},
				drop_cartridge			= 204,		-- cartridge_50cal
				ejector_pos				= {-0.8, 0.122, -4.02},
				ejector_dir 			= {0,1,0},
				effects = {
					{name = "FireEffect", arg = 432, duration = 0.02, attenuation = 2, light_pos = {0.5,0,0}},
					{name = "HeatEffectExt", shot_heat = 20.9, barrel_k = 0.462 * 16.6, body_k = 0.462 * 35.4},
					{name = "SmokeEffect", gas_deflector_arg = 327, add_speed = {0, -3, 10}},
				},
		}),
		gun_mount("M_39",		-- Port inboard
			{ count = 280 },
			{
				-- muzzle_pos				= {5.61, -0.773, 0.499},
				muzzle_pos_connector	= "gunpoint_2",
				supply_position			= {2.8753, 0, 0.2},
				drop_cartridge 			= 204,		-- cartridge_50cal
				ejector_pos				= {0.033, 0.053, -3.514},
				ejector_dir 			= {0,1,0},
				effects = {
					{name = "FireEffect", arg = 433, duration = 0.02, attenuation = 2, light_pos = {0.5,0,0}},
					{name = "HeatEffectExt", shot_heat = 20.9, barrel_k = 0.462 * 16.6, body_k = 0.462 * 35.4},
					{name = "SmokeEffect", gas_deflector_arg = 328, add_speed = {0, 3, 10}},
				},
		}),
		gun_mount("M_39",		-- Stbd inboard
			{ count = 280 },
			{
				-- muzzle_pos				= {5.94, -0.914, -0.488},
				muzzle_pos_connector	= "gunpoint_3",
				supply_position			= {2.8753, 0, -0.2},
				drop_cartridge			= 204,		-- cartridge_50cal
				ejector_pos				= {0.033, 0.053, 3.54},
				ejector_dir 			= {0,1,0},
				effects = {
					{name = "FireEffect", arg = 432, duration = 0.02, attenuation = 2, light_pos = {0.5,0,0}},
					{name = "HeatEffectExt", shot_heat = 20.9, barrel_k = 0.462 * 16.6, body_k = 0.462 * 35.4},
					{name = "SmokeEffect", gas_deflector_arg = 327, add_speed = {0, -3, 10}},
				},
		}),
		gun_mount("M_39",		-- Stbd outboard
			{ count = 280 },
			{
				-- muzzle_pos				= {5.94, -0.912, 0.499},
				muzzle_pos_connector	= "gunpoint_4",
				supply_position			= {2.8753, 0, 0.2},
				drop_cartridge 			= 204,		-- cartridge_50cal
				ejector_pos				= {-0.8, 0.122, 4.02},
				ejector_dir 			= {0,1,0},
				effects = {
					{name = "FireEffect", arg = 433, duration = 0.02, attenuation = 2, light_pos = {0.5,0,0}},
					{name = "HeatEffectExt", shot_heat = 20.9, barrel_k = 0.462 * 16.6, body_k = 0.462 * 35.4},
					{name = "SmokeEffect", gas_deflector_arg = 328, add_speed = {0, 3, 10}},
				},
		})
	},
	
	Pylons = {
		-- Port outermost station
        pylon(1, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_1", arg = 308, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
		   }
        ),

        pylon(2, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_2", arg = 309, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),

       pylon(3, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_3", arg = 310, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),

      pylon(4, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_4", arg = 311, FiX = 0, FiY = 0, FiZ = 2},
           {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
	}
        ),

       pylon(5, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_5", arg = 312, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),

       pylon(6, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_6", arg = 313, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),
		
		-- Port Inner Heavy
        pylon(7, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_14", arg = 314, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.500, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.4500, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.500, -.12 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.35, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.5, .1 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.5, .1 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}",attach_point_position = {.500, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.45, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {.450, -.05, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {.450, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,attach_point_position = {.450, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,attach_point_position = {.3, -.15 ,0 }},--Mk-84 - 2000lb GP Bomb LD		
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.5, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares

				{ CLSID = "{AV8BNA_AERO1D}" 	,attach_point_position = {.600, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{DFT-150gal}"		,attach_point_position = {.700, .1 ,0 }},
				{ CLSID = "{DFT-150gal_EMPTY}"	,attach_point_position = {.700, .1 ,0 }},

				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.4500, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}" ,attach_point_position = {0.0, -.13 ,0 }},--LAU-10 pod - 4 x Zuni HE
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.13 ,0 }},--Hawkeye 5 inch unguided rocket
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				{ CLSID = "DIS_mk46torp", attach_point_position = {0.2, -0.07, 0}}, --Torpedo
				{ CLSID = "{toilet_bomb}", attach_point_position = {0.55, -0.3, 0}}, -- Toilet Bomb
				{ CLSID = "{mk77mod1}", attach_point_position = {0.4, 0.08, 0} }, -- A-4E Napalm
				{ CLSID = "{mk77mod0}", attach_point_position = {0.4, 0.08, 0} }, -- A-4E Napalm
			}
        ),
		
		-- Centerline
        pylon(8, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_13", arg = 314},
            {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.00, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.00, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.00, -.12 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.00, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.08, .08 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.08, .08 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)

				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}"	,attach_point_position = {.00, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" 	,attach_point_position = {.00, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets

				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" 	,attach_point_position = {.0, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" 	,attach_point_position = {.0, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"	,attach_point_position = {.0, -.15 ,0 }},--Mk-84 - 2000lb GP Bomb LD				

				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.00, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{AV8BNA_AERO1D}" ,attach_point_position = {.00, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				{ CLSID = "DIS_mk46torp", attach_point_position = {0, -0.07, 0}}, --Torpedo
				{ CLSID = "{mk77mod1}", attach_point_position = {-0.1, 0.08, 0} }, -- A-4E Napalm
				{ CLSID = "{mk77mod0}", attach_point_position = {0.4, 0.08, 0} }, -- A-4E Napalm
			}
        ),
		
		-- Stbd Inner Heavy
        pylon(9, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_15", arg = 314, FiX = 0, FiY = 0, FiZ = 2},
           {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.500, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.4500, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.500, -.12 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.35, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.5, .1 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.5, .1 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {.450, -.05, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}",attach_point_position = {.500, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.45, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {.450, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,attach_point_position = {.450, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,attach_point_position = {.3, -.15 ,0 }},--Mk-84 - 2000lb GP Bomb LD		
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.5, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				
				{ CLSID = "{AV8BNA_AERO1D}" 	,attach_point_position = {.600, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{DFT-150gal}"		,attach_point_position = {.700, .1 ,0 }},
				{ CLSID = "{DFT-150gal_EMPTY}"	,attach_point_position = {.700, .1 ,0 }},
				
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.4500, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}" ,attach_point_position = {0.0, -.13 ,0 }},--LAU-10 pod - 4 x Zuni HE
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.13 ,0 }},--Hawkeye 5 inch unguided rocket
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				{ CLSID = "DIS_mk46torp", attach_point_position = {0.2, -0.07, 0}}, --Torpedo
				{ CLSID = "{toilet_bomb}", attach_point_position = {0.55, -0.3, 0}}, -- Toilet Bomb
				{ CLSID = "{mk77mod1}",  attach_point_position = {0.4, 0.08, 0} }, -- A-4E Napalm
				{ CLSID = "{mk77mod0}", attach_point_position = {0.4, 0.08, 0} }, -- A-4E Napalm
		   }
        ),
			
       pylon(10, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_7", arg = 315, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
		   }
        ),
			
       pylon(11, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_8", arg = 316, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),
			
        pylon(12, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_9", arg = 317, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),
			
        pylon(13, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_10", arg = 318, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
			}
        ),
			
        pylon(14, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_11", arg = 319, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
		   }
        ),
		
		-- Stbd outermost station
        pylon(15, 0, 0.000, -0.100, 0.000, {use_full_connector_position = true, connector = "pylon_12", arg = 320, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.08 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.12 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, 0.03, 0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{90321C8E-7ED1-47D4-A160-E074D5ABD902}" ,attach_point_position = {0, 0, 0.0124 }},--Mk-81 - 250lb GP Bomb LD
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.15, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}",attach_point_position = {0.0, -.13 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.2 ,0 }},--LAU-68 pod - 7 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.2 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.025 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				{ CLSID = "{toilet_bomb}", attach_point_position = {0, -0.35, 0}}, -- Toilet Bomb
 			}
        ),
	},
	
	Tasks = {
		aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(AFAC),
		aircraft_task(RunwayAttack),
		aircraft_task(AntishipStrike),
	},
	DefaultTask = aircraft_task(CAS),

-- ============================================================================================================
-- SECTION: FLIGHT MODEL (SFM)
-- ============================================================================================================

	SFM_Data = {
		aerodynamics = {
			-- Control authority parameters
			Cy0				=	0.27,		-- [coeff] Zero AoA lift
			Mzalfa			=	3.8,		-- [coeff] Pitch stability
			Mzalfadt		=	0.8,		-- [coeff] Pitch damping factor
			kjx				=	2.25,		-- [coeff] Roll inertia coefficient
			kjz				=	0.00125,	-- [coeff] Pitch inertia coefficient
			Czbe			=	-0.012,		-- [coeff] Directional stability
			
			-- Drag coefficients
			cx_gear			=	0.035,		-- [coeff] Drag Gear
			cx_flap			=	0.045,		-- [coeff] Drag Flaps
			cy_flap			=	0.35,		-- [coeff] Lift Flaps
			cx_brk			=	0.12,		-- [coeff] Drag Airbrakes
			table_data		= 
			{
				-- M		Cx0			Cya			B		B4			Omxmax	Aldop	Cymax
				{0.0,		0.034,		0.085,		0.060,	0.00010,	0.15,	19.0,	1.58},	-- Static/Taxi
				{0.1,		0.034,		0.085,		0.060,	0.00010,	0.45,	19.0,	1.58},	-- Takeoff / Landing (~75 kts)
				{0.2,		0.034,		0.088,		0.058,	0.00010,	0.85,	18.5,	1.55},	-- Loiter / Approach (~150 kts)
				{0.3,		0.034,		0.090,		0.056,	0.00012,	1.10,	18.0,	1.50},	-- Cruise (~220 kts)
				{0.4,		0.035,		0.092,		0.054,	0.00020,	1.15,	17.0,	1.45},	-- High Speed Cruise (~300 kts)
				{0.5,		0.039,		0.092,		0.052,	0.00050,	1.05,	15.0,	1.35},	-- Vne / Dive Start (~380 kts)
				{0.6,		0.055,		0.089,		0.080,	0.00100,	0.80,	13.0,	1.15},	-- Compressibility onset
				{0.7,		0.085,		0.085,		0.150,	0.00500,	0.50,	11.0,	0.90},	-- Heavy Drag Rise
				{0.8,		0.120,		0.070,		0.300,	0.02000,	0.20,	9.0,	0.60},	-- Transonic Wall
				{0.9,		0.160,		0.050,		0.500,	0.10000,	0.10,	7.0,	0.40},	-- Uncontrollable
				{1.0,		0.190,		0.040,		0.800,	0.20000,	0.05,	5.0,	0.30},	-- Supersonic (Theoretical)
			},
		},
		
		engine = {
			Nominal_RPM			=	2900,
			Nmg					=	(900/2900)*100,	-- [%] Idle
			MinRUD				=	0,
			MaxRUD				=	1,
			MaksRUD				=	1,
			ForsRUD				=	1,
			typeng				=	2,			-- [enum] 2 = Piston logic
			type				=	"Radial",
			Startup_Prework		=	12,
			Startup_RPMs		=	{ {0, 0}, {1, 66}, {4.6, 66}, {5, 300}, {5.5, 450}, {7, 500}, {9, 800}, {12, 900} },
			Startup_Ignition_Time = 7,
			Shutdown_Duration	=	6.8,
			cylinder_firing_order = {1,12,5,16,9,2,13,6,17,10,3,14,7,18,11,4,15,8},
			
			hMaxEng				=	12.5,		-- [km] Altitude limit for engine
			cemax				=	0.37,		-- [kg/s] Max fuel consumption per engine
			cefor				=	0.37,
			dpdh_m 				= 	0,			-- set to zero so piston parameters are not overridden
			dpdh_m 				= 	0,			-- set to zero so piston parameters are not overridden

			-- Thrust table: Normalized for ~2700 HP Propeller
			-- Col 1: Mach
			-- Col 2: Mil Power (N) - Approx 34kN static
			-- Col 3: AB Power (N) - Same as Mil for Prop
			table_data =
			{
				--			M 		Power (N)
				[1]		= {0.0,		34500.0,	34500.0},	-- Static Pull
				[2]		= {0.1,		29500.0,	29500.0},
				[3]		= {0.2,		25000.0,	25000.0},
				[4]		= {0.3,		18000.0,	18000.0},	-- Thrust drops with speed
				[5]		= {0.4,		11000.0,	11000.0},	-- Near Vmax
				[6]		= {0.5,		8000.0,		8000.0},
				[7]		= {0.6,		6000.0,		6000.0},
				[8]		= {0.7,		4000.0,		4000.0},
				[9]		= {0.8,		2000.0,		2000.0},
				[10]	= {0.9,		1000.0,		1000.0},
			},
			
			dcx_eng				=	0.018,		-- Engine Cooling Drag and Intake Momentum Drag.
											--[[ 	This is It is the sum of:

														Cooling Drag (C_D_cool​​): The aerodynamic resistance caused by air passing
														through radiators (P-51, Bf 109) or engine cooling baffles (F4U, A-1H, A-20).
														For WWII aircraft, this typically accounts for 10% to 15% of the total aircraft drag.

														Momentum Drag: The momentum lost by taking still air, accelerating it to aircraft
														speed, and slowing it down to enter the intake.

														Nacelle/Cowling Form Drag: The resistance of the engine housing itself
														(especially relevant for the A-20G's nacelles or the A-1H's flat radial nose).]]

			k_adiab_1			=	0.029,		-- Adiabatic efficiency (low blower)
			k_adiab_2			=	0.0562,		-- Adiabatic efficiency (high blower)
											--[[	Real-World Equivalent: Compressor Adiabatic Efficiency (η_c​).

													Definition: Defines how much heat is added to the air during compression.
													_1 and _2 likely refer to the different supercharger gears
													(Low Blower / High Blower).

													Reality Check: Compressing air heats it up. Hotter air is less dense
													(less power) and causes detonation. A value closer to 1.0 implies a
													very efficient blower that adds minimal excess heat.]]
			
			MAX_Manifold_P_1	=	152400,		-- [Pa] Manifold pressure for max continuous cruise (aka METO)
			MAX_Manifold_P_2	=	176092,		-- [Pa] Manifold pressure for dry takeoff
			MAX_Manifold_P_3	=	201500,		-- [Pa] Manifold pressure for wet takeoff or war emergency power
			
			
			k_after_cool		=	0.49,		-- [coeff] Intercooler/aftercooler effectiveness or efficiency (% heat removed from air before entering cylinders)
											--[[	Reality Check: Crucial for high-altitude performance. If this value is low,
													the engine will overheat or detonate at high power settings (common in
													early war aircraft like the Spitfire V vs. the intercooled Spitfire IX).]]
			
			
			Displ 				= 	54.8475,	-- [L] 3,347 cubic inches total displacement
			
			k_Eps 				= 	6.85,		-- [ratio] Cylinder compression ratio (volume ratio from bottom dead center to top dead center)
											--[[	Real-World Equivalent: Compression Ratio (ϵ).

													Definition: The ratio of the cylinder volume at bottom dead center to top
													dead center (e.g., 6.0:1 or 8.5:1).

													Reality Check: Higher k_Eps yields higher thermal efficiency (more power)
													but increases the risk of detonation (knocking), requiring higher octane fuel.
													This parameter directly feeds the thermal efficiency equation:
													
																	η = 1 − ( 1 / (ϵ^(γ−1)) )​
											]]
			
			Stroke 				= 	0.160,		-- [m] 6.3125 inch stroke
			V_pist_0			=	18,			-- [#] Number of pistons/cylinders
			
			Nu_0 				= 	1.28,		-- Static Potential (see below)
			Nu_1 				= 	0.94,		-- Coefficient for the Advance Ratio (J) (see below)
			Nu_2 				= 	0.0019,		-- Coefficient for the Helical Tip Mach Number (M_tip^2) (see below)											
											--[[	DCS appears to be approximating the propeller's Thrust Coefficient (C_T​)
													or Efficiency Factor (η) using a combination of Advance Ratio (J) and
													Tip Mach Number (M_tip​):
													
															Factor = Nu_0​ − (J * Nu_1​) − (Nu_2​ * (M_tip)^2​)

													Where:

														Nu_0​: 	The Static Thrust Coefficient. (Base "grip" at 0 airspeed).
																This is also called Static Potential.


														J (Advance Ratio):

																				J = V / (n * D)

															Function: 	This handles the linear drop in thrust as the plane
																		speeds up (Nu_1).


														M_tip​ (Helical Tip Mach):
														
																	M_tip = sqrt( V^2 + (π * n *D)^2​ ) / a​

															Function: 	This calculates the actual speed of the propeller
																		tips through the air.

															Key Variables: 		n (Prop RPM)
																				D (Prop Diameter)
																				V (Airspeed)
																				a (Speed of Sound)
													
													
													Propeller Efficiency Factor (η):
													
														η	=	Nu_0  −  ( Nu_1​ * (V / (n*D)) )  −  ( Nu_2 * (M_tip)^2 ​)
													
													Where:
														
														0. Nu_0​ (Static Potential): 	The efficiency baseline when V = 0.

														1. The Linear Term (Nu_1 * J): 	The variable J is the Advance Ratio.
														
																				J = n * D * V​

															At Takeoff:	V is near 0, so this term is near 0.

															In Flight:	As airspeed (V) increases, this term grows,
																		subtracting from thrust. This models the geometric
																		loss of propeller "grip" on the air.

														2. The Quadratic Term (Nu_2 * M_tip^2​):
														
																The variable M_tip​ is the Helical Tip Mach Number.

															This calculates how fast the tips of the blades are moving,
															combining rotational speed (RPM) and forward airspeed.
															
															M_tip = sqrt( V^2 + (Rotational Velocity)^2 ) / (Speed of Sound)
											]]
			
			N_indic_0			=	2013400,	-- [W] Indicated power
			
			N_fr_0 				=	0.095,		-- Friction Mean Effective Pressure (FMEP) - Static drag to turn engine over
			N_fr_1 				=	0.055,		-- Friction Mean Effective Pressure (FMEP) - Viscous drag as piston speed increases
											--[[	Definition: These coefficients model the horsepower lost to friction
													(piston rings, bearings, valve train) and pumping losses (sucking air
													in/pushing exhaust out).

													The Math: Total Friction Power = N_fr_0 + (N_fr_1 * RPM)

													Reality Check: In reality, friction losses increase expertly with RPM.
													N_fr_0 represents the static drag (power needed just to turn the engine over),
													while N_fr_1 accounts for the linear increase in viscous drag as piston
													speed increases.]]
													
			k_gearbox			=	16/7,		-- Engine/propeller gearbox ratio (inverse of reduction ratio; never less than 1.0 in DCS)
			P_oil				=	482633,		-- [Pa] Oil pressure
			
			k_boost				=	8.67,		-- Supercharger boost factor/Boost scaling
											--[[	Real-World Equivalent: Charge density scalar.

													Definition: Likely a coefficient linking Manifold Pressure to actual
													air mass entering the cylinder (Volumetric Efficiency scalar).]]
			
			k_cfug				=	0.003,		-- [coeff] Centrifugal Compressor Pressure Rise
											--[[	Real-World Equivalent: Centrifugal Compressor Pressure Rise
													(proportional to RPM^2).

													Definition: Defines how much pressure the supercharger impeller
													generates based on its rotational speed.

													Reality Check: Centrifugal superchargers (like in the P-51 or F4U)
													generate boost exponentially with RPM. A higher k_cfug means the
													supercharger builds boost much faster as RPM climbs.]]
			
			k_oil				=	4e-05,		-- Oil Drag/Viscocity factor
											--[[	Real-World Equivalent: Oil Shearing resistance.

													Definition: Likely models the parasitic loss caused by the oil pump
													and the viscosity of the oil, which changes with temperature.]]
			
			k_piston			=	3000,		-- Indicated Mean Effective Pressure (IMEP) scaler
											--[[	Real-World Equivalent: Mean Piston Speed or Indicated Mean Effective
													Pressure (IMEP) scaler.

													Definition: This likely scales the efficiency of the combustion cycle
													relative to the physical speed of the pistons.

													Reality Check: As piston speed increases, volumetric efficiency usually drops
													(less time to fill the cylinder). This parameter helps define the
													"torque peak" of the engine.]]
													
			k_reg				=	0.003,		-- Regulator Gain/Response
											--[[	Real-World Equivalent: Governor/Regulator sensitivity.

													Definition: How quickly and accurately the boost regulator corrects
													the throttle plate to maintain the target Manifold Pressure.

													Reality Check: If tuned poorly, this results in "hunting"
													(RPM/MAP oscillating) when the pilot changes the throttle setting rapidly.]]
			
			k_vel				=	0.017,		-- Ram Air Recovery factor
											--[[	Real-World Equivalent: Intake Ram Recovery Ratio.

													Definition: How effectively the aircraft speed (V) increases the
													air pressure at the supercharger intake (Ram Effect).

													Reality Check: At 400 mph, a well-designed intake (like the P-51's
													underbelly scoop) provides significant "free boost" simply from the
													air rushing in. A high k_vel models a highly efficient scoop.]]
			
			prop_direction 	 	=	1,	 		-- +1 for CCW when viewed from front, -1 for CW when viewed from front
			Init_Mom 			= 	600,		-- [N*m] Starting torque
			D_prop				=	4.11,		-- [m] 13ft 6in (Corrected from 3.51)
			MOI_prop			=	28,			-- [kg*m^2] Propeller moment of inertia
			prop_pitch_min		=	23.0,
			prop_pitch_max		=	65.0,
			prop_pitch_feather	=	80.0,
			prop_blades_count	=	4,
			prop_locations		=	{{3.9, 0.79, 0.0058}, {0.0, 0.0, math.rad(-4.5)},},
		},
	},

-- ============================================================================================================
-- SECTION: DAMAGE & COLLISION
-- ============================================================================================================

	Damage = verbose_to_dmg_properties({
		["fuselage"]			= {critical_damage = 2, args = { 65}},
		["body"]				= {critical_damage = 3, args = {146}},
		["NOSE_RIGHT_SIDE"]		= {critical_damage = 3, args = {147}},
		["NOSE_LEFT_SIDE"]		= {critical_damage = 3, args = {150}},
		["NOSE_BOTTOM"]			= {critical_damage = 3, args = {148}},
		["NOSE_TOP_SIDE"]		= {critical_damage = 3, args = {147}},
		["WING_L"]				= {critical_damage = 3, args = {223}, deps_cells = {"FLAP_L_IN"}},
		["WING_R"]				= {critical_damage = 3, args = {213}, deps_cells = {"FLAP_R_IN"}},
		["CABIN"]				= {critical_damage = 3, args = {221}},
		["CANOPY"]				= {critical_damage = 3, args = {231}},
		["HOOK"]				= {critical_damage = 5, args = {227}},
		["FLAP_R_IN"]			= {critical_damage = 4, args = {217}},
		["FLAP_L_IN"]			= {critical_damage = 4, args = {217}},
		["FUSELAGE_BOTTOM"]		= {critical_damage = 4, args = {152}},
		["FUSELAGE_CENTR_TOP"]	= {critical_damage = 4, args = {151}},
		["rear_strut"]			= {critical_damage = 4, args = {244}},
		["RUDDER"]				= {critical_damage = 2, args = {247}},
		["Right_strut"]			= {critical_damage = 4, args = {167}},
		["left_strut"]			= {critical_damage = 3, args = {161}},
		["ELEVATOR"]			= {critical_damage = 3, args = {235}},
		["STABILIZER_R_IN"]		= {critical_damage = 3, args = {233}},
		["Front Wheel Out"]		= {critical_damage = 1},
		["Left Wheel Out"]		= {critical_damage = 1},
		["Right Wheel Out"]		= {critical_damage = 1},
	}),

	DamageParts = {},

-- ============================================================================================================
-- SECTION: MECHANICAL ANIMATIONS
-- ============================================================================================================

	flaps_transmission          = "Hydraulic",
	undercarriage_transmission 	= "Hydraulic",
	doors_transmission 			= "Mechanical",
	
	doors_movement 				= 2,		-- Enable custom doors mechanimations
	mechanimations = {
		--[[
        Removed for Korea use with WWII Essex
		-- from FA-18C
		LaunchBar = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 1.0, "in", 4.5}}}}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 4.5}}}}},
			{Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 0.745, "in", 4.0}}}}},
			{Transition = {"Any", "Retract"},    Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 1.0}}}}},--4.5 LaunchBar Hoch from VSN F-4B
			{Transition = {"Stage", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 0.5}}}}}, -- in was 4.0
			{Transition = {"Extend", "Stage"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 1.0, "to", 0.745, "in", 1.0}}}}},
			{Transition = {"Stage", "Pull"},     Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 0.743, "in", 1.0}}}}},
			{Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 1.0, "in", 0.2}}}}},
		},
        ]]
		Door0 = {
			{Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.849, "in", 9.0},},},}, Flags = {"Reversible"},},
			{Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
			{Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
		},
		FoldableWings = {
			{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 11.0}}}}, Flags = {"Reversible"}},
			{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 11.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
		},
		Crewman0Gestures = {
			{Transition = {"Any", "GestureSaluteLeft"},
				Sequence = {
					{--step 1 hands and head to 0 position
						C = {
								{"Arg", 39,  "to",  0.0,  "speed", 0.50},	-- head left/right
								{"Arg", 99,  "to", -0.45, "speed", 0.50},	-- head down/up
							},
					},
					{-- step 2 gesture start
						C = {{"Arg", 39, "from", 0.0, "to", -1.0, "in", 2.0}}
					},
					{-- step 3 pause
						C = {{"Sleep", "for", 5.0}}
					},
					{-- step 4 gesture end
						C = {{"Arg", 39, "from", 1.0, "to", 0.0, "in", 1.5}}
					},
					{-- step 5 ready up
						C = {{"Arg", 99, "from", -0.45, "to", -0.045, "in", 1.5}}
					},
				},
			},
			{Transition = {"Any", "GestureSaluteRight"},
				Sequence = {
					{--step 1 hands and head to 0 position
						C = {
								{"Arg", 39,  "to",  0.0,  "speed", 0.50},	-- head left/right
								{"Arg", 99,  "to", -0.45, "speed", 0.50},	-- head down/up
							},
					},
					{-- step 2 gesture start
						C = {{"Arg", 39, "from", 0.0, "to", 1.0, "in", 2.0}}
					},
					{-- step 3 pause
						C = {{"Sleep", "for", 5.0}}
					},
					{-- step 4 gesture end
						C = {{"Arg", 39, "from", 1.0, "to", 0.0, "in", 1.7}}
					},
					{-- step 5 ready up
						C = {{"Arg", 99, "from", -0.45, "to", -0.045, "in", 1.5}}
					},
				},
			},
			{Transition = {"Any", "GestureSaluteTakeOffFinalize"},
				Sequence = {
					{--step 1 lock facemask
						C = {{"Arg", 99, "to", 0.0, "in", 1.0},},
					},
					{-- step 2 reset 522 arg, move to normal operation
						C = {
							{"Arg", 39, "set", 0.0},
							{"Arg", 99, "set", 0.0},
							{"Arg", 520, "set", 0.0},
						}
					},
				},
			},
			
			{Transition = {"Any", "GestureSaluteReset"}, Sequence = {
				{C = {
						{"Arg", 39,  "to",  0.0,  "speed", 0.50},
						{"Arg", 99,  "to", -0.45, "speed", 0.50},
					},
				},
			}},
		},
	},
	
-- ===================================================================
-- SECTION: LIGHTS
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
			[WOLALIGHT_NAVLIGHTS] = {
				typename = "Collection",
				lights = {
					[1] = {
						typename = "collection",
						lights = 
						{
							{
								typename  = "omnilight",
								connector = "BANO_0",
								color     = {1.0, 1.0, 1.0, 0.333},
								position  = {-8.880, 0.687, 0.000},
								argument  = 192,
								movable   = false,
							},					
							{
								typename  = "omnilight",
								connector = "BANO_1",
								color     = {0.99, 0.11, 0.3, 0.333},
								position  = {-0.406, -0.480, -3.901},
								argument  = 190,
								movable   = false,
							},
							{
								typename  = "omnilight",
								connector = "BANO_2",
								color     = {0.0, 0.894, 0.6, 0.333},
								position  = {-0.406, -0.480,  3.901},
								argument  = 191,
								movable   = false,
							},
							{ typename = "argumentlight", argument = 100 },
							{ typename = "argumentlight", argument = 103 },
							{ typename = "argumentlight", argument = 105 },		
						},
					},
				},
			},
			[WOLALIGHT_SPOTS] = {
				typename = "collection",
				lights = {
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR", argument = 208,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR", argument = 208,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
				},
			},
			[WOLALIGHT_TAXI_LIGHTS] = {
				typename = "collection",
				lights = {
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR", argument = 209,
								proto = lamp_prototypes.FPP_7,
								movable = true, intensity_max = 0
							},
							{
								typename = "spotlight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true, intensity_max = 0
							},
							{
								typename = "omnilight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true, intensity_max = 0
							},
						},
					},
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR", argument = 209,
								proto = lamp_prototypes.FPP_7,
								movable = true, intensity_max = 0
							},
							{
								typename = "spotlight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true, intensity_max = 0
							},
							{
								typename = "omnilight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true, intensity_max = 0
							},
						},
					},
				},
			},
			[WOLALIGHT_STROBES] = {
				typename = "collection",
				lights = {
					{
						typename = "Collection",
						lights = {
							{
								typename = "RotatingBeacon",position  = {-4.206, 3.615,  0.00}, connector = "RED_BEACON",color = {0.8, 0.0, 0.0}, argument = 193,
								proto = lamp_prototypes.MSL_4,
							},
							{
								typename  = "omnilight",position  = {-4.206, 3.615,  0.00},connector = "BANO_1",color  = {0.8, 0.0, 0.0},
								movable   = false,
							},						
						},
					},
				},
			},
			[WOLALIGHT_FORMATION_LIGHTS] = {
				typename = "collection",
				lights = {
					{ typename = "argumentlight", argument = 200,position  = {-1.206, 0.615,  -4.00} },
					{ typename = "argumentlight", argument = 201,position  = {-1.206, 0.615,  4.00} },
					{ typename = "argumentlight", argument = 202 },
					{ typename = "argumentlight", argument = 203 },
				},
			},
		}, 
	},
}