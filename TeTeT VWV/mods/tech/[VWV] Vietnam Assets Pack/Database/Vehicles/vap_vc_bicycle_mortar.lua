-- VAP Viet Cong Bicycle Mortar 2A60 --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_vc_bicycle_chassis);
GT.chassis.mass = GT.chassis.mass + 70; 	

GT.visual.shape = "vap_vc_bicycle_mortar";
GT.visual.shape_dstr = "vap_vc_bicycle_dest";

-----------------------------------------------------------------------------------------------------
GT.IR_emission_coeff = 0.08

GT.swing_on_run = false;
GT.snd.engine = "";
GT.snd.move = "";

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 1.5;

--destruction  
GT.visual.fire_size = 0.000;
GT.visual.max_time_agony = 0;
GT.visual.agony_explosion_size = 0;

GT.visual.IR = { coeffs = {GT_t.IR_COEFFS_ENGINE_APC, GT_t.IR_COEFFS_WHEELS_Car, GT_t.IR_COEFFS_MLRS_80, IR_COEFFS_BODY, {0.25, 0.25/1050}}}

GT.driverCockpit = "DriverCockpit/DriverCockpit"
GT.driverViewConnectorName = "DRIVER_POINT"

-----------------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {};

GT.WS.fire_on_march = false;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].newZ = GT_t.ANGLE_Z_TRANSLATION_OPTIONS.TRANSLATE_MIN_ANGLE_TO_MINUS_ONE;
GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180),math.rad(45), math.rad(80),},
                    };
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(30);
GT.WS[ws].pidY = {p=5, i=0.0, d=2};
GT.WS[ws].pidZ = {p=5, i=0.0, d=2};
GT.WS[ws].reference_angle_Z = math.rad(60);
GT.WS[ws].canSetTacticalDir = true;

--GT.WS[1].LN[1]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.howitzer_2A60);
__LN.connectorFire = false;
--__LN.customViewPoint = { "genericMLRS", {00.0, 50.0, 0.0 }, open = true};
__LN.PL[1].ammo_capacity= 20;
__LN.PL[1].portionAmmoCapacity= 20;
__LN.PL[1].reload_time = 30;
__LN.BR[1].connector_name = 'POINT_GUN';
__LN = nil;

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_bicycle_mortar";
GT.DisplayName = _("VAP VC Bicycle Mortar");
GT.DisplayNameShort = _("VC Bike Mortar")
GT.Rate = 5;

GT.Crew = 1;

GT.DetectionRange  	= 0;
GT.ThreatRangeMin 	= GT.WS[1].LN[1].distanceMin;
GT.ThreatRange 		= 7000;

GT.mapclasskey = "P0091000006";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_GenericSAU,
                "Artillery",
                };
GT.category = "Artillery";
GT.tags  =
{
    "Artillery",
}
GT.Countries = {"Vietnam"}