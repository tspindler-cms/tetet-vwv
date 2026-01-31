-- VAP Chassis Mutt --

-- M151 MUTT
GT_t.CH_t.vap_mutt_chassis = {
	life = 2,
		mass = 100,
		length = 3.380,
		width = 1.63,
		max_road_velocity = 29.166,
		max_slope = 0.47,
		canSwim = false,
		canWade = true,
		engine_power = 71,
	    engineMinRPM = 600,
	    engineMaxPowerRPM = 2400,
	    engineMaxRPM = 2800,
	    gearRatios = { -5.0, 0.0, 4.59, 2.25, 1.54, 1.00, 0.75, 0.65},
	    mainGearRatio = 5.80,
		automaticTransmission = false,		
		max_vert_obstacle = 0.45,
		max_acceleration = 1.925926,
		min_turn_radius = 3.5,
		X_gear_1 = 1.184,
		Y_gear_1 = 0,
		Z_gear_1 = 0.769,
		X_gear_2 = -1.185,
		Y_gear_2 = 0,
		Z_gear_2 = 0.769,
		gear_type = GT_t.GEAR_TYPES.WHEELS,
		r_max = 0.42,
		trace_width = 0.223,
		armour_thickness = 0.001,
}

