livery = {
    {"Mig21_Hull",	DIFFUSE			        ,	"Mig21_Hull_nobort", true};
	{"Mig21_Hull",	NORMAL_MAP		        ,	"Mig21_Hull_nobort_Normal", true};
    {"Mig21_Hull",	ROUGHNESS_METALLIC		,	"Mig21_Hull_nobort_RoughMet", true};
};

name = "default livery with editor BORT";

order = 998;

custom_args =
{
    [450] = 0.0, -- Show BORT number from Editor
}
