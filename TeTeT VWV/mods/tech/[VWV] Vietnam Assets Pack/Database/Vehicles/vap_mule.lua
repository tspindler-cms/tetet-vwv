-- VAP US Mule --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_mule_chassis);

GT.visual.shape = "vap_mule";
GT.visual.shape_dstr = "vap_mule_dest";

-----------------------------------------------------------------------------------------------------
--chassis
GT.chassis.life = 3;
GT.swing_on_run = false;

GT.radar_rotation_period = 1.0;

GT.animation_arguments.alarm_state = 3;
GT.animation_arguments.locator_rotation = 11;
GT.animation_arguments.stoplights = 30;
GT.animation_arguments.headlights = 31;
GT.animation_arguments.markerlights = 32;
--GT.animation_arguments.luna_lights = -1;

GT.AddPropVehicle = {
			{ id = "cargo_type" , control = 'comboList', wCtrl = 150, label = _('Cargo'), defValue = 0, arg = 60,
				values = {
				{ id = 1, dispName = _("Empty"), value = 0.0},
				{ id = 2, dispName = _("Ammo"), value = 0.1},
				{ id = 3, dispName = _("Fuel"), value = 0.2},
				{ id = 4, dispName = _("Mixed Cargo"), value = 0.3}
				}
			}
		}

--Burning after hit
GT.visual.fire_size = 0.1; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 30; --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpitWithLLTV";
GT.animation_arguments.crew_presence = 50;

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_mule";
GT.DisplayName = _("VAP US Mule");
GT.DisplayNameShort = _("US Mule")
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
