livery = {


{"ch46_outside",	DIFFUSE			,	"CH46_OUTSIDE", false};

	{"ch46d_BORT_single",	DIFFUSE			,	"ch46d_amarillo_bort_single", false};
	{"ch46d_BORT_tens",	DIFFUSE			,	"ch46d_amarillo_bort_tens", false};

{"Pilot1_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", false};
{"Pilot2_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", false};




};

name = "USMC Grey";

order = 176;

custom_args =
{

    --[8] = 1.0, -- rotors folded
    [36] = 1.0, -- ramp closed --  0.2 = ramp horizontal
    [38] = 0.0, -- door closed --  0.9 = open
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
