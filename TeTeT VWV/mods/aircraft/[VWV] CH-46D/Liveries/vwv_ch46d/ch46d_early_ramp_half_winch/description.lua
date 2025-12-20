livery = {
	-- {"ch46d_BORT_single",	DIFFUSE			,	"ch46d_amarillo_bort_single", true};
	-- {"ch46d_BORT_tens",	DIFFUSE			,	"ch46d_amarillo_bort_tens", true};
};

name = "CH-46D Early [Winch, Ramp aligned]";

order = 140;

custom_args =
{
    [36] = 0.2, -- ramp open, horizontal aligned with fuselage
    [38] = 0.9, -- open door
    [1000] = 1.0, -- hide dispenser
    [1003] = 1.0, -- winch deployed
}
