livery = {


{"ch46_outside",	DIFFUSE			,	"CH46_OUTSIDE", false};
{"ch46_outside",	NORMAL_MAP		,	"CH46_OUTSIDE_Normal", false};
{"ch46_outside",        ROUGHNESS_METALLIC      ,       "CH46_OUTSIDE_RoughMet", false};

{"ch46d_BORT_single",	DIFFUSE			,	"ch46d_amarillo_bort", false};
{"ch46d_BORT_tens",	DIFFUSE			,	"ch46d_amarillo_bort", false};

{"Pilot1_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USN", false};


};

name = "USN Blue";

order = 180;

custom_args =
{

    [8] = 0.0, -- rotors unfolded
    [36] = 1.0, -- ramp closed --  0.2 = ramp horizontal
    [38] = 0.0, -- door closed --  0.9 = open
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
