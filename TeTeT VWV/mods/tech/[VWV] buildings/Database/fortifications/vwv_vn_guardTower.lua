GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 50

GT.visual.shape = "guardTower_armed"
GT.visual.shape_dstr = "guardTower_destroyed"
GT.CustomAimPoint = {-3,1.5,0}
--Burning after hit
GT.visual.fire_size = 0.6 --relative burning size
GT.visual.fire_pos = {-2,0,0};
GT.visual.fire_time = 10 --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 1.5;
GT.sensor.max_range_finding_target = 1000;

-- weapon systems
GT.WS = {};
GT.WS.maxTargetDetectionRange = 2500;

GT.WS.fire_on_march = false;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER_01';
GT.WS[ws].angles = {
	{math.rad(60), math.rad(-60), math.rad(-60), math.rad(80)},
};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].reloadAngleY = math.rad(30);
GT.WS[ws].reloadAngleZ = math.rad(30);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
-- GT.WS[ws].pointer = 'POINT_SIGHT_1';

local ln = add_launcher(GT.WS[ws], GT_t.LN_t.vwv_ak47t3)
ln.maxShootingSpeed = 0
for i=2,8 do
    ln.PL[i] = {}
    set_recursive_metatable(ln.PL[i], ln.PL[1])
end
ln.fireAnimationArgument = 23
ln.BR = { { connector_name = 'POINT_762mm_1' } }
-- ln.BR[1].connector_name = 'POINT_762mm_1'
ln.customViewPoint = { "IronSight/IronSight", {0.0, 0.0, 0.0} }

ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER_02';
GT.WS[ws].angles = {
	{math.rad(-60), math.rad(60), math.rad(-60), math.rad(80)},
};
GT.WS[ws].reference_angle_Y = math.rad(90)
GT.WS[ws].drawArgument1 = 2;
GT.WS[ws].drawArgument2 = 3;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].reloadAngleY = math.rad(30);
GT.WS[ws].reloadAngleZ = math.rad(30);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
-- GT.WS[ws].pointer = 'POINT_SIGHT_2';

local ln = add_launcher(GT.WS[ws], GT_t.LN_t.vwv_ak47t3)
ln.maxShootingSpeed = 0
for i=2,8 do
    ln.PL[i] = {}
    set_recursive_metatable(ln.PL[i], ln.PL[1])
end
ln.fireAnimationArgument = 24
ln.BR = { { connector_name = 'POINT_762mm_2' } }
-- ln.BR[1].connector_name = 'POINT_762mm_2'
ln.customViewPoint = { "IronSight/IronSight", {0.0, 0.0, 0.0} }

ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER_03';
GT.WS[ws].angles = {
	{math.rad(-60), math.rad(60), math.rad(-60), math.rad(80)},
};
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].drawArgument1 = 4;
GT.WS[ws].drawArgument2 = 5;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].reloadAngleY = math.rad(30);
GT.WS[ws].reloadAngleZ = math.rad(30);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
-- GT.WS[ws].pointer = 'POINT_SIGHT_3';

local ln = add_launcher(GT.WS[ws], GT_t.LN_t.vwv_ak47t3)
ln.maxShootingSpeed = 0
for i=2,8 do
    ln.PL[i] = {}
    set_recursive_metatable(ln.PL[i], ln.PL[1])
end
ln.fireAnimationArgument = 25
-- ln.BR[1].connector_name = 'POINT_762mm_3'
ln.BR = { { connector_name = 'POINT_762mm_3' } }
ln.customViewPoint = { "IronSight/IronSight", {0.0, 0.0, 0.0} }

ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER_04';
GT.WS[ws].angles = {
	{math.rad(-60), math.rad(60), math.rad(-60), math.rad(80)},
};
GT.WS[ws].reference_angle_Y = math.rad(270)
GT.WS[ws].drawArgument1 = 6;
GT.WS[ws].drawArgument2 = 7;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].reloadAngleY = math.rad(30);
GT.WS[ws].reloadAngleZ = math.rad(30);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
-- GT.WS[ws].pointer = 'POINT_SIGHT_4';

local ln = add_launcher(GT.WS[ws], GT_t.LN_t.vwv_ak47t3)
ln.maxShootingSpeed = 0
for i=2,8 do
    ln.PL[i] = {}
    set_recursive_metatable(ln.PL[i], ln.PL[1])
end
ln.fireAnimationArgument = 26
ln.BR = { { connector_name = 'POINT_762mm_4' } }
-- ln.BR[1].connector_name = 'POINT_762mm_4'
ln.customViewPoint = { "IronSight/IronSight", {0.0, 0.0, 0.0} }

GT.Name = "vwv_vn_guardTower"
GT.DisplayName = _("[VWV] VC Guard Tower (armed)")
GT.Rate = 5

GT.DetectionRange  = GT.sensor.max_range_finding_target;
--GT.airWeaponDist = 0
GT.ThreatRange = 500;
GT.mapclasskey = "P0091000076";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_GenericFort,
                "Fortifications",
                "CustomAimPoint",
                };
GT.category = "Fortification";
-- GT.Countries = {"Vietnam"}
