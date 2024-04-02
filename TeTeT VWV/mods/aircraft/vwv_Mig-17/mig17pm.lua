mount_vfs_texture_path  (current_mod_path.."/Textures/mig17pm")

mount_vfs_liveries_path (current_mod_path.."/Liveries")




local tracer_on_time = 0.02
declare_weapon({category = CAT_SHELLS,name =   "N37_37x155_HEI_T",
  user_name		 = _("N37_37x155_HEI_T"),
  model_name     = "tracer_bullet_crimson",
  v0    		 = 690,
  Dv0   		 = 0.0060,
  Da0     		 = 0.0017,
  Da1     		 = 0.0,
  mass      	 = 0.722,
  round_mass 	 = 1.250+0.115,		-- round + link
  cartridge_mass = 0.0,				-- 0.413+0.115, cartridges are ejected
  explosive      = 0.410,
  life_time      = 5.0,
  caliber        = 37.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {0.5,0.80,0.90,0.080,2.15},
  k1        	 = 5.7e-09,
  tracer_off     = 1.5,
  tracer_on		 = tracer_on_time,
  scale_tracer   = 2,
  scale_smoke    = 2.0, 
  smoke_tail_life_time = 1.0,
  cartridge		 = 0,
  visual_effect_correction = 3.0,
})

declare_weapon({category = CAT_SHELLS,name =   "N37_37x155_API_T",
  user_name		 = _("N37_37x155_API_T "),
  model_name     = "tracer_bullet_crimson",
  v0    		 = 675,
  Dv0   		 = 0.0060,
  Da0     		 = 0.0017,
  Da1     		 = 0.0,
  mass      	 = 0.765,
  round_mass 	 = 1.294+0.115,		-- round + link
  cartridge_mass = 0.0,				-- 0.413+0.115, cartridges are ejected
  explosive      = 0.410,
  life_time      = 5.0,
  caliber        = 37.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {0.5,0.80,0.90,0.080,2.15},
  k1        	 = 5.7e-09,
  tracer_off     = 1.5,
  tracer_on		 = tracer_on_time,
  scale_tracer   = 2,
  scale_smoke    = 2.0, 
  smoke_tail_life_time = 1.0,
  cartridge		 = 0,
  visual_effect_correction = 3.0,
})

declare_weapon({category = CAT_SHELLS,name =   "NR23_23x115_HEI_T",
  user_name		 = _("NR23_23x115_HEI_T"),
  model_name     = "tracer_bullet_crimson",
  v0    		 = 680,
  Dv0   		 = 0.0050,
  Da0     		 = 0.0007,
  Da1     		 = 0.0,
  mass      	 = 0.196,
  round_mass 	 = 0.340+0.071,		-- round + link
  cartridge_mass = 0.0,				-- 0.111+0.071, cartridges are ejected
  explosive      = 0.011,
  life_time      = 5.0,
  caliber        = 23.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {1.0,0.74,0.65,0.150,1.78},
  k1        	 = 2.3e-08,
  tracer_off     = 1.5,
  tracer_on		 = tracer_on_time,
  scale_tracer   = 2,
  scale_smoke    = 2.0, 
  smoke_tail_life_time = 1.0,
  cartridge		 = 0,
})

declare_weapon({category = CAT_SHELLS,name =   "NR23_23x115_API",
  user_name		 = _("NR23_23x115_API"),
  model_name     = "tracer_bullet_crimson",
  v0    		 = 680,
  Dv0   		 = 0.0050,
  Da0     		 = 0.0007,
  Da1     		 = 0.0,
  mass      	 = 0.199,
  round_mass 	 = 0.340+0.071,		-- round + link
  cartridge_mass = 0.0,				-- 0.111+0.071, cartridges are ejected
  explosive      = 0.000,
  life_time      = 5.0,
  caliber        = 23.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {1.0,0.74,0.65,0.150,1.78},
  k1        	 = 2.3e-08,
  tracer_off     = -1,
  tracer_on		 = tracer_on_time,
  scale_tracer   = 2,
  scale_smoke    = 2.0, 
  smoke_tail_life_time = 1.0,
  cartridge		 = 0,
})

