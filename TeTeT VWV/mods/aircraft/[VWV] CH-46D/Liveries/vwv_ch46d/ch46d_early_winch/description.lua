livery = {
	-- {"ch46d_BORT_single",	DIFFUSE			,	"ch46d_amarillo_bort_single", true};
	-- {"ch46d_BORT_tens",	DIFFUSE			,	"ch46d_amarillo_bort_tens", true};
};

name = "CH-46D Early [Winch]";

order = 110;

custom_args =
{
    [36] = 1.0, -- ramp closed
    [38] = 0.9, -- open door
    [1000] = 1.0, -- hide dispenser
    [1003] = 1.0, -- winch deployed
}
