-- [VWV] ATC-CCB custom ammunition --
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

-- [VWV] CCB custom 40 mm Bofors ammunition
-- Note because i wanted to have the smoke effect im using the 75mm gun shooting a vwv 40mm shell, the gun adjustments 
-- are in the CCB.lua yet some are over ridden due to the main gun call.
-- =============================================================================
-- 40 mm Bofors L/60 (Historical Data)
--
-- Calibre:               40×311R mm
-- Operation:             Automatic, long-recoil
--
-- Cyclic Rate of Fire:   120 rounds per minute (2 rounds/second)
-- Practical Rate:        80–100 rounds per minute
--
-- Feed System:           Manual loading using 4-round clips
-- Ready Feed Capacity:   8 rounds (two 4-round clips in the feed)
-- Clip Size:             4 rounds
-- Reload Time:           Approximately 1–2 seconds per 4-round clip
--
-- Total Ammunition:      Varies by vessel (typically several hundred rounds)
--
-- Historical Note:
-- The Bofors L/60 does not use a detachable magazine. Instead, the loader
-- continuously feeds 4-round clips into the top of the gun, allowing nearly
-- continuous fire as long as ammunition is supplied.
-- "This is good to know as i dont think i can make a 4 shot mag using the 75mm"
-- if you read this thanks for careing.
-- =============================================================================

declare_weapon({
    category        = CAT_SHELLS,
    name            = "vwv_40mm_Bofors_HE_red",
    user_name       = _("40mm Bofors HE-T"),

    model_name      = "tracer_bullet_red",

    v0              = 880.0,
    Dv0             = 0.0040,
    Da0             = 0.00070,
    Da1             = 0.0,

    mass            = 0.900,
    round_mass      = 2.150,
    cartridge_mass  = 1.100,
    explosive       = 0.090,

    life_time       = 15.0,
    caliber         = 40.0,

    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0.0,

    cx              = {0.4, 0.95, 0.65, 0.18, 1.85},
    k1              = 4.0e-09,

    tracer_on       = 0.05,
    tracer_off      = 4.0,
    scale_tracer    = 1,

    smoke_tail_life_time = 2.5,
    scale_smoke          = 1.0,
    smoke_opacity        = 0.15,

    cartridge       = 0,

    aiming_table = {
        precalculateAirDefenceAimingTable = true,
        precalculateAimingTable = true,
        [1] = {
            init_vel = 880.0
        }
    }
})