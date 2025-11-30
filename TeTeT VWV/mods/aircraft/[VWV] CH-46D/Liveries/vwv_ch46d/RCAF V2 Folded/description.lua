livery = {


{"ch46_outside",	DIFFUSE			,	"CH46_OUTSIDE", false};
{"ch46_outside",	NORMAL_MAP		,	"CH46_OUTSIDE_Normal", true};
{"ch46_outside",        ROUGHNESS_METALLIC      ,       "CH46_OUTSIDE_RoughMet", true};

{"ch46d_BORT_single",	DIFFUSE			,	"empty", true};
{"ch46d_BORT_tens",	DIFFUSE			,	"empty", true};

{"Pilot1_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", false};
{"Pilot2_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", false};




};

name = "RCAF V2 Folded";

order = 270;

custom_args =
{
    [8] = 1.0, -- rotors folded
    [36] = 0.0, -- ramp open
    [38] = 0.9, -- door open
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
 
}
