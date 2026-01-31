-- VAP US Hooch Closed --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 5

GT.visual.shape = "vap_us_hooch_closed";
GT.visual.shape_dstr = "vap_us_hooch_closed";

-----------------------------------------------------------------------------------------------------
GT.radar_rotation_period = 1.0;
--GT.snd.radarRotation = "";
--GT.toggle_alarm_state_interval = 60.0;

GT.animation_arguments.locator_rotation = 11;
GT.animation_arguments.stoplights = 30;
GT.animation_arguments.headlights = 31;
GT.animation_arguments.markerlights = 32;
--GT.animation_arguments.luna_lights = -1;
GT.animation_arguments.alarm_state = 3;

--Burning after hit
GT.visual.fire_size = 0.9; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1000; --burning time (seconds)

GT.sensor = {};
GT.sensor.max_range_finding_target = 0;
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_alt_finding_target = 0;
GT.sensor.height = 3.8;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpitWithLLTV";

-----------------------------------------------------------------------------------------------------
GT.WS = {};
GT.WS.maxTargetDetectionRange = 0;
GT.WS.radar_type = 0;
GT.WS.radar_rotation_type = 0;

local ws  = 0;
for i = 1,10 do
    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].pos = {0,3,0}
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), 0, math.rad(0)},
					};
    GT.WS[ws].omegaY = 1
    GT.WS[ws].omegaZ = 1

    GT.WS[ws].LN = {}
    GT.WS[ws].LN[1] = {}
    GT.WS[ws].LN[1].type = 100
    GT.WS[ws].LN[1].reactionTime = 12;
    GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
    GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
	GT.WS[ws].LN[1].ECM_K = 0.65;
	GT.WS[ws].LN[1].reflection_limit = 0.18;
    GT.WS[ws].LN[1].min_trg_alt = 15
    GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;

end --for

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_us_hooch_closed";
GT.DisplayName = _("VAP US Hooch");
GT.DisplayNameShort = _("Hooch")
GT.Rate = 5;

--GT.Sensors = { OPTIC = {"generic tank daysight", "human nightsight", "human daysight",}, RADAR = GT.Name, };
GT.Sensors = { RADAR = {"SA-11 Buk SR 9S18M1"} };

GT.DetectionRange  = 0;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000076";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_GenericFort,
                "Fortifications",
                "CustomAimPoint",
                };
GT.category = "Fortification";
GT.Countries = {"USA"}