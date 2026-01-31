-- VAP Viet Cong Bicycle AK47 --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_vc_bicycle_chassis);
GT.chassis.mass = GT.chassis.mass + 70; 	

GT.visual.shape = "vap_vc_bicycle_ak";
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
GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(60)},
                   
                    };
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
GT.WS[ws].pointer = 'POINT_SIGHT';

--GT.WS[1].LN[1]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t3);
__LN.maxShootingSpeed = 0;
__LN.fireAnimationArgument = -1;
for i=2,8 do -- 8x30 clips, 240 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1].connector_name = 'POINT_GUN'
__LN.customViewPoint = { "IronSight/IronSight", {0.0, 0.0, 0.0} };

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_bicycle_ak";
GT.DisplayName = _("VAP VC Bicycle AK");
GT.DisplayNameShort = _("VC Bike AK47")
GT.Rate = 4;

GT.Crew = 1;

GT.DetectionRange	= GT.WS[1].LN[1].distanceMax;
GT.ThreatRange		= GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000004";
GT.attribute = {wsType_Ground, wsType_Tank, wsType_Gun, WSTYPE_PLACEHOLDER,
                "APC",
                };
GT.category = "Armor"
GT.tags  =
{
   "Armor",
   "Scout/Recon",
}
GT.Countries = {"Vietnam"}