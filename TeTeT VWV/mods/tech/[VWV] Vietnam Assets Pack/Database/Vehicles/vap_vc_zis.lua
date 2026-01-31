-- VAP VC zis 150, truck based on HL pickup with DShK by ED --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_vc_zis_chassis);

GT.visual.shape = "vap_vc_zis_150";
GT.visual.shape_dstr = "vap_zis_150_dest";

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

--destruction  
GT.agony_fire_pos_y = 0.982;
GT.agony_fire_pos_y = 1.725;
GT.agony_fire_pos_z = 0.315;

--Burning after hit
GT.visual.fire_size = 0.65; --relative burning size
GT.visual.fire_pos[1] = 0.2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0.8; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 300; --burning time (seconds)
GT.visual.min_time_agony = 2;
GT.visual.max_time_agony = 10;
GT.visual.agony_explosion_size = 2;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpit";
GT.animation_arguments.crew_presence = 50;

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_zis";
GT.DisplayName = _("VAP VC Zis 150");
GT.DisplayNameShort = _("VC Zis")
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
GT.Countries = {"Vietnam"}
GT.InternalCargo = {
			nominalCapacity = 1100,
			maximalCapacity = 1100, --максимальный объем, который может вместить в усл. ед., складываются все transportable.size
		}

