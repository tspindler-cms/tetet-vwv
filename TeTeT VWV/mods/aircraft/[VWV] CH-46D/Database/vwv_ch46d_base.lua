--[[
	The parameters in this file were populated by HawaiianRyan in December 2025 and are based
	on the CH-46D with T58-GE-10 engines as operated by the USA during the late Vietnam War
	period.
	
	Some values are classified or generally unavailable, so inferences based on other known
	performance numbers or educated guesses are applied and noted where appropriate.
	
	Original work by TeTeT modified by HawaiianRyan.
]]


return {
	Name 				=   'vwv_ch46d',
	DisplayName			= 	_('[VWV] CH-46D Sea Knight'),
	DisplayNameShort	= 	_('CH-46D'),

	Picture 			=  	current_mod_path .. '/Textures/sh_2c_f.png',
	Rate 				= 	40, -- RewardPoint in Multiplayer
	Shape 				= 	"ch46d",

	shape_table_data 	=
	{
		{
			file  	 = "ch46d";
			life  	 = 5; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = ''; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destroyed: 300sec 2m
			username = "ch46d";
			index    =  WSTYPE_PLACEHOLDER;
            classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap = true;
		},
		{
			name  = "ch46d_oblomok";
			file  = "ch46d";
			fire  = { 240, 2};
		},

	},
	
	mapclasskey 		= "P0091000020",
    attribute   		= { wsType_Air, wsType_Helicopter, wsType_Cruiser, WSTYPE_PLACEHOLDER, "Transport helicopters", "Side_approach_type", },
    Categories  		= {"{828CEADE-3F1D-40aa-93CE-8CDB73FE2710}", "Helicopter",},
	country_of_origin 	= "USA",
	
	Tasks = {
        aircraft_task(Transport),
        aircraft_task(Reconnaissance),
        aircraft_task(Airborne),
    },
    DefaultTask = aircraft_task(Transport),
	
	
	-- DIMENSIONS (correct in original)
	length 			= 13.92,    -- Fuselage length: Mostly used for collision avoidance and ensuring it "fits" in its spawn and parking places.
	height 			= 5.08,     -- Height. Mostly used for collision avoidance and ensuring it "fits" in its spawn and parking places.
	rotor_height 	= 3.02,    	-- Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!)
	rotor_diameter 	= 15.24, 	-- Main rotor diameter: 15.24 meters
	blades_number 	= 6,     	-- 3 blades per rotor (6 total)
	blade_chord 	= 0.387,   	-- CH-46D chord length: 38.7 cm = 0.387 meters
	blade_area 		= 2.95,    	-- The area of each blade (blade chord * blade radius = 0.387m * 7.62m)
	rotor_pos		= {5.08, 3.02, 0.0},	-- Forward rotor position (center of hub)
	tail_pos 		= {-5.22, 4.444, 0.0},	-- Aft rotor position (center of hub)
	
	-- ROTOR PERFORMANCE
	rotor_RPM 		= 264,      -- Main rotor RPM (synchronized tandem rotors)
	tail_rotor_RPM 	= -264, 	-- Aft rotor RPM (same as front, negative for counter-rotation)
	
	
							--[[
								ED's CH-47F lists 30000, but the real world CH-47F should have a blade MOI of ~3755 kg*m^2
								and overall rotor MOI of ~21,900 kg*m^2, so what is the CH-47F module using?
								Presume that the DCS CH-47F's definition file is wrong.
								
								Overall CH-46D rotor MOI = ~6,800 - ~8,200 kg*m^2 so we'll pick the mean.
								
								Note: While exact factory data for the "D" model is classified or obscure, this value
								is derived from the standard "1.5-second hover time" energy requirement for twin-engine
								helicopters and scaling from the CH-47B metal-blade system.
							]]
	rotor_MOI 		= 7000,		-- Rotor total moment of inertia (not per blade)
	
	
							--[[
								For the Boeing Vertol CH-46D Sea Knight, the tandem rotor efficiency factor—typically
								referring to the induced power interference factor (k_int​ or K) due to the interaction
								between the two rotors—is approximately 1.16 to 1.18 in hover.

								This factor quantifies the aerodynamic penalty caused by the rear rotor operating in
								the wake of the forward rotor. In terms of overall efficiency, this translates to
								the tandem system being roughly 85% as efficient as two isolated rotors producing
								the same thrust.

								Key aerodynamic specifications determining this factor for the CH-46D include:

									Rotor Overlap (critical driving factor):
									The CH-46D rotors have an overlap of approximately 34% (geometric overlap ratio).

									Interference Mechanism:
									In hover, the rear rotor operates partially in the downwash of the front rotor,
									requiring higher induced power to produce lift. The "efficiency factor" acts as
									a multiplier to the induced power calculated by momentum theory.

									Correction Value:
									While an ideal single rotor has a factor of 1.0, the CH-46D's tandem configuration
									requires an induced power correction of ~1.18 (meaning ~18% more induced power
									is required compared to ideal isolated rotors).
									
								* Note:
								This interference penalty decreases significantly in forward flight(above ~60 knots)
								as the rear rotor moves out of the forward rotor's wake, and the "tandem" configuration
								becomes aerodynamically advantageous due to the lack of a power-consuming tail rotor.
							]]
	
	thrust_correction = 0.85, 	-- Tandem rotor efficiency factor (see discussion above)
	scheme 			= 2,  		-- Tandem rotor scheme enumeration

	-- WEIGHT PARAMETERS (kg)
	M_empty 		= 5827,		-- A empty mass of CH-46D is 	~12,846 lbs = ~5,827 kg
	M_nominal 		= 9435,    	-- Normal mission: 				 20,800 lbs = ~9,435 kg
	
	M_max 			= 11022,   	-- Max gross weight: 			 24,300 lbs = ~11,022 kg
								-- Note: This is the absolute structural limit for takeoff, typically used for
								-- emergency war situations or heavy-lift missions. Operations above 9,435 kg often
								-- require "running takeoffs" rather than vertical ascents.
	
							--[[
								Standard internal fuel (stub wings/sponsons) is approximately
								350 US Gallons (1,325 Liters) = ~2,380 lbs (1,080 kg) using 
								(JP-5/Jet A approx. 6.8 lbs/gallon).
								
								Fuel Burn Rate: ~1,200 lbs/hour (approx. 175–180 gallons/hour)
								
								Endurance: ~2.0 Hours (plus 20 min reserve)
							]]
	M_fuel_max 		= 1080,		-- Internal fuel tanks only (see above)

	-- PERFORMANCE (Speeds in km/h for Helicopters)
	V_max 			= 267.0,    -- Max speed: 144 kts = ~267 km/h
	
							--[[
								Although the aircraft is capable of cruising near its top speed (~265 kph), pilots
								typically flew at the recommended 120–130 knot range for two main reasons:

									Vibration & Stress: Flying near maximum speed (Vne) in a tandem-rotor helicopter
									like the "Phrog" significantly increases vibration and mechanical stress on the
									rotor heads and transmission.

									Fuel Economy: The "Economical Cruise" of ~209 kph (113 knots) is often cited in
									flight manuals (NATOPS) as the speed that provides the best range per pound of fuel.
							]]
	V_max_cruise 	= 231.5,  	-- Cruise speed: 115 kts = ~231.5 km/h
	
	-- Vertical performance, maximum hover altitude (meters)
	H_stat_max_L 	= 4267,   	-- Hover out of ground effect (OGE) (Light)
	H_stat_max 		= 2600,    	-- Hover OGE (Max weight)
	
								-- Note: The aerodynamic ceiling is approx. 5,180 m / 17,000 ft, but the
								-- CH-46D is typically restricted to 14,000 ft by NATOPS regulations
	H_din_two_eng 	= 5180,		-- (oxygen requirements and flight envelope limits).
									
								-- Single engine ceiling
								-- Note: This figure is for a standard mission weight. If the aircraft is at
								-- Max Gross Weight (24,300 lbs) and loses an engine, the single-engine service
								-- ceiling is below sea level -- meaning the aircraft cannot maintain altitude
	H_din_one_eng 	= 1450,		-- and must descend or land immediately.
	
							--[[
								Because running out of fuel in a helicopter is catastrophic (the engines stop and
								hydraulic pumps fail, making autorotation difficult), pilots rarely planned for
								flights longer than 1 hour and 30 minutes.
								
								Start/Warmup: -15 mins fuel

								Reserve Requirement: -20 mins fuel (NATOPS min)

								Usable Mission Time: ~1 hour and 25 minutes
								
								For DCS, I'll assume no warmup and 20m reserve to compute this ceiling.
							]]
	flight_time_typical = 120, 	-- 2.0 hours hours
	
							--[[
								The absolute maximum flight time for the CH-46D Sea Knight on internal fuel alone is
								approximately 2 hours and 15 minutes. This assumes the pilot is flying at
								"Maximum Endurance Speed" (approx. 70–75 knots) to minimize fuel consumption until
								the engines flame out.
							]]
	flight_time_maximum = 135, 	-- Max endurance without extra fuel tanks
	
	range = 370,          		-- Maximum one-way range (km) using internal fuel only

	-- ENGINES (Two General Electric T58-GE-10 turboshafts)
	engines_count 	= 2,		-- How many engines are modeled by this lua (independent of the 3D model)
	has_afteburner 	= false,	-- CH-46D does not have afterburner -- sorry Airwolf fans.
	
	-- FUSELAGE AERODYNAMICS --
								--[[
									fuselage_Cxa0 remains largely unchanged from ED's CH-47F.
									Both aircraft share the same blunt-nosed, tandem-rotor "boxcar"
									aerodynamic shape. The form drag coefficient is determined
									by shape rather than size, and the CH-46 shares the CH-47's
									hydraulically operated ramp and blunt frontal profile.
								]]
	fuselage_Cxa0 	= 0.60,    	-- largely unchanged from ED's CH-47F
	
	
								--[[	
									Derivation: This value is higher for the CH-46. This coefficient
									represents side drag normalized to the frontal area. Because the
									CH-46 is "skinnier" (a lower width-to-length ratio) than the
									wide-bodied CH-47F, its side profile is proportionally larger
									compared to its small frontal face. Therefore, when the wind
									hits it from the side (90°), it generates more drag relative
									to its frontal size than the Chinook does.
								]]
	fuselage_Cxa90 	= 6.8,    	-- See block comment above
	
	
								--[[	
									The CH-46D has a significantly smaller frontal cross-section.
									While the CH-47F features massive fuel sponsons running the length
									of the fuselage (widening its profile to ~3.8m), the CH-46D
									fuselage is slender (~2.2m wide) with smaller, localized sponsons
									at the rear. Scaling the 8.8 m2 of the Chinook by the standard
									mass-to-area relationship (M^{2/3}) yields approximately 5.6 m2.
								]]
	fuselage_area 	= 5.6 ,    	-- Fuselage cross-section area (Sq.-Qubed-Law scaled based on ED's CH-47F's 8.8)


	-- TAIL CONFIGURATION --
								--[[
									This parameter says "area," but I'm not so sure this is meant
									to be the width * height of the rotor pylon. Here's what I can
									get based on ED's CH-47F listing 3.45m as their parameter:
									
									The Aft Pylon (Vertical Profile)

									This parameter represents the vertical surface area of the rear rotor pylon,
									specifically the section that extends above the main fuselage tube.

									Physical Part: The large, slab-sided structure at the back of the helicopter
									that houses the engines and the aft transmission.

									Function: In the real aircraft, this pylon acts exactly like a vertical
									stabilizer (tail fin). It provides "weathercock stability," keeping the
									nose pointed forward during high-speed flight.

									Why 3.45 m2? This is the "effective" aerodynamic side area of that pylon tower.
									It creates side-force when the helicopter slides (yaws) through the air.
									
									CH-46D estimate: 	~2.0 - 2.2
									
									Justification: The CH-46 aft pylon is shorter and narrower; it houses
									smaller engines.
								]]
	tail_fin_area 	= 2.2,     	-- Under the assumptions above, equivalent vertical stabilizer "area" (orig. 3.2)
	
								--[[
									This parameter says "area" just like the above for tail_fin_area, but as above
									it's not the area you would naively assume. Here's what I can gather based
									on ED's CH-47F listing 2.94m as their parameter:
									
									The Fuel Sponsons (Horizontal Profile)

									This parameter almost certainly corresponds to the planform (top-down) area of
									the side fuel sponsons.

									Physical Part: The long pods running along the sides of the lower fuselage that
									hold the fuel and landing gear.

									Function: While not true "wings," these sponsons are flat on top and bottom.
									At speed, they act like short, stubby wings (lifting bodies). They generate a
									small amount of lift and, more importantly, pitch damping (preventing the nose
									from bobbing up and down).

									Why 2.94 m2? The CH-47F has very large, widened fuel sponsons (much larger than
									the CH-46). This value represents the total horizontal surface area of these
									pods acting against the airflow.
									
									CH-46D estimate: 	~0.8 - 1.2		or		0.65 - 0.85 (0.74 recommended)
									
									Critical Difference: The CH-46D has very small "stub" sponsons compared to the
									massive full-length pods on the Chinook. It has very little horizontal surface
									area.
									
									Important Variation: The "Bullfrog" (CH-46E) - The larger sponsons on the "E"
									model (~1.50 equiv.) provided significantly better pitch stability (damping)
									during forward flight, reducing the "porpoising" tendency found in the earlier
									"D" models.
								]]
	tail_stab_area 	= 0.74,    	-- Under the assumptions above, equivalent horizontal stabilizer area (orig. 2.8)
	
								-- CG position (originally -5.2). Research says 194 - 214 inches aft of front rotor hub).
								-- This seems to WANT the distance aft of the front rotor hub.
	centering 		= -5.21,	-- -5.1816 puts it right in the middle of the recommended range but makes the model unstable.


	-- MOMENTS OF INERTIA (kg*m^2)
	-- Format: {pitch, roll, yaw}
	
	--[[
		All the data HawaiianRyan can find on NASA's Technical Memorandum 84281, which details the mathematical
		simulation model for the CH-47B, and making the assumption the CH-47F has essentially the same mass
		distribution and geometric inertia, we should get:
		
			{   R,     Y,	   P  }
			{46100, 259000, 274550} for the real world CH-47B/F, and
			{18000, 103000, 108000} for the real world CH-46D
			
			Scaling Logic: The CH-46D has approximately 50% of the gross weight and roughly 85-90% of the
			fuselage length of the CH-47. Since inertia scales with mass and the square of the length
			(I proportional to mass*length^2), the CH-46's inertia is roughly 35-40% of the CH-47's values.
				
				Note: The pitch and yaw inertias (Iyy​ and Izz​) are very close in magnitude for both helicopters
				because they are long, slender cylinders (tandem configuration), making the distribution of mass
				along the longitudinal axis the dominant factor for both axes.
			
			
		But ED lists
		
			{46000,  76162, 80778} for their DCS CH-47F implementation.
	
		Taking ED's CH-47F values and transforming them yields these proposed CH-46D values:
		
				{   R,    Y,     P  }
				{22428, 37133, 39384}
			
		These values are derived using a mass-geometric scaling factor of approximately 0.49, based on the
		CH-46D having roughly 63% of the empty weight and 88% of the fuselage length of the CH-47F.
		
		The correct order is:  {roll, yaw, pitch} and NOT {yaw, pitch, roll} or {pitch, roll, yaw} 
		because Russians.
		
		There are two choices:
			1) MOI = {22428, 37133, 39384},		-- Scaled based on ED's CH-47F {roll, yaw, pitch} (DCS-ism)
			2) MOI = {18000, 103000, 108000},	-- From NASA Technical Memorandum 84281 transformed to CH-46D's
												   dimensions (real world)
	]]
	
	MOI = {18000, 103000, 108000},	-- From NASA Technical Memorandum 84281 transformed to CH-46D's dimensions (real world)



	-- FLIGHT CHARACTERISTICS
	Vy_max 			= 10.4, 	-- Max climb speed in m/s (for AI)
	
								--[[
									The maximum vertical speed for a landing in the CH-46D Sea Knight is determined
									by its structural design limits,specifically the shock-absorbing capability
									of its landing gear.
										
									Structural Design Limit (Touchdown):
									Approximately 2.4 meters per second(8 feet per second).
									
									Note: This is the standard military design specification (MIL-S-8698) for
									transport helicopters of this era. Touching down at this rate is considered a
									"limit landing" -- the gear will absorb the impact without failure, but it is
									the absolute threshold before potential structural damage occurs.
									
									Hard Landing Threshold: Generally anything exceeding 1.8 – 2.0 meters per second
									(approx. 360–400 feet per minute).
									
									Note: Exceeding this rate usually requires a maintenance inspection
									("hard landing inspection") to check for damage to the landing gear,
									fuselage skin, or rotor transmission mounts.
									
									In normal operations, pilots aim for a vertical speed of 0.5 m/s or less
									(approx. 100 ft/min) at the moment of touchdown.
								]]
	Vy_land_max 	= 2.0,      -- Max vertical speed landing: 1.8-2.0 m/s
	Ny_max 			= 2.5,      -- Max load factor (Max Positive Load: 24.5 m/s2 (Equivalent to +2.5 G))
	
	radar_can_see_ground = false,	-- Is AI radar able to see enemy surface entities (tanks, ships)?
	
	-- LANDING GEAR
	nose_gear_pos 	= { 4.8265695, -1.73, -0.004341}, 	-- Nose gear position (ground under center of the axel: {y,z,x})
	
	main_gear_pos 	= {-2.816938,  -1.23,  1.949},		-- Main gear position (ground under center of the axel: {y,z,x})
														-- automatically mirrored
														
								--[[
									Another complication: what is the definition of "normal" stroke?
									
									Is it with M_nominal or M_empty?
									
									For the CH-46D:
									
									Nose gear (305mm available stroke for real CH-46D; 300mm in DCS 3D model):
										M_nominal (nose)					M_empty
										~76-127mm chrome showing			~200-230mm chrome showing
										
									Main gear (302mm available stroke for real CH-46D; 300mm in DCS 3D model):
										M_nominal (main)					M_empty
										~76mm chrome showing				~150-180mm chrome showing
									
									We'll pick "normal" to mean M_nominal.
								]]
	nose_gear_amortizer_direct_stroke 		= 0.0,		-- Full Strut Expansion (no weight on wheels)
	nose_gear_amortizer_reversal_stroke 	= -0.300225,-- Full Strut Compression (maximum+ weight on wheels)
	nose_gear_amortizer_normal_weight_stroke= -0.10,	-- Strut Weight Compression (normal compression with weight on wheels; number is amount of "chrome showing")
	nose_gear_wheel_diameter 				= 0.5005,	-- Diameter of the nose gear wheel (meters)

	main_gear_amortizer_direct_stroke 		= 0.0,		-- Full Strut Expansion (no weight on wheels)
	main_gear_amortizer_reversal_stroke 	= -0.29984,	-- Full Strut Compression (maximum+ weight on wheels)
	main_gear_amortizer_normal_weight_stroke= -0.076,	-- Strut Weight Compression (normal compression with weight on wheels; number is amount of "chrome showing")
	main_gear_wheel_diameter 				= 0.4892,	-- Diameter of the main gear wheels (meters)
	
	
	

								--[[ 	
									Based on the NATOPS flight manual for the CH-46D Sea Knight, the nose wheel has
									two distinct modes of operation regarding its turning angle:
										
									1) Power Steering Limit (Taxiing): When the Nose Wheel Steering (NWS) system is
									engaged, the nose wheel is steerable through a 60° arc (typically 30° left and
									30° right) via the rudder pedals. This allows the pilot to perform controlled
									turns during taxi.

									2) Swivel Limit (Towing/Handling): For ground handling and towing, or when the
									steering is disconnected/unlocked, the nose wheel is capable of swiveling 360°
									continuously.
									
									
									Since DCS only models self-powered movement, pick (1) then add some extra
									freedom of motion to account for real-world pilots using pedal turns.
								]]
	wheel_steering_angle_max = math.rad(65.0),
	
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
									attached to the rotor hug and do not have lead-lag articulation.
									
									Summary of the negative value case:
									
									If you see a positive number: The helicopter has a physical hinge, and the number
									is the angle (in radians) where the blade hits the metal stop.

									If you see a negative number: The helicopter relies on structural flexing
									(bending the rotor yoke) OR the flight model is "Custom" and has disabled the
									default hinge physics.
									
									
									Back to our CH-46D...
									
									We will choose:
									
											lead_stock_main: 	0.265 (approx. 15.2°)

											lead_stock_support:	0.265 (approx. 15.2°)
											
									
									The Rationale
									
									
									1. Design Lineage (The "Little Brother" Rule)
									
									The CH-46 Sea Knight is the direct predecessor to the CH-47 Chinook. Both
									were designed by Vertol (later Boeing Vertol) using the exact same rotor
									hub philosophy:

									Tandem Configuration: 	Two identical, counter-rotating rotors.

									Fully Articulated Hubs:	3 blades per hub, with vertical flapping hinges
															and vertical lead-lag (drag) hinges.

									Hydraulic Dampers: 		Both use linear hydraulic dampers to manage the
															lead-lag hunting.

									Because the hub geometry is geometrically scaled, the angular limits
									(the maximum range the blade can swing before hitting a stop) are likely
									identical or nearly identical to the CH-47.
									
									
									2. Why Symmetrical Values?
									
									Just like the CH-47, the CH-46 uses two identical rotor heads.

									If lead_stock_main and lead_stock_support were different (asymmetric),
									it would imply the rotor is optimized for air flow coming from only one
									direction (like a standard helicopter).

									Tandem rotors must operate efficiently with the rear rotor flying in
									the wake of the front rotor, and the transmission synchronizes them.
									Symmetrical stops (+/-15.2°) are standard for this configuration to
									prevent the blades from swinging out of sync and colliding (intermeshing).
									
									
									3. Why not "Negative" or "Low"?

									Not Negative: The CH-46 has real physical hinges (unlike the UH-1H).

									Not Low (<0.15): The CH-46 uses metal hinges and oil-filled dampers,
									not the stiff elastomeric (rubber) bearings found on the UH-60 Black Hawk.
									It needs the loose "swing" (15°+) to smooth out the vibrations of the
									tandem system.
									
									
								]]
	lead_stock_main 	= 0.265,	-- See discussion above
	lead_stock_support 	= 0.265,	-- See discussion above
	
									-- Best/closest sound we will get given the tandem rotor design of each
    sound_name		= "Aircrafts/Engines/RotorCH47",

    stores_number	=	0,
    fire_rate		=	0,
	
	-- CARRIER OPERATIONS
	LandRWCategories = {
		[1] = {Name = "AircraftCarrier"},
		[2] = {Name = "HelicopterCarrier"},},
	TakeOffRWCategories = {
		[1] = {Name = "AircraftCarrier"},
		[2] = {Name = "HelicopterCarrier"},},
	
	-- CARGO CAPACITY
	openRamp 		= 1,  		-- allow task for internal cargo transportation 
	doors_movement 	= 2,		-- Enable custom doors mechanimations?
	
	InternalCargo 	= {
		nominalCapacity = 3175,		-- 7,000 lbs / 3,175 kg or 25 troops
		maximalCapacity = 4100,		-- 10,000 lbs / 4,536 kg maximum, but setting to 9,000 lbs because of fuel
		para_unit_point = 10,		-- Paratrooper capacity
		unit_point 		= 18,		-- Troops capacity
		area 			= {8.5, 1.8, 2.1}, 	-- Cargo bay dimensions (L×W×H)
			
			--[[
				A soldier or Marine in full combat gear required significantly more space than the standard
				military seat allotment. While a standard seat was designed for an 18–20 inch width,
				a combat-loaded trooper required roughly 24 to 26 inches of width.
				
				
						Standard troop		Combat loaded		Notes
						(No gear)			(Vietnam)
						
				Width	~18–20 inches		24–26 inches		Bulk of M-1956/ALICE webbing, canteens,
						~0.46-0.51 meters	0.61-0.66 meters	and ammo pouches worn on the hips.
																
				Depth	~24 inches			30+ inches			Rucksacks were often held on laps or
						~0.61 meters		0.76+ meters		placed between legs/knees for rapid
																egress.
										
			]]
		unit_block 	   = {0.76, 0.63},		-- Volume of each soldier/marine (L, W) (meters)
		far_wall_pos   = {4.2, -0.2325, 0},	-- coordinates of point on cargohold floor, along centerline, fore face of cargohold
		deck_connector = "CARGO_VOLUME",
		ramp_connector = "RAMP_PLATFORM",
		seat_connector = "SEAT_POINT",
		
		out_door = {
			cargo_ramp = {
				large 	= true, 
				x 		= -5.12, 
				z 		= 0, 
				heading = math.rad(-180),
				door_connector_name = "AIRDROP_RIGHT",
				mechanicals = {
					close 	= {"Door0", "Close"},
					deploy 	= {"Door0", "Deploy"},
					board 	= {"Door0", "Board"},
					deployable = {
						{mechanism = "Door0", states = {"Open","Deploy",}},
					},
					boardable = {
						{mechanism = "Door0", states = {"Open","Board",}},
					},
				},
			},
			side_door = {
				large 	= false, 
				x 		= 3.92,
				z 		= -0.2325, 
				heading = math.rad(90),
				door_connector_name  = "STBD_DOOR",
				mechanicals = {
					close 	= {"Door1", "Close"},
					deploy 	= {"Door1", "Deploy"},
					board 	= {"Door1", "Board"},
					deployable = {
						{mechanism = "Door1", states = {"Open","Deploy",}},
					},
					boardable = {
						{mechanism = "Door1", states = {"Open","Board",}},
					},
				},
			},
		},
	},
	
	cargo_max_weight 	 = 4536,  				-- CH-46D external cargo sling load: 4,536 kg / 10,000 lbs
	cargo_radius_in_menu = 2000,				-- Presumably how far you have to be away from cargo to have it show up in the cargo UI
	helicopter_hook_pos  = {-0.21, -0.406, 0},	-- Belly hook coordinates (sliding door and hook not modeled in 3D model)
	-- helicopter_hook_pos = {3.340,1.375,1.625},	-- The hook on this helo's 3D model is here after argument 1003 = +1.000.
	h_max_gear_hook 	 = 3.3,					-- What is this parameter? Maybe how close the hook needs to be to "latch" onto cargo? 3.3

	-- SIGNATURES
	RCS 				= 25,  	-- Large tandem-rotor helicopter
	detection_range_max = 15,  	-- The max range enemy AI can visually see this aircraft in clear weather (km)
	IR_emission_coeff 	= 0.85, -- Moderate IR signature (turboshaft engines)
	
	-- Comms config
	
		--[[
			During the Vietnam War, the U.S. Marine Corps CH-46D Sea Knight was typically equipped
			with two primary communication systems: a UHF radio for aviation/ship communication
			and a VHF-FM radio for tactical communication with ground troops.

			Here are the specific radio models and their frequency ranges:
			
			1. AN/ARC-51 (UHF Command Radio)

			This was the primary radio for air-to-air, air-to-ship, and air-to-tower communications.
			Because the CH-46 was a Navy/Marine asset, it relied heavily on the UHF band.

				Frequency Range: 225.0 to 399.9 MHz
				Modulation: AM (Amplitude Modulation)
				Channels: 3,500 selectable channels (50 kHz spacing)
				Guard Channel: Tuned automatically to 243.0 MHz (Military Air Distress)

			2. AN/ARC-54 (VHF-FM Tactical Radio)

			This was the "Fox Mike" radio used to talk to Marine infantry and Army ground units.
			It was essential for coordinating landing zones (LZs) and medevacs.

				Frequency Range: 30.00 to 69.95 MHz

			Modulation: FM (Frequency Modulation)
			Channels: 800 selectable channels (50 kHz spacing)
			
			Note: Towards the very end of the war or during post-war upgrades, this was sometimes
			replaced by the AN/ARC-131, which extended the range slightly to 30.00 – 75.95 MHz.
			
			Historical Note: Unlike modern helicopters, the standard CH-46D in Vietnam did not
			typically carry a VHF-AM radio (118.00–136.00 MHz) for civilian air traffic control,
			nor did it standardly carry HF (High Frequency) radios for long-range over-the-horizon
			communication, relying instead on line-of-sight UHF/VHF.
		]]
	HumanRadio = {
		editable = true,
		frequency = 225.0,
		minFrequency = 30,
		maxFrequency = 399.975,
		rangeFrequency = {
			{min =  30.0, max =  75.975, modulation	= MODULATION_FM},
			{min = 225.0, max = 399.975, modulation	= MODULATION_AM},
		},
		modulation = MODULATION_AM,},
	
	-- CREW
	crew_size 		= 3,  		-- Pilot, copilot, crew chief (typically)

    crew_members = {
        [1] =
        {
			bailout_arg 			= 38,
			boarding_arg 			= 38,
            ejection_seat_name 		= 0,
            drop_canopy_name 		= 0,
            pos 					= {3.93, 0.40, -1.09},
			ejection_added_speed	= {0.0, 0.0, -1.0},
            pilot_body_arg 			= 50,
            canopy_arg 				= 38,
            role 					= "pilot"
        }, -- end of [1]
        [2] =
        {
			bailout_arg 			= 38,
			boarding_arg 			= 38,
            ejection_seat_name 		= 0,
            drop_canopy_name 		= 0,
            pos 					= {3.93, 0.40, -1.09},
			ejection_added_speed	= {0.0, 0.0, -1.0},
            pilot_body_arg 			= 472,
            canopy_arg 				= 38,
            role 					= "copilot"
        }, -- end of [2]
		[3] =
        {
			bailout_arg 			= 38,
			boarding_arg 			= 38,
            ejection_seat_name 		= 0,
            drop_canopy_name 		= 0,
            pos 					= {3.93, 0.40, -1.09},
			ejection_added_speed	= {0.0, 0.0, -1.0},
            canopy_arg 				= 38,
            role 					= "flight_officer"
        }, -- end of [3]
    },
		

    Pylons 			= { },
	
	
	AddPropAircraft = {{		-- This adds a checkbox in the mission editor to fold blades
            id = "FoldRotor",
            control = 'checkbox' ,
            label = _('Fold Main Rotor'),
            defValue = false,
            weightWhenOn = 0,
            arg = 8,
            wCtrl = 150
        },},
		

    rotor_animation = {
        rotor_locations = {
		--[[
			The spec sheeet for the CH-46D/E/F says:
			
			Forward rotor (9.51° forward tilt); Aft rotor (7° forward tilt).
			
			However, the 3D model we have doesn't really jive well with those numbers. HawaiianRyan found numbers which
			work well visually.
			
			Pick this block if you want to match: https://www.youtube.com/watch?v=gWjZ4bjWxww which shows the front rotor on top of the rear rotor (!!).
			Also this video (e.g., 5m:56s and 10m:47s): https://www.youtube.com/watch?v=GIImvUbg31M
			
			{pos = {5.006, 3.035, 0.0}, pitch = -math.rad(9.51)},	-- Forward rotor (9.51° forward tilt; negative means pitch forward, positive is aft tilt)
			{pos = {-5.209, 4.460, 0.0}, pitch = -math.rad(7.0)},	-- Aft rotor (7° forward tilt; negative means pitch forward, positive is aft tilt)
			
			
			
			The 3D model we have doesn't jive well with the real numbers.
			Mensurating the 3D model gives: 		Forward rotor (12.75° forward tilt); Aft rotor (7.23° forward tilt).
			
			{pos = {5.006, 3.035, 0.0}, pitch = -math.rad(12.75)},	-- Forward rotor (12.75° forward tilt; matches 3D model)
			{pos = {-5.209, 4.440, 0.0}, pitch = -math.rad(7.23)},	-- Aft rotor (7.23° forward tilt; matches 3D model)
			
			
			This block is a good balance between videos of real-world CH-46Ds and their rotor discs vs. what's possible with this DCS 3D model.
			Also see: https://www.facebook.com/100063486350259/videos/the-boeing-vertol-ch-46-sea-knight-helicopter-startup-and-take-off/660384630169554/
			And: https://www.youtube.com/watch?v=ewXiz2LHuuQ
			
			{pos = {5.006, 3.035, 0.0}, pitch = -math.rad(8.0)},    -- Forward rotor (8° forward tilt; experimentally determined to "look right")		-- DEBUG: old value
			{pos = {-5.209, 4.440, 0.0}, pitch = -math.rad(5.5)},   -- Aft rotor (5.5° forward tilt; experimentally determined to "look right")			-- DEBUG: old value
			
			{pos = { 5.07827, 3.04067, 0.0}, pitch = -math.rad(8.0)},    -- Forward rotor (8° forward tilt; experimentally determined to "look right")
			{pos = {-5.18350, 4.45821, 0.0}, pitch = -math.rad(5.5)},   -- Aft rotor (5.5° forward tilt; experimentally determined to "look right")
			
			
			Pick this block if you want it to "look right" according to this picture, which shows more of a gap between the rotor discs:
			https://www.history.navy.mil/content/history/museums/nnam/explore/collections/aircraft/c/ch-46a-sea-knight/ch-46-sea-knight-operations-in-south-vietnam.html
			{pos = {5.006, 3.035, 0.0}, pitch = -math.rad(6.5)},   	-- Forward rotor; negative means pitch forward, positive is aft tilt.
			{pos = {-5.209, 4.430, 0.0}, pitch = -math.rad(5.0)}   	-- Aft rotor; negative means pitch forward, positive is aft tilt.
			
			
																	Based on https://www.youtube.com/watch?v=_ye_tYqJbcU it seems
																	6.5 degrees and 5 degrees forward matches better, but we're
																	trying to match against CH-65E shown in this video.
		]]
			{pos = { 5.07827, 3.04067, 0.0}, pitch = -math.rad(8.0)},	-- Forward rotor (8° forward tilt; experimentally determined to "look right")
			{pos = {-5.18350, 4.45821, 0.0}, pitch = -math.rad(5.5)},	-- Aft rotor (5.5° forward tilt; experimentally determined to "look right")
		},
		
        rotor_models = {{
                modelRotorHub_EDM       = "ch46d_rotor_head_front",
                modelRotorHubLod_FBX    = "/models/ch46d_rotor_head_front_lod.fbx",
                boundRotorHub_FBX       = "/models/ch46d_rotor_head_front_bound.fbx",
                boundBlade_FBX          = "/models/ch46d_rotor_blade_bound.fbx",
                modelBlade_FBX          = {"/models/ch46d_rotor_blade.fbx"},
            },{
                modelRotorHub_EDM       = "ch46d_rotor_head_rear",
                modelRotorHubLod_FBX    = "/models/ch46d_rotor_head_front_lod.fbx",
                boundRotorHub_FBX       = "/models/ch46d_rotor_head_front_bound.fbx",
                boundBlade_FBX          = "/models/ch46d_rotor_blade_bound.fbx",
                modelBlade_FBX          = {"/models/ch46d_rotor_blade.fbx"},
            },
        },
    },


    engines_nozzles = {
        [1] = {
            pos = {-4.5046, 2.042, -0.7},	-- Left engine exhaust plume origin
			elevation 			= -20.0,	-- Points 20 degrees down from longitudinal axis with rotor downwash
			azimuth 			= 35.0,		-- +90 degrees is perpendicular to the longitudinal axis and parallel to the ground (left engine)
			diameter 			= 0.55,		-- Mensurated the 3D model in ModelViewer in orthographic projection mode
			exhaust_length_ab 	= 0.7,
			exhaust_length_ab_K = 0.35,
			smokiness_level 	= 0.12,
			engine_number 		= 1,
        }, -- end of [1]
        [2] = {
            pos = {-4.5046, 2.042, 0.7},	-- Right engine exhaust plume origin
			elevation 			= -20.0,	-- Points 20 degrees down from longitudinal axis with rotor downwash
			azimuth 			= -35.0,	-- -90 degrees is perpendicular to the longitudinal axis and parallel to the ground (right engine)
			diameter 			= 0.55,		-- Mensurated the 3D model in ModelViewer in orthographic projection mode
			exhaust_length_ab	= 0.7,
			exhaust_length_ab_K = 0.35,
			smokiness_level 	= 0.12,
			engine_number 		= 2,
        }, -- end of [2]
    }, -- end of engines_nozzles
	

    engine_data = {
		-- T58-GE-10 Ratings (Per Engine)
		-- Max Takeoff (Short Duration): 	~1,400 SHP = 1,044 kW
		-- Max Continuous: 					~1,250 SHP = 932 kW
		-- Emergency/WEP: 					~1,400 SHP = 1,044 kW
		
		-- These parameters are meant to be PER ENGINE. If you have x engines, DCS will multiply each value by x for you.
		
		--[[	
			The CH-46D combining transmission is rated for a maximum continuous input of approximately 2,800 SHP (2,088 kW).
			
			Because the two T58-GE-10 engines produce exactly 1,400 SHP each (2,800 SHP total) at their maximum Military
			power setting, the engine output is perfectly matched to the transmission's structural limit. You cannot
			"over-torque" the transmission with healthy -10 engines unless you exceed the engine's own thermal limits (N1/EGT).
			
			Limits:
				* Military (Takeoff - 30 mins): 1,400 SHP (1,044 kW) per engine.
				* Normal (Continuous): 1,250 SHP (932 kW) per engine.
				* The lack of a higher "Emergency" rating meant that if you lost an engine while heavy, you lost 50% of your
				  power instantly, with no "super-boost" available from the survivor. This made the CH-46D significantly more
				  vulnerable in combat/hover scenarios compared to the CH-46E (which had -16 engines that could surge to
				  1,870 SHP to compensate).
				  
				  
			In the CH-46D, 100% Torque indicated 1,400 SHP (Military Power).

			This is why later CH-46E pilots (flying with -16 engines but the same transmission gauges) would see torque
			readings of 120-130% during high-power maneuvers -- the gauge was still calibrated to the old D-model limit
			of 1,400 SHP.
			
			
			* Note: The T58-GE-10 engine did not have a specific "2.5-minute" or "Emergency" contingency rating exceeding
			its Military power. In a short-term emergency (like an engine failure), the pilot was limited to the Military
			rating of the remaining engine (1,044 kW).
			
			
			This community module models the CH-46D with 2x T58-GE-10 engines.
			
			
			Note on the CH-64E:
			
			The primary advantage of the -16 engine is not necessarily combined power, but safety. In the event of
			a single engine failure, the remaining engine can produce enough power (up to 1,870 SHP) to keep the
			helicopter flying, whereas earlier engines (like the T58-GE-10 at 1,400 SHP) provided significantly
			less margin for single-engine recovery.
		]]
		
		power_take_off 	= 1044,		-- Takeoff power per engine: 1,400 SHP = ~1,044 kW (Total 2,800 SHP).
		power_max 		= 932,		-- Max Continuous: 1,250 SHP = 932 kW per engine (Total 2,500 SHP).
		power_WEP 		= 1044,		-- Absolute engine power limit: 1,400 SHP = ~1,044 kW (Total 2,800 SHP).
		
		
		
		-- Power variation with altitude and temperature
		-- Format: {coefficient_quadratic, coefficient_linear, constant}
		power_TH_k = {
			[1] = {  8.5,  -245.0,  2150.0 },  	-- Sea level, standard temp
			[2] = {  9.2,  -260.0,  2200.0 },  	-- Low altitude
			[3] = { -2.5,  -155.0,  1980.0 },  	-- Medium altitude
			[4] = { -4.0,   -85.0,  1520.0 },  	-- High altitude
		},
		
		SFC_k 		= {0.0, -1.2e-005, 0.36},	-- Specific fuel consumption
		power_RPM_k 	= {-0.085, 0.24, 0.84}, -- Power vs RPM relationship
		power_RPM_min 	= 9.0,
		Nmg_Ready 		= 78.0,       			-- Flight idle Ng or N1 RPM (%)
				
					--[[
						The T58-GE-10 (used in the CH-46 Sea Knight and SH-3 Sea King) is notorious
						for its "scream" due to its all-axial 10-stage compressor spinning at very
						high RPM (approx. 26,300 RPM). The high-pitched whine comes from the
						"blade pass frequency" of those small compressor blades cutting through
						the air, combined with the intake geometry.
						
						The closest match we can leverage in the existing DCS library is
						the "Whistling Death" Isotov TV3-117.
						
						While deeper in tone than the T58, this is the standard Russian military
						helicopter engine.

						Aircraft: Mi-24 "Hind", Mi-8MT / Mi-17 "Hip", Ka-50/52.

						The Sound: These engines have a very distinct "whistling" start-up sequence.
						Before the main rotors even turn, the AI-9V APU (Auxiliary Power Unit) emits
						a high-pitched scream, followed by the high-frequency whine of the TV3-117
						engines spooling up.

						Comparison: While the T58 is a steady whine, the TV3-117 has a characteristic
						"warbling" or "modulating" whine during flight maneuvering due to the engine
						governor fighting to maintain RPM under the heavy load of the main rotor.
						
						
						Here are some alternatives if you don't like this choice:
							sound_name = "Aircrafts/Engines/EngineGE_CH47",
							sound_name = "Aircrafts/Engines/EngineGE",
					]]
		sound_name	= "Aircrafts/Engines/EngineTV3117",
    },
	
	--[[
		Note: 	The Simple Flight Model (SFM) table_data determines your total thrust,
				but engine_data drives fuel consumption and some system logic. Aligning
				this with reality prevents "infinite climb" scenarios.
	]]
	
	SFM_Data = {
        engine = {
            type 		= "TurboShaft",
            name 		= "T58-GE-10",
			typeng 		= 5,			-- Enumeration for turboshaft engines


            Nmg     	= 59.0,				-- Ground idle Ng or N1 RPM (%)
			Nominal_RPM = 19500.0,		-- 100% speed for the power turbine feeding the transmission (Nf or N2)
            Nominal_Fan_RPM = 6000.0,	-- The T58 engine has an integral reduction gearbox that steps the
										-- 19,500 RPM turbine speed down to ~6,000 RPM before it enters the
										-- helicopter's main transmission mixing gearbox.
										
            MinRUD  	= 0, 			-- Min state of the throttle
            MaxRUD  	= 1, 			-- Max state of the throttle
            MaksRUD 	= 1, 			-- Military power state of the throttle
            ForsRUD 	= 1, 			-- Afterburner state of the throttle
			
			
            Startup_Prework 	= 20.0,	-- Prework before starting the engines (e.g., APU, initializing GPS)
            Shutdown_Duration	= 30.0,	-- Similar duration for AI to wait for shutting down avionics
            Startup_Duration 	= 50.0, -- Increased to 50s for realistic twin-engine sequence
										-- (https://www.facebook.com/reel/660384630169554)
										-- also https://www.youtube.com/watch?v=gWjZ4bjWxww
			

            dcx_eng 	= 0.015, 		-- Engine drag coefficient
            hMaxEng 	= 5.18, 		-- Max altitude for safe engine operation (km)
            dpdh_f  	= 1800, 		-- altitude coefficient for AB thrust
            dpdh_m  	= 1800, 		-- altitude coefficient for max thrust
			
			-- FUEL CONSUMPTION (TOTAL for 2 Engines)
			-- T58-GE-10: ~0.64 to ~0.66 lb/shp/hr (TSFC) at cruise
			-- Cruise burn: ~1224 lbs/hr total = ~0.154 kg/s total
			-- Takeoff burn: ~0.226 kg/s total
			
            cemax   	= 0.154, 		-- Cruise flow (kg/s) - Total for aircraft (both engines)
            cefor   	= 0.226,  		-- Takeoff flow (kg/s) - Total for aircraft (both engines)
			
			
			-- I don't know if helicopters even use this table. Might be only fixed-wing in DCS.
			
            table_data = {
            --   M          Thrust (Newtons) 
            --   Notes: MTOW is ~11,000kg (~108,000 N). Thrust must exceed this for Hover.
            --   Thrust drops as speed increases (Power = Force * Velocity)
			
                {0.0,     130000.0}, 	-- Hover Static Thrust (Allows Vertical Takeoff)
                {0.1,     105000.0}, 	-- Transition
                {0.2,      75000.0}, 	-- Cruise Speed (~130 kts) - Drag equilibrium
                {0.3,      45000.0}, 	-- High Speed / Vne
                {0.4,      25000.0}, 	-- Aerodynamic Limit
                {0.5,      10000.0}, 	-- Theoretical limit
                {0.6,       5000.0},
                {0.7,          0.0},
                {0.8,          0.0},
                {0.9,          0.0},
                {1.0,          0.0},
            },
        }, -- end of engine
    },
	
	
    cannon_sight_type	=	0,
	
    fires_pos =
    {
        [1] = {0,  0,  0.000}, -- "MAIN"
        [2] = {-4.444,  2.097, -0.600}, -- "ENGINE_L"
        [3] = {-4.444,  2.097,  0.600}, -- "ENGINE_R"
        [4] = {-5.958,  1.843,  0.000}, -- "TAIL"
        [5] = {-1.700,  0.130, -1.500}, -- "FUEL_TANK_LEFT_SIDE"
        [6] = {-1.700,  0.130,  1.500}, -- "FUEL_TANK_RIGHT_SIDE"
    }, -- end of fires_pos

    effects_presets = {
        {effect = "HeaterExhaustSmokeTrail", preset = "KO_50"},
        {effect = "HeaterExhaustHotAir", preset = "KO_50"},
		{effect = "APU_STARTUP_BLAST", preset = "mi8mtv2", ttl = 3},
    },

    chaff_flare_dispenser = { },
	
    Damage = verbose_to_dmg_properties({
        -- Сabin
        ["COCKPIT"] = {
            args = {65}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["FUSELAGE_BOTTOM"] = {
            args = {149}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["FUSELAGE_TOP"] = {
            args = {150}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["ROTOR"] = {
            args = {151}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["TAIL_ROTOR"] = {
            args = {152}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["TAIL_BOTTOM"] = {
            args = {153}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["LEFT_GEAR_BOX"] = {
            args = {153}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["RIGHT_GEAR_BOX"] = {
            args = {154}, damage_boundary = 0.1,
            critical_damage = 3.5,
            construction = {durability = 4.15, skin = "Aluminum"},
            droppable = false,
        },
        ["WHEEL_FL"] = {
            critical_damage = 5,
            args = {267},
            construction = {durability = 10.0, skin = "Steel", spar = "Rod"},
            droppable = false,
        },
        ["WHEEL_L"] = {
            critical_damage = 5,
            args = {266},
            construction = {durability = 10.0, skin = "Steel", spar = "Rod"},
            droppable = false,
        },
        ["WHEEL_R"] = {
            critical_damage = 5,
            args = {137},
            construction = {durability = 10.0, skin = "Steel", spar = "Rod"},
            droppable = false,
        },
    }),

    DamageParts = { },
	
	net_animation = {
		-- Determines what is sent across the network for appearance states.
		-- Only useful for multiplayer, obviously, but each one you turn on means more network traffic
		
        1,				-- Nose gear compression
		2,				-- Nose gear left/right
		4,				-- Right main landing gear compression
		6,				-- Left main landing gear compression
		8,				-- Rotor folding
		-- 31,			-- Bort numbers
		-- 32,			-- Bort numbers
		36,				-- Main ramp
		38,				-- Helo side door
		39,				-- Both pilots head turning
		-- 40,				-- Both rotors turning
		50,				-- Right seat pilot presence
		
		76,				-- Nose wheels spinning
		77,				-- Main wheels spinning
		190,			-- Stbd. green nav light
		191,			-- Port red nav light
		192,			-- Beacon light
		193,			-- Front dorsal strobe (red)
		209,			-- Search light intensity
		
		472,			-- Left seat co-pilot presence
		591,			-- Ventral strobe (red)
		593,			-- Aft dorsal strobe (red)
		
		1000,			-- CH-46D (late) countermeasure fins
		-- 1003, 			-- Winch extend from fuselage
		1004,			-- Search light pan left/right
		1005,			-- Search light pitch up/down
    },
	
    mechanimations = {
		
		Door0 = {
			-- Open/close main ramp (aft of aircraft)
			-- 0.026 to hit ground with compression (args 4 & 6 -> 0.58 for appropriate compression when full open = 0)
            {
                Transition = {"Any", "Open"},
                Sequence = {
					{C = {											-- All simultaneously in the same step
						{"Arg", 2, "to", 0.0, "in", 2.0},			-- Center the nose gear in two seconds (from whatever its position is)
                    	{"Arg", 36, "to", 0.026, "speed", 0.2},		-- Open the ramp almost completely at a rate = full ramp transit in 5 seconds
					}},
				},
            },
            {
                Transition = {"Any", "Close"},
                Sequence = {
                    {C = {											-- All simultaneously in the same step
						{"Arg", 2, "to", 0, "in", 2.0},				-- Center the nose gear in two seconds (from whatever its position is)
						{"Arg", 36, "to", 1.0, "speed", 0.2},		-- Closes the ramp at a rate = full ramp transit in 5 seconds
					}},
                },
            },
			{
                Transition = {"Any", "Board"},
                Sequence = {
					{C = {											-- All simultaneously in the same step
						{"Arg", 2, "to", 0.0, "in", 2.0},			-- Center the nose gear in two seconds (from whatever its position is)
						{"Arg", 36, "to", 0.026, "speed", 0.2},		-- Transition to this state only if in the opening direction
					}},
                },
            },
		},
		
		Door1 = {	-- Open/close cargohold side door (starboard side)
			{Transition = {"Close", "Open"},  	Sequence = {{C = {{"Arg", 38, "to", 1.0, "in", 3.0},},},}, 	Flags = {"Reversible"},},
			{Transition = {"Open", "Close"},  	Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 3.0},},},}, 	Flags = {"Reversible", "StepsBackwards"},},
			{Transition = {"Any", "Board"},  	Sequence = {{C = {{"Arg", 38, "to", 1.0, "in", 3.0},},},},},
			{Transition = {"Board", "Close"},  	Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 3.0},},},},},
			
			{Transition = {"Any", "Bailout"},	Sequence = {{C = {	{"Arg", 50,  "set", 1.0},		-- Vanishes stbd pilot
																	{"Arg", 472, "set", 1.0},		-- Vanishes port pilot
																	-- {"JettisonCanopy", 0},		-- CH-46D cannot do this
																	},},},},	-- Crew bails out port-side door
		},
		
		Door2 = {DuplicateOf = "Door1"},
		
		CrewLadder = {
			{Transition = {"Dismantle", "Erect"},  	Sequence = {{C = {{"Arg", 38, "to", 1.0, "in", 3.0},},},}, 	Flags = {"Reversible"},},
			{Transition = {"Erect", "Dismantle"},  	Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 3.0},},},}, 	Flags = {"Reversible", "StepsBackwards"},},
		},
		
		FoldableWings = {
			{Transition = {"Retract", "Extend"},
				Sequence = {
					{C = {{"Arg", 8, "to", 0.0, "in", 15.0}}}
				}, Flags = {"Reversible"}},
				
			{Transition = {"Extend", "Retract"},
				Sequence = {
					{C = {
						{"Arg", 8, "to", 1.0, "in", 15.0},
						{"Arg", 40, "to", 0.0, "in", 15.0},
					}},
				}, Flags = {"Reversible", "StepsBackwards"}},
		},
		
		ExternalCargoEquipment = {
			-- Animates everything associated with cargo sling loading
			-- {Transition = {"Dismantle", "Erect"}, Sequence = {{C = {{"Arg", 1003, "to", 1.0, "speed", 0.2},},},},},	-- Starboard winch
			-- {Transition = {"Erect", "Dismantle"}, Sequence = {{C = {{"Arg", 1003, "to", 0.0, "speed", 0.2},},},},},	-- Starboard winch
		},
		
		SearchLight0Elevation = {
			-- Formula for determining arg 1005 values:	arg_value = 2 * (extension_angle_deg / 90 - 1) + 1; fully stowed is angle 0
			{Transition = {"Any", "Retract"},	Sequence = {{C = {{"Arg", 1005, "from",  0.0,  "to",  -1.0, "speed", 0.157},},},},},
			{Transition = {"Any", "Extend"},	Sequence = {{C = {{"Arg", 1005, "from", -1.0,  "to",   0.0, "speed", 0.157},},},},},
		},
		SearchLight0Panning = {
			{Transition = {"Any", "Right"},		Sequence = {{C = {{"Arg", 1004, "from",  1.0,  "to",  -1.0, "speed", 0.17},},},},},	-- pan right/starboard
			{Transition = {"Any", "Left"},		Sequence = {{C = {{"Arg", 1004, "from", -1.0,  "to",   1.0, "speed", 0.17},},},},}, -- pan left/port
		},
		
		HeadLights = {
			-- The real-world lamp (sealed beam incandescent; PAR-46 or PAR-64 size, e.g. GE 4580 series)
			-- is rated at 600,000 (0.6M) candela and takes 200 milliseconds to power on from black, and
			-- 500 milliseconds to power off from full power.
			-- The beam width should be: 11 degrees wide and 12 degrees tall.
		
			-- Spotlight elevation angle: 	arg_value = 2 * (extension_angle_deg / 90 - 1) + 1; fully stowed is angle 0
			{Transition = {"Any", "Retract"},   Sequence = {{C = {	{"Arg", 1004, "to",  0.0, "speed", 0.17},	-- Stow search light
																	{"Arg", 1005, "to", -1.0, "speed", 0.157},
																	{"Arg", 209,  "to",  0.0, "speed", 5.0},},},},},
																	
			-- Extend search light forward 85.5 deg. That is, it will point 14.5 degrees down from straight ahead
			{Transition = {"Any", "Taxi"}, 		Sequence = {{C = {	{"Arg", 1004, "to",  0.0, "speed", 0.17},
																	{"Arg", 1005, "to",  0.88, "speed", 0.157},
																	{"Arg", 209,  "to",  0.4, "speed", 2.0},},},},},
			
			-- Extend search light forward 60 deg. That is, it will point 30 degrees down from straight ahead
			{Transition = {"Any", "High"}, 		Sequence = {{C = {	{"Arg", 1004, "to",  0.0, "speed", 0.17},
																	{"Arg", 1005, "to",  1/3, "speed", 0.157},
																	{"Arg", 209,  "to",  1.0, "speed", 2.0},},},},},
																	
			{Transition = {"Retract", "Taxi"}, 	Sequence = {{C = {	{"Arg", 209,"from", 0.0, "to", 1.0, "in", 10.0},
																	{"Arg", 1005, "to", 0.88, "speed", 0.17},
																	},},},Flags = {"Reversible"}},
																	
			
			{Transition = {"High", "Taxi"}, 	Sequence = {{C = {	{"Arg", 209, 			"to", 0.4,"speed", 2.0},
																	{"Arg", 1005,"from",1/3,"to", 0.88, "in",  3.0},
																	},},},Flags = {"Reversible"}},
																	
			{Transition = {"Taxi", "High"}, 	Sequence = {{C = {	{"Arg", 209, 			 "to", 1.0, "speed", 2.0},
																	{"Arg", 1005,"from",0.88,"to", 1/3, "speed", 0.157},
																	},},},Flags = {"Reversible"}},
		},
    }, -- end of mechanimations


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
				Rearmost dorsal strobe in phase with ventral strobe (https://www.dvidshub.net/video/417502/looking-back-ch-46-sea-knight-helicopter)
				Strobe period is ~1.0 seconds determined by frame-stepping through recorded video.
				
				For moving around on the ground/taxiing.
				For helicopters at least, WOLALIGHT_TIPS_LIGHTS seems to be ON in more conditions than this collection.
			]]
				typename = "Collection",
				lights = {
					{typename = "Argument", argument = 591,}, 				-- Ventral red beacon (constant on - red)
					{typename = "Argument", argument = 193,}, 				-- Fore dorsal beacon (constant on - red)
					{typename = "Argument", argument = 593,}, 				-- Aft dorsal beacon (constant on - red)
					
					{
						typename = "RotatingBeacon", 						-- Ventral red beacon
						position = { 1.7556, -0.4933, 0.000 },
						connector = "ch46_light_bottom_strobe_mesh",
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						angle_max = math.rad(12.0)
					},
					--[[	
						Even though the CH-46's aft pylon (the tail fin) slopes upward,
						the beaconlight itself was not mounted flush with the sloping
						skin. It was mounted on a leveling wedge or a pedestal base.
						
						The beam sweeps a 360° circle effectively horizontal to the
						fuselage, rather than pointing up into the sky or down at the tail.
					]]
					{
						typename = "RotatingBeacon", 						-- Fore dorsal red beacon just forward of rear rotor, 1/2 cycle out of phase with others
						-- position = { -4.200, 4.070, 0.000 },
						connector = "ch46_light_nav_tail_strobe",
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						phase_shift = 0.25,									-- Half cycle out of phase with the other 2
						angle_max = math.rad(12.0)
					},
					{
						typename = "RotatingBeacon",						-- Aft dorsal red beacon aft of rear rotor
						connector = "ch46_light_tail_red_2_strobe",
						proto = lamp_prototypes.MSL_3_2,
						color = {1.0, 30/255, 0, 3 * 0.012*math.sqrt(40)},	-- Bright, fiery red-orange
						angular_velocity = math.rad(240.0),					-- 40-45 rpm
						angle_max = math.rad(12.0)
					},
				},
			},
			
			[WOLALIGHT_TIPS_LIGHTS] = {
				-- The CH-46D doesn't have tip lights.
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
						
						typename = "Argument", argument = 209, movable = true, color = {1, 0.945, 0.8784},
					},
				},
			},
			
            [WOLALIGHT_LANDING_LIGHTS] = {
				-- This collection turns on for approach and landing, obviously.
                typename = "Collection",
                lights = {					
					{typename = "Argument", argument = 209, movable = true, color = {1, 0.945, 0.8784},},
                },
            },
			
            [WOLALIGHT_TAXI_LIGHTS] = {
				-- This collection turns on when taxiing around on the ground.
                typename = "Collection",
                lights = {
					{typename = "Argument", argument = 209, movable = true, color = {1, 0.945, 0.8784},},
				},
			},
			
            [WOLALIGHT_NAVLIGHTS] = {
                -- 	The argument lights are permanently bright which is a 3D model thing and has to be fixed there.
				-- 	The lights defined below will bounce off nearby objects, but you cannot observe them directly
				-- 	so they don't become balls of light at a distance -- only the 3D model can do that.
                typename = "Collection",
				lights = {
					{typename = "Argument",argument = 190}, 				-- Left nagivation light (red)
					{typename = "Argument",argument = 191}, 				-- Right navigation light (green)
					{typename = "Argument",argument = 192}, 				-- White tail lights
					
					{	-- Port (left) side position light (red)
						typename = "Spot", position = { 2.231, 0.847568, -1.117 },
						direction = {azimuth = math.rad(-90.0), elevation = math.rad(0)},
						proto = lamp_prototypes.ANO_3_Kr, angle_max = math.rad(180.0),
						color = {1.0, 15/255, 0, 0.12},
					},
					{	-- Starboard (right) side position light (green)
						typename = "Spot", position = { 2.221, 0.381, 1.117 },
						direction = {azimuth = math.rad(90.0), elevation = math.rad(0)},
						proto = lamp_prototypes.ANO_3_Zl, angle_max = math.rad(180.0),
						color = {0.0, 1.0, 65/255, 0.12},
					},
					{	-- Aft white nav light (above APU exhaust)
						typename = "Spot", position = { -7.2567, 2.5091, 0 },
						proto = lamp_prototypes.HS_2A,
						direction = {azimuth = math.rad(180.0)},
						angle_max = math.rad(165.0),
						power_up_t = 0.25, cool_down_t = 0.35,
					},
					{	-- Aft white nav light (below APU exhaust)
						typename = "Spot", position = { -7.2983, 1.957, 0 },
						proto = lamp_prototypes.HS_2A,
						direction = {azimuth = math.rad(180.0)},
						angle_max = math.rad(165.0),
						power_up_t = 0.25, cool_down_t = 0.35,
					},
                },
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
                lights = {
                    {
                        typename = "Spot",	-- Cabin is 1.85m tall
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { 2.213394, 1.684508, 0 },
						-- connector = "ch46_light_red_passenger1", emitter_shift_z = -0.040,
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						-- angle_max = math.rad(90.0),
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { 2.213394, 1.684508, 0 },
						intensity_max = 8.0,
						range = 2,
                    },
					
                    {
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { 0.573959, 1.683662, 0 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						-- angle_max = math.rad(90.0),
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { 0.573959, 1.683662, 0 },
						intensity_max = 8.0,
						range = 2,
                    },
					
                    {
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { -1.041669, 1.697513, 0 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						-- angle_max = math.rad(90.0),
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { -1.041669, 1.697513, 0 },
						intensity_max = 8.0,
						range = 2,
                    },
					
                    {
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { -2.682571, 1.654862, 0 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						-- angle_max = math.rad(90.0),
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						color = {0.588, 0, 0},
						position = { -2.682571, 1.654862, 0 },
						intensity_max = 8.0,
						range = 2,
                    },
                },
            },
			
			[WOLALIGHT_CABIN_BOARDING] = {
				-- These lights are used from engine startup, through taxi, and turn off just after takeoff.
                typename = "Collection",
                lights = {
                    {
                        typename = "Spot",	-- Cabin is 1.85m tall
						proto = lamp_prototypes.HS_2A,
						position = { 2.213394, 1.684508, 0 },
						-- connector = "ch46_light_red_passenger1", emitter_shift_z = -0.040,
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						color = {1, 214/255, 170/255},
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						position = { 2.213394, 1.684508, 0 },
						intensity_max = 8.0,
						{1, 214/255, 170/255},
						range = 2,
                    },
					
                    {
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						position = { 0.573959, 1.683662, 0 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						color = {1, 214/255, 170/255},
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						position = { 0.573959, 1.683662, 0 },
						intensity_max = 8.0,
						{1, 214/255, 170/255},
						range = 2,
                    },
					
                    {
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						position = { -1.041669, 1.697513, 0 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						color = {1, 214/255, 170/255},
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						position = { -1.041669, 1.697513, 0 },
						intensity_max = 8.0,
						{1, 214/255, 170/255},
						range = 2,
                    },
					
                    {
                        typename = "Spot",
						proto = lamp_prototypes.HS_2A,
						position = { -2.682571, 1.654862, 0 },
						intensity_max = 8.0,
						direction = {elevation = math.rad(90)},
						color = {1, 214/255, 170/255},
						range = 2,
                    },
					{
                        typename = "Omni",
						proto = lamp_prototypes.HS_2A,
						position = { -2.682571, 1.654862, 0 },
						intensity_max = 8.0,
						{1, 214/255, 170/255},
						range = 2,
                    },
                },
            },
			
			[WOLALIGHT_FORMATION_LIGHTS] = {
				-- Slime lights, etc. used around airfields (ground and air), but especially around other aircraft (e.g., aerial refuelers).
				typename = "Collection",
				lights = { },
			},
		},
    },
};
