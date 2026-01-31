-- VAP Viet Cong Bicycle ammo --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_vc_bicycle_chassis);

GT.visual.shape = "vap_vc_bicycle_ammo";
GT.visual.shape_dstr = "vap_vc_bicycle_dest";

-----------------------------------------------------------------------------------------------------
--chassis
GT.chassis.life = 2;
GT.swing_on_run = false;
GT.snd.engine = "";
GT.snd.move = "";

GT.radar_rotation_period = 1.0;

GT.animation_arguments.alarm_state = 3;
GT.animation_arguments.locator_rotation = 11;
GT.animation_arguments.stoplights = 30;
GT.animation_arguments.headlights = 31;
GT.animation_arguments.markerlights = 32;

--destruction  
GT.visual.fire_size = 0.000;
GT.visual.max_time_agony = 0;
GT.visual.agony_explosion_size = 0;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpit";
GT.animation_arguments.crew_presence = 50;

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_bicycle_ammo";
GT.DisplayName = _("VAP VC Bicycle Ammo");
GT.DisplayNameShort = _("VC Bike Ammo")
GT.Rate = 2;

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
GT.Countries = {"Vietnam"}
GT.InternalCargo = {
			nominalCapacity = 1100,
			maximalCapacity = 1100, --максимальный объем, который может вместить в усл. ед., складываются все transportable.size
		}