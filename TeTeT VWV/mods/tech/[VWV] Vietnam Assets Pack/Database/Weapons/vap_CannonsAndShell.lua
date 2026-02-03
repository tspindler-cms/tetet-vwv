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
GT_t.LN_t.vap_2zu23.PL[1].shell_name 			= {	"VAP_BZ23_API"	,"VAP_OFZT23_HEFT",
													"VAP_BZT23_APIT","VAP_BZ23_API",
													"VAP_OFZ23_HEI"	,"VAP_BZT23_APIT",
													"VAP_OFZ23_HEI"	,"VAP_OFZ23_HEI",
													"VAP_OFZT23_HEFT","VAP_OFZ23_HEI"
													}
GT_t.LN_t.vap_2zu23.PL[1].shell_display_name 	= _("API/API-T/HEI(2x)/HEF-T")
GT_t.LN_t.vap_2zu23.BR = { {pos = {0, 0, 0} } }

-----------------------------------------------------------------------------------------------------

-- === Shell VAP Type 96 25x163mm ===

-- VAP T96 HE 25mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_T96_HE",
	user_name				= _("Type96 25 HE"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.320,
	round_mass				= 0.820,
	explosive				= 0.012,
	life_time				= 8.0,
	caliber					= 25,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.32, 0.52, 0.68, 0.32, 1.60},
	k1        				= 9.0e-10,
	
	tracer_off				= 100,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 18,
	cartridge 				= 0,
	
	visual_effect_correction = 1.2,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 900.0 }
	}
})

-- VAP T96 HEI 25mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_T96_HEI",
	user_name				= _("Type96 25 HEI"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.320,
	round_mass				= 0.820,
	explosive				= 1.0,
	life_time				= 8.0,
	caliber					= 25,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.32, 0.52, 0.68, 0.32, 1.60},
	k1        				= 9.0e-10,
	
	tracer_off				= 100,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 18,
	cartridge 				= 0,
	
	visual_effect_correction = 1.5,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 900.0 }
	}
})

-- VAP T96 HE-T 25mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_T96_HET",
	user_name				= _("Type96 25 HE-T"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.320,
	round_mass				= 0.820,
	--explosive				= 0.010,
	explosive				= 1.0,
	life_time				= 8.0,
	caliber					= 25,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.33, 0.53, 0.70, 0.33, 1.62},
	k1        				= 9.2e-10,
	
	tracer_color 			= "yellow",
	tracer_pos				= {-0.15, 0.0, 0.0},
	tracer_on   			= 0,
	tracer_off    			= 6.5,
	tracer_scale  			= 1.0,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 18,
	cartridge 				= 0,
	
	visual_effect_correction = 1.3,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 900.0 }
	}
})

-- VAP T96 HE-T-SD 25mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_T96_HETSD",
	user_name				= _("Type96 25 HE-T-SD"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.320,
	round_mass				= 0.820,
	explosive				= 1.0,  -- 0.010 g but correction for Effects DCS at 1.0
	life_time				= 5.0,
	--life_time_random		= 1,
	caliber					= 25,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.33, 0.53, 0.70, 0.33, 1.62},
	k1        				= 9.2e-10,
	
	tracer_color 			= "yellow",
	tracer_pos				= {-0.15, 0.0, 0.0},
	tracer_on   			= 0,
	tracer_off    			= 4.5,
	tracer_scale  			= 1.0,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 18,
	cartridge 				= 0,
	
	visual_effect_correction = 1.3,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 900.0 }
	}
})

-- VAP T96 AP 25mm
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_T96_AP",
	user_name				= _("Type96 25 AP"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0013,
	Da0						= 0.0005,
	Da1						= 0.0004,
	mass					= 0.280,
	round_mass				= 0.820,
	explosive				= 0.002,
	life_time				= 10.0,
	caliber					= 25,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.28, 0.48, 0.62, 0.28, 1.50},
	k1        				= 8.0e-10,
	
	tracer_off				= 100,
	
	smoke_tail_life_time 	= 0.0,
	rotation_freq  			= 20,
	cartridge 				= 0,
	
	visual_effect_correction = 0.8,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 900.0 }
	}
})

-- Ratio Mixed

-- HE - HE - AP - HE - HE-T
-- ou
-- HEI - HE - AP - HE - HE-T
-- ou
-- HE - HE - AP - HEI - HE-T

-- Special VAP
-- HE - HE - AP - HEI - HE-T-SD

-- === VAP AA Cannon ===

-- Type 96 25mm Twin Mount (25mm) --

GT_t.LN_t.vap_type96tm = {name = "VAP Type96 TM", display_name = _("Type 96 TM")} 
GT_t.LN_t.vap_type96tm.type 					= 3
GT_t.LN_t.vap_type96tm.distanceMin 				= 0
GT_t.LN_t.vap_type96tm.distanceMax				= 6800 -- à 6.8km 45° , 5.5km effectif
GT_t.LN_t.vap_type96tm.max_trg_alt 				= 3500
GT_t.LN_t.vap_type96tm.reactionTime 			= 2
GT_t.LN_t.vap_type96tm.reactionTimeLOFAC 		= 1
GT_t.LN_t.vap_type96tm.fireAnimationArgument	= -1
GT_t.LN_t.vap_type96tm.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_type96tm.sensor, GT_t.WSN_t[3])
GT_t.LN_t.vap_type96tm.PL = {}
GT_t.LN_t.vap_type96tm.PL[1] = {}
GT_t.LN_t.vap_type96tm.PL[1].switch_on_delay 		= 4
GT_t.LN_t.vap_type96tm.PL[1].shot_delay 			= 60/220
GT_t.LN_t.vap_type96tm.PL[1].reload_time 			= 8
GT_t.LN_t.vap_type96tm.PL[1].automaticLoader 		= false
GT_t.LN_t.vap_type96tm.PL[1].ammo_capacity 			= 30
GT_t.LN_t.vap_type96tm.PL[1].portionAmmoCapacity 	= 30
GT_t.LN_t.vap_type96tm.PL[1].shell_name 			= {	"VAP_T96_HE"	,"VAP_T96_HEI",
														"VAP_T96_HET"	,"VAP_T96_HETSD",
														"VAP_T96_AP"	,"VAP_T96_HE",
														"VAP_T96_HEI"	,"VAP_T96_HET",
														"VAP_T96_HETSD"	,"VAP_T96_AP",
													}
GT_t.LN_t.vap_type96tm.PL[1].shell_display_name 	= _("HE/HET/AP/HEI/HE-T-SD")
GT_t.LN_t.vap_type96tm.BR = { {pos = {0, 0, 0} } }

-----------------------------------------------------------------------------------------------------

-- End for Cannons and Shell