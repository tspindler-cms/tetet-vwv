-- taken from pa_18 piper
return
{
	Name 				=   'vwv_o-1',
	DisplayName			= _('[VWV] O-1 Bird Dog'),
	DisplayNameShort    = _('O-1'),

	HumanCockpit 		= false,

	Picture 			= current_mod_path..'/Textures/o1_bird_dog.png',
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "o1_birddog",
	shape_table_data 	=
	{
		{
			file  	 = "o1_birddog";
			life  	 = 150; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = "o1_birddog_collision"; -- Name of destroyed object file name
			fire  	 = { 500, 4}; -- Fire on the ground after destoyed: 500sec 4m
			username = "o1_birddog";
			index    =  WSTYPE_PLACEHOLDER;
			classname 	= "4LandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "o1_birddog_collision";
			file  = "o1_birddog_collision";
			fire  = { 500, 4};
		},
	},
	mapclasskey = "P0091000027",
	attribute = {wsType_Air, wsType_Airplane, wsType_Battleplane, o1_bird_dog, "Battleplanes"},
	Categories = {},

	propellorShapeType = "3ARG_PROC_BLUR",
	propellorShapeName  = "o1_blade.fbx",
	-------------------------
	M_empty 					= 732, -- 490, -- kg
	M_nominal 					= 850, -- reduced to have higher payload on pylons 892, -- kg
	M_max 						= 1102, -- 757, -- kg
	M_fuel_max 					= 160, -- 80, -- kg
	length 						= 7.87, -- 7.34, -- full lenght in m
	height 						= 2.24, -- 2.61, -- height in m
	wing_area 					= 48.6, -- 32.4, -- greatly increased to lift-off with pylons loaded - 16.2, -- 15.52, -- wing area in m2
	wing_span 					= 10.97, -- 10.2, -- wing spain in m
	wing_type 					= 0,
	wing_tip_pos 				= {0.908,	1.636, 21.415}, -- wingtip coords for visual effects

	nose_gear_pos				= {-3.5114, -1.050, 0}, -- {2.426,	-1.050,	0}, -- nosegear coord
	main_gear_pos 				= {2.4126, -1.050, 1.14}, -- {-3.472,-1.050,	0}, -- main gear coords
	tand_gear_max 				= 0.60,  -------- distance between main gears in m

	nose_gear_wheel_diameter 	= 0.450, -- in m
	main_gear_wheel_diameter 	= 0.600, -- in m
	stores_number				= 4,
	V_opt 						= 80, -- 60,-- Cruise speed (for AI)
	V_take_off 					= 45, -- Take off speed in m/s (for AI)
	V_land 						= 55, -- Land speed in m/s (for AI)
	V_max_sea_level 			= 85, -- Max speed at sea level in m/s (for AI)
	V_max_h 					= 180, -- Max speed at max altitude in m/s (for AI)
	Vy_max 						= 2.21, -- Max climb speed in m/s (for AI)
	Mach_max 					= 0.450, -- Max speed in Mach (for AI)
	H_max 					 	= 6000, -- m
	Ny_min 						= -0.5, -- Min G (for AI)
	Ny_max 						= 1.5,  -- Max G (for AI)
	Ny_max_e 					= 2.6,  -- Max G (for AI)
	AOA_take_off 				= 0.08, -- AoA in take off (for AI)
	bank_angle_max 				= 10, -- 10, -- Max bank angle (for AI)
	average_fuel_consumption 	= 0.01, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	range 						= 600, -- Max range in km (for AI)
	CAS_min 					= 72, -- if this is not OVERAL FLIGHT TIME, but jus LOITER TIME, than it sholud be 10-15 minutes.....CAS capability in minute (for AI)
	thrust_sum_max 				= 4500,
	thrust_sum_ab 				= 4500,
	has_afteburner 				= false, -- AFB yes/no
	has_speedbrake 				= false, -- Speedbrake yes/no
	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
	flaps_maneuver 				= 0.5, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords
	RCS 						= 10, -- Radar Cross Section m2
	IR_emission_coeff 			= 1.5, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
	IR_emission_coeff_ab 		= 0, -- With afterburner
	engines_count				= 1, -- Engines count
	sound_name	=	"Aircrafts/Engines/PackardMerlinProp/Engine",
------------------------------------------------------------------------------
-- Fumo scarico motori {x,y,z}
------------------------------------------------------------------------------
	engines_nozzles =
	{
		[1] =
        {
            pos         =  {-4.3,    0.24,    -0.672}, -- nozzle coords
            elevation   =  0, -- AFB cone elevation
            diameter    = 0.5, -- AFB cone diameter
            exhaust_length_ab = 0.01,
            exhaust_length_ab_K = 0.7,
            smokiness_level = 0.2,
            afterburner_circles_count = 0,
			-- engine_number  = 1, --both to first engine
        },
	}, -- end of engines_nozzles
--------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--  equipaggio
---------------------------------------------------------------------------------

	crew_size	 = 1,
	crew_members =
	{
			[1] =
			{
				pilot_name          = "pilot_p51",
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos = 	{3.2,	0.2,	-0.65},
			}, -- end of [1]
	}, -- end of crew_members

	fires_pos =
	{
		[1] = 	{1.1, 1.7, 0.8},
		[2] = 	{1.1, 1.3, 0.9},
		[3] = 	{1.2, 1.2, 2.2},
		[4] = 	{1.2, 2.265, 2.3},
		[5] = 	{1.2, 2.5, 0},
		[6] = 	{1.2,	2.2, 0.5},
		[7] = 	{-7.3, 0.95, 0},
	}, -- end of fires_pos

	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0,
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0,
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,
	chaff_flare_dispenser 	=
	{
	}, -- end of chaff_flare_dispenser

	--sensors
	detection_range_max		 = 60,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry =
	{
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors =
	{
	},
	HumanRadio =
	{
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},

	Guns =
	{
    },

	Pylons =  {
		pylon(1, 0, 1.4477, 0.9585, -2.9957, {use_full_connector_position = true, connector = "pylon_1", arg = 308, FiX = 0, FiY = 0, FiZ = 12},
			{
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, .025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		),
		pylon(2, 0, 1.4541, 0.9637, -2.6598, {use_full_connector_position = true, connector = "pylon_2", arg = 309, FiX = 0, FiY = 0, FiZ = 12},
			{
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, .025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		),
		pylon(3, 0, 1.4541, 0.9636, 2.6593, {use_full_connector_position = true, connector = "pylon_3", arg = 310, FiX = 0, FiY = 0, FiZ = 12},
			{
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, .025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		),
		pylon(4, 0, 1.4477, 0.9585, 2.9953, {use_full_connector_position = true, connector = "pylon_4", arg = 311, FiX = 0, FiY = 0, FiZ = 12},
			{
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}", attach_point_position = {0.0, -.150 ,0 }}, -- 3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}", attach_point_position = {0.0, .025 ,0 }}, -- SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{LAU68_FFAR_WP156}", attach_point_position = { 0, 0, 0} }, -- WP x 7
				{ CLSID = "{LAU68_FFAR_MK1HE}", attach_point_position = { 0, 0, 0}}, -- HE x 7
				{ CLSID = "{LAU68_FFAR_MK5HEAT}", attach_point_position = { 0, 0, 0}}, 	-- HEAT x 7
				{ CLSID = "{TELSON8_SNEBT254_RED}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_YELLOW}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT254_GREEN}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
				{ CLSID = "{TELSON8_SNEBT256}", attach_point_position = { 0, 0, 0}}, 	-- TELSON8
			}
		)
	},

	Tasks = {
		aircraft_task(CAP),				-- 11, Combat Air Patrol
        aircraft_task(CAS),				-- 31, Close air support
        aircraft_task(Escort),			-- 18,
        aircraft_task(FighterSweep),	-- 19,
        aircraft_task(GroundAttack),	-- 32,
        aircraft_task(Intercept),		-- 10,
    },
	DefaultTask = aircraft_task(CAS),

	SFM_Data =
	{ -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		aerodynamics =
		{
            Cy0         = 0.05, -- zero AoA lift coefficient
            Mzalfa      = 1.355, -- coefficients for pitch agility
            Mzalfadt    = 0.8, -- coefficients for pitch agility
			-- kjx				=  2.00,   --2.50,        -- koeficijent sile po nagibu (na X osi), sto vise - to brze valjanje i zaustavljanje
			-- kjz				=  0.0018, --0.0025,    -- koeficijent sile po naklonu (na Z osi), sto vise - to brzi naklon i zaustavljanje
            kjx            =    2.25,
            kjz            =    0.00125,
			Czbe			= 0.02,               -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system

            -- M      -- Mach number
            -- Cx0    -- Coefficient, drag, profile, of the airplane
            -- Cya    -- Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
            -- B      -- Polar quad coeff
            -- B4     -- Polar 4th power coeff
            -- Omxmax -- roll rate, rad/s
            -- Aldop  -- Alfadop Max AOA at current M - departure threshold
            -- Cymax  -- Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
			-- ED bug: avion ne moze da sleti ako su naredne vrednosti suvise male (ili 0)
            cx_gear     = 0.0477, -- coefficient, drag, gear
            cx_flap     = 0.195, -- coefficient, drag, full flaps
            cy_flap     = 0.4, -- coefficient, normal force, lift, flaps
            cx_brk      = 0.06, -- coefficient, drag, breaks
			table_data =
				{
					--      M		Cx0		 	Cya			 B		 	B4	      Omxmax		Aldop		Cymax
					{	0.000	,	0.010	,	0.0225	,	0.046	,	0.0120	,	0.120	,	0.000	,	0.0	,	}	,
					{	0.010	,	0.012	,	0.0341	,	0.048	,	0.0125	,	0.123	,	1.000	,	0.161	,	}	,
					{	0.020	,	0.014	,	0.0422	,	0.051	,	0.0135	,	0.129	,	2.000	,	0.133	,	}	,
					{	0.040	,	0.018	,	0.0613	,	0.052	,	0.0140	,	1.332	,	15.000	,	1.820	,	}	, --60mph
					{	0.070	,	0.020	,	0.0805	,	0.053	,	0.0145	,	1.635	,	16.000	,	1.805	,	}	,
					{	0.080	,	0.020	,	0.0895	,	0.054	,	0.0150	,	1.938	,	14.000	,	1.791	,	}	,
					{	0.090	,	0.020	,	0.0885	,	0.055	,	0.0155	,	2.241	,	12.000	,	1.775	,	}	,
					{	0.100	,	0.020	,	0.0776	,	0.056	,	0.0160	,	2.544	,	10.000	,	1.760	,	}	,  --100mph
					{	0.110	,	0.020	,	0.0765	,	0.057	,	0.0165	,	2.847	,	8.000	,	1.750	,	}	,
					{	0.120	,	0.020	,	0.0758	,	0.057	,	0.0170	,	3.150	,	6.000	,	1.735	,	}	,
					{	0.130	,	0.020	,	0.0750	,	0.057	,	0.0175	,	3.071	,	4.000	,	1.722	,	}	,
					{	0.140	,	0.020	,	0.0740	,	0.057	,	0.0180	,	2.994	,	2.000	,	1.709	,	}	,
					{	0.150	,	0.020	,	0.0703	,	0.057	,	0.0185	,	2.920	,	0.000	,	1.655	,	}	,  ---153mph
				},
		},

		engine =
		{
			Nominal_RPM      =     3200,
			Nmg				 =	     45.0,--67.5,
			MinRUD			 =	     0.0,
			MaxRUD			 =	     1.0,
			MaksRUD			 =	     1.0,--0.925,
			ForsRUD			 =	     1.0,
            cylinder_firing_order = {1, 3, 2, 4},
			type    = "Piston",
			name    = "RollsRoyceMerlin",
			hMaxEng			 =	     12.0,--12.5,
			dcx_eng			 =	     0.0015, --0.0015,
			cemax			 =	     0.5,--1.5,--0.37,
			cefor			 =	     0.5,--1.5,--0.37,
			dpdh_m			 =	  1800,
			dpdh_f			 =	  1800,
			k_adiab_1		 =	     0.037923,
			k_adiab_2		 =	     0.0562,
			MAX_Manifold_P_1 =	351325,--155774,
			MAX_Manifold_P_2 =	351325,--206570,
			MAX_Manifold_P_3 =	351325,--226648,
			k_after_cool	 =	     0.54,
			Displ			 =	     5.916,                 -- ok
			k_Eps			 =	     1,--1.72,--6,          -- veliki uticaj na vucnu silu, sto manje to jaca sila
			Stroke			 =	     0.151, -- ok
			V_pist_0		 =	     12,--10.0,--12,
			Nu_0			 =	     1.2,
			Nu_1			 =	     0.9,
			Nu_2			 =	     0.001,
			N_indic_0		 =		 1023040, -- 1023040,           -- veliki uticaj na vucnu silu, sto vece to jaca
			N_fr_0			 =	     0.072,
			N_fr_1			 =	     0.02,
			Init_Mom		 =	    20,                     -- guess /was 220/
			D_prop			 =	     1.88,                  -- ok
			MOI_prop		 =	    10.5, --7.76            prop weight 50-55 pounds -- ok
			k_gearbox		 =	     2.0,                   -- ok
			P_oil			 =		495438,
			k_boost			 =       1,                     -- was 3
			k_cfug			 =       0.003,
			k_oil			 =       0.00004,
			k_piston		 =    	3000,
			k_reg			 =       0.003,
			k_vel			 =       0.017,
			sound_name	=	"Aircrafts/Engines/PackardMerlinProp/Engine",

			table_data =
			{
			--   M		Pmax

				{0.00,	12000.0},--4000.0
				{0.05,	11900.0}, -- 50
				{0.10,	10800.0}, -- 100
				{0.15,	8700.0},-- 153 mph
				{0.42,	7600.0},
				{0.53,	6500.0},
				{0.64,	6400.0},
				{0.75,	6700.0},
				{0.86,	6600.0},
				{0.97,	6100.0},
				{0.98,	6000.0},-- 230 mph
				{1.20,	5680.0},
			},

			prop_direction      = 1, -- pos rotates cw looking fwd neg is ccw

			prop_pitch_min      = -16.0, -- prop pitch min, degrees
            prop_pitch_max      = -22.0, -- prop pitch max, degrees
            prop_pitch_feather  = -30.0, -- prop pitch feather position, degrees if feather < prop_pitch_max no feathering available
            prop_blades_count   = 2,
            prop_locations      = {
				{3.630450, 0.721771, 0},
			},
		},
	},


--[[
To break the entries down:

eg oh58d_cells_properties[0] = {critical_damage = 4, args = {161},deps_cells = {11,12},droppable=false}
   ----------green------- loc   ----------red------  ---blue----  ------yellow--------
Green is the model name and part# as referenced in the list at top of the damage.lua

Red, amount of damage it can sustain before something falls off or
you get shot down. Some parts will have an extra section named deps_cells,
I think these parts fall off when the particular part reaches its critical
damage amount unless droppable = false.
Blue is 3D model argument # of the damage part
Yellow is the damage cells affected by damage on this location
	--]]
----------------------------------------------------------------------------------------------------
---  Damage Section
-----------------------------------------------------------------------------------------------------

Failures = {
		-- power plant
		{ id = 'ENG0_GOVERNOR_FAILURE',		label = _('Prop governor Fault.'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG0_MAGNETO0',				label = _('Magneto 1 Fault.'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG0_MAGNETO1',				label = _('Magneto 2 Fault.'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG0_JAMMED',				label = _('Engine Jam'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		--{ id = 'sight_failure',	label = 'SIGHT FAILURE',	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 }
	},

    -- Blueprint taken from Damage.lua of ED, Fencer (Scripts/Aircraft/_Common/Damage.lua)
    Damage = verbose_to_dmg_properties({
        ["COCKPIT"]             = {critical_damage = 2,args =  { 65}},
        ["NOSE_CENTER"]         = {critical_damage = 3,args =  {146}},

        ["WING_L_OUT"]          = {critical_damage = 10,args =  {223},deps_cells = {"FLAP_L_IN","WING_L_PART_OUT"}},
        ["WING_R_OUT"]          = {critical_damage = 10,args =  {213},deps_cells = {"FLAP_R_IN","WING_R_PART_OUT"}},
        ["WING_L_PART_OUT"]     = {critical_damage = 3, args =  {221}},
        ["WING_R_PART_OUT"]     = {critical_damage = 3, args =  {231}},
        ["FLAP_L_IN"]           = {critical_damage = 4, args =  {227}},
        ["FLAP_R_IN"]           = {critical_damage = 4, args =  {217}},

        ["FUSELAGE_BOTTOM"]     = {critical_damage = 8, args =  {152}},
        ["FUSELAGE_CENTR_TOP"]  = {critical_damage = 8, args =  {151}},

        ["FIN_TOP"]             = {critical_damage = 4, args =  {244}},
        ["RUDDER"]              = {critical_damage = 2, args =  {247}},

        ["STABILIZER_L_IN"]     = {critical_damage = 3, args =  {235}},
        ["STABILIZER_R_IN"]     = {critical_damage = 3, args =  {233}},
        }),

	DamageParts =
	{
	},

----------------------------------------------------------------------------------------------------
---  End Damage Section
-----------------------------------------------------------------------------------------------------
	lights_data =
	{
		typename = "collection",
		lights =
		{
			[1] =
			{
			},
			[2] =
			{
			},
		    [3]	=
			{
				typename = "collection",
				lights =
				{
					-- Left Position Light (red)
					{typename = "omnilight",
					color = {0.32, 0.0, 0.07},
					position  = {3.74, 1.44, -21.45},
					argument  = 190
					},
					-- Right Position Light (green)
					{typename = "omnilight",
					color = {0, 0.26, 0.18},
					position = {3.74, 1.44, 21.45},
					argument  = 191
					},
					-- Tail Position Light (white)
					{typename = "omnilight",
					color = {0.8, 0.8, 0.8},
					position  = {-13.2, 0.33, 0.0},
					argument  = 203
					},
				}
			},
		    [4] =
			{
			},
			[5]	=
			{
			}
		}
	},  -- end of lights_data

}
