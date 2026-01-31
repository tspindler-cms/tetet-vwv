-- VAP US Mutt Gun M40A2 Recoilless Rifle 106mm --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_mutt_chassis);

GT.visual.shape = "vap_mutt_gun";
GT.visual.shape_dstr = "vap_mutt_dest";

-----------------------------------------------------------------------------------------------------
--chassis
GT.chassis.life = 3;
GT.swing_on_run = false;

GT.radar_rotation_period = 1.0;
--GT.toggle_alarm_state_interval = 60.0;

GT.animation_arguments.alarm_state = 3;
GT.animation_arguments.locator_rotation = 11;
GT.animation_arguments.stoplights = 30;
GT.animation_arguments.headlights = 31;
GT.animation_arguments.markerlights = 32;
--GT.animation_arguments.luna_lights = -1;

--destruction  
GT.agony_fire_pos_y = 0.982;
GT.agony_fire_pos_y = 1.225;
GT.agony_fire_pos_z = 0.315;

--Burning after hit
GT.visual.fire_size = 0.25; --relative burning size
GT.visual.fire_pos[1] = 0.2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0.2; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 60; --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;
GT.visual.agony_explosion_size = 1;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_range_finding_target = 3500;
GT.sensor.max_alt_finding_target = 0;
GT.sensor.height = 2.0;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpit";
GT.animation_arguments.crew_presence = 50;

-----------------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {}

GT.WS.fire_on_march = false;

local ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].center = 'CENTER_TOWER'
GT.WS[ws].pointer = 'POINT_SIGHT'
GT.WS[ws].cockpit = {"genericHowitzer", {0.0, 0.0, 0.0}}
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-5), math.rad(27)},};
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].mount_before_move = true
GT.WS[ws].omegaY = math.rad(22)
GT.WS[ws].omegaZ = math.rad(22)
GT.WS[ws].pidY = {p=30, i=0.0, d=9, inn=2}
GT.WS[ws].pidZ = {p=30, i=0.0, d=9, inn=2}

--GT.WS[1].LN[1]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_m40a2HEAT);
__LN.connectorFire			= true
--__LN.distanceMax			= 2250
__LN.sightMasterMode 		= 1
__LN.sightIndicationMode 	= 1
__LN.PL[1].virtualStwID 	= 1
__LN.PL[1].ammo_capacity 	= 15
__LN.BR[1] = {connector_name = 'POINT_GUN'}

--GT.WS[1].LN[2]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_m40a2HEPT);
__LN.connectorFire 			= true
--__LN.distanceMax 			= 2850
__LN.sightMasterMode 		= 1
__LN.sightIndicationMode 	= 1
__LN.PL[1].virtualStwID 	= 1
__LN.PL[1].ammo_capacity 	= 10
__LN.BR[1] = {connector_name = 'POINT_GUN'}

--GT.WS[1].LN[3]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_m40a2APERST);
__LN.connectorFire 			= true
--__LN.distanceMax 			= 1500
__LN.sightMasterMode 		= 1
__LN.sightIndicationMode 	= 1
__LN.PL[1].virtualStwID 	= 1
__LN.PL[1].ammo_capacity 	= 5
__LN.BR[1] = {connector_name = 'POINT_GUN'}

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_mutt_gun";
GT.DisplayName = _("VAP US MUTT Gun");
GT.DisplayNameShort = _("US MUTT Gun")
GT.Rate = 5;

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRangeMin	= GT.WS[1].LN[1].distanceMin;
GT.ThreatRange		= GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000006";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun, WSTYPE_PLACEHOLDER,
                "Artillery",
                };

GT.category = "Artillery";
GT.tags  =
{
    "Artillery",
    "SPA",
}
GT.Countries = {"USA"}

