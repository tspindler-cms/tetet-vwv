-- VAP US M35 Quad M2 Browning Truck --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_m35_chassis);

GT.visual.shape = "vap_m35_gun_truck";
GT.visual.shape_dstr = "vap_m35_gun_dest";

-----------------------------------------------------------------------------------------------------
--chassis
GT.chassis.life = 2;
GT.swing_on_run = false;

GT.radar_rotation_period = 1.0;

GT.animation_arguments.alarm_state = 3;
GT.animation_arguments.locator_rotation = 11;
GT.animation_arguments.stoplights = 30;
GT.animation_arguments.headlights = 31;
GT.animation_arguments.markerlights = 32;

-- GT.AddPropVehicle = {
			-- { id = "config" , control = 'comboList', wCtrl = 150, label = _('Configuration'), defValue = 0, arg = 60,
				-- values = {
				-- { id = 1, dispName = _("Covered"), value = 0.0},
				-- { id = 2, dispName = _("Tent Frame"), value = 0.1},
				-- { id = 3, dispName = _("Clean"), value = 0.2},
				-- { id = 4, dispName = _("Fuel"), value = 0.3},
				-- { id = 5, dispName = _("Cargo"), value = 0.4}
				-- }
			-- }
		-- }

--destruction  
GT.agony_fire_pos_y = 0.982;
GT.agony_fire_pos_y = 1.725;
GT.agony_fire_pos_z = 0.315;

--Burning after hit
GT.visual.fire_size = 0.25; --relative burning size
GT.visual.fire_pos[1] = 0.2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0.2; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 300; --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;
GT.visual.agony_explosion_size = 2;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpitWithLLTV";
GT.animation_arguments.crew_presence = 50;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_range_finding_target = 4500;
GT.sensor.max_alt_finding_target = 1500;
GT.sensor.height = 2.8;

-----------------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {};

local ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].center = "CENTER_TOWER_01";
GT.WS[ws].pointer = "CENTER_SIGHT_01";
GT.WS[ws].cockpit = {"IronSight/IronSight", {-0.2, 1.0, 0.0}, open = true};
GT.WS[ws].angles = {	{math.rad(45), math.rad(-45), math.rad(10), math.rad(90)},
						{math.rad(-45), math.rad(45), math.rad(-10), math.rad(90)},
                   };
GT.WS[ws].canSetTacticalDir = true ;
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(45);
GT.WS[ws].omegaZ = math.rad(45);
GT.WS[ws].pidY = GT_t.AAA_PIDY;
GT.WS[ws].pidZ = GT_t.AAA_PIDZ;
GT.WS[ws].reference_angle_Y	= math.rad(0);
GT.WS[ws].reference_angle_Z	= math.rad(0);

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_4m2bmg);
__LN.type = 10;
__LN.sightMasterMode 		= 1;
__LN.sightIndicationMode 	= 1;
__LN.maxShootingSpeed 		= 1;
for i=2,4 do -- 4x800 clips, 3200 rounds
	__LN.PL[i] = {}
	set_recursive_metatable(__LN.PL[i], __LN.PL[1])
end
__LN.BR = {	{ connector_name = 'CENTER_GUN_01'},
			{ connector_name = 'CENTER_GUN_02'},
			{ connector_name = 'CENTER_GUN_03'},
			{ connector_name = 'CENTER_GUN_04'},

		};

------------------------------------------------------------------------------------------------------------------------
GT.Name = "vap_m35_gun_truck";
GT.DisplayName = _("VAP US M35 Gun Truck");
GT.DisplayNameShort = _("US M35 QuadM2");
GT.Rate = 12;

GT.Crew = 2;

GT.DetectionRange  	= GT.WS.maxTargetDetectionRange;
GT.ThreatRange 		= GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000205";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericVehicle,wsType_GenericAPC,
				--"Trucks",
				"Tanks",
				};
GT.category = "Air Defence";
GT.tags  =
{   "Air Defence",
	"APC",
	"Support & Logistics",
}
GT.warehouse = false
GT.InternalCargo = {
			nominalCapacity = 1100,
			maximalCapacity = 1100, --максимальный объем, который может вместить в усл. ед., складываются все transportable.size
		}
GT.Countries = {"USA"}
