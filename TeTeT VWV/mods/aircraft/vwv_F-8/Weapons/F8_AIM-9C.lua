local F8_AIM_9C_warhead =
{
    mass                 = 3.9,
    caliber              = 100,
    expl_mass            = 2.3,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 1.0,
    obj_factors          = { 2.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}



local F8_AIM9C = 
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9C",
	user_name		= _("AIM-9C"),
	scheme			= "aa_missile_semi_active",
	class_name		= "wAmmunitionSelfHoming",
	model			= "agm-122",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	
	mass = 66,
	Escort = 1,
	Head_Type = 6,
	sigma 			= {3, 3, 3},	-- the maximum error of sight in meters
	M 				= 66.00,	-- [v] gross weight in kg
	H_max 			= 21300.0,	-- maximum altitude [m]
	H_min 			= 1500,		-- [v] minimum flight altitude [m]
	Diam 			= 168.0,	-- [v] Body diameter in[mm]
	Cx_pil			= 0.5,	-- Cx as suspension??
	D_max 			= 3500, -- maximum launch range at low altitude
	D_min 			= 1067,	-- [v] minimum launch range
	Head_Form = 1,
	Life_Time 		= 100.0, -- [v]lifetime ( self-destruct timer ) [sec]
	Nr_max 			= 27, -- [v] - Maximum overload when turning (G?)
	v_min 			= 150.0, -- The minimum speed [- ?]
	v_mid 			= 400.0, -- average speed [- ?]
	Mach_max 		= 4.0,-- [v] The maximum Mach number [mach]
	t_b 			= 0.0, -- time of the motor [sec]
	t_acc			= 0.6,-- time operation of the accelerator
	t_marsh			= 4.1,-- While working in the marching mode ? [sec]
	Range_max		= 10668.0,-- [v] maximum launch range at maximum height [m]
	H_min_t		    = 50.0,-- [v] minimum target height above terrain , m
	Fi_start 		= 0.3,-- angle tracking and sighting at start- ?
	Fi_rak 		    = 3.14152,-- permissible angle angle purpose (rad)- ?
	Fi_excort 		= 0.79,-- tracking angle ( sight . ) missile 90 
	Fi_search 		= 0.09,-- limit angle free search- 60
	OmViz_max 		= 0.29,-- speed limit of the line of sight- ?
	exhaust 		=  { 1, 1, 1, 1 }, --tail_solid,	-- damage inflicted by direct contact
	X_back 			= -0.00,
	Y_back 			= -0.00,
	Z_back			= 0.0,
	Reflection		= 0.0182,
	KillDistance 	= 5.0,
	ccm_k0 = 1.0,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	loft = 1,
	hoj = 1,
	

	
	PN_coeffs = {2, 				-- Number of Entries	
				2000.0 ,1.0,		-- Less 2 km to target Pn = 1
				10000.0, 0.4};		-- Between 10 and 2 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
	
    warhead     = F8_AIM_9C_warhead,
    warhead_air = F8_AIM_9C_warhead,

	shape_table_data =
	{
		{
			name  = "AIM-9C";
			file  = "agm-122";
			life  = 1;
			fire  = { 0, 1};
			username = "AIM-9C";
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},
	
	supersonic_A_coef_skew = 0.25, -- pendenza del coefficiente diretto della lama polare su supersonico
	nozzle_exit_area =	0.007238, -- Area della sezione trasversale dell'uscita dell'ugello
		
	ModelData = {   58 ,  -- model params count
					0.35 ,   -- characteristic square
		
		-- dependency settings Сx
		0.02 , -- Cx_k0 Cx0 bar on subsonic ( M << 1)
		0.04 , -- Cx_k1 height of the peak of the wave crisis
		0.04 , -- Cx_k2 steepness of the front on the approach to the wave crisis
		0.02, -- Cx_k3 Cx0 bar on supersonic ( M >> 1)
		0.6 , -- Cx_k4 steepness of recession after wave crisis 
		0.6 , -- polar blade coefficient (proportional to sqrt (M^2-1))
		
		-- Cy dependency settings
		0.2 , -- Cy_k0 Cy0 bar on subsonic ( M << 1)
		0.2	 , -- Cy_k1 Cy0 bar on supersonic ( M >> 1)
		0.6  , -- Cy_k2 steepness of the recession (front) behind the wave crisis  
		
		0.19 , -- 7 Alfa_max  maximum balancing angle, radians
		0.0, --angular velocity created by the angular momentum of gas rudders
		
	-- Engine data. Time, fuel flow, thrust.	
	--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		 -1.0,		-1.0,		0.6,  		4.1,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		 0.0,		0.0,		1.6,		1.5,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		 0.0,		0.0,		19662.0,	2824.0,		0.0,			0.0,		0.0,           -- thrust, newtons
	
		 100.0, -- self-destruction timer, sec
		 22.0, -- power system operating time, sec
		 0, -- absolute height of self-destruction, m
		 2.0, -- delay time for switching on control (departure maneuver, safety), sec
		 1.0e9, -- range to the target at the time of launch, at exceeding which the missile performs the maneuver "gorka", m
		 1.0e9, -- the range to the target, at which the "slide" maneuver is completed and the missile switches to net proportional navigation (must be greater than or equal to the previous parameter), m 
		 0.0,  -- sine angle of elevation of the trajectory of the slide set
		 30.0, -- Longitudinal acceleration of fuze cocking
		 0.0, -- speed module reported by catapult device, knockout charge, etc.
		 1.19, -- characteristics of the SAU-RAKETA system, second-order filter coefficient K0
		 1.0, -- characteristics of the SAU-RAKETA system, second-order filter coefficient K1
		 2.0, -- characteristics of the SAU-RAKETA system, control circuit bandwidth
		 0.0,
		 0.0,
		 0.0,
		 0.0,
		 0.0,
		  -- DLZ. Data for calculating launch ranges (sight indication)
		 9000.0, -- range angle 180(towards) hail, Н=10000м, V=900km/h, m
		 4000.0, -- range angle 0(catch-up) hail, Н=10000м, V=900km/h, m
		 4000.0, -- range angle 180(towards) hail, Н=1000м, V=900km/h, m
		 0.2, -- Reduction of the permitted launch range when the carrier velocity vector deviates from the target line of sight.
		 1.0, -- Vertical plane. The slope of the curve of the permitted launch range into the lower hemisphere. Reduced range when firing downwards.
		 1.4, -- Vertical plane. Tilt of the curve of the permitted launch range into the upper hemisphere. Increased range when firing upwards.
		-3.0, -- Vertical plane. Inflection angle of the permitted range curve, upper to lower hemisphere.
		 0.5, -- Change in the slope coefficients of the curve to the upper and lower hemispheres from the height of the carrier.
				},
	
controller = {
		boost_start = 0.01,
		march_start = 0.61,
	},
	
	boost = {
		impulse								= 125,
		fuel_mass							= 5.9,
		work_time							= 0.6,
		nozzle_position						= {{-1.40, -0.1, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {0.0, 0.0, 0.0},
		smoke_transparency					= 0.2,
		custom_smoke_dissipation_factor		= 0.2,	
	},
	
	march = {
		impulse								= 125,
		fuel_mass							= 6.1,
		work_time							= 4.1,
		nozzle_position						= {{-1.40, -0.1, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.2,
	},

	
	fm = {
		mass				= 66,  
		caliber				= 0.168,  
		wind_sigma			= 0.0,
		wind_time			= 0.0,
		tail_first			= 1,
		fins_part_val		= 0,
		rotated_fins_inp	= 0,
		delta_max			= math.rad(20),
		draw_fins_conv		= {math.rad(90),1,1},
		L					= 0.1,
		S					= 0.0124,
		Ix					= 1.5,
		Iy					= 67.4,
		Iz					= 67.4,
		
		Mxd					= 0.3 * 66.3,
		Mxw					= -22.5,

		table_scale	= 0.2,
		table_degree_values = 1,
	--	Mach	  | 0.0		0.2		0.4		0.6		0.8		1.0		1.2		1.4		1.6		1.8		2.0		2.2		2.4		2.6		2.8		3.0		3.2		3.4		3.6		3.8		4.0	 |
		Cx0 	= {	0.17,	0.17,	0.17,	0.17,	0.20,	0.43,	0.41,	0.41,	0.42,	0.42,	0.40,	0.40,	0.41,	0.42,	0.47,	0.44,	0.41,	0.48,	0.46,	0.44,	0.42 },
		CxB 	= {	0.11,	0.11,	0.11,	0.11,	0.11,	0.40,	0.19,	0.17,	0.16,	0.14,	0.13,	0.12,	0.12,	0.11,	0.11,	0.10,	0.09,	0.09,	0.08,	0.08,	0.07 },
		K1		= { 0.0056,	0.0056,	0.0056,	0.0056,	0.0056,	0.0056,	0.0056,	0.0056,	0.0052,	0.0048,	0.0045,	0.0041,	0.0037,	0.0036,	0.0034,	0.0032,	0.0031,	0.0030,	0.0029,	0.0027,	0.0026 },
		K2		= { 0.0055,	0.0055,	0.0055,	0.0055,	0.0055,	0.0055,	0.0055,	0.0055,	0.0051,	0.0047,	0.0043,	0.0037,	0.0031,	0.0032,	0.0033,	0.0035,	0.0036,	0.0037,	0.0038,	0.0039,	0.0040 },
		Cya		= { 1.14,	1.14,	1.14,	1.14,	1.14,	1.42,	1.46,	1.39,	1.32,	1.15,	1.06,	1.00,	0.94,	0.89,	0.83,	0.78,	0.73,	0.69,	0.65,	0.61,	0.57 },
		Cza		= { 1.14,	1.14,	1.14,	1.14,	1.14,	1.42,	1.46,	1.39,	1.32,	1.15,	1.06,	1.00,	0.94,	0.89,	0.83,	0.78,	0.73,	0.69,	0.65,	0.61,	0.57 },
		Mya		= { -0.5,	-0.5},
		Mza		= { -0.5,	-0.5},
		Myw		= { -2.0,	-2.0},
		Mzw		= { -2.0,	-2.0},
		A1trim	= { 10.0,	10.0},
		A2trim	= { 10.0,	10.0},
		
		model_roll = math.rad(45),
		fins_stall = 1,
	},
	
	proximity_fuze = {
		radius		= 0.1,
		arm_delay	= 0.1,
	},
	
	seeker = {
		delay					= 1.0,
		op_time					= 120,
		FOV						= math.rad(120),
		max_w_LOS				= math.rad(20),
		sens_near_dist			= 1050,
		sens_far_dist			= 10500,
		ccm_k0					= 0.5,
		aim_sigma				= 5.5,
		height_error_k			= 100;
		height_error_max_vel	= 238;
		height_error_max_h		= 300;
		hoj						= 1,
	},

	autopilot = {
		x_channel_delay		= 0.9,
		delay				= 1.0,
		op_time				= 75,
		Kconv				= 4.0,
		Knv					= 0.02,
		Kd					= 0.4,
		Ki					= 0.1,
		Kout				= 1.0,
		Kx					= 0.1,
		Krx					= 2.0,
		fins_limit			= math.rad(20),
		fins_limit_x		= math.rad(5),
		Areq_limit			= 25.0,
		bang_bang			= 0,
		max_side_N			= 10,
		max_signal_Fi		= math.rad(12),
		rotate_fins_output	= 0,
		alg					= 0,
		PN_dist_data 		= {	11300,	1,
								9000,	1},
		null_roll			= math.rad(45),
		
		loft_active_by_default	= 1,
		loft_add_pitch			= math.rad(30),
		loft_time				= 3.5,
		loft_min_dist			= 3500,
		loft_max_dist			= 10000,
	},
}

declare_weapon(F8_AIM9C)

declare_loadout({
	category		=	CAT_AIR_TO_AIR,
	CLSID			= 	"{F8_AIM-9C}",
	Picture			=	"aim9p.png",
	wsTypeOfWeapon	=	F8_AIM9C.wsTypeOfWeapon,
	displayName		=	_("AIM-9C Sidewinder SARH AAM"),
	attribute		=   F8_AIM9C.wsTypeOfWeapon,
	Count			=	1,
	Weight			=	66,
	Elements	=	{
		{
			{	ShapeName	= "aero-3b", IsAdapter = true  }, 
			{	ShapeName	= "agm-122",	 connector_name = "Point"},
		},
	}, -- end of Elements

})