function nr23(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "NR-23"
	tbl.display_name	= "NR-23"
	tbl.supply 	 = 
	{
		shells = {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 140,	---80
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 80,
		rates 			 = {850},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204		-- shell_50cal
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

function n37(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "N-37"
	tbl.display_name	= "N-37"
	tbl.supply 	 = 
	{
		shells = {"N37_37x155_HEI_T", "N37_37x155_API_T"},
		mixes  = {{1,1,1,2}}, --  Calculated by weight (55 kg)
		count  = 140,	---40
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 40,
		rates 			 = {400},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,3,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 203		-- shell_30mm
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

mig17pm =  {
      
		Name 			= 'mig17pm',--AG
		DisplayName		= _('Mikoyan-Gurevich MiG-17 Fresco E'),
        	Picture 		= "mig17pm.png",
        	Rate 			= "50",
        	Shape			= "mig17pm",--AG	
       
        
	shape_table_data 	= 
	{
		{
			file  	 	= 'mig17pm';--AG
			life  	 	= 20; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'mig17f-oblomok'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; 			-- Fire on the ground after destoyed: 300sec 2m
			username	= 'mig17pm';--AG
			index       =  WSTYPE_PLACEHOLDER;
			classname   = "lLandPlane";
			positioning = "BYNORMAL";
		},
		{
			name  		= "mig17f-oblomok";
			file  		= "mig17f-oblomok";
			fire  		= { 240, 2};
		},
	},

	
	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters",  "Datalink", "Link16"},
	Categories= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	
		M_empty						=	3798,	-- kg  with pilot and nose load, F15
		M_nominal					=	5340,	-- kg (Empty Plus Full Internal Fuel)
		M_max						=	6072,	-- kg (Maximum Take Off Weight)
		M_fuel_max					=	1140,	-- kg (Internal Fuel Only)
		H_max						=	18000,	-- m  (Maximum Operational Ceiling)
		average_fuel_consumption	=	0.150,
		CAS_min						=	70,		-- Minimum CAS speed (m/s) (for AI)
		V_opt						=	180,	-- Cruise speed (m/s) (for AI)
		V_take_off					=	81,		-- Take off speed in m/s (for AI)
		V_land						=	81,		-- Land speed in m/s (for AI)
		has_afteburner				=	true,
		has_speedbrake				=	true,
		radar_can_see_ground			=	true,

		nose_gear_pos 		= {1.42,	-1.00,	0},   -- nosegear coord---6.157,	-1.26,	0 
	    nose_gear_amortizer_direct_stroke   		=  0,  -- down from nose_gear_pos !!!
	    nose_gear_amortizer_reversal_stroke  		=  0,  -- up 
	    nose_gear_amortizer_normal_weight_stroke 	=  0,   -- up 
	    nose_gear_wheel_diameter 	                =  0.754, -- in m
	
	    	main_gear_pos 		= {-2.14,	-1.16,	1.70}, -- main gear coords	----1.184,	-1.26,	2.714 
	    main_gear_amortizer_direct_stroke	 	    =   0, --  down from main_gear_pos !!!
	    main_gear_amortizer_reversal_stroke  	    =   0, --  up 
	    main_gear_amortizer_normal_weight_stroke    =   0,-- down from main_gear_pos
	    main_gear_wheel_diameter 				    =   0.972, -- in m

		AOA_take_off				=	0.16,	-- AoA in take off (for AI)
		stores_number				=	9,
		bank_angle_max				=	30,		-- Max bank angle (for AI)
		Ny_min						=	-3,		-- Min G (for AI)
		Ny_max						=	8,		-- Max G (for AI)
		V_max_sea_level				=	340,	-- Max speed at sea level in m/s (for AI)
		V_max_h					=	340,	-- Max speed at max altitude in m/s (for AI)
		wing_area		=	22.6,	-- wing area in m2
		thrust_sum_max				=	16240,	-- thrust in kgf (64.3 kN)
		thrust_sum_ab				=	24400,	-- thrust in kgf (95.1 kN)
		Vy_max						=	275,	-- Max climb speed in m/s (for AI)
		flaps_maneuver				=	0.5,
		Mach_max					=	1.15,	-- Max speed in Mach (for AI)
		range						=	2540,	-- Max range in km (for AI)
		RCS				=	2,		-- Radar Cross Section m2
		Ny_max_e				=	9,		-- Max G (for AI)
		detection_range_max			=	250,
		IR_emission_coeff			=	0.91,	-- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
		IR_emission_coeff_ab			=	4,		-- With afterburner
		tand_gear_max				=	3.73,--XX  1.732 FA18 3.73, 
		tanker_type					=	0,--F14=2/S33=4/ M29=0/S27=0/F15=1/ F16=1/To=0/F18=2/A10A=1/ M29K=4/F4=0/
		wing_span			=	9.628,--XX  wing spain in m
		wing_type 					= 	1,-- 0=FIXED_WING/ 1=VARIABLE_GEOMETRY/ 2=FOLDED_WING/ 3=ARIABLE_GEOMETRY_FOLDED
		length				=	11.09,
		height				=	3.80,
		crew_size				=	1, --XX
		engines_count				=	1, --XX
		wing_tip_pos 				= 	{-4.207,	-0.086,	5.782},
		
		--EPLRS 						= true,--?
		TACAN_AA					= true,--?
		launch_bar_connected_arg_value	= 0.815,--0.885,--0.745
		
		mechanimations = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0},},},}, Flags = {"Reversible"},},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
            {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
        },
        FoldableWings = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0}}}}, Flags = {"Reversible"}},
            {Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 5.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
        },
		ServiceHatches = {--Parkposition
            {Transition = {"Close", "Open"}, Sequence = {{C = {{"PosType", 3}, {"Sleep", "for", 30.0}}}, {C = {{"Arg", 24, "set", 1.0}}}}},
            {Transition = {"Open", "Close"}, Sequence = {{C = {{"PosType", 6}, {"Sleep", "for", 5.0}}}, {C = {{"Arg", 24, "set", 0.0}}}}},
        },
        LaunchBar = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.881, "in", 4.4}}}}},
            {Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.815, "in", 4.4}}}}},
			{Transition = {"Any", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 4.5}}}}},
            {Transition = {"Extend", "Stage"},   Sequence = {
                    {C = {{"ChangeDriveTo", "Mechanical"}, {"Sleep", "for", 0.000}}},
                    {C = {{"Arg", 85, "from", 0.881, "to", 0.766, "in", 0.600}}},
                    {C = {{"Arg", 85, "from", 0.766, "to", 0.753, "in", 0.300}}},
                    {C = {{"Sleep", "for", 0.45}}},
                    {C = {{"Arg", 85, "from", 0.753, "to", 0.784, "in", 0.1, "sign", 2}}},
                    {C = {{"Arg", 85, "from", 0.784, "to", 0.881, "in", 1.0}}},
                },
            },
			{Transition = {"Stage", "Pull"},  Sequence = {
					{C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85,"from", 0.881, "to", launch_bar_connected_arg_value_, "in", 0.15}}},
					{C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85, "to", 0.78, "speed", 0.1}}},
					{C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85, "to", 0.7792, "speed", 0.02}}},
					}
			},
            {Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "from", 0.815, "to", 0.881, "in", 0.2}}}}},
        },
    }, -- end of mechanimations
		
		engines_nozzles = 
		{
			[1] = 
			{
				pos = 	{-7.100,	0.10,	0.00},
				elevation	=	-2.8,--3.7
				diameter	=	0.965,--0.965
				exhaust_length_ab	=	5.5,
				exhaust_length_ab_K	=	0.76,
				smokiness_level     = 	0.5, 
			}, -- end of [1]			
		}, -- end of engines_nozzles
		crew_members = 
		{
			[1] = 
			{
				ejection_seat_name	=	9,
				drop_canopy_name	=	41,
				pos = 	{4.763,	0.862,	0},
				drop_parachute_name = "pilot_yak52_parachute",
			}, -- end of [1]			
		}, -- end of crew_members
		brakeshute_name	=	0,
		is_tanker	=	false,
		---air_refuel_receptacle_pos = 	{0,	0,	0},
		fires_pos = 
		{
			[1] = 	{-0.664,	-0.496,	0},
			[2] = 	{0.173,	-0.307,	1.511},
			[3] = 	{0.173,	-0.307,	-1.511},
			[4] = 	{-0.82,	0.265,	2.774},
			[5] = 	{-0.82,	0.265,	-2.774},
			[6] = 	{-0.82,	0.255,	4.274},
			[7] = 	{-0.82,	0.255,	-4.274},
			[8] = 	{-4.899,	-0.212,	0.611},
			[9] = 	{-4.899,	-0.212,	-0.611},
			[10] = 	{-0.896,	1.118,	0},
			[11] = 	{0.445,	-0.436,	0},
		}, -- end of fires_pos

