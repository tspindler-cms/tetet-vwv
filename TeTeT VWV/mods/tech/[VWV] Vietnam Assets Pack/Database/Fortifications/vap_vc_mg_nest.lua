-- VAP MG nest, from Barracks armed --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 20

GT.visual.shape = "vap_vc_mg_nest"
GT.visual.shape_dstr = "vap_vc_mg_nest_dest"

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
GT.sensor.max_range_finding_target = 1000;
GT.sensor.height = 1.5;

-----------------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {};

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].angles = {{math.rad(100), math.rad(-100), math.rad(-10), math.rad(60)},};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
GT.WS[ws].pointer = 'POINT_SIGHT';

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t2);
__LN.maxShootingSpeed = 0;
__LN.distanceMax = 550;
for i=2,20 do -- 20x30 clips, 600 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1].connector_name = 'POINT_GUN'
__LN.customViewPoint = { "IronSight/IronSight", {0.0, 3.0, 0.0} };

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_mg_nest"
GT.DisplayName = _("VAP VC MG Nest")
GT.DisplayNameShort = _("VC MG Nest")
GT.Rate = 10

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