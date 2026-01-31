-- VAP Recoilless Rifle And Shell Weapons -- by FMD


-- === Shell VAP 106mm ===

-- VAP M344 HEAT --
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M344_HEAT",
	user_name 				= _("VAP M344 HEAT"),
	model_name    			= "pula",
	v0    					= 503.0,
	Dv0   					= 0.00018,
	Da0     				= 0.0000,
	Da1     				= 0.000,
	mass      				= 7.96,		-- 7.96 kg
	--round_mass				= 10.98,
	life_time     			= 150,
	caliber    				= 105,		-- 105 mm in real, 106 is name for new Cartridge
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,	
	charTime    			= 0,
	cx        				= {0.68, 0.40, 0.61, 0.12, 1.15},
	k1        				= 1.8e-09,
	tracer_off    			= 150,
	
	explosive				= 1.27,     -- 1.27 kg Composition B
	cumulative_mass 		= 1.27,		-- Masse charge creuse (kg)
	cumulative_thickness 	= 0.400,
	--piercing_mass			= 0.4,
	
	rotation_freq			= 0,
	cartridge 				= 0,

	visual_effect_correction	= 1.0,
	
	aiming_table			=
	{
		precalculateAimingTable = true,
		[1] = { init_vel = 503.0 }
	},
})

-- VAP M346A1 HEP-T --
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M346A1_HEPT",
	user_name 				= _("VAP M346A1 HEP-T"),
	model_name    			= "pula",
	v0    					= 498.0,		-- 498 m/s (US Army spec)
	Dv0   					= 0.00018,		-- Similaire M344
	Da0     				= 0.00025,		-- Spin-stabilisé (rotating band)
	Da1     				= 0.0,
	mass      				= 7.7,			-- 7.7 kg projectile (17 lb)
	life_time     			= 150,
	caliber    				= 105,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {0.68, 0.40, 0.61, 0.12, 1.15},
	k1        				= 1.5e-09,
	tracer_color 			= "red",
	tracer_pos				= {-0.15, 0.0, 0.0},
	tracer_on   			= 0,
	tracer_off    			= 150,
	tracer_scale  			= 1,
	
	explosive				= 3.5,			-- 3.5 kg Composition A3 (plastic explosive)
	--obj_factors 			= {1.0, 1.0, 1.0, 1.0, 1.0, 1.0},
	
	rotation_freq			= 7,
	cartridge 				= 0,
	
	visual_effect_correction	= 2.0,
	
	aiming_table			=
	{
		precalculateAimingTable = true,
		[1] = { init_vel = 498.0 }
	},
})

-- VAP M581 APERS-T --
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M581_APERST",
	user_name 				= _("VAP M581 APERS-T"),
	model_name    			= "pula",
	v0    					= 503.0,		-- 503 m/s (estimé)
	Dv0   					= 0.00018,
	Da0     				= 0.00025,		-- Spin-stabilisé
	Da1     				= 0.0,
	mass      				= 6.5,			-- 6.5 kg (plus léger que HEAT/HEP)
	life_time     			= 30,			-- 15 -- Courte portée (fléchettes)
	caliber    				= 105,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {0.68, 0.40, 0.61, 0.12, 1.15},
	k1        				= 1.5e-09,
	tracer_color 			= "red",
	tracer_pos				= {-0.15, 0.0, 0.0},
	tracer_on   			= 0,
	tracer_off    			= 45,
	tracer_scale  			= 1,
	
	explosive				= 0.1,			-- Charge d'expulsion seulement
	AP_cap_caliber 			= 29.0, -- 29 -- spécifie la masse et le diamètre de la « flèche »
	subcalibre     			= true,
	--obj_factors 			= {1.0, 1.0, 0.5, 0.5, 0.5, 0.5},	-- Faible vs structures
	
	rotation_freq			= 7,
	cartridge 				= 0,
	
	visual_effect_correction	= 0.5,

	aiming_table			=
	{
		precalculateAimingTable = true,
		[1] = { init_vel = 503.0 }
	},
})


-- === VAP M40A2 Recoilless Rifle ===

-- M40A2 shell 344 HEAT --

GT_t.LN_t.vap_m40a2HEAT = {name = "VAP M40A2 HEAT", display_name = _("M40A2 HEAT")}
GT_t.LN_t.vap_m40a2HEAT.type				= 6
GT_t.LN_t.vap_m40a2HEAT.xc					= 0.28
GT_t.LN_t.vap_m40a2HEAT.distanceMin			= 10
GT_t.LN_t.vap_m40a2HEAT.distanceMax 		= 6850
GT_t.LN_t.vap_m40a2HEAT.max_trg_alt 		= 5000
GT_t.LN_t.vap_m40a2HEAT.reactionTime 		= 5
GT_t.LN_t.vap_m40a2HEAT.reactionTimeLOFAC 	= 3
GT_t.LN_t.vap_m40a2HEAT.maxShootingSpeed 	= 0
GT_t.LN_t.vap_m40a2HEAT.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_m40a2HEAT.sensor, GT_t.WSN_t[8])
GT_t.LN_t.vap_m40a2HEAT.PL = {}
GT_t.LN_t.vap_m40a2HEAT.PL[1] = {}
GT_t.LN_t.vap_m40a2HEAT.PL[1].switch_on_delay 		= 2.0
GT_t.LN_t.vap_m40a2HEAT.PL[1].shot_delay 			= 6
GT_t.LN_t.vap_m40a2HEAT.PL[1].reload_time 			= 60/5
GT_t.LN_t.vap_m40a2HEAT.PL[1].automaticLoader 		= false
GT_t.LN_t.vap_m40a2HEAT.PL[1].ammo_capacity 		= 20
GT_t.LN_t.vap_m40a2HEAT.PL[1].portionAmmoCapacity	= 5
GT_t.LN_t.vap_m40a2HEAT.PL[1].shell_name 			= {"VAP_M344_HEAT"}
GT_t.LN_t.vap_m40a2HEAT.PL[1].shell_display_name 	= "M344 HEAT"
GT_t.LN_t.vap_m40a2HEAT.BR = { {pos = {0, 0, 0} } }

