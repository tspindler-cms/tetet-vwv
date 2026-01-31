-- VAP Chassis M35 --

-- M35 Truck
GT_t.CH_t.vap_m35_chassis = {
	life = 2,
		mass = 6750,
		length = 6.98,
		width = 2.56,
		max_road_velocity = 25.833,
		max_slope = 0.37,
		canSwim = false,
		canWade = true,
		engine_power = 127,
		engineMinRPM = 700,
	    engineMaxPowerRPM = 2200,
		engineMaxRPM = 2600,
	    gearRatios = { -5.03, 0.0, 3.49, 1.86, 1.41, 1.00, 0.75, 0.65},
	    mainGearRatio = 5.2,
		automaticTransmission = false,		
		max_vert_obstacle = 0.55,
		max_acceleration = 1.425926,
		min_turn_radius = 9.5,
		X_gear_1 = 2.270,
		Y_gear_1 = 0,
		Z_gear_1 = 0.720,
		X_gear_2 = -1.763,
		Y_gear_2 = 0,
		Z_gear_2 = 0.720,
		gear_type = GT_t.GEAR_TYPES.WHEELS,
		r_max = 0.62,
		trace_width = 0.423,
		armour_thickness = 0.001,
}

