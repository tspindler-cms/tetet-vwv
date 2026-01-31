-- VAP US Mutt --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_mutt_chassis);

GT.visual.shape = "vap_mutt";
GT.visual.shape_dstr = "vap_mutt_dest";

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
			{ id = "cargo_type" , control = 'comboList', wCtrl = 150, label = _('Cargo'), defValue = 0, arg = 60,
				values = {
				{ id = 1, dispName = _("Clean"), value = 0.0},
				{ id = 2, dispName = _("Antennas"), value = 0.1},
				{ id = 3, dispName = _("Windshield Down"), value = 0.2}
				}
			}
		}

--Burning after hit
GT.visual.fire_size = 0.1; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 360; --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;

GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpitWithLLTV";
GT.animation_arguments.crew_presence = 50;

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_mutt";
GT.DisplayName = _("VAP US MUTT");
GT.DisplayNameShort = _("US MUTT")
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
	"Scout/Recon",
}
GT.Countries = {"USA"}