-- M40A2 shell M346A1 HEP-T --

GT_t.LN_t.vap_m40a2HEPT = {name = "VAP M40A2 HEPT", display_name = _("M40A2 HEPT")}
GT_t.LN_t.vap_m40a2HEPT.type				= 6
GT_t.LN_t.vap_m40a2HEPT.xc					= 0.15
GT_t.LN_t.vap_m40a2HEPT.distanceMin			= 10
GT_t.LN_t.vap_m40a2HEPT.distanceMax 		= 6850
GT_t.LN_t.vap_m40a2HEPT.max_trg_alt 		= 5000
GT_t.LN_t.vap_m40a2HEPT.reactionTime 		= 5
GT_t.LN_t.vap_m40a2HEPT.reactionTimeLOFAC 	= 3
GT_t.LN_t.vap_m40a2HEPT.maxShootingSpeed 	= 0
GT_t.LN_t.vap_m40a2HEPT.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_m40a2HEPT.sensor, GT_t.WSN_t[8])
GT_t.LN_t.vap_m40a2HEPT.PL = {}
GT_t.LN_t.vap_m40a2HEPT.PL[1] = {}
GT_t.LN_t.vap_m40a2HEPT.PL[1].switch_on_delay 		= 2.0
GT_t.LN_t.vap_m40a2HEPT.PL[1].shot_delay 			= 6
GT_t.LN_t.vap_m40a2HEPT.PL[1].reload_time 			= 60/5
GT_t.LN_t.vap_m40a2HEPT.PL[1].automaticLoader 		= false
GT_t.LN_t.vap_m40a2HEPT.PL[1].ammo_capacity 		= 20
GT_t.LN_t.vap_m40a2HEPT.PL[1].portionAmmoCapacity	= 5
GT_t.LN_t.vap_m40a2HEPT.PL[1].shell_name 			= {"VAP_M346A1_HEPT"}
GT_t.LN_t.vap_m40a2HEPT.PL[1].shell_display_name 	= "M346A1 HEP-T"
GT_t.LN_t.vap_m40a2HEPT.BR = { {pos = {0, 0, 0} } }

-- M40A2 shell M581 APERS-T --

GT_t.LN_t.vap_m40a2APERST = {name = "VAP M40A2 APERST", display_name = _("M40A2 APERST")}
GT_t.LN_t.vap_m40a2APERST.type				= 6
GT_t.LN_t.vap_m40a2APERST.xc				= 0.10
GT_t.LN_t.vap_m40a2APERST.distanceMin		= 10
GT_t.LN_t.vap_m40a2APERST.distanceMax 		= 2000
GT_t.LN_t.vap_m40a2APERST.max_trg_alt 		= 5000
GT_t.LN_t.vap_m40a2APERST.reactionTimeLOFAC = 3
GT_t.LN_t.vap_m40a2APERST.reactionTime 		= 5
GT_t.LN_t.vap_m40a2APERST.maxShootingSpeed 	= 0
GT_t.LN_t.vap_m40a2APERST.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_m40a2APERST.sensor, GT_t.WSN_t[8])
GT_t.LN_t.vap_m40a2APERST.PL = {}
GT_t.LN_t.vap_m40a2APERST.PL[1] = {}
GT_t.LN_t.vap_m40a2APERST.PL[1].switch_on_delay 	= 2.0
GT_t.LN_t.vap_m40a2APERST.PL[1].shot_delay 			= 6
GT_t.LN_t.vap_m40a2APERST.PL[1].reload_time 		= 60/5
GT_t.LN_t.vap_m40a2APERST.PL[1].automaticLoader 	= false
GT_t.LN_t.vap_m40a2APERST.PL[1].ammo_capacity 		= 20
GT_t.LN_t.vap_m40a2APERST.PL[1].portionAmmoCapacity	= 5
GT_t.LN_t.vap_m40a2APERST.PL[1].shell_name 			= {"VAP_M581_APERST"}
GT_t.LN_t.vap_m40a2APERST.PL[1].shell_display_name 	= "M581 APERS-T"
GT_t.LN_t.vap_m40a2APERST.BR = { {pos = {0, 0, 0} } }

-----------------------------------------------------------------------------------------------------

-- End for Recoilless Rifle and Shell