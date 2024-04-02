-- mount_vfs_model_path	(current_mod_path.."/Shapes")
-- mount_vfs_liveries_path (current_mod_path.."/Liveries")
-- mount_vfs_texture_path  (current_mod_path.."/Textures/mig17pm")

-- mig_boarding_ladder
GT_t.CH_t.mig_boarding_ladder = {
	life = 2,
		mass = 3090,
		length = 8.325,
		width = 3.685,
		max_road_velocity = 12.7778,
		max_slope = 0.37,
		canSwim = false,
		canWade = true,
		engine_power = 150,
		max_vert_obstacle = 0.45,
		max_acceleration = 2.925926,
		min_turn_radius = 4.5,
		X_gear_1 = 1.175,
		Y_gear_1 = 0,
		Z_gear_1 = 0.769,
		X_gear_2 = -1.215,
		Y_gear_2 = 0,
		Z_gear_2 = 0.769,
		gear_type = GT_t.GEAR_TYPES.WHEELS,
		r_max = 0.42,
		armour_thickness = 0.001,
}

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.mig_boarding_ladder);


GT.visual.shape = "mig_boarding_ladder";
GT.visual.shape_dstr = "mig_boarding_ladder";


--chassis
GT.swing_on_run = false;
GT.chassis.life = 3; -- shielded
GT.animation_arguments.locator_rotation = 11;
GT.radar_rotation_period = -1.2;
GT.snd.sirene = "sirene";
GT.animation_arguments.stoplights = 30;
GT.animation_arguments.headlights = 31;
GT.animation_arguments.markerlights = 32;
--GT.animation_arguments.luna_lights = -1;
GT.animation_arguments.alarm_state = 3;
--GT.toggle_alarm_state_interval = 60.0;

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


GT.Name = "mig_boarding_ladder";
GT.DisplayName = _("Mig Boarding Ladder");
GT.Rate = 5;



--GT.Sensors = { OPTIC = {"generic tank daysight", "human nightsight", "human daysight",}, RADAR = GT.Name, };
GT.Sensors = { RADAR = {"SA-11 Buk SR 9S18M1"} };

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000005";
--GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsTypeUAZ469,
--				"Cars",
--				"human_vehicle",
--};
GT.attribute = {wsType_Ground,wsType_SAM,wsType_NoWeapon,BUK_9C470M1,
				"SAM CC",
				};
				
GT.category = "Unarmed";
GT.tags  =
{
    "Unarmed",
	"Support & Logistics",
}
add_surface_unit(GT)