-- VAP Cannons And Shell Weapons -- by FMD


-- === Shell VAP ZPU-23 23mm BZT/OFZ ===

-- VAP BZ API 23mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_BZ23_API",
	user_name				= _("BZ 23 API"),
	model_name				= "pula",
	v0						= 970.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.184,
	round_mass				= 0.470,
	explosive				= 0.005,
	life_time				= 30,
	caliber					= 23,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.3,0.5,0.65,0.3,1.55},
	k1        				= 8.5e-10,
	
	tracer_off				= 100,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 20,
	cartridge 				= 0,
	
	visual_effect_correction = 1.0,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 970.0 }
	}
})

-- VAP BZT API-T 23mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_BZT23_APIT",
	user_name				= _("BZT 23 API-T"),
	model_name				= "pula",
	v0						= 970.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.184,
	round_mass				= 0.470,
	explosive				= 0.005,
	life_time				= 30,
	caliber					= 23,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.3,0.5,0.65,0.3,1.55},
	k1        				= 8.5e-10,
	
	tracer_color 			= "red",
	tracer_pos				= {-0.15, 0.0, 0.0},
	tracer_on   			= 0,
	tracer_off    			= 4.5,
	tracer_scale  			= 1,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 20,
	cartridge 				= 0,
	
	visual_effect_correction = 1.0,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 970.0 }
	}
})


-- VAP OFZ HE-I 23mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_OFZ23_HEI",
	user_name				= _("OFZ 23 HE-I"),
	model_name				= "pula",
	v0						= 970.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.190,
	round_mass				= 0.470,
	explosive				= 1.5,
	life_time				= 7.0,
	caliber					= 23,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.3,0.5,0.65,0.3,1.55},
	k1        				= 8.5e-10,
	
	tracer_off				= 100,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 20,
	cartridge 				= 0,
	
	visual_effect_correction = 1.5,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 970.0 }
	}
})

-- VAP OFZT HEF-T 23mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_OFZT23_HEFT",
	user_name				= _("OFZT 23 HEF-T"),
	model_name				= "pula",
	v0						= 970.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.190,
	round_mass				= 0.470,
	life_time				= 6.5,
	explosive				= 1.0,
	caliber					= 23,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.3,0.5,0.65,0.3,1.55},
	k1        				= 8.5e-10,
	
	tracer_color 			= "red",
	tracer_pos				= {-0.15, 0.0, 0.0},
	tracer_on   			= 0,
	tracer_off    			= 5,
	tracer_scale  			= 1,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 20,
	cartridge 				= 0,
	
	visual_effect_correction = 1.5,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 970.0 }
	}
})

-- API - API - API - API-T  (ratio 1:4)
-- ou
-- HE - HE - API-T  (ratio 1:3)
-- ou
-- HE - API-T  (ratio 1:2, engagement intensif)

-- API - API-T - HE - HE - HEF-T (Special VAP DCS)

-- === VAP AA Cannon ===

-- 2Cannons ZU-23 (23mm) --

GT_t.LN_t.vap_2zu23 = {name = "VAP ZU-23-2", display_name = _("ZU-23-2")} 
GT_t.LN_t.vap_2zu23.type 					= 3
GT_t.LN_t.vap_2zu23.distanceMin 			= 0
GT_t.LN_t.vap_2zu23.distanceMax				= 7000
GT_t.LN_t.vap_2zu23.max_trg_alt 			= 4000
GT_t.LN_t.vap_2zu23.reactionTime 			= 2
GT_t.LN_t.vap_2zu23.reactionTimeLOFAC 		= 1
GT_t.LN_t.vap_2zu23.fireAnimationArgument	= -1
GT_t.LN_t.vap_2zu23.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_2zu23.sensor, GT_t.WSN_t[3])
GT_t.LN_t.vap_2zu23.PL = {}
GT_t.LN_t.vap_2zu23.PL[1] = {}
GT_t.LN_t.vap_2zu23.PL[1].switch_on_delay 		= 6
GT_t.LN_t.vap_2zu23.PL[1].shot_delay 			= 60/800
GT_t.LN_t.vap_2zu23.PL[1].reload_time 			= 20
GT_t.LN_t.vap_2zu23.PL[1].automaticLoader 		= false
GT_t.LN_t.vap_2zu23.PL[1].ammo_capacity 		= 100
GT_t.LN_t.vap_2zu23.PL[1].portionAmmoCapacity 	= 100
GT_t.LN_t.vap_2zu23.PL[1].shell_name 			= {	"VAP_BZ23_API","VAP_OFZT23_HEFT",
													"VAP_BZT23_APIT","VAP_BZ23_API",
													"VAP_OFZ23_HEI","VAP_BZT23_APIT",
													"VAP_OFZ23_HEI","VAP_OFZ23_HEI",
													"VAP_OFZT23_HEFT","VAP_OFZ23_HEI"
													}
GT_t.LN_t.vap_2zu23.PL[1].shell_display_name 	= _("API/API-T/HEI(2x)/HEF-T")
GT_t.LN_t.vap_2zu23.BR = { {pos = {0, 0, 0} } }

-----------------------------------------------------------------------------------------------------

-- End for Cannons and Shell