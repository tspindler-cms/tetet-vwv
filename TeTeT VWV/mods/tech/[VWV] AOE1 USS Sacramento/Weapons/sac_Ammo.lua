-- Kudos to currenthill, original Shell name is ModernUSNShips_127_AA
-- Download from https://currenthill.com/
-- note that some characteristics have been changed by TeTeT, see the old value as comment

-- Derived from jjj_mk12_127mm_AIR
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "jjj_sac_mk33_76mm_AIR",
	user_name 				= _("76.2 mm AA"),
	model_name    			= "pula",
    projectile      		= "HE",
    payloadEffect   		= "Fragmentation",
    payloadMaterial 		= "RDX",
	v0						= 792, -- 1808.0,
	Dv0						= 0.0005, -- 0.0002,
	Da0						= 0.00005, -- 0.00001,
	Da1						= 0.0001, -- 0.0,
	mass      				= 13.2,
	explosive     			= 13.2,
	life_time     			= 100,
	caliber     			= 76.2,
	s         				= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime    			= 0,
	cx        				= {0.0,0.52,0.67,0.14,1.76},
	k1        				= 7.6e-10,
	tracer_off    			= 100,
	scale_tracer  			= 1,
	scale_smoke    			= 12.0,
	smoke_opacity  			= 0.5,
	cartridge 				= 1,

	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 792.0 } -- intentionally not 792 to get less accurate
	}
});