return {
----------------------------------------------------------------------------------------------------
-- KAMAN UH-2A SEASPRITE DEFINITION FILE
-- Updated: December 2025
-- Ref: Real-world data for Single-Engine T58-GE-8B configuration
----------------------------------------------------------------------------------------------------
-- Useful video: https://www.youtube.com/watch?v=qdA-6MaLH3g
-- https://www.sjsu.edu/researchfoundation/docs/AHS_1999_Colbourne.pdf
-- https://vertipedia.vtol.org/aircraft/getAircraft/aircraftID/726

	Name                = "uh2a",
    DisplayName         = _("[VWV] UH-2A Seasprite"),
    DisplayNameShort    = _("UH-2A"),
    date_of_introduction= 1962.12,
    Picture             = current_mod_path .. "/Textures/sh_2c_f.png",
    Rate                = 40, 
    Shape               = "uh2b",	-- I know, but the "a" EDM had 3 blades on the main rotor mistakenly
    WorldID             = WSTYPE_PLACEHOLDER,
	defFuelRatio    	= 0.8, -- fuel default in fractions of the full (1.0)
	
	-- AI / MAP PROPERTIES
    mapclasskey         = "P0091000020",
    attribute           = {wsType_Air, wsType_Helicopter, wsType_Cruiser, WSTYPE_PLACEHOLDER ,"Transport helicopters",},
	-- Categories 			= {"{828CEADE-3F1D-40aa-93CE-8CDB73FE2710}", "Helicopter",},
    Categories          = {},
    country_of_origin   = "USA",
	takeoff_and_landing_type = "VTOL",		-- VTOL, CTOL... any others?
	
	-- LIFE & DAMAGE
    livery_entry    	= "uh2a",
	shape_table_data 	=
	{
		{
			file  	 = "uh2b";	-- I know, but the "a" EDM had 3 blades on the main rotor mistakenly
			life  	 = 5; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'sh-60b-oblomok'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destroyed: 300sec 2m
			username = "uh2a";	-- This needs to match Name up above, or at least be unique
			index    =  WSTYPE_PLACEHOLDER;
            classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap = true;
		},
		{
			name  = "sh-60b-oblomok";
			file  = "sh-60b-oblomok";
			fire  = { 240, 2};
		},

	},
	
	
	------------------------------------------------------------------------------------------------
    -- DIMENSIONS & GEOMETRY
    ------------------------------------------------------------------------------------------------
	length 			= 11.48,    -- [m] Fuselage length (Total length w/ rotors ~15.9m)
	height 			= 4.11,     -- [m] Overall height
	
	-- Landing Gear
	nose_gear_pos 	= {-4.728, -1.755,	0}, 	-- Nose gear position (ground under center of the axle)
	main_gear_pos 	= { 1.664, -1.728,  1.699},-- Main gear position (ground under center of the axle)
												-- automatically mirrored
	wheel_steering_angle_max = math.rad(180.0),	-- Maximum steering angle for tail wheel [degrees]

	------------------------------------------------------------------------------------------------
    -- WEIGHT PARAMETERS [kg]
    ------------------------------------------------------------------------------------------------
	M_empty         = 2767,     -- [kg] Empty mass (~6,100 lbs)
    M_nominal       = 3900,     -- [kg] Normal mission mass
    M_max           = 4627,     -- [kg] Max Takeoff Weight (MTOW) (~10,200 lbs)
    M_fuel_max      = 836,      -- [kg] Internal fuel
	
	cargo_max_weight = 1800,    -- [kg] Operational external load limit (approx 4000 lbs)
    cargo_radius_in_menu = 2000,-- [m] radius, when cargo displays in menu
    helicopter_hook_pos = {-0.25, -1.207, 0.0},
    h_max_gear_hook = 2.4,

	------------------------------------------------------------------------------------------------
    -- PERFORMANCE
    ------------------------------------------------------------------------------------------------
	-- Speeds [km/h]
	V_max           = 261,      -- [km/h] Max speed (Vne): 141 kts = ~261 km/h
    V_max_cruise    = 222,      -- [km/h] Cruise speed: 120 kts = ~222 km/h
	
	-- Vertical Performance (Meters)
    -- Note: Single engine UH-2A had limited OGE performance compared to later twins.
    H_stat_max_L    = 1500,     -- [m] Hover OGE (Lightweight)
    H_stat_max      = 900,      -- [m] Hover OGE (Max weight)
    H_din_two_eng   = 5300,     -- [m] Service Ceiling (17,400 ft)
    H_din_one_eng   = 5300,     -- [m] Same as above (Single Engine aircraft)
	
	flight_time_typical = 150,  -- [minutes] Typical flight time
    flight_time_maximum = 210,  -- [minutes] Max endurance
	range           = 1080,     -- [km] Ferry range (582 nmi)
	
	Vy_max          = 10.7,     -- [m/s] Max climb speed: 2,100 ft/min = ~10.7
    Vy_land_max     = 3.66,     -- [m/s] Max vertical landing speed: 12 ft/sec
    Ny_max          = 2.5,      -- [G] Max load factor (+2.5 G)

    ------------------------------------------------------------------------------------------------
    -- AERODYNAMICS & DRAG
    ------------------------------------------------------------------------------------------------
	--[[
		Definition:
			This is the Frontal Reference Area (S_ref), a critical
			parameter for determining drag helicopter drag in DCS.
		
		Calculation:
			1. Main Cabin (Oval)
				The UH-2A Seasprite has a relatively narrow, tall
				cabin compared to transport helicopters.

				Dimensions:	~1.5m wide x 1.8m high

				Shape:		Modeled rectangle

				Calculation:
							Area​ = ~1.5 * ~1.8 = ~2.70 m^2

			2. Engine Doghouse & Intakes
				The structure housing the General Electric T58
				engine sits on top of the cabin.

				Calculation:
							Area = ~1.2 m^2

			3. Landing Gear Sponsors (Retracted)
				The UH-2A has distinctive bulges on the side where
				the main gear retracts.

				Calculation:
							Area = ~1.1 m^2

			4. Rotor Hub & Mast
				The exposed mechanical assembly.

				Estimate: ~0.5 m^2
				
			5. Total Summation:
				S_ref 	= 	2.7 (Cabin) + 1.2 (Engine) +
							1.1 (Sponsons) + 0.5 (Hub)
				
				S_ref 	=	~5.50 m^2
	]]
	fuselage_area 	= 5.5,    	-- Frontal Reference Area (S_ref) [m^2]
	
	--[[
		Definition:
			The drag coefficient at 0 deg Angle of Attack (nose-on airflow).
		
		Derivation:
			f     = Equivalent Flat Plate Area
			S_ref = Reference Frontal Area
			C_x   = 0 deg AoA drag coefficient (fuselage_Cxa0)
		
			C_x   = f / (S_ref)
			
		Calculation:
			1. The Numerator: Equivalent Flat Plate Area (f)
				Historical data for clean, single-engine helicopters
				of this size (like the early S-76 or Bell 222) suggests
				an Equivalent Flat Plate Area (f) of ~2.2 m^2
				
			2. The Denominator: Reference Area (S_ref)
			
				Derived above:
				
					S_ref = fuselage_area
					
					S_ref = 5.50
				
			3. The Calculation
			
				f     = Equivalent Flat Plate Area = ~2.2 m^2
				S_ref = Reference Frontal Area = ~5.5 m^2
				C_x   = 0 deg AoA drag coefficient
			
				C_x   = f / (S_ref)
				
				C_x   = ~2.2 / ~5.5
				
				C_x   = ~0.40
			
	]]
	fuselage_Cxa0 	= 0.40,    -- 0 degree AoA drag coefficient (Forward drag - C_x)
	
	--[[
		Definition:
			The drag coefficient at 90 deg Angle of Attack (airflow
			hitting the bottom of the fuselage, i.e., vertical descent
			or "belly" drag).
		
		Derivation:
			1. The Geometry: Planform (Belly) Area Breakdown
				Main Fuselage:
					Dimensions: Length ~11.48 m × Width ~2.3 m

				Total Geometric Planform Area:
				
					Area = ~11.48 * ~2.3 = ~26.4 m^2
					
			2. The Physics: The "Real" Drag Coefficient
				The UH-2A has a rounded boat-hull bottom
				(designed for emergency water landings).

				Aerodynamics: A rounded cylinder shape (~1.0 * C_d​)
				creates less drag than a sharp-edged flat plate
				(~1.2 * C_d​) or the "brick" shape of a Chinook.

				Therefore, the Effective Drag Area is:
				
					Planform Area (26.4 m^2) x C_d​ (1.0) = 26.4 m^2
					
			3. The Final Calculation
				We divide the Effective Drag Area by the Reference Area
				to get fuselage_Cxa90:
				
					fuselage_Cxa90​ = (Effective Drag) / (S_ref)​
					
					fuselage_Cxa90 = (26.4 m^2) / (5.5 m^2)
					
					fuselage_Cxa90 = 4.80
		
		Summary:
			The value 4.80 is simply telling DCS:
			
				"The belly of this helicopter is 4.8 times larger
				(and draggier) than the nose of the helicopter."
	]]
	fuselage_Cxa90 	= 4.80,    	-- 90 degree AoA (vertical flight) drag coefficient


	-- Tail Configuration
    tail_fin_area   = 1.85,     -- Vertical stabilizer area [m^2]
    tail_stab_area  = 1.35,     -- Horizontal stabilizer area [m^2]
	centering 		= -0.1,		-- Not sure what this is real-world. Have to guess/check to tune stability in DCS.
	
	------------------------------------------------------------------------------------------------
    -- ENGINE & FUEL SYSTEMS
    ------------------------------------------------------------------------------------------------
    -- Engine: 1x General Electric T58-GE-8B Turboshaft
    engines_count   = 1,        
    has_afteburner  = false,    

    engines_nozzles = {
        [1] = {
            pos = {-0.906, 0.762, 0.704},	-- Right engine exhaust plume origin
			elevation 			= -8.0,		-- Points 8 degrees down from longitudinal axis
			azimuth 			= -16.0,	-- -90 degrees is perpendicular to the longitudinal axis and parallel to the ground (right engine)
			diameter 			= 0.30,		-- Mensurated the 3D model in ModelViewer in orthographic projection mode
			exhaust_length_ab 	= 1.1,
			exhaust_length_ab_K = 0.35,
			smokiness_level 	= 0.1,
			engine_number 		= 1,
        }, -- end of [1]
    }, -- end of engines_nozzles
	
	engine_data =
    {
		-- General Electric T58-GE-8B Ratings (Per Engine)
		-- Max Takeoff (Short Duration): 	932 kW (1,250 shp)
		-- Max Continuous: 					783 kW (1,050 shp)
		-- Emergency/WEP: 					932 kW (1,250 shp)
		-- These parameters are meant to be PER ENGINE. If you have x engines, DCS will multiply each value by x for you.

        power_take_off	=	932,	-- Max takeoff power (Short Duration) - 932 kW
        power_max		=	783,	-- Max continuous power - 783 kW
        power_WEP		=	932,	-- Emergency power - 932 kW
		
	--[[ Old/wrong DEBUG REMOVE
		-- UH-2A (T58-GE-8B) Power vs Altitude Coefficients
		-- P(h) = a*h^2 + b*h + c
		-- h in km, P in kW
        power_TH_k = {
			--		 a,       b,      c
            [1] = { 3.30,  -90.15,  783.0}, -- Max Continuous (1050 shp)
			[2] = { 4.18, -110.67,  932.0}, -- Takeoff / Military (1250 shp)
			[3] = {-0.81,  -60.30,  818.0}, -- Intermediate / Cruise
			[4] = {-1.30,  -28.17,  644.0}, -- Low / Descent
        },
	]]
		
		-- UH-2A (T58-GE-8B) Power vs Altitude Coefficients
		-- Unit: kW, Altitude: km
		-- P(h) = a*h^2 + b*h + c
		-- Pattern: [1] Takeoff, [2] Emergency, [3] Continuous, [4] Cruise
		power_TH_k = {
			--		 a,       b,      c
			[1] = { 4.180, -110.67,  932.0 },		-- [1] Max Takeoff (10 min): 932 kW (1,250 SHP)
			[2] = { 4.180, -110.67,  932.0 },		-- [2] Emergency / OEI: 932 kW (Same as Takeoff)
			[3] = { 3.300,  -90.15,  783.0 },		-- [3] Max Continuous: 783 kW (1,050 SHP)
			[4] = { 2.574,  -70.32,  611.0 },		-- [4] Cruise: 611 kW (~78% of Max Cont)
		},
		
        -- UH-2A (T58-GE-8B)
		-- Specific Fuel Consumption vs Altitude
		-- SFC(h) = a*h^2 + b*h + c
		-- Unit: kg / (kW * hr)
		-- h in Meters
		SFC_k 			= {0.0, -1.150e-005, 0.3805},
		
		-- UH-2A (T58-GE-8B)
		-- Power vs RPM Curve coefficients (Normalized) and Min Power Scalar
		power_RPM_k 	= {-0.1250, 0.2900, 0.8350},
		power_RPM_min 	= 20.0/10,		-- Rotor starts turning as engine passes up through 20% RPM
		Nmg_Ready 		= 78.0,       	-- Flight idle Ng RPM (%)
		
        sound_name	=	"Aircrafts/Engines/EngineGE",
    }, -- end of engine_data

    SFM_Data = {
		engine = {
            type 		= "TurboShaft",
            name 		= "T58-GE-8",
			typeng 		= 5,			-- Enumeration for turboshaft engines


            Nmg     	= 59.0,			-- Ground idle Ng or N1 RPM (%)
			Nominal_RPM = 26300.0,		-- 100% speed for the turbine power shaft entering the gearbox
            Nominal_Fan_RPM = 19500.0,	-- Engine output shaft feeds directly into the main transmission
			
            MinRUD  	= 0, 			-- Min state of the throttle
            MaxRUD  	= 1, 			-- Max state of the throttle
            MaksRUD 	= 1, 			-- Military power state of the throttle
            ForsRUD 	= 1, 			-- Afterburner state of the throttle
			
			
            Startup_Prework 	= 20.0,	-- Prework before starting the engines (e.g., APU, initializing GPS)
            Shutdown_Duration	= 42.0,	-- Seconds (Cut-off to engine stop)
            Startup_Duration 	= 28.0, -- Seconds (Starter press to stable idle)
			
		--[[ Not needed?
            -- dcx_eng 	= 0.018, 		-- Engine drag/response coefficient
            -- hMaxEng 	= 5.3, 			-- Max altitude for safe engine operation (km)
            -- dpdh_f  	= 1500, 		-- altitude coefficient for AB thrust
            -- dpdh_m  	= 1500, 		-- altitude coefficient for max thrust
			
			-- -- FUEL CONSUMPTION
            -- -- T58-GE-8B SFC: ~0.64 lb/shp/hr
            -- -- Cruise (550 lbs/hr) = 0.070 kg/s
            -- -- Takeoff (800 lbs/hr) = 0.100 kg/s
            -- cemax   	= 0.100, 		-- Takeoff flow [kg/s]
            -- cefor   	= 0.100,  		-- Takeoff flow [kg/s]
			
		
            table_data = {
            --   M          Thrust (Newtons) 
            --   MTOW: ~4,627 kg (~45,400 N).
            --   Static Thrust needs to be ~1.2x MTOW = ~55,000 N.
                {0.0,   56000.0},  -- Hover Static Thrust (approx 12,500 lbs lift)
                {0.05,  54000.0},  
                {0.1,   48000.0},  -- ETL transition
                {0.15,  38000.0},  
                {0.2,   24000.0},  -- Cruise (~120 kts)
                {0.25,  18000.0},  
                {0.3,   10000.0},  -- High Speed
                {0.4,    4000.0},  
                {0.5,    1500.0},  
                {0.6,       0.0},
                {1.0,       0.0},
            },
		]]
        }, -- end of engine
	},
	
	------------------------------------------------------------------------------------------------
    -- ROTOR & PHYSICS
    ------------------------------------------------------------------------------------------------
	scheme          = 0,		-- "Regular" main rotor/tail rotor helicopter modeling scheme
    -- rotor_height 	= 1.084,    -- Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!) [meters]
	rotor_height	= 1.080367,	-- Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!) [meters]
    rotor_diameter  = 13.41,    -- 44 ft [meters]
    blades_number   = 4,        -- UH-2A/B/C and SH-2F all had 4 Main Rotor Blades
    rotor_pos       = { 0.5715155, 1.804,  0.0},	-- Forward rotor hub position (3D model center of hub)
    tail_pos        = {-7.2339, 4.444,  1.4333},-- Tail rotor hub position (3D model center of hub)
    rotor_RPM       = 298,      -- Main rotor RPM (positive: CCW looking from above)
    tail_rotor_RPM  = 1590,     -- Tail rotor RPM (positive: CW looking from port side) - approx. 5.3:1
    -- sound_name		= "Aircrafts/Engines/RotorSH3",
	sound_name		= "Aircrafts/Engines/RotorOH58",
	
    -- Moments of Inertia
    rotor_MOI		= 4930,     -- [kg*m^2] Rotor total moment of inertia (not per blade) [kg*m^2]
    MOI	= {4100, 23500, 28200}, -- [kg*m^2] {Roll,Yaw,Pitch}

    -- Rotor Aerodynamics (Servo-flap Kaman system)
	--[[
		For the Kaman UH-2A Seasprite, the rotor efficiency factor (commonly
		defined in engineering and simulation contexts as the Figure of Merit
		or the Induced Power Correction Factor) typically falls within the
		following ranges for its specific "101 Rotor" system:
		
		1. Figure of Merit (FM)
		
				Value: 0.62 – 0.65 (Approximate)

				Definition:	This represents the ratio of ideal induced power
							to actual power required in a hover.

				Context: 	While the Kaman rotor hub is aerodynamically
							"cleaner" than conventional swashplate hubs
							(reducing parasite drag), the servo-flaps located
							at the 75% blade station add significant profile
							drag. This keeps the overall efficiency in the
							standard range for 1960s articulated rotors
							(0.60–0.70), rather than exceeding it.

		2. Induced Power Factor (k or κ)

				Value: 1.15 – 1.18

				Definition: The correction factor used in the power equation
							P_induced​ = k*P_ideal​.

				Simulation Use: A value of 1.16 is a safe baseline.
				This accounts for non-ideal inflow distribution caused by the
				fuselage blockage and the servo-flap cutouts in the blades.

		3. Tip Loss Factor (B)

				Value: 0.96

				Context: Standard rotors use ~0.97. The UH-2A value is slightly
				lower because the servo-flap mechanism and the squared-off
				blade tips of the early A-models created slightly more vortex
				interference near the tips compared to later tapered designs.
	]]
	thrust_correction = 0.635, 	-- Rotor efficiency factor/Figure of merit (see discussion above)
    
    -- Blade Data
	--[[
		These figures are based on the "101 Rotor" system (standardized on the SH-2F/G).
		While the UH-2A used an earlier iteration of the hub, the aerodynamic profiles
		for the blade and servo-flap remained consistent across the H-2 family to maintain
		the servo-flap's control characteristics.
		
		1. Airfoil Profiles

			Main Rotor Blade: NACA 23012 (Modified)
			This is a reflexed airfoil common in earlier helicopter designs for its low
			pitching moment, which is critical for the aeroelastic twisting required by
			the Kaman control system.

			Servo-Flap: NACA 633-018
			The servo-flap itself uses this thicker, symmetrical laminar flow airfoil
			to ensure consistent lift generation (control force) regardless of the main
			blade's angle of attack.

		2. Blade Geometry (Aerodynamic Reference)

			Main Rotor Blade Chord: 764 mm (0.764 m)
				Note: 	This chord measurement is taken at the servo-flap station
						(approx. 75% radius). The blade has a constant chord for
						most of its span.

			Servo-Flap Chord: ~180 mm (Derived from 23-25% of the main blade chord).

			Twist: 	The blades have a geometric twist (washout) of approximately
					-6° to -8° from root to tip to distribute lift evenly.
	]]
	-- blade_chord 	= 0.764,   	-- [m] See discussion above 
	-- blade_area 		= 5.12262,  -- [m^2] The area of each blade (approx. = blade chord * (rotor_diameter/2))
	
	-- New source: https://vertipedia.vtol.org/aircraft/getAircraft/aircraftID/726
	blade_chord 	= 0.561,   	-- [m] 		https://vertipedia.vtol.org/aircraft/getAircraft/aircraftID/726
	blade_area 		= 3.76,  	-- [m^2]	https://vertipedia.vtol.org/aircraft/getAircraft/aircraftID/726
	
	--[[
		I think the next two parameters are related to the mechanical stops (limits)
		for the rotor blade Lead-Lag (hunting) motion.
		
		This conclusion is based on data extracted from other DCS helicopters and
		looking at real-world parameters which might match the given data:
		
			Ka-50 lead_stock_main = 0.295,
			Ka-50 lead_stock_support = 0.21,

			Mi-24P lead_stock_main = 0.438,
			Mi-24P lead_stock_support = 0.356

			CH-47F lead_stock_main = 0.265,
			CH-47F lead_stock_support = 0.265
			
			UH-60A lead_stock_main = 0.117
			UH-60A lead_stock_support = 0.138 
		
		
		The Physical Meaning

			lead_stock_main: This is likely the Lag Limit (the rearward stop).

		In powered flight, drag forces cause the rotor blades to "lag" behind the hub's
		rotation. This value defines the maximum angle (in radians) the blade can swing
		backward before hitting the mechanical stop or fully compressing the damper.

			lead_stock_support: This is likely the Lead Limit (the forward stop).

		This defines how far forward the blade can swing (e.g., during autorotation or
		rapid deceleration) before hitting the forward stop.

		In the DCS code structure, "stock" is often a transliteration of the Russian
		term "Shtok" (Шток), which refers to the piston rod of a hydraulic damper.
		Therefore, these parameters define the maximum travel (stroke) of the lead-lag
		damper, expressed as the equivalent angular limit (in radians) of the blade.
		
		
		Data Analysis and Findings
		
		Helicopter	Parameter		(Rad) 	(Deg)	Real-World Context
		Mi-24P		Main (Lag)		0.438	25.1°	Massive articulated rotor allows
													huge lag to absorb drag from heavy
													blades.
					Support (Lead)	0.356	20.4°	Large forward swing allowance for
													high-speed maneuvering.
					
		Mi-8MT		Main (Lag)		0.360	20.6°	Similar to Mi-24 but slightly older
													hub design; limits are tighter.
					Support (Lead)	0.176	10.1°	Much more restrictive forward swing
													limit than the Mi-24.
					
		Ka-50		Main (Lag)		0.295	16.9°	Coaxial rotors must restrict movement
													to prevent blades from hitting each other.
					Support (Lead)	0.210	12.0°
					
		CH-47F		Both			0.265	15.2°	Symmetrical limits. The tandem rotors are
													identical and counter-rotating.
		
		UH-60A		Main (Lag)		0.117	6.7°	Key difference: The UH-60 uses an
													elastomeric rotor head. It doesn't have
													loose mechanical hinges like the Mi-24;
													it twists against a rubber bearing.
													6.7° is a very realistic, tight limit
													for an elastomeric bearing.
					Support (Lead)	0.138	7.9°	Slightly more allowance for lead
													(possibly to account for autorotation
													dynamics).
		
		
		
		* Quick aside - Some helicopters have negative values:
			
			UH-1H lead_stock_main = -0.1,
			UH-1H lead_stock_support = -0.1,
			
			SA342 lead_stock_main = -0.1,
			SA342 lead_stock_support = -0.1,

			OH-58D lead_stock_main = -0.05,
			OH-58D lead_stock_support = -0.05,
			
		It's likely that negative values tell the DCS engine that these are blades rigidly
		attached to the rotor hub and do not have lead-lag articulation.
		
		Summary of the negative value case:
		
		If you see a positive number: The helicopter has a physical hinge, and the number
		is the angle (in radians) where the blade hits the metal stop.

		If you see a negative number: The helicopter relies on structural flexing
		(bending the rotor yoke) OR the flight model is "Custom" and has disabled the
		default hinge physics.
		
		
		
		Specific numerical lead and lag limits (in degrees) for the Kaman
		UH-2A main rotor are not publicly documented in open-source technical
		data or declassified flight manuals.

		However, based on the UH-2A's fully articulated rotor system
		(specifically the "101 Rotor" system used on the H-2 series) and
		comparable naval helicopters of the era, the following engineering
		context is relevant for simulation parameters:

		Rotor Hub Type: Fully articulated with hydraulic lead-lag dampers.

		Typical Articulated Limits: For 4-bladed articulated rotors of this size
		(e.g., H-3 Sea King, H-34), lead/lag motion is typically constrained to
		±15° to ±20° from the radial position during startup/shutdown (static stops)
		and operates within a narrower dynamic range (approx. ±5° to ±10°) during
		flight, damped by the hydraulic system.

		Coupling: Unlike standard swashplate helicopters, the Seasprite's unique
		servo-flap control system introduces significant mechanical coupling.
		Research on the SH-2 rotor indicates the presence of a "Lag-to-Servo-Flap"
		feedback coefficient, meaning blade lag motion mechanically inputs a pitch
		change to the servo flap to dampen oscillations (similar to Delta-3 coupling
		but applied to the flap).
	]]
	lead_stock_main 	= math.rad(10),	-- See discussion above [radians]
	lead_stock_support 	= math.rad(10),	-- See discussion above [radians]  
    
	------------------------------------------------------------------------------------------------
    -- SENSORS & ARMAMENT
    ------------------------------------------------------------------------------------------------
    radar_can_see_ground = false,	-- Is AI radar able to see enemy surface entities (tanks, ships)?
    RCS                 = 10,
    detection_range_max = 11,
    IR_emission_coeff   = 0.04,		-- Su-27 ~= 5000 Watts/steradian; UH-2A/B = ~200 W/sr
	
	HumanRadio = {
		editable = true,
		frequency = 225.0,
		minFrequency = 225,
		maxFrequency = 399.975,
		rangeFrequency = {
			{min = 225.0, max = 399.975, modulation	= MODULATION_AM},
		},
		modulation = MODULATION_AM,
	},

    stores_number	=	4,
    fire_rate	=	0,
	
	Pylons = {
        pylon(1, 0, 0.00, 0.00, 0.00,
             {use_full_connector_position = true, connector = "Pylon_1", FiX = 0, FiY = 0, FiZ = 0},
            {
                { CLSID = "{SH2F_FUEL_TANK_120R}" , connector = "Pylon_1", attach_point_position = {0.0, 0.0, 0}}
            }
        ),
        pylon(2, 0, 0.00, 0.00, 0.00,
             {use_full_connector_position = true, connector = "Pylon_2", FiX = 0, FiY = 0, FiZ = 0},
            {
                { CLSID = "{SH2F_FUEL_TANK_120L}" , connector = "Pylon_2", attach_point_position = {0.0, 0.0, 0}}
            }
        ),
    },
	
	fires_pos = {
        [1] =   {0, 0.7,    0},
        [2] =   {-0.6,  1.1,    0},
        -- (Remaining fires_pos maintained)
        [3] =   {0, 0,  0}, [4] = {-6.8, 0.8, 0}, [5] = {-0.623, -0.746, 0},
        [6] =   {0, 0,  0}, [7] = {0, 0, 0}, [8] = {0, 0, 0}, [9] = {0, 0, 0},
        [10] =  {0, 0,  0}, [11] = {0, 0, 0},
    },

    chaff_flare_dispenser = {
        [1] = { dir = {-0.98, -0.174, -0.087}, pos = {-7.7, -0.25, -0.5} },
        [2] = { dir = {-0.98, -0.174,  0.087}, pos = {-7.7, -0.25,  0.5} },
    },
    
    cannon_sight_type   = 0,

	------------------------------------------------------------------------------------------------
    -- ANIMATIONS & CREW
    ------------------------------------------------------------------------------------------------
	undercarriage_transmission 	= "Hydraulic",
	doors_transmission 			= "Hydraulic",
    undercarriage_movement 		= 2,		-- Enable custom landing gear mechanimations
	doors_movement 				= 2,		-- Enable custom doors mechanimations
    mechanimations = {
		LeftStrut = {
			{Transition = {"Retract", "Extend"},  	Sequence = {{C = {{"Arg", 3, "to", 1.0, "in", 7.0},},},}, 	Flags = {"Reversible"},},
			{Transition = {"Extend", "Retract"},  	Sequence = {{C = {{"Arg", 3, "to", 0.0, "in", 6.0},},},}, 	Flags = {"Reversible"},},
			-- {
				-- Transition = {"Any", "Collapse"},
				-- Sequence = {
					-- {C = {{"VelType", 4}, {"PosType", 7}, {"Arg", 3, "to", 0.5, "speed", 2.0, "sign", -1}}},
				-- },
			-- },
		},
		RightStrut = {
			{Transition = {"Retract", "Extend"},  	Sequence = {{C = {{"Arg", 5, "to", 1.0, "in", 7.0},},},}, 	Flags = {"Reversible"},},
			{Transition = {"Extend", "Retract"},  	Sequence = {{C = {{"Arg", 5, "to", 0.0, "in", 6.0},},},}, 	Flags = {"Reversible"},},
			-- {
				-- Transition = {"Any", "Collapse"},
				-- Sequence = {
					-- {C = {{"VelType", 4}, {"PosType", 7}, {"Arg", 5, "to", 0.5, "speed", 2.0, "sign", -1}}},
				-- },
			-- },
		},
        FoldableWings = {
            {Transition = {"Retract", "Extend"},
                Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 15.0}}}}, Flags = {"Reversible"}},
            {Transition = {"Extend", "Retract"},
                Sequence = {
                    {C = {{"Arg", 8, "to", 1.0, "in", 15.0},},},
                    {C = {{"Arg", 40, "to", 0.0, "in", 15.0},},},
                }, Flags = {"Reversible", "StepsBackwards"}},
        },
		HeadLights = {
			{Transition = {"Any", "Retract"},   Sequence = {{C = {	{"Arg", 3,  "to",  0.0,  "speed", 1/6},
																	{"Arg", 5,  "to",  0.0,  "speed", 1/6},},},},},
																	
			-- {Transition = {"Any", "Taxi"}, 		Sequence = {{C = {	{"Arg", 3,  "to",  1.0,  "speed", 1/7},
																	-- {"Arg", 5,  "to",  1.0,  "speed", 1/7},},},},},
			
			{Transition = {"Any", "High"}, 		Sequence = {{C = {	{"Arg", 3, "to",   1.0,  "speed", 1/7},
																	{"Arg", 5,  "to",  1.0,  "speed", 1/7},},},},},
		},
    },

	crew_size = 3,
    crew_members = {
        [1] = { ejection_seat_name = 0, drop_canopy_name = 0, pos = {2.34,0, -0.457}, pilot_body_arg = 50, role = "pilot"},
        [2] = { ejection_seat_name = 0, drop_canopy_name = 0, pos = {2.34,0,  0.457}, pilot_body_arg = 472, role = "copilot"},
        [3] = { ejection_seat_name = 0, drop_canopy_name = 0, pos = {0.64,0, -0.5}, pilot_body_arg = 473, role = "flight_officer"},
    },

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
	
	rotor_animation = {
        -- rotor_locations = { {pos = { 0.5824, 1.7843, 0.0}, pitch = -0.01}, },
		
		-- Forward Tilt: 6° forward; source: https://www.sjsu.edu/researchfoundation/docs/AHS_1999_Colbourne.pdf
		-- Lateral Tilt: 6° port; source: https://www.sjsu.edu/researchfoundation/docs/AHS_1999_Colbourne.pdf
		-- EDM already has rotor tilted forward 3 degrees w.r.t. the longitudinal axis.
		rotor_locations = { {pos = { 0.5824, 1.8477, 0.0}, pitch = math.rad(-3.0), roll = math.rad(-6.0)}, },
        rotor_models = {
            {
				modelRotorHub_EDM       = "vwv_uh2a_rotorhub_front",
                modelRotorHubLod_FBX    = "/models/sh2f_rotor_hub_lod.fbx",
                boundRotorHub_FBX       = "/models/sh2f_rotor_hub_bound.fbx",
                boundBlade_FBX          = "/models/ch46d_rotor_blade_bound.fbx",
                modelBlade_FBX          = {"/models/sh2f_rotor_blade.fbx"},
            },
        },
        tail_rotor = {
            blades_count    = 3,
            modelBlade_FBX  = "/models/sh2f_blade.fbx",
            rotor_direction = -1,
            rotor_locations = {{pos = {-7.2187, 1.4516, -0.4933}, pitch = 0.0, yaw = math.rad(90)}},
        },
    },
	
	------------------------------------------------------------------------------------------------
    -- TASKS & CARRIER OPS
    ------------------------------------------------------------------------------------------------
    Tasks = {
        aircraft_task(Transport),
        aircraft_task(Reconnaissance),
		aircraft_task(Airborne),
    },
    DefaultTask = aircraft_task(Transport),
    
    LandRWCategories = {
        [1] = {Name = "AircraftCarrier"},
        [2] = {Name = "HelicopterCarrier"},
        [3] = {Name = "AircraftCarrier With Catapult"},
        [4] = {Name = "AircraftCarrier With Tramplin"},
    },
    TakeOffRWCategories = {
        [1] = {Name = "AircraftCarrier"},
        [2] = {Name = "HelicopterCarrier"},
        [3] = {Name = "AircraftCarrier With Catapult"},
        [4] = {Name = "AircraftCarrier With Tramplin"},
    },
	
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
		
			[WOLALIGHT_BEACONS] = {
				-- DCS seems to only turn this collection on during startup of the engines then turns them off when it's time to taxi.
				typename = "Collection",
				lights = { },
			},
			
			[WOLALIGHT_STROBES] = {
				-- Red beacon lights. Old aircraft have rotating/oscillating ones. Modern aircraft flash.
				
			--[[
				For moving around on the ground/taxiing.
				For helicopters at least, WOLALIGHT_TIPS_LIGHTS seems to be ON in more conditions than this collection.
			]]
				typename = "Collection",
				lights = {					
					{
						typename = "RotatingBeacon", 						-- Tail red beacon
						position = { -7.2873, 1.653, 0.000 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						-- angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon", 						-- Red beacon under co-pilot left foot
						position = { 3.53, -1.09, -0.888 },
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						phase_shift = 0.25,									-- Half cycle out of phase with the other 2
						-- angle_max = math.rad(12.0)
					},
				},
			},
			
			[WOLALIGHT_TIPS_LIGHTS] = {
				-- The UH-2A doesn't have tip lights.
				-- This lighting set should be on whenever it's dark outside and the helicopter isn't in combat.
				typename = "Collection",
				lights = { },
			},
			
			[WOLALIGHT_PROJECTORS] = {
				-- Handles spotlights
				typename = "Collection",
                lights = {
					{	-- searchlight (part of 3D model); since this is the first table, the corresponding
						-- mechanimations are: SearchLight0Elevation and SearchLight0Panning
						
						-- Spotlight logic for the CH-46D handled by mechanimations.HeadLights
					},
				},
			},
			
            [WOLALIGHT_LANDING_LIGHTS] = {
				-- This collection turns on for approach and landing, obviously.
                typename = "Collection",
                lights = {
					{	typename = "Spot",
						position = { 3.7399, -0.9398, 0.1633 },
						proto = lamp_prototypes.LFS_R_27_130,
						color = {1, 0.945, 0.8784},
						direction = {azimuth = math.rad(0.0), elevation = math.rad(15.0)},
						angle_max = math.rad(35.0),
						-- angle = math.rad(11.0),
						-- emitter_angle_z = math.rad(12.0),
						range = 600,
					},
					{	typename = "Spot",
						position = { 4.0155, -0.840, -0.16955 },
						proto = lamp_prototypes.LFS_R_27_130,
						color = {1, 0.945, 0.8784},
						direction = {azimuth = math.rad(0.0), elevation = math.rad(5.0)},
						angle_max = math.rad(60.0),
						-- angle = math.rad(11.0),
						-- emitter_angle_z = math.rad(12.0),
						range = 50,
					},
                },
            },
			
            [WOLALIGHT_TAXI_LIGHTS] = {
				-- This collection turns on when taxiing around on the ground.
                typename = "Collection",
                lights = {
					{	typename = "Spot",
						position = { 4.0155, -0.840, -0.16955 },
						proto = lamp_prototypes.LFS_R_27_130,
						color = {1, 0.945, 0.8784},
						direction = {azimuth = math.rad(0.0), elevation = math.rad(5.0)},
						angle_max = math.rad(60.0),
						-- angle = math.rad(11.0),
						-- emitter_angle_z = math.rad(12.0),
						range = 50,
					},
				},
			},
			
            [WOLALIGHT_NAVLIGHTS] = {
                -- 	The argument lights are permanently bright which is a 3D model thing and has to be fixed there.
				-- 	The lights defined below will bounce off nearby objects, but you cannot observe them directly
				-- 	so they don't become balls of light at a distance -- only the 3D model can do that.
                typename = "Collection",
				lights = { },
            },
			
			[WOLALIGHT_CABIN_WORK] = {
                typename = "Collection",
                lights = {
                    { 	-- Ambient cockpit scatter from instruments
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { 5.92719, 0.709705, -0.00877 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(-130.0)},
						-- angle_max = math.rad(165.0),
						range = 2.0,
					},
					{ 	-- Ambient cockpit scatter from instruments
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						connector = "ch46_light_red_cabin",
						intensity_max = 8.0,
						range = 2.0,
					},
                },
            },
			
            [WOLALIGHT_CABIN_NIGHT] = {
				-- This collection turns on when the aircraft is in motion at night (including in combat conditions, I think).
                typename = "Collection",
                lights = { },
            },
			
			[WOLALIGHT_CABIN_BOARDING] = {
				-- These lights are used from engine startup, through taxi, and turn off just after takeoff.
                typename = "Collection",
                lights = { },
            },
			
			[WOLALIGHT_FORMATION_LIGHTS] = {
				-- Slime lights, etc. used around airfields (ground and air), but especially around other aircraft (e.g., aerial refuelers).
				typename = "Collection",
				lights = { },
			},
		},
    },
};
