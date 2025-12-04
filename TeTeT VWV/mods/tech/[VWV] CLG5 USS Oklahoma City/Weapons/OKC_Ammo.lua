-- Kudos to currenthill, original Shell name is ModernUSNShips_127_AA
-- Download from https://currenthill.com/
-- note that some characteristics have been changed by TeTeT, see the old value as comment

declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "jjj_OKC_mk16_152mm_HC",
	user_name 				= _("152 mm HC"),
	model_name				= "pula",
	projectile	  		= "HE",
	payloadEffect   		= "Fragmentation",
	payloadMaterial 		= "RDX",
	v0						= 812, -- 2665.0 fps,
	Dv0						= 0.003, -- 0.001,
	Da0						= 0.0012, -- 0.0002,
	Da1						= 0.0000, -- 0.0001,
	mass	  				= 260.0,
	explosive	 			= 40.5881, -- about 6kg,
	life_time	 			= 300,
	caliber	 			= 152.0,
	s		 				= 0.0,
	j		 				= 0.0,
	l		 				= 0.0,
	charTime				= 0,
	cx						= {0.0,0.52,0.67,0.14,1.76},
	k1						= 9.6e-10,
	tracer_off				= 1.7,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 1.7,
	scale_tracer  			= 1,
	scale_smoke			= barrel_smoke_level,
	smoke_opacity  			= barrel_smoke_opacity,
	smoke_particle  		= 1,
	cartridge 				= 0,

	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 812.0 } -- intentionally not 792 to get less accurate
	}

});



declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "jjj_OKC_mk12_127mm_AIR",
	user_name 				= _("127 mm AA"),
	model_name				= "pula",
	projectile	  		= "HE",
	payloadEffect   		= "Fragmentation",
	payloadMaterial 		= "RDX",
	v0						= 762, -- 2500.0 fps,
	Dv0						= 0.001, -- 0.0002,
	Da0						= 0.0002, -- 0.00001,
	Da1						= 0.0001, -- 0.0,
	mass	  				= 25.0,
	explosive	 			= 22.3235, -- about 3.3kg,
	life_time	 			= 100,
	caliber	 			= 127.0,
	s		 				= 0.0,
	j		 				= 0.0,
	l		 				= 0.0,
	charTime				= 0,
	cx						= {0.0,0.52,0.67,0.14,1.76},
	k1						= 7.6e-10,
	tracer_off				= 100,
	scale_tracer  			= 1,
	scale_smoke				= 12.0,
	smoke_opacity  			= 0.5,
	cartridge 				= 1,

	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 762.0 } -- intentionally not 792 to get less accurate
	}

});

