-- VAP US M35 Truck --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_m35_chassis);

GT.visual.shape = "vap_m35_truck";
GT.visual.shape_dstr = "vap_m35_truck_dest";

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

GT.AddPropVehicle = {
			{ id = "config" , control = 'comboList', wCtrl = 150, label = _('Configuration'), defValue = 0, arg = 60,
				values = {
				{ id = 1, dispName = _("Covered"), value = 0.0},
				{ id = 2, dispName = _("Tent Frame"), value = 0.1},
				{ id = 3, dispName = _("Clean"), value = 0.2},
				{ id = 4, dispName = _("Fuel"), value = 0.3},
				{ id = 5, dispName = _("Cargo"), value = 0.4}
				}
			}
		}

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

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_m35_truck";
GT.DisplayName = _("VAP US M35 Truck");
GT.DisplayNameShort = _("US M35 Trck")
GT.Rate = 5;

GT.DetectionRange  = 0;
GT.ThreatRange = 0;

GT.mapclasskey = "P0091000212";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericVehicle,
				"Trucks",
				};
GT.category = "Unarmed";
GT.tags  =
{
    "Unarmed",
	"Support & Logistics",
}
GT.warehouse = true
GT.InternalCargo = {
			nominalCapacity = 1100,
			maximalCapacity = 1100, --максимальный объем, который может вместить в усл. ед., складываются все transportable.size
		}
GT.Countries = {"USA"}
