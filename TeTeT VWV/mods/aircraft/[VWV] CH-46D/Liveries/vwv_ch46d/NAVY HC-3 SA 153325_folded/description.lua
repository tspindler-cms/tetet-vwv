livery = {
	{"ch46_outside",	DIFFUSE			  ,	"../NAVY HC-3 SA 153325/CH46_OUTSIDE", false};
	{"ch46_outside",	ROUGHNESS_METALLIC,	"../NAVY HC-3 SA 153325/CH46_OUTSIDE_roughmet", false};	
	{"ch46d_BORT_single",	DIFFUSE			,	"empty", true};
	{"ch46d_BORT_tens",	DIFFUSE			,	"empty", true};	
};

custom_args =
{
    [8] = 1.0, -- rotors folded
    [36] = 1.0, -- ramp closed
    [38] = 1.0, -- door closed
    [1000] = 1.0, -- hide dispenser
    [1003] = 0.0, -- winch stowed
}
order = 196
