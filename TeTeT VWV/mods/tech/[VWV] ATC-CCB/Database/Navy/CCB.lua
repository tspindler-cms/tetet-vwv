-- CCB "COMMAND AND CONTROL BOAT" --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape 		= "CCB"
GT.visual.shape_dstr	= ""

GT.life 				= 120
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
GT.airWeaponDist = 3000
GT.airFindDist = 5000

GT.DM = {
			{ area_name = "damage_deck", 	area_arg = 75, area_life = 55, area_fire = { pos = {-5.5,1.0,0.7}, size = 0.3}},
			{ area_name = "turret_damage", 	area_arg = 76, area_life = 100, area_fire = { pos = {6.5,2.5,0.0}, size = 0.5}},
		}

----------------------------------------------------------------------------------------
GT.WS = {};
GT.WS.maxTargetDetectionRange = 5000;
GT.WS.radar_type = 102
GT.WS.fire_on_march = true;
GT.animation_arguments.alarm_state = 9;
GT.animation_arguments.luna_lights = -1;

--Turret mid heavy gun
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'Turret1'
GT.WS[ws].angles = {{math.rad(180), math.rad(-180), math.rad(-1), math.rad(51)},};
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].reference_angle_Z = math.rad(10);
GT.WS[ws].drawArgument1 = 19
GT.WS[ws].drawArgument2 = 20

--GT.WS[1].LN[1]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.major_weapon = true;
__LN.BR[1].connector_name = 'Point1'
__LN.fireAnimationArgument = -1;
	
--Turret right light gun
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(-25), math.rad(-175), math.rad(-5), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(-174);
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].center = 'Turret2'
GT.WS[ws].drawArgument1 = 17
GT.WS[ws].drawArgument2 = 18
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'Point2'
__LN.fireAnimationArgument = -1;

--Turret left light gun
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(175), math.rad(25), math.rad(-5), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(174);
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].center = 'Turret3'
GT.WS[ws].drawArgument1 = 15
GT.WS[ws].drawArgument2 = 16
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'Point3'
__LN.fireAnimationArgument = -1;

--Main GUN front

--GT.WS[1].LN[1]
GT.WS[ws].area = "turret_damage";
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].stabilizer = true;
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_MK75 )
GT.WS[ws].angles = {{math.rad(150), math.rad(-150), math.rad(-7), math.rad(53)},};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(10);
GT.WS[ws].drawArgument1 = 33
GT.WS[ws].drawArgument2 = 34
GT.WS[ws].center = 'TurretGUNfront'
__LN.major_weapon = true;
GT.WS[ws].LN[1].BR[1].connector_name = 'PointGUNfront'
GT.WS[ws].LN[1].BR[1].recoilArgument = 51;
GT.WS[ws].LN[1].BR[1].recoilTime = 0.7;

----------------------------------------------------------------------------------------
GT.Name = "CCB"
GT.DisplayName = _("[VWV] CCB Charlie")
GT.DisplayNameShort = _("CCB")
GT.Rate = 700

GT.Sensors = {OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
				        RADAR = {"Patriot str","ticonderoga search radar",}};

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.riverCraft = true

GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
				"low_reflection_vessel","Light armed ships",};
GT.Categories = {{name = "Armed Ship"},};
GT.Countries = { "USA",};


add_surface_unit(GT)