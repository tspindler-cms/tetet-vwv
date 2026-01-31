-- VAP MachineGuns & Ammo for the Vietnam Asset Pack -- by FMD


-- === Shell VAP BMG .50 ===

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M2Ball_50",
	user_name				= _("M2 Ball .50"),
	model_name				= "",
	v0						= 890.0,
	Dv0						= 0.0065,
	Da0						= 0.0004,
	Da1						= 0.0003,
	mass					= 0.0430,
	explosive				= 0.0,
	life_time				= 30,
	caliber					= 12.7,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.28, 0.50, 0.65, 0.24, 1.80},
	k1        				= 2.8e-08,
	tracer_off				= 0,
	--smoke_tail_life_time 	= 0,
	cartridge 				= 0,
	
	--visual_effect_correction = 1.0,

});

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M8API_50",
	user_name				= _("M8 API .50"),
	model_name				= "",
	v0						= 887.0,
	Dv0						= 0.0065,
	Da0						= 0.0004,
	Da1						= 0.0003,
	mass					= 0.0427,
	explosive				= 0.080,
	life_time				= 30,
	caliber					= 12.7,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.28, 0.50, 0.65, 0.24, 1.80},
	k1        				= 2.8e-08,
	tracer_off				= 0,
	--smoke_tail_life_time 	= 0,
	cartridge 				= 0,
	
	visual_effect_correction = 0.2,

});

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M20APIT_50",
	user_name				= _("M20 APIT .50"),
	model_name				= "pula",
	v0						= 887.0,
	Dv0						= 0.0065,
	Da0						= 0.0004,
	Da1						= 0.0003,
	mass					= 0.0427,
	explosive				= 0.080,
	life_time				= 30,
	caliber					= 12.7,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.28, 0.50, 0.65, 0.24, 1.80},
	k1        				= 2.8e-08,
	tracer_off				= 30,
	tracer_color			= "red",
	tracer_pos				= {-0.2, 0.0, 0.0},
	scale_tracer  			= 1,
	--smoke_tail_life_time 	= 0,
	cartridge 				= 0,
	
	visual_effect_correction = 0.2,

});

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_M1Tr_50",
	user_name				= _("M1 Tracer .50"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0067,
	Da0						= 0.0004,
	Da1						= 0.0003,
	mass					= 0.040,
	round_mass				= 0.113,
	explosive				= 0.0,
	life_time				= 30,
	caliber					= 12.7,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.29, 0.52, 0.67, 0.25, 1.85},
	k1        				= 2.8e-08,
	tracer_off				= 30,
	tracer_color			= "red",
	tracer_pos				= {-0.2, 0.0, 0.0},
	scale_tracer  			= 1,
	--smoke_tail_life_time 	= 0,
	cartridge 				= 0,
	
	--visual_effect_correction = 1.0,

});


-- Ratio 4:1 → 4 M2 Ball ou M8 API pour 1 M20 APIT
-- Ratio 3:1:1 → 3 M2 Ball, 1 M8 API, 1 M20 APIT

-- === VAP M2 BMG (browning machine gun) ===

GT_t.LN_t.vap_m2bmg = {name = "VAP M2 BMG", display_name = _("M2 BMG")}
GT_t.LN_t.vap_m2bmg.type						= 10
GT_t.LN_t.vap_m2bmg.distanceMin					= 0
GT_t.LN_t.vap_m2bmg.distanceMax					= 1500
GT_t.LN_t.vap_m2bmg.max_trg_alt					= 2500
GT_t.LN_t.vap_m2bmg.reactionTime 				= 0
GT_t.LN_t.vap_m2bmg.fireAnimationArgument		= -1
GT_t.LN_t.vap_m2bmg.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_m2bmg.sensor, GT_t.WSN_t[9])
GT_t.LN_t.vap_m2bmg.PL = {}
GT_t.LN_t.vap_m2bmg.PL[1] = {}
GT_t.LN_t.vap_m2bmg.PL[1].switch_on_delay		= 10
GT_t.LN_t.vap_m2bmg.PL[1].shot_delay			= 60/500
GT_t.LN_t.vap_m2bmg.PL[1].reload_time			= 20
GT_t.LN_t.vap_m2bmg.PL[1].ammo_capacity			= 200
GT_t.LN_t.vap_m2bmg.PL[1].portionAmmoCapacity	= 200
GT_t.LN_t.vap_m2bmg.PL[1].shell_name 			= {"VAP_M2Ball_50","VAP_M1Tr_50","VAP_M2Ball_50","VAP_M2Ball_50","VAP_M8API_50"}
GT_t.LN_t.vap_m2bmg.PL[1].shell_display_name	= _("M2Ball/M1Tr/M2Ball(2x)/M8API")
GT_t.LN_t.vap_m2bmg.BR = { {pos = {0, 0, 0} } }


-- === VAP Quad M2 BMG (browning machine gun) ===

GT_t.LN_t.vap_4m2bmg = {name = "VAP Quad M2 BMG", display_name = _("Quad M2 BMG")}
GT_t.LN_t.vap_4m2bmg.type						= 10
GT_t.LN_t.vap_4m2bmg.distanceMin				= 0
GT_t.LN_t.vap_4m2bmg.distanceMax				= 4500
GT_t.LN_t.vap_4m2bmg.max_trg_alt				= 4500
GT_t.LN_t.vap_4m2bmg.reactionTime 				= 0
GT_t.LN_t.vap_4m2bmg.fireAnimationArgument		= -1
GT_t.LN_t.vap_4m2bmg.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_4m2bmg.sensor, GT_t.WSN_t[9])
GT_t.LN_t.vap_4m2bmg.PL = {}
GT_t.LN_t.vap_4m2bmg.PL[1] = {}
GT_t.LN_t.vap_4m2bmg.PL[1].switch_on_delay		= 40
GT_t.LN_t.vap_4m2bmg.PL[1].shot_delay			= 60/500
GT_t.LN_t.vap_4m2bmg.PL[1].reload_time			= 60
GT_t.LN_t.vap_4m2bmg.PL[1].ammo_capacity		= 800
GT_t.LN_t.vap_4m2bmg.PL[1].portionAmmoCapacity	= 800
GT_t.LN_t.vap_4m2bmg.PL[1].shell_name 			= {"VAP_M2Ball_50","VAP_M2Ball_50","VAP_M2Ball_50","VAP_M8API_50","VAP_M20APIT_50"}
GT_t.LN_t.vap_4m2bmg.PL[1].shell_display_name	= _("M2Ball(3x)/M8API/M8APIT")
GT_t.LN_t.vap_4m2bmg.BR = { {pos = {0, 0, 0} } }



-------------------------------------------------------------------------------------------------------------

-- End for MGuns & Ammo