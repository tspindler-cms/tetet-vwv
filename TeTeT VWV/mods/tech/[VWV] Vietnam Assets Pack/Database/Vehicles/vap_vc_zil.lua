-- VAP VC zil, truck based on HL pickup with DShK by ED --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_vc_zil_chassis);
GT.chassis.mass = GT.chassis.mass + 580;   -- +580kg Cargo

GT.visual.shape = "vap_vc_zil";	
GT.visual.shape_dstr = "vc_truck_dest";

-----------------------------------------------------------------------------------------------------
GT.IR_emission_coeff = 0.08

GT.swing_on_run = false;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_range_finding_target = 750;
GT.sensor.max_alt_finding_target = 1000;
GT.sensor.height = 2.826;

GT.AddPropVehicle = {
			{ id = "camo" , control = 'checkbox', label = _('camo'), defValue = true, arg=60, boolean_inverted = true} -- boolean_inverted = true by default: element present - argVal=0, absent - argVal=1
		}
		
GT.animation_arguments.headlights = 31;		

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
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 12;
GT.visual.agony_explosion_size = 2;

GT.visual.IR = { coeffs = {GT_t.IR_COEFFS_ENGINE_APC, GT_t.IR_COEFFS_WHEELS_Car, GT_t.IR_COEFFS_HMG, GT_t.IR_COEFFS_BODY, {0.21, 0.21/1050}}}

GT.driverCockpit = "DriverCockpit/DriverCockpit"
GT.driverViewConnectorName = "DRIVER_POINT"
GT.animation_arguments.crew_presence = 50;

-----------------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {};

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER_01';
GT.WS[ws].angles = {	{math.rad(20), math.rad(-20), math.rad(5), math.rad(20)},
						{math.rad(-20), math.rad(20), math.rad(-10), math.rad(20)},
                   };
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);
GT.WS[ws].stabilizer = false;
GT.WS[ws].laser = false;
GT.WS[ws].pointer = 'POINT_SIGHT_01';

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t3);
__LN.distanceMax = 500;
__LN.maxShootingSpeed = 1.5;
for i=2,15 do -- 15x30 clips, 450 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1].connector_name = 'POINT_GUN_01'
__LN.customViewPoint = { "IronSight/IronSight", {0.0, 0.0, 0.0} };

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_vc_zil";
GT.DisplayName = _("VAP VC Zil 130");
GT.DisplayNameShort = _("VC Zil AK47");
GT.Rate = 6;

GT.Crew = 2;

GT.DetectionRange	= GT.sensor.max_range_finding_target;
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