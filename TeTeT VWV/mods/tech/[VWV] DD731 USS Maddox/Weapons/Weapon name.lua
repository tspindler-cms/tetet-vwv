local SEACAT = { 

	category		= CAT_MISSILES,
	name			= "name",
	user_name		= _("name"),
	wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AS_Missile, WSTYPE_PLACEHOLDER},--{4, 4, 8, WSTYPE_PLACEHOLDER},
	NatoName		=	"(name)",
	
	shape_table_data =
	{
		{
			name	 = "name";
			file  = "name";
			life  = 1;
			fire  = { 0, 1};
			username = "name";
			index = WSTYPE_PLACEHOLDER,
		},
	},
	
Seacat_Missile =
		{
		category	= CAT_MISSILES,
	    name			= weap_name,
	    display_name	= weap_disp_name,
	    user_name		= weap_disp_name,
	    scheme			= "command_guided_missile_sfe",
	    class_name		= "wAmmunitionVikhr",
	    model			= "rapier_fsa_missile",
	    wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};

        Escort 				= 3, --escort: 0 - no, 1 - LA launch, 2 - another LA, 3 - from the ground
        Head_Type 			= 5, --/N/ 6 semi active radar, 4 laser /OR/ 7 semi auto, 5 Autonmous (INS+ Card, GPS,TV,IIR 8-SACLOS
		warhead 			= predefined_warhead("AGM_65E"),
		sigma 				= {5, 5, 5}, --maximum aiming error in meters, in coordinates of the target. x is the longitudinal axis of the target, y is the vertical axis of the target, z is the transverse axis of the target
        M 					= 68.0, --gross weight in kg
        H_max 				= 2000.0, --maximum flight altitude.
        H_min				= -1, --minimum flight altitude.  
        Diam 				= 220, --Case diameter in mm
        Cx_pil 				= 4, --Cx as suspension
        D_max 				= 5000.0, --low launch maximum range
        D_min 				= 1000.0, --minimum launch range
        Head_Form 			= 0, --false - hemispherical head shape, true - lively (~ conical)
        Life_Time 			= 110, --lifetime (self-destruct timer), seconds??
        Nr_max 				= 10, --Maximum overload when turning
        v_min 				= 20.0, --Minimum speed
        v_mid 				= 900.0, --average speed
        Mach_max 			= 0.8,  --The maximum mach number.
        t_b 				= 0.0, --engine start time
        t_acc 				= 4.0, --accelerator operation time
        t_marsh 			= 30.0, --running time
        Range_max 			= 5000.0, --maximum launch range at maximum height
        H_min_t 			= 0.0, --minimum target height above the relief, m
        Fi_start 			= 30.0, --tracking and sighting angle at launch
        Fi_rak 				= 5.5, --allowable angle of view (rad)
        Fi_excort 			= 1.05, --tracking angle (target) by a rocket.
        Fi_search 			= 99.9, --marginal free search angle
        OmViz_max 			= 99.9, --line of sight speed
        exhaust 			= {0.75, 0.75, 0.75, 0.1}, --
		Damage              = 20.0 --direct hit damage
        X_back 				= -0.879, --coordinates of the center of the nozzle in the rocket axes
        Y_back 				= -0.155, --coordinates of the center of the nozzle in the rocket axes
        Z_back 				= 0.0, --coordinates of the center of the nozzle in the rocket axes
        Reflection 			= 0.063, --effective radio reflection surface, square meters
        KillDistance 		= 0.0,
		shape_table_data 	=
			{
				{
				name	 = "name",
				file	 = "name",
				life	 = 1,
				fire	 = { 0, 1},
				username = "name",
				index = WSTYPE_PLACEHOLDER,
				},
			},
		}
declare_weapon(name)

--[[
- // type of seeker homing:
- const int InfraredSeeker = 1; // thermal IR (infrared seeker)
- const int ActiveRadar = 2; // active radar (active radar (AR) (+ INS))
- const int AntiRadar = 3; // antiradar (passive radar + INS)
- const int LaserHoming = 4; // laser illumination (+ ins)
- const int Autopilot = 5; // autonomous (INS + map, GPS, TV, IIR ...)
- const int SemiActiveRadar = 6; // semi-radar semi-active radar (SAR) radiosodus
- const int SemiAutoAT = 7; // semiautomatic control from the ATGM platform, fly to woPoint, the woPoint coordinates are changed by the platform.
--]]