
local F8_AIM_9D =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9D", -- AIM-9D
	user_name		= _("AIM-9D"),
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort = 0,
	Head_Type = 1,
	sigma = {3, 3, 3},
	M = 74.84,
	H_max = 18000.0,
	H_min = -1,
	Diam = 127.0,
	Cx_pil = 1.68,
	D_max = 7000.0,
	D_min = 300.0,
	Head_Form = 0,
	Life_Time = 40.0,
	Nr_max = 22,
	v_min = 140.0,
	v_mid = 350.0,
	Mach_max = 2.5,
	t_b = 0.0,
	t_acc = 2.2,
	t_marsh = 0.0,
	Range_max = 14000.0,
	H_min_t = 1.0,
	Fi_start = 0.3,
	Fi_rak = 1.8,
	Fi_excort = 0.7,
	Fi_search = 0.017,
	OmViz_max = 0.29,
	warhead = simple_aa_warhead(11.0),
	exhaust = { 1, 1, 1, 1 },
	X_back = -1.55,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.03,
	KillDistance = 7.0,
	--seeker sensivity params
	SeekerSensivityDistance = 7000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 2.2,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.				
	shape_table_data =
	{
		{
			name	 = "AIM-9D",
			file	 = "AIM-9D",
			life	 = 1,
			fire	 = {0, 1},
			username = "AIM-9D",
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.005, -- площадь выходного сечения сопла
		
	ModelData = {   58,  -- model params count
					0.35,   -- characteristic square (характеристическая площадь)
	
					-- параметры зависимости Сx
					0.049, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
					0.082, -- Cx_k1 высота пика волнового кризиса
					0.010, -- Cx_k2 крутизна фронта на подходе к волновому кризису
					0.001, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
					0.550, -- Cx_k4 крутизна спада за волновым кризисом 
					0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
						
					-- параметры зависимости Cy
					2.5, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
					0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
					1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
						
					0.13, -- 7 Alfa_max  максимальный балансировачный угол, радианы
					0.00, --угловая скорость создаваймая моментом газовых рулей
						
				-- Engine data. Time, fuel flow, thrust.	
				--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,	   -1.0,	5.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
					 0.0,		0.0,	8.45,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					 0.0,		0.0,	17170.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					40.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					0.8, -- время задержки включения управления (маневр отлета, безопасности), сек
					1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.0,  -- синус угла возвышения траектории набора горки
					30.0, -- продольное ускорения взведения взрывателя
					0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					1.2, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					7.34,   -- производная дальности по скорости носителя на высоте 1км, ППС
					-7.93,  -- производная дальности по скорости цели на высоте 1км, ЗПС
					-1.96,  -- производная по высоте производной дальности по скорости цели, ЗПС
					11526.0, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
					2805.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
					19655.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
					5192.6,  -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					7837.1, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
					1786.9, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
					2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.01, -- производная процента гарантированной дальности в ППС по высоте
					0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
				},
	
	
} 
declare_weapon(F8_AIM_9D)

declare_loadout({
    category     	= CAT_AIR_TO_AIR,
    CLSID        	= "{F8_AIM-9D}",
    Picture     	= 'us_aim-9l.png',
    attribute       = F8_AIM_9D.wsTypeOfWeapon,
	wsTypeOfWeapon	= F8_AIM_9D.wsTypeOfWeapon,
    displayName 	= _("AIM-9D Sidewinder IR AAM"),
    Cx_pil      	= 0.0001,
    Count       	= 1,
    Weight      	= 74.84,
    Elements    	= {
		{
			Position	=	{0,	0,	0}, 
			ShapeName	=	"AIM-9D",
		},
    }, -- end of Elements
})