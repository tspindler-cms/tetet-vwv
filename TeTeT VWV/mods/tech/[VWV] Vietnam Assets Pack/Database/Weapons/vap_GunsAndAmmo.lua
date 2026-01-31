-- Weapons for the Vietnam Asset Pack -- by FMD


-- === Shell VAP AK47 7.62mm ===


declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_57N231S", 
	user_name 				= _("VAP 57 N 231S"),
	model_name    			= "",
	v0    					= 715.0,
	Dv0   					= 0.0065,
	Da0     				= 0.00045,
	Da1     				= 0.0,
	mass      				= 0.008,
	explosive     			= 0.000,
	life_time     			= 8,
	caliber    				= 7.62,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {1.0,0.65,0.68,0.18,1.85},
	k1        				= 3.2e-08,
	tracer_off    			= -100,
	scale_tracer  			= 1,
	cartridge 				= 0,
	visual_effect_correction = 0.0,
	
});

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_57N231U", 
	user_name 				= _("VAP 57 N 231U"),
	model_name    			= "",
	v0    					= 290.0,
	Dv0   					= 0.0025,
	Da0     				= 0.0002,
	Da1     				= 0.0,
	mass      				= 0.0126,
	explosive     			= 0.000,
	life_time     			= 8,
	caliber    				= 7.62,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {0.5,0.35,0.38,0.12,1.2},
	k1        				= 4.5e-08,
	tracer_off    			= -100,
	scale_tracer  			= 1,
	cartridge 				= 0,
	visual_effect_correction = 0.0,
	
});

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_57N231P", 
	user_name 				= _("VAP 57 N 231P"),
	model_name    			= "tracer_bullet_red",
	v0    					= 715.0,
	Dv0   					= 0.0068,
	Da0     				= 0.00047,
	Da1     				= 0.0,
	mass      				= 0.0078,
	explosive     			= 0.000,
	life_time     			= 8,
	caliber     			= 7.62,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {1.0,0.66,0.69,0.19,1.88},
	k1        				= 3.3e-08,
	tracer_off    			= 5,
	scale_tracer  			= 1,
	cartridge 				= 0,
	visual_effect_correction = 0.0,
	
});

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "VAP_Type56", 
	user_name 				= _("VAP Type 56"),
	model_name    			= "",
	v0    					= 720.0,
	Dv0   					= 0.0066,
	Da0     				= 0.00045,
	Da1     				= 0.0,
	mass      				= 0.008,
	explosive     			= 0.000,
	life_time     			= 8,
	caliber    				= 7.62,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {1.0,0.64,0.67,0.18,1.83},
	k1        				= 3.1e-08,
	tracer_off    			= -100,
	scale_tracer  			= 1,
	cartridge 				= 0,
	visual_effect_correction = 0.0,
	
});

-- === VAP AK47 Type II (1951) ===

GT_t.LN_t.vap_ak47t2 = {name = "VAP AK47 TypeII", display_name = _("AK47 TypeII")}
GT_t.LN_t.vap_ak47t2.type 						= 10
GT_t.LN_t.vap_ak47t2.distanceMin				= 0
GT_t.LN_t.vap_ak47t2.distanceMax				= 1500
GT_t.LN_t.vap_ak47t2.max_trg_alt				= 600
GT_t.LN_t.vap_ak47t2.reactionTime				= 0.5
GT_t.LN_t.vap_ak47t2.fireAnimationArgument		= -1
GT_t.LN_t.vap_ak47t2.radialDisperse				= 5.0
GT_t.LN_t.vap_ak47t2.dispertionReductionFactor	= 0.80
GT_t.LN_t.vap_ak47t2.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_ak47t2.sensor, GT_t.WSN_t[9])
GT_t.LN_t.vap_ak47t2.PL = {}
GT_t.LN_t.vap_ak47t2.PL[1] = {}
GT_t.LN_t.vap_ak47t2.PL[1].switch_on_delay 		= 2.0
GT_t.LN_t.vap_ak47t2.PL[1].ammo_capacity 		= 30
GT_t.LN_t.vap_ak47t2.PL[1].shot_delay 			= 60/700
GT_t.LN_t.vap_ak47t2.PL[1].reload_time 			= 5
GT_t.LN_t.vap_ak47t2.PL[1].portionAmmoCapacity 	= 30
GT_t.LN_t.vap_ak47t2.PL[1].shell_name 			= {"VAP_57N231U"}
GT_t.LN_t.vap_ak47t2.PL[1].shell_display_name	= "57N231U"
GT_t.LN_t.vap_ak47t2.BR = { {pos = {5.2, 0, 0} } }


