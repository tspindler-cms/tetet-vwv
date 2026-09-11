Gray_RIM7_SeaSparrow = {
    category        = CAT_MISSILES,
    name            = "Gray_RIM7_SeaSparrow",
    user_name       = _("RIM-7E"),
    model           = 'HB_F-4E_AIM7E',
    mass            = 206.4,
    wsTypeOfWeapon  = {4,4,34,WSTYPE_PLACEHOLDER},

 	Escort 			= 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type 		= 6, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing
	sigma 			= {15, 15, 15}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M 			    = 206.4, -- Mass of the missile at launch
	H_max 			= 24400.0, -- Maximum target altitude
	H_min 			= 1.0, -- minimum target altitude
	Diam 			= 203.0, -- Missile diameter in cm
	Cx_pil 			= 4, -- "Cx like pendants" - Moment of inertia??
	D_max 			= 20000.0, -- Maximum range firing at low altitude, in meters
	D_min 			= 1500.0, -- minimum range in meters
	Head_Form 		= 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time 		= 160.0, -- Battery life
	Nr_max 			= 25, -- Maximum g when turning
	v_min 			= 140.0, -- Minimum speed in m/s
	v_mid 			= 500.0, -- average speed in m/s
	Mach_max 		= 3.0, -- maximum Mach of the missile
	t_b 			= 0.0, -- Motor start delay
	t_acc 			= 4.0, -- motor burn time
	t_marsh 		= 11.0, -- cruise time, 0.0 if not applicable
	Range_max 		= 50000.0, -- Max range in meters 
	H_min_t 		= 20.0, -- minimum target height above the terrain, m.
	Fi_start 		= 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak 			= 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort 		= 2.6, -- tracking angle (sighting) of the target by the missile.
	Fi_search 		= 0.1, -- limit angle of free search
	OmViz_max 		= 0.35, -- line-of-sight speed limit
	warhead		= predefined_warhead("AIM_7"),
	shape_table_data =
	{
		{
			name  = "Gray_RIM7";
			file  = "HB_F-4E_AIM7E";
			life  = 1;
			fire  = { 0, 1};
			username = "AIM-7E";
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

	exhaust			= {1, 1, 1, 0.8};
	X_back			= -2.0,
	Y_back			= -0.0,
	Z_back			= 0.0, -- -0.1,
	tail_scale 	 	= 5.5,
	Reflection 		= 0.08,
	KillDistance 	= 10.0,
		loft = 1,

	ModelData = {   58 ,  -- model params count
					0.9 ,   -- characteristic square (характеристическая площадь)
			
					-- параметры зависимости Сx
					0.0125 , -- планка Сx0 на дозвуке ( M << 1)
					0.052 , -- высота пика волнового кризиса
					0.010 , -- крутизна фронта на подходе к волновому кризису
					0.002 , -- планка Cx0 на сверхзвуке ( M >> 1)
					0.5  , -- крутизна спада за волновым кризисом 
					1.2  , -- коэффициент отвала поляры
					
					-- параметры зависимости Cy
					2.20, -- планка Cya на дозвуке ( M << 1)
					1.05, -- планка Cya на сверхзвуке ( M >> 1)
					1.20, -- крутизна спада(фронта) за волновым кризисом  

					0.18, -- ~10 degrees Alfa_max  максимальный балансировачный угол, радианы
					0.00, --угловая скорость создаваймая моментом газовых рулей
						
					--	t_statr   t_b      t_accel  t_march   t_inertial   t_break  t_end
					-1.0,        -1.0,       2.8,     0.0,      0.0,		 0.0,    1.0e9,           -- time interval
					 0.0,         0.0, 	   14.28,     0.0,      0.0,         0.0,    0.0,           -- fuel flow rate in second kg/sec(секундный расход массы топлива кг/сек)
					 0.0,         0.0,   35000.0,     0.0,      0.0,         0.0,    0.0,           -- thrust
					
					 1.0e9, -- таймер самоликвидации, сек
					 75.0, -- время работы энергосистемы
					 0.0, -- абсалютеая высота самоликвидации, м
					 1.5, -- время задержки включения управленя, сек
					 1.0e9, -- дальность до цели в момент пуска, выше которой выполняется маневр набора высоты 
					 1.0e9, -- дальность до цели на трассе, менее которой начинается завершение маневра набора высоты (длжен быть больше чем предылущий параметр) 
					 0.0,  -- синус угла возвышения траектории набора горки
					 50.0, -- продольное ускорения взведения взрывателя
					 0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					 -- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					 14.0, -- производная дальности по скорости носителя на высоте 1км, ППС
					 -19.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
					 -2.2, -- производная по высоте производной дальности по скорости цели, ЗПС
					 19000, -- дальность ракурс 180(навстречу) град, Н=5000м, V=900км/ч, м
					 4800.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м
					 26000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
					 7000.0, -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					 13000.0, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
					 2500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
					 2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					 0.4, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.014, -- производная процента гарантированной дальности в ППС по высоте
					0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
				},  
				
	controller = {
		boost_start = 0,
		march_start = 3.7,
	},
	
	boost = {
		impulse								= 247,
		fuel_mass							= 38.48,
		work_time							= 3.7,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.2,	
	},
	
	march = {
		impulse								= 209,
		fuel_mass							= 21.82,
		work_time							= 10.8,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.2,
	},
}

declare_weapon(Gray_RIM7_SeaSparrow)

GT_t.WS_t.Gray_RIM7_SeaSparrow = {name = "Gray_RIM7_SEASPARROW", display_name = _("RIM-7E")}; 
GT_t.WS_t.Gray_RIM7_SeaSparrow.angles = {
					{math.rad(180), math.rad(-180), math.rad(-15), math.rad(85)},
					};
GT_t.WS_t.Gray_RIM7_SeaSparrow.omegaY = 1
GT_t.WS_t.Gray_RIM7_SeaSparrow.omegaZ = 1
GT_t.WS_t.Gray_RIM7_SeaSparrow.distanceMin = 1000
GT_t.WS_t.Gray_RIM7_SeaSparrow.distanceMax = 27000
GT_t.WS_t.Gray_RIM7_SeaSparrow.ECM_K = 0.8
GT_t.WS_t.Gray_RIM7_SeaSparrow.reference_angle_Z = 0
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN = {}
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1] = {}
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].type = 4
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].launch_delay = 2;
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].reactionTime = 3;
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].reflection_limit = 0.02;
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].min_launch_angle = math.rad(15.0)
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].beamWidth = math.rad(90);
--GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].BR = { {pos = {0, 0, 0.9} }, {pos = {0, 0, -0.9} } }
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].PL = {}
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].PL[1] = {}
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].PL[1].ammo_capacity = 8
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].PL[1].type_ammunition = Gray_RIM7_SeaSparrow.wsTypeOfWeapon
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].PL[1].shot_delay = 0.1;
GT_t.WS_t.Gray_RIM7_SeaSparrow.LN[1].PL[1].reload_time = 1000000; 

