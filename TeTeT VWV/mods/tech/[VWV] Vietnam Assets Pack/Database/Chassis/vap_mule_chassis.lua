-- VAP Chassis Mule --

-- Mule
GT_t.CH_t.vap_mule_chassis = {
	life = 2,
		mass = 661, -- 361 + 300 cargo
		length = 3.000,
		width = 1.27,
		max_road_velocity = 11.1111,
		max_slope = 0.37,
		canSwim = false,
		canWade = true,
		engine_power = 16,
		engineMinRPM = 700,
	    engineMaxPowerRPM = 2200,
		engineMaxRPM = 2600,
		gearRatios = { -5.03, 0.0, 3.49, 1.86, 1.41, 1.00, 0.85},
		mainGearRatio = 4.6,
		automaticTransmission = false,
		max_vert_obstacle = 0.45,
		max_acceleration = 0.225926,
		min_turn_radius = 1.5,
		X_gear_1 = 0.837,
		Y_gear_1 = 0,
		Z_gear_1 = 0.769,
		X_gear_2 = -0.544,
		Y_gear_2 = 0,
		Z_gear_2 = 0.769,
		gear_type = GT_t.GEAR_TYPES.WHEELS,
		r_max = 0.42,
		trace_width = 0.155,
		armour_thickness = 0.001,
}

