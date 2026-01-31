-- VAP Bunker single, from Barracks armed --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 35

GT.visual.shape = "vap_vc_bunker_single"
GT.visual.shape_dstr = "vap_vc_bunker_dest"

-----------------------------------------------------------------------------------------------------
GT.CustomAimPoint = {-3,1.5,0}

--Burning after hit
GT.visual.fire_size = 0.6 --relative burning size
GT.visual.fire_pos = {-2,0,0};
GT.visual.fire_time = 10 --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.max_range_finding_target = 1500;
GT.sensor.max_alt_finding_target = 2000;
GT.sensor.height = 1.5;

-----------------------------------------------------------------------------------------------------
-- Weapon systems
GT.WS = {};

-- GT.WS[1] Center
local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos =  {2.65, 1.3 ,0.30}; -- 'CENTER_TOWER_01'
GT.WS[ws].angles = {{math.rad(65), math.rad(-65), math.rad(-5), math.rad(30)},};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
--GT.WS[ws].pointer = 'POINT_SIGHT';
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t3);
__LN.distanceMax = 550;
__LN.customViewPoint = { "IronSight/IronSight", {-0.5, 0.0 , 0.0} };
for i=2,30 do -- 30x30 clips, 900 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1] = { {pos = {0.0, 0.0 ,0.0} } }; -- -- 'POINT_GUN_01'


-- GT.WS[2] Left
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos =  {-0.22, 1.3 ,-2.65}; -- 'CENTER_TOWER_02'
GT.WS[ws].angles = {{math.rad(155), math.rad(25), math.rad(-5), math.rad(30)},};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
--GT.WS[ws].pointer = 'POINT_SIGHT';
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t3);
__LN.distanceMax = 550;
__LN.customViewPoint = { "IronSight/IronSight", {-0.5, 0.0 , 0.0} };
for i=2,30 do -- 30x30 clips, 900 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1] = { {pos = {0.0, 0.0 ,0.0} } }; -- 'POINT_GUN_02'


-- GT.WS[3] Right
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos =  {-0.82, 1.3 ,2.65}; -- 'CENTER_TOWER_03'
GT.WS[ws].angles = {{math.rad(-25), math.rad(-155), math.rad(-5), math.rad(30)},};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
--GT.WS[ws].pointer = 'POINT_SIGHT';
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t3);
__LN.distanceMax = 550;
__LN.customViewPoint = { "IronSight/IronSight", {-0.5, 0.0 , 0.0} };
for i=2,30 do -- 30x30 clips, 900 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1] = { {pos = {0.0, 0.0 ,0.0} } }; -- 'POINT_GUN_03'

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_bunker_single"
GT.DisplayName = _("VAP VC Bunker")
GT.DisplayNameShort = _("VC Bunker")
GT.Rate = 20

GT.DetectionRange  	= GT.sensor.max_range_finding_target;
GT.ThreatRange 		= GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000076";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_GenericFort,
                "Fortifications",
				"IFV",
                "CustomAimPoint",
                };
GT.category = "Fortification";
GT.Countries = {"Vietnam"}