--		effects_presets = {
--			{effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/VSN_F4E_overwingVapor.lua"},
--		},

		chaff_flare_dispenser = 
		{
			[1] = 
			{
				dir = 	{0,	1,	0},
				pos = 	{-5.776,	1.4,	-0.422},
			}, -- end of [1]
			[2] = 
			{
				dir = 	{0,	1,	0},
				pos = 	{-5.776,	1.4,	0.422},
			}, -- end of [2]
		}, -- end of chaff_flare_dispenser

        -- Countermeasures
passivCounterm 		= {
CMDS_Edit 			= true,
SingleChargeTotal 	= 96,
chaff 				= {default = 48, increment = 24, chargeSz = 1},
flare 				= {default = 48, increment = 24, chargeSz = 1}
 },
	
	
        CanopyGeometry 	= {
            azimuth 	= {-145.0, 145.0},-- pilot view horizontal (AI)
            elevation 	= {-50.0, 90.0}-- pilot view vertical (AI)
        },

	Sensors = {
		RADAR = "N-011M",
		IRST = "OLS-27",
		RWR = "Abstract RWR"   
	},

	Failures = {
			{ id = 'asc', 		label = _('ASC'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		  --{ id = 'eos',  		label = _('EOS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		  --{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mlws',  	label = _('MLWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },		
	},
	HumanRadio = {
		frequency 		= 127.5,  -- Radio Freq
		editable 		= true,
		minFrequency	= 100.000,
		maxFrequency 	= 156.000,
		modulation 		= MODULATION_AM
	},

	Guns = {


	gun_mount("GSh_23_2", { count = 250 },{muzzle_pos = {2.00, -0.550, -0.5}}),
		gun_mount("GSh_23_2", { count = 250 },{muzzle_pos = {1.85, -0.650, -0.3}}),
		gun_mount("M_39", { count = 250 },{muzzle_pos = {1.95,  -0.60,  0.40}}),

			},
-------------------------------------------------------------------------------
	Pylons =     {
         pylon(1, 0, 1.2, 2.50, -1.60,
            {
                use_full_connector_position = false,connector = "pylon_1",
            },
            {
			
		{ CLSID = "FAB_50"},
		 { CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}" },        --FAB-250
 		{ CLSID = "B_8V20A_CM"                       },        --B-8V20A - 20 S-8TsM
        { CLSID = "B_8V20A_OM"                    },        --B-8V20A - 20 S-8OM
        { CLSID = "B-8M1 - 20 S-8OFP2"                },        --B-8M1 - 20 S-8OFP2
        { CLSID = "B-8V20A - 20 S-8OFP2"            },        --B-8V20A - 20 S-8OFP2
		{ CLSID = "FAB_100M"},
		{ CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}" },        --UPK-23-250
		{ CLSID = "CATM-9M"                    },        --CATM-9M
            }
        ),
       pylon(2, 0, 1.2, 2.40, -1.75,
            {
				use_full_connector_position = false,connector = "pylon_2",
            },
            {
	    { CLSID = "FAB_50"},
		 { CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}" },        --FAB-250
 		{ CLSID = "B_8V20A_CM"                       },        --B-8V20A - 20 S-8TsM
        { CLSID = "B_8V20A_OM"                    },        --B-8V20A - 20 S-8OM
        { CLSID = "B-8M1 - 20 S-8OFP2"                },        --B-8M1 - 20 S-8OFP2
        { CLSID = "B-8V20A - 20 S-8OFP2"            },        --B-8V20A - 20 S-8OFP2
		{ CLSID = "FAB_100M"},
		{ CLSID = "{05544F1A-C39C-466b-BC37-5BD1D52E57BB}" },        --UPK-23-250
	    { CLSID = "CATM-9M"                    },        --CATM-9M
		
		
            }
        ),
        pylon(3, 0, 0.00, 0.00, 0.000,
            {
				use_full_connector_position = false,connector = "pylon_3",
            },
            {
	   
            }
        ),
		pylon(4, 0, 0.00, 0.00, 0.00,
            {
				use_full_connector_position = false,connector = "pylon_4",
            },
            {
				
            }
        ),
      		
      
     },

------------------------------------------------------------------------------			
			
			
			

	
	
	Tasks = {
        aircraft_task(CAP),
     	aircraft_task(Escort),
      	aircraft_task(FighterSweep),
		aircraft_task(Intercept),
		aircraft_task(Reconnaissance),
    	aircraft_task(GroundAttack),
     	aircraft_task(CAS),
        aircraft_task(AFAC),
	    aircraft_task(RunwayAttack),
--  	aircraft_task(AntishipStrike),
    },	
	DefaultTask = aircraft_task(CAP),

	SFM_Data = {
	aerodynamics = --F15
		{
			Cy0	=	0,
			Mzalfa	=	6,
			Mzalfadt	=	1,
			kjx = 2.95,
			kjz = 0.00125,
			Czbe = -0.016,
			cx_gear = 0.0268,
			cx_flap = 0.06,
			cy_flap = 0.4,
			cx_brk = 0.06,
			table_data = 
			{
			--      M	 Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax
				{0.0,	0.0215,		0.055,		0.08,		0.22,	0.65,	25.0,	1.2 	},
				{0.2,	0.0215,		0.055,		0.08,		0.22,	1.80,	25.0,	1.2     },
				{0.4,	0.0215,		0.055,		0.08,	   	0.22,	3.00,	25.0,	1.2     },
				{0.6,	0.0215,		0.055,		0.05,		0.28,	4.20,	25.0,	1.2     },
				{0.7,	0.0215,		0.055,		0.05,		0.28,	4.20,	23.0,	1.15    },
				{0.8,	0.0215,		0.055,		0.05,		0.28,	4.20,	21.7,	1.1     },
				{0.9,	0.0230,		0.058,		0.09,		0.20,	4.20,	20.1,	1.07    },
				{1.0,	0.0320,		0.062,		0.17,		0.15,	4.20,	18.9,	1.04    },
				{1.1,	0.0430,		0.062,	   	0.235,		0.09,	3.78,	17.4,	1.02    },
				{1.2,	0.0460,		0.062,	   	0.285,		0.08,	2.94,	17.0,	1.00 	},		
				{1.3,	0.0470,		0.06,	   	0.29,		0.10,	2.10,	16.0,	0.92 	},				
				{1.4,	0.0470,		0.056,	   	0.3,		0.136,	1.80,	15.0,	0.80 	},					
				{1.6,	0.0470,		0.052,	   	0.34,		0.21,	1.08,	13.0,	0.7 	},					
				{1.8,	0.0460,		0.042,	   	0.34,		2.43,	0.96,	12.0,	0.55 	},		
				{2.2,	0.0420,		0.037,	   	0.49,		3.5,	0.84,	 10.0,	0.37 	},					
				{2.5,	0.0420,		0.033,		0.6,		4.7,	0.84,	 9.0,	0.3 	},		
				{3.9,	0.0400,		0.023,		0.9,		6.0,	0.84,	 7.0,	0.2		},
			}, -- end of table_data
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			type	=	"TurboJet",
			hMaxEng	=	19.5,
			dcx_eng	=	0.0114,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	6000,
			dpdh_f	=	14000.0,
			table_data = {
			--   M		Pmax		 Pfor
				{0.0,	115000,		212000},
				{0.2,	 94000,		200000},
				{0.4,	 92000,		205000},
				{0.6,	103000,		207000},
				{0.7,	105000,		210000},
				{0.8,	105000,		220000},
				{0.9,	105000,		235000},
				{1.0,	107000,		250000},
				{1.1,	103000,		258000},
				{1.2,	 94000,		268000},
				{1.3,	 84000,		285000},
				{1.4,	 71000,		300000},
				{1.6,	 34000,		318000},
				{1.8,	 19000,		337000},
				{2.2,	 17000,		370000},
				{2.5,	 19000,		390000},
				{3.9,	 82000,		310000},
			}, -- end of table_data
		}, -- end of engine
	},


	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
	[0]  = {critical_damage = 5,  args = {146}},
	[1]  = {critical_damage = 3,  args = {296}},
	[2]  = {critical_damage = 3,  args = {297}},
	[3]  = {critical_damage = 8, args = {65}},
	[4]  = {critical_damage = 2,  args = {298}},
	[5]  = {critical_damage = 2,  args = {301}},
	[7]  = {critical_damage = 2,  args = {249}},
	[8]  = {critical_damage = 3,  args = {265}},
	[9]  = {critical_damage = 3,  args = {154}},
	[10] = {critical_damage = 3,  args = {153}},
	[11] = {critical_damage = 1,  args = {167}},
	[12] = {critical_damage = 1,  args = {161}},
	[13] = {critical_damage = 2,  args = {169}},
	[14] = {critical_damage = 2,  args = {163}},
	[15] = {critical_damage = 2,  args = {267}},
	[16] = {critical_damage = 2,  args = {266}},
	[17] = {critical_damage = 2,  args = {168}},
	[18] = {critical_damage = 2,  args = {162}},
	[20] = {critical_damage = 2,  args = {183}},
	[23] = {critical_damage = 5, args = {223}},
	[24] = {critical_damage = 5, args = {213}},
	[25] = {critical_damage = 2,  args = {226}},
	[26] = {critical_damage = 2,  args = {216}},
	[29] = {critical_damage = 5, args = {224}, deps_cells = {23, 25}},
	[30] = {critical_damage = 5, args = {214}, deps_cells = {24, 26}},
	[35] = {critical_damage = 6, args = {225}, deps_cells = {23, 29, 25, 37}},
	[36] = {critical_damage = 6, args = {215}, deps_cells = {24, 30, 26, 38}}, 
	[37] = {critical_damage = 2,  args = {228}},
	[38] = {critical_damage = 2,  args = {218}},
	[39] = {critical_damage = 2,  args = {244}, deps_cells = {53}}, 
	[40] = {critical_damage = 2,  args = {241}, deps_cells = {54}}, 
	[43] = {critical_damage = 2,  args = {243}, deps_cells = {39, 53}},
	[44] = {critical_damage = 2,  args = {242}, deps_cells = {40, 54}}, 
	[51] = {critical_damage = 2,  args = {240}}, 
	[52] = {critical_damage = 2,  args = {238}},
	[53] = {critical_damage = 2,  args = {248}},
	[54] = {critical_damage = 2,  args = {247}},
	[56] = {critical_damage = 2,  args = {158}},
	[57] = {critical_damage = 2,  args = {157}},
	[59] = {critical_damage = 3,  args = {148}},
	[61] = {critical_damage = 2,  args = {147}},
	[82] = {critical_damage = 2,  args = {152}},
	},
	
	DamageParts = 
	{  
		[1] = "mig17_f-oblomok-wing-r", -- wing R
		[2] = "mig17_f-oblomok-wing-l", -- wing L

	},
	
	lights_data = { typename = "collection", lights = {
		
	    [WOLALIGHT_NAVLIGHTS] = {
         typename = "argumentlight",
         argument = 49, },

        [WOLALIGHT_SPOTS] = {
            typename = "collection",
            lights = {
                [1] = {
                    typename = "Collection",
                    lights = {
                        {
                            typename = "Spot", connector = "MAIN_SPOT_PTR", dir_correction = {elevation = math.rad(8.0)}, argument = 51,
                            proto = lamp_prototypes.LFS_P_27_600,
                        },
                    },
                },
            }
        },
        [WOLALIGHT_TAXI_LIGHTS] = {
            typename = "collection",
            lights = {
                [1] = {
                    typename = "Collection",
                    lights = {
                        {
                            typename = "Spot", connector = "MAIN_SPOT_PTR", dir_correction = {elevation = math.rad(8.0)}, argument = 51,
                            proto = lamp_prototypes.LFS_R_27_180,},
                        },
                    },
                },
            }
        },
	},
}

add_aircraft(mig17pm) --AG
