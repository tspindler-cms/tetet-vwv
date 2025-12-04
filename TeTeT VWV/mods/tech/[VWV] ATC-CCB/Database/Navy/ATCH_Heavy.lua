-- ATC(H) "Tango Haevy" --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "ATC-H_Heavy"
GT.visual.shape_dstr = ""

GT.life = 100
GT.mass = 66500
GT.max_velocity = 4.37242
GT.race_velocity = 4.11556
GT.economy_velocity = 2.57201
GT.economy_distance = 1.59272e+007
GT.race_distance = 1.59272e+007
GT.shipLength = 17.2
GT.Width = 5.3
GT.Height = 4.5
GT.Length = 17.5
GT.DeckLevel = 1.26
GT.X_nose = 8.5
GT.X_tail = -8.5
GT.Tail_Width = 6
GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 1.1814062
GT.R_min = 35.0
GT.distFindObstacles = 45.0

GT.numParking = 1
GT.Plane_Num_ = 0
GT.Helicopter_Num_ = 1
GT.Landing_Point = {6.55, 3.13, 0.0} 

----------------------------------------------------------------------------------------

GT.exhaust = {[1] = { size = 0.00 , pos = {-8.569 ,0.989, 1.126 }}}; --y,z,x
GT.airWeaponDist = 3000
GT.airFindDist = 5000

--GT.sensor = {};
--GT.sensor.height = 2.723;
--GT.sensor.max_range_finding_target = 3000;
--GT.LSOPosition = {81.236, 24.0, 28.497, 10.0, 0.0}
--GT.animation_arguments.radar1_rotation = 2;
--GT.radar1_period = 3;
--GT.animation_arguments.radar2_rotation = -1; 
--GT.animation_arguments.radar3_rotation = -1; 
--GT.animation_arguments.luna_lights = -1;

----------------------------------------------------------------------------------------

-- weapon systems

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
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.major_weapon = false;
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM2_mid'
__LN.fireAnimationArgument = 135;

--GT.WS[1].LN[2]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.major_weapon = true;
__LN.BR[1].connector_name = 'Point1'
__LN.fireAnimationArgument = 125;

--Turret right light gun
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(-25), math.rad(-175), math.rad(-5), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(10);
GT.WS[ws].center = 'Turret2'
GT.WS[ws].drawArgument1 = 17
GT.WS[ws].drawArgument2 = 18
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'POINT2'
__LN.fireAnimationArgument = 126;

--Turret left light gun
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(175), math.rad(25), math.rad(-5), math.rad(80)},};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(10);
GT.WS[ws].center = 'Turret3'
GT.WS[ws].drawArgument1 = 15
GT.WS[ws].drawArgument2 = 16
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'POINT3'
__LN.fireAnimationArgument = 127;

--M2 right
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)},};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'M2_1'
GT.WS[ws].drawArgument1 = 21
GT.WS[ws].drawArgument2 = 22
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.BR[1].connector_name = 'PointM2_right'
__LN.fireAnimationArgument = 128;

--M2 left
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)},};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'M2_2'
GT.WS[ws].drawArgument1 = 27
GT.WS[ws].drawArgument2 = 28
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.BR[1].connector_name = 'PointM2_left'
__LN.fireAnimationArgument = 131;

--M60 1 right
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)},};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'M60_1'
GT.WS[ws].drawArgument1 = 23
GT.WS[ws].drawArgument2 = 24
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_M240C);
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM60_1_right'
__LN.fireAnimationArgument = 129;

--M60 2 right
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)},};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'M60_2'
GT.WS[ws].drawArgument1 = 25
GT.WS[ws].drawArgument2 = 26
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_M240C);
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM60_2_right'
__LN.fireAnimationArgument = 130;

--M60 1 left
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)},};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'M60_3'
GT.WS[ws].drawArgument1 = 29
GT.WS[ws].drawArgument2 = 30
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_M240C);
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM60_1_left'
__LN.fireAnimationArgument = 132;

--M60 2 left
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {{math.rad(145), math.rad(35), math.rad(-5), math.rad(45)},};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'M60_4'
GT.WS[ws].drawArgument1 = 31
GT.WS[ws].drawArgument2 = 32
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_M240C);
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM60_2_left'
__LN.fireAnimationArgument = 133;

----------------------------------------------------------------------------------------
GT.Name = "ATCH_Heavy"
GT.DisplayName = _("[VWV] ATC(H) Tango Heavy")
GT.DisplayNameShort = _("ATC(H) Tango Heavy")
GT.Rate = 700
GT.Sensors = {OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
						RADAR = {"Patriot str","ticonderoga search radar",}};
					
GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,TICONDEROGA,
				"Cruisers","RADAR_BAND1_FOR_ARM","DetectionByAWACS",};

GT.Categories = {{name = "Armed Ship"},{name = "HelicopterCarrier"}};
GT.Countries = { "USA",};
GT.riverCraft = true


add_surface_unit(GT)