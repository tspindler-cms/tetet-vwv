livery = {

{"ch46_outside",	DIFFUSE			,	"CH46_OUTSIDE", false};
{"ch46_outside",	ROUGHNESS_METALLIC,	"CH46_OUTSIDE_roughmet", false};



	{"ch46d_BORT_single",	DIFFUSE			,	"ch46d_amarillo_bort_single", false};
	{"ch46d_BORT_tens",	DIFFUSE			,	"ch46d_amarillo_bort_tens", false};

{"Pilot1_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", false};
{"Pilot2_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", false};




};

name = "CH-46D Green";

order = 174;

custom_args =
{
    [36] = 1.0, -- ramp closed
    [38] = 0.0, -- door closed
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
