livery = {


{"ch46_outside",	DIFFUSE			,	"CH46_OUTSIDE", false};
{"ch46_outside",	NORMAL_MAP		,	"CH46_OUTSIDE_Normal", true};
{"ch46_outside",        ROUGHNESS_METALLIC      ,       "CH46_OUTSIDE_RoughMet", true};

{"ch46d_BORT_single",	DIFFUSE			,	"empty", true};
{"ch46d_BORT_tens",	DIFFUSE			,	"empty", true};

{"Pilot1_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", true};
{"Pilot2_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", true};




};

name = "Sweden V2";

order = 300;

custom_args =
{

    [8] = 0.0, -- rotors folded
    [36] = 1.0, -- ramp closed --  0.2 = ramp horizontal
    [38] = 0.0, -- door closed --  0.9 = open
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
