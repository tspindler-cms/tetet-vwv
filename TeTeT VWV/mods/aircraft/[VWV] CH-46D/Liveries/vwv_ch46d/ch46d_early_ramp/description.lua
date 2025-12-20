livery = {
	-- {"ch46d_BORT_single",	DIFFUSE			,	"ch46d_amarillo_bort_single", true};
	-- {"ch46d_BORT_tens",	DIFFUSE			,	"ch46d_amarillo_bort_tens", true};
};

name = "CH-46D Early [Ramp]";

order = 120;

custom_args =
{
    [36] = 0.0, -- ramp open
    [38] = 0.0, -- door closed
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
