livery = {
	{"ch46_outside",	DIFFUSE			  ,	"CH46_OUTSIDE", false};
	{"ch46_outside",  ROUGHNESS_METALLIC  ,	"../textures/CH46_OUTSIDE_YT_roughmet", false};
	{"ch46d_BORT_single",	DIFFUSE			,	"empty", true};
	{"ch46d_BORT_tens",	DIFFUSE			,	"empty", true};
	{"Pilot1_Flightsuit",	DIFFUSE			,	"T_Pilot_Flightsuit1_color_USMC_green", true};
	{"Pilot2_Flightsuit",	DIFFUSE			,	"T_Pilot_Flightsuit1_color_USMC_green", true};
    {"Pilot1_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", true};
    {"Pilot2_Helmet",	DIFFUSE			,	"T_Pilot_Helmet1_color_USMC_GREEN", true};
};

custom_args =
{
    [36] = 1.0, -- ramp closed
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
order = 168
