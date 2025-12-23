-- ATC(H) "Tango" --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape 		= "ATC-H"
GT.visual.shape_dstr 	= ""

GT.life 				= 100
GT.mass 				= 66500
GT.max_velocity 		= 4.37242
GT.race_velocity 		= 4.11556
GT.economy_velocity 	= 2.57201
GT.economy_distance 	= 1.59272e+007
GT.race_distance	 	= 1.59272e+007
GT.shipLength 			= 17.2
GT.Width 				= 5.3
GT.Height 				= 4.5
GT.Length 				= 17.5
GT.DeckLevel 			= 1.26
GT.X_nose 				= 8.5
GT.X_tail 				= -8.5
GT.Tail_Width 			= 6
GT.Gamma_max 			= 0.35
GT.Om 					= 0.05
GT.speedup 				= 1.1814062
GT.R_min 				= 35.0
GT.distFindObstacles 	= 45.0

----------------------------------------------------------------------------------------
GT.numParking 		= 1
GT.Helicopter_Num_ 	= 1
GT.Plane_Num_ 		= 0
GT.Landing_Point 	= {5.25, 3.08, -0.40}

GT.exhaust = {[1] = { size = 0.00 , pos = {-8.569 ,0.989, 1.126 }}}; --y,z,x}
GT.airWeaponDist = 3000
GT.airFindDist = 5000

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

----------------------------------------------------------------------------------------
GT.Name = "ATCH"
GT.DisplayName = _("[VWV] ATC(H) Tango")
GT.DisplayNameShort = _("ATC(H) Tango")
GT.Rate = 100

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
				RADAR = {"Patriot str","ticonderoga search radar",}}
				
GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.riverCraft = true

GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,TICONDEROGA,
				"Cruisers","RADAR_BAND1_FOR_ARM","DetectionByAWACS",};
				
GT.Categories = {{name = "Armed Ship"},{name = "HelicopterCarrier"}};
GT.Countries = { "USA",};


add_surface_unit(GT)