
GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape 		= "CCB"
GT.visual.shape_dstr	= ""

GT.life 				= 7.3
GT.mass 				= 80000
GT.max_velocity 		= 4.37242
GT.race_velocity 		= 4.11556
GT.economy_velocity 	= 2.57201
GT.economy_distance 	= 1.59272e+007
GT.race_distance 		= 1.59272e+007
GT.shipLength 			= 17.5
GT.Width 				= 5.5
GT.Height 				= 4.5
GT.Length 				= 17.5
GT.DeckLevel 			= 1.26
GT.X_nose 				= 8.5
GT.X_tail 				= -8.5
GT.Tail_Width 			= 6
GT.Gamma_max 			= 0.35
GT.Om 					= 0.05
GT.speedup 				= 1.1814062
GT.R_min 				= 25.0
GT.distFindObstacles	= 40.0

----------------------------------------------------------------------------------------
GT.exhaust = {[1] = { size = 0.00 , pos = {-8.569 ,0.989, 1.126 }}}; --y,z,x}
GT.airWeaponDist = 3000;
GT.airFindDist = 5000;

GT.DM = {
	{ area_name = "damage_deck", 	area_arg = 75, area_life = 55, area_fire = { pos = {-5.5,1.0,0.7}, size = 0.3}},
	{ area_name = "turret_damage", 	area_arg = 76, area_life = 100, area_fire = { pos = {6.5,2.5,0.0}, size = 0.5}},
};

----------------------------------------------------------------------------------------
GT.WS = {};
GT.WS.maxTargetDetectionRange = 5000;
GT.WS.radar_type = 102
GT.WS.fire_on_march = true;
GT.animation_arguments.alarm_state = 9;
GT.animation_arguments.luna_lights = -1;
GT.animation_arguments.water_propeller = 70;

--Turret aft gun -----------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'Turret_aft_empty';
GT.WS[ws].angles = {{math.rad(145), math.rad(-145), math.rad(-20), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].drawArgument1 = 19;
GT.WS[ws].drawArgument2 = 20;
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 );
GT.WS[ws].LN[1].BR = {{ connector_name = 'Point_aft' }};
GT.WS[ws].LN[1].PL = {[1]={}}
set_recursive_metatable(GT.WS[ws].LN[1].PL[1], GT_t.WS_t.ship_Oerlikon_20.LN[1].PL[1])
GT.WS[ws].LN[1].PL[1].shell_name = {"vwv_20mm_HE_red"};
GT.WS[ws].LN[1].PL[1].shell_display_name = "20mm HE-T";

--Turret right light gun ----------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].angles = {{math.rad(-25), math.rad(-175), math.rad(-5), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(-174);
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].center = 'Turret_starboard_empty';
GT.WS[ws].drawArgument1 = 17;
GT.WS[ws].drawArgument2 = 18;
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 );
GT.WS[ws].LN[1].BR = {{ connector_name = 'Point_starboard' }};
GT.WS[ws].LN[1].PL = {[1]={}}
set_recursive_metatable(GT.WS[ws].LN[1].PL[1], GT_t.WS_t.ship_Oerlikon_20.LN[1].PL[1])
GT.WS[ws].LN[1].PL[1].shell_name = {"vwv_20mm_HE_red"};
GT.WS[ws].LN[1].PL[1].shell_display_name = "20mm HE-T";

--Turret left light gun ------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].angles = {{math.rad(175), math.rad(25), math.rad(-5), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(174);
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].center = 'Turret_port_empty';
GT.WS[ws].drawArgument1 = 15;
GT.WS[ws].drawArgument2 = 16;
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 );
GT.WS[ws].LN[1].BR = {{ connector_name = 'Point_port' }};
GT.WS[ws].LN[1].PL = {[1]={}}
set_recursive_metatable(GT.WS[ws].LN[1].PL[1], GT_t.WS_t.ship_Oerlikon_20.LN[1].PL[1])
GT.WS[ws].LN[1].PL[1].shell_name = {"vwv_20mm_HE_red"};
GT.WS[ws].LN[1].PL[1].shell_display_name = "20mm HE-T";


-- Bow 40 mm Bofors ---------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {};

GT.WS[ws].area = "turret_damage";
GT.WS[ws].center = "Turret_front_empty";

GT.WS[ws].angles =
{
    {
        math.rad(145),
        math.rad(-145),
        math.rad(-10),
        math.rad(80)
    },
};

GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(5);

GT.WS[ws].drawArgument1 = 33;
GT.WS[ws].drawArgument2 = 34;

GT.WS[ws].stabilizer = true;

set_recursive_metatable(
    GT.WS[ws],
    GT_t.WS_t.ship_MK75
);

local LN = GT.WS[ws].LN[1];
local PL = LN.PL[1];
local BR = LN.BR[1];

LN.major_weapon = true;
LN.connectorFire = true;

BR.connector_name = "Point_front";
BR.recoilArgument = 51;
BR.recoilTime = 0.7;

PL.shell_name = {"vwv_40mm_Bofors_HE_red"};
PL.shell_display_name = "40mm Bofors HE-T";

-- Edit these as using the WS_t.ship_MK75 overides the vwv 40mm weapon lua, 
-- some work some dont but whats it doing now is okay...
PL.shot_delay = 0.75;
PL.ammo_capacity = 500;
PL.portionAmmoCapacity = 4;
PL.reload_time = 4.0;

PL.automaticLoader = false;

----------------------------------------------------------------------------------------
GT.Name = "CCB";
GT.DisplayName = _("[VWV] CCB Charlie");
GT.DisplayNameShort = _("CCB");
GT.Rate = 700;

GT.Sensors = {OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
				        RADAR = {"Patriot str","ticonderoga search radar",}};

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.riverCraft = true;

GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
				"low_reflection_vessel","Light armed ships",};
GT.Categories = {{name = "Armed Ship"},};
GT.Countries = { "USA",};

-- add_surface_unit(GT);
