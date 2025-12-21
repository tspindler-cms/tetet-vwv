-- Config modified by TeTeT for VWV
-- IX514 armed
GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.animation_arguments.radar1_rotation = 2;
GT.radar1_period = 3;
GT.animation_arguments.radar2_rotation = 3; 
GT.radar2_period = 2; 
GT.animation_arguments.luna_lights = -1;

GT.visual = {}
GT.visual.shape = "ix514_armed"
GT.visual.shape_dstr = ""
GT.visual.fire_size = 1 --relative burning size
GT.visual.fire_pos = {17,7,0};
GT.visual.fire_time = 100 --burning time (seconds)
GT.time_agony = 100;

GT.life = 400
GT.mass = 160000
GT.max_velocity = 7.20222
GT.race_velocity = 6.17333
GT.economy_velocity = 6.17333
GT.economy_distance = 1.59272e+007
GT.race_distance = 1.59272e+007
GT.shipLength = 40.0
GT.Width = 11
GT.Height = 14
GT.Length = 43.5
GT.DeckLevel = 1.68
GT.X_nose = 25.214
GT.X_tail = -12.35
GT.Tail_Width = 11
GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 0.0814062
GT.R_min = 212.4
GT.distFindObstacles = 150.6

GT.numParking = 1
GT.Plane_Num_ = 0
GT.Helicopter_Num_ = 1
GT.Landing_Point = {-2.16, 3.57, 0.0}

--GT.LSOPosition = {81.236, 24.0, 28.497, 10.0, 0.0} 

--GT.exhaust = 
--{
--	[1] = { size = 0.15 , pos = {-12 ,7.9, 4 } },
--				 }

GT.airWeaponDist = 3000
GT.airFindDist = 5000

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 5000;
GT.WS.radar_type = 102
GT.WS.fire_on_march = true;
GT.animation_arguments.alarm_state = 9;
GT.animation_arguments.luna_lights = -1;


--Turret right 25mm

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {
		{math.rad(-25), math.rad(-175), math.rad(-5), math.rad(80)},
		};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(10);
GT.WS[ws].center = 'Turret_Center_1'
GT.WS[ws].drawArgument1 = 15
GT.WS[ws].drawArgument2 = 16
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'Point_Gun_1'

__LN.fireAnimationArgument = 125;

--Turret left 25mm

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {
		{math.rad(175), math.rad(25), math.rad(-5), math.rad(80)},
		};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(10);
GT.WS[ws].center = 'Center_Gun_002'
GT.WS[ws].drawArgument1 = 20
GT.WS[ws].drawArgument2 = 21
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'Point_Gun_2'

__LN.fireAnimationArgument = 126;

--M2 right
				
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {
		{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)},
		};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'Center_Gun_1'
GT.WS[ws].drawArgument1 = 23
GT.WS[ws].drawArgument2 = 24
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.BR[1].connector_name = 'PointM2_1'
__LN.fireAnimationArgument = 140;

--M2 left
				
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {
		{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)},
		};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'Center_M2_2'
GT.WS[ws].drawArgument1 = 26
GT.WS[ws].drawArgument2 = 27
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.BR[1].connector_name = 'PointM2_2'
__LN.fireAnimationArgument = 128;

--M60 1 right

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {
		{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)},
		};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'Center_M60_1'
GT.WS[ws].drawArgument1 = 29
GT.WS[ws].drawArgument2 = 30
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_M240C);
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM60_1'
__LN.fireAnimationArgument = 129;



--M60 1 left

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].angles = {
		{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)},
		};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(20);
GT.WS[ws].center = 'Center_M60_2'
GT.WS[ws].drawArgument1 = 32
GT.WS[ws].drawArgument2 = 33
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_M240C);
__LN.type = 10;
__LN.BR[1].connector_name = 'PointM60_2'
__LN.fireAnimationArgument = 141;


--Main GUN front

--GT.WS[1].LN[1]
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].stabilizer = true;
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_MK75 )
GT.WS[ws].angles = {
			{math.rad(150), math.rad(-150), math.rad(-7), math.rad(53)},
			};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(10);
								
GT.WS[ws].drawArgument1 = 17
GT.WS[ws].drawArgument2 = 18
GT.WS[ws].center = 'Center_Frontgun'
GT.WS[ws].LN[1].BR[1].connector_name = 'Point_Frontgun'
GT.WS[ws].LN[1].BR[1].recoilArgument = 19;
GT.WS[ws].LN[1].BR[1].recoilTime = 0.7;

--Phalanx rechts
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.phalanx )
GT.WS[ws].reference_angle_Y = math.rad(-90);
--GT.WS[ws].angles[1][1] = math.rad(-20);
GT.WS[ws].angles = {
				{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)},
		};
--GT.WS[ws].angles[1][2] = math.rad(20);
GT.WS[ws].center = 'Center_Ph_1'
GT.WS[ws].drawArgument1 = 50
GT.WS[ws].drawArgument2 = 51
GT.WS[ws].LN[1].BR[1].connector_name = 'Point_Ph_1'
GT.WS[ws].LN[1].fireAnimationArgument = 132;

--Phalanx links
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.phalanx )
GT.WS[ws].reference_angle_Y = math.rad(90);
--GT.WS[ws].angles[1][1] = math.rad(-20);
--GT.WS[ws].angles[1][2] = math.rad(20);
GT.WS[ws].angles = {
				{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)},
		};
GT.WS[ws].center = 'Center_Ph_002'
GT.WS[ws].drawArgument1 = 52
GT.WS[ws].drawArgument2 = 53
GT.WS[ws].LN[1].BR[1].connector_name = 'Point_Ph_002'
GT.WS[ws].LN[1].fireAnimationArgument = 133;

GT.Name = "[VWV]IX514"
GT.DisplayName = _("[VWV] IX514")
GT.DisplayNameShort = _("IX514")
GT.Rate = 700

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
				RADAR = {
					"Patriot str",
					"ticonderoga search radar",
				}
		};
GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000065";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,TICONDEROGA,
					"Cruisers",
					"RADAR_BAND1_FOR_ARM",
					"DetectionByAWACS",
				};
GT.Categories = {
					{name = "Armed Ship"},
					{name = "HelicopterCarrier"}
};
	
GT.Countries = { "USA",};
add_surface_unit(GT)