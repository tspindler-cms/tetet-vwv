-- VAP Loudspeakers Vietnam --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 4

GT.visual.shape			= "vap_loudspeakers2Vietnam";
GT.visual.shape_dstr	= "vap_loudspeakers2Vietnam_dest";

-----------------------------------------------------------------------------------------------------
GT.visual.fire_size = 0.000;

GT.radar_rotation_period = 1.0;
GT.snd.radarRotation = "AFVN_LS";
--GT.toggle_alarm_state_interval = 60.0;

GT.sensor = {};
GT.sensor.max_range_finding_target = 0;
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_alt_finding_target = 0;
GT.sensor.height = 0;

--------------------------------------------------------------------------
GT.WS = {};
GT.WS.maxTargetDetectionRange = 20000;
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
    GT.WS[ws].LN[1].min_trg_alt = 400
    GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;

end --for

--------------------------------------------------------------------------
GT.Name = "_vap_loudspeakersVietnam";
GT.DisplayName = _("VAP Loudspeakers Radio Vietnam");
GT.DisplayNameShort = _("Loudspeakers Radio Viet");
GT.Rate = 1;

GT.Sensors = { RADAR = {"SA-11 Buk SR 9S18M1"} };

GT.DetectionRange  = 0;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000076";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_GenericFort,
				"Fortifications"
				};
				
GT.category = "Unarmed";