-- === VAP AK47 Type III (1954-1955) === 

GT_t.LN_t.vap_ak47t3 = {name = "VAP AK47 TypeIII", display_name = _("AK47 TypeIII")}
GT_t.LN_t.vap_ak47t3.type						= 10
GT_t.LN_t.vap_ak47t3.distanceMin				= 0
GT_t.LN_t.vap_ak47t3.distanceMax				= 1500
GT_t.LN_t.vap_ak47t3.max_trg_alt				= 650
GT_t.LN_t.vap_ak47t3.reactionTime				= 0.5
GT_t.LN_t.vap_ak47t3.fireAnimationArgument		= -1
GT_t.LN_t.vap_ak47t3.radialDisperse				= 3.0
GT_t.LN_t.vap_ak47t3.dispertionReductionFactor	= 0.80
GT_t.LN_t.vap_ak47t3.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_ak47t3.sensor, GT_t.WSN_t[9])
GT_t.LN_t.vap_ak47t3.PL = {}
GT_t.LN_t.vap_ak47t3.PL[1] = {}
GT_t.LN_t.vap_ak47t3.PL[1].switch_on_delay 		= 2.0
GT_t.LN_t.vap_ak47t3.PL[1].ammo_capacity 		= 30
GT_t.LN_t.vap_ak47t3.PL[1].shot_delay 			= 60/750
GT_t.LN_t.vap_ak47t3.PL[1].reload_time 			= 3
GT_t.LN_t.vap_ak47t3.PL[1].portion_reload_time 	= 3
GT_t.LN_t.vap_ak47t3.PL[1].portionAmmoCapacity 	= 30
GT_t.LN_t.vap_ak47t3.PL[1].shell_name 			= {"VAP_57N231S","VAP_57N231S","VAP_57N231P"}
GT_t.LN_t.vap_ak47t3.PL[1].shell_display_name	= "57N231S(3x)/57N231P"
GT_t.LN_t.vap_ak47t3.BR = { {pos = {5.2, 0, 0} } }

-- === VAP M16A1 ===
--[[
GT_t.LN_t.vap_m16a1 = {name = "VAP M16A1", display_name = _("M16A1")}
GT_t.LN_t.vap_m16a1.type						= 10
GT_t.LN_t.vap_m16a1.distanceMin					= 0
GT_t.LN_t.vap_m16a1.distanceMax					= 1500
GT_t.LN_t.vap_m16a1.max_trg_alt					= 650
GT_t.LN_t.vap_m16a1.reactionTime				= 0.5
GT_t.LN_t.vap_m16a1.fireAnimationArgument		= -1
GT_t.LN_t.vap_m16a1.radialDisperse				= 3.0
GT_t.LN_t.vap_m16a1.dispertionReductionFactor	= 0.80
GT_t.LN_t.vap_m16a1.sensor = {}
set_recursive_metatable(GT_t.LN_t.vap_m16a1.sensor, GT_t.WSN_t[9])
GT_t.LN_t.vap_m16a1.PL = {}
GT_t.LN_t.vap_m16a1.PL[1] = {}
GT_t.LN_t.vap_m16a1.PL[1].switch_on_delay 		= 2.0
GT_t.LN_t.vap_m16a1.PL[1].ammo_capacity			= 240
GT_t.LN_t.vap_m16a1.PL[1].shot_delay			= 60/850
GT_t.LN_t.vap_m16a1.PL[1].reload_time			= 3
GT_t.LN_t.vap_m16a1.PL[1].portionAmmoCapacity	= 30
GT_t.LN_t.vap_m16a1.PL[1].shell_name			= {"","","","",}
GT_t.LN_t.vap_m16a1.PL[1].shell_display_name 	= {"",}
GT_t.LN_t.vap_m16a1.BR = { {pos = {0, 0, 0} } }
]]

-----------------------------------------------------------------------------------------------------

-- End for Guns and Shell