-- [VWV] PBR custom ammunition --
-- 20 mm HE round with a RED tracer, used by the CCB aft Oerlikon-based mount.
-- Ballistics are based on the stock DCS 20 mm round; "tracer_bullet_red" is the
-- stock red tracer visual, so rounds leave a red trail in flight.

declare_weapon({
	category		= CAT_SHELLS,
	name			= "vwv_20mm_HE_red",
	user_name		= _("20mm HE-T (red)"),
	model_name		= "tracer_bullet_red",
	v0				= 1050.0,
	Dv0				= 0.0060,
	Da0				= 0.00094,
	Da1				= 0.0,
	mass			= 0.100,
	round_mass		= 0.260,
	cartridge_mass	= 0.120,
	explosive		= 0.012,
	life_time		= 5,
	caliber			= 20.0,
	s				= 0.0,
	j				= 0.0,
	l				= 0.0,
	charTime		= 0,
	cx				= {0.2, 1.27, 0.65, 0.26, 2.35},
	k1				= 2.3e-08,
	tracer_off		= 3,
	scale_tracer	= true,
	cartridge		= 0,
});
