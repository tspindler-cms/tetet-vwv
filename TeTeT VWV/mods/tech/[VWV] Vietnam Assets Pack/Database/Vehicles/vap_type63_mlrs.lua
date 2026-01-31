-- VAP VC Type63 mlrs --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_wheel_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.vap_type63_chassis);
GT.chassis.mass = GT.chassis.mass + 470; 	

GT.visual.shape = "vap_type63_mlrs";
GT.visual.shape_dstr = "vap_type63_mlrs_dest";

-----------------------------------------------------------------------------------------------------
GT.encyclopediaAnimation = { 
	args = {
		[1] = 0.125, -- B8M1 angle
		[121] = 1.0, -- rocket back
		[122] = 1.0, -- rocket back
		[123] = 1.0, -- rocket back
		[124] = 1.0, -- rocket back
		[125] = 1.0, -- rocket back
		[126] = 1.0, -- rocket back
		[127] = 1.0, -- rocket back
		[128] = 1.0, -- rocket back
		[129] = 1.0, -- rocket back
		[130] = 1.0, -- rocket back
		[131] = 1.0, -- rocket back
		[132] = 1.0, -- rocket back
	}
}

GT.IR_emission_coeff = 0.08

GT.swing_on_run = false;
GT.snd.engine = "";
--GT.snd.move = "";

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.max_range_finding_target = 7500;
GT.sensor.min_range_finding_target = 200;
GT.sensor.max_alt_finding_target = 0;
GT.sensor.height = 1.5;

--destruction  
GT.agony_fire_pos_y = 0.982;
GT.agony_fire_pos_y = 1.725;
GT.agony_fire_pos_z = 0.315;

--Burning after hit
GT.visual.fire_size = 0.25; --relative burning size
GT.visual.fire_pos[1] = 0.2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0.2; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 60; --burning time (seconds)
GT.visual.min_time_agony = 5;
GT.visual.max_time_agony = 10;
GT.visual.agony_explosion_size = 1;

GT.visual.IR = { coeffs = {GT_t.IR_COEFFS_ENGINE_APC, GT_t.IR_COEFFS_WHEELS_Car, GT_t.IR_COEFFS_MLRS_80, IR_COEFFS_BODY, {0.25, 0.25/1050}}}

GT.driverCockpit = "DriverCockpit/DriverCockpit"
GT.driverViewConnectorName = "DRIVER_POINT"

-----------------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {};

GT.WS.fire_on_march = false;

--GT.WS[1] -- 3x12 Rockets
local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.vap_type63LR);
GT.WS[ws].pos = {-0.21, 1.67, 0.0};
GT.WS[ws].reloadAngleZ = math.rad(8);

GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_ROCKET_01', drawArgument = 121},
	{connector_name = 'POINT_ROCKET_02', drawArgument = 122},
	{connector_name = 'POINT_ROCKET_03', drawArgument = 123},
	{connector_name = 'POINT_ROCKET_04', drawArgument = 124},
	{connector_name = 'POINT_ROCKET_05', drawArgument = 125},
	{connector_name = 'POINT_ROCKET_06', drawArgument = 126},
	{connector_name = 'POINT_ROCKET_07', drawArgument = 127},
	{connector_name = 'POINT_ROCKET_08', drawArgument = 128},
	{connector_name = 'POINT_ROCKET_09', drawArgument = 129},
	{connector_name = 'POINT_ROCKET_10', drawArgument = 130},
	{connector_name = 'POINT_ROCKET_11', drawArgument = 131},
	{connector_name = 'POINT_ROCKET_12', drawArgument = 132},
}

GT.WS[ws].LN[1].customViewPoint = { "genericMLRS", {-100.0, 12.0, 35.0 }, open = true};

--GT.WS[2]
ws = GT_t.inc_ws();
GT.WS[ws] = {};
--GT.WS[ws].base = 1;
GT.WS[ws].center = 'CENTER_AK';
GT.WS[ws].angles = {	{math.rad(180), math.rad(-22), math.rad(-10), math.rad(60)},
						{math.rad(-22), math.rad(-85), math.rad(10), math.rad(60)},
						{math.rad(-85), math.rad(-180), math.rad(-10), math.rad(60)},
                    };
GT.WS[ws].drawArgument1 = 24;
GT.WS[ws].drawArgument2 = 25;
GT.WS[ws].omegaY = math.rad(50);
GT.WS[ws].omegaZ = math.rad(50);
GT.WS[ws].pidY = GT_t.MG_TOWER_PIDY
GT.WS[ws].pidZ = GT_t.MG_TOWER_PIDZ
GT.WS[ws].pointer = 'POINT_SIGHT_AK'
GT.WS[ws].cockpit = {'IronSight/IronSight', {1.8, -0.0, 0.35 },}

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.vap_ak47t2);
__LN.type = 10;
__LN.sightMasterMode = 1;
__LN.sightIndicationMode = 1;
__LN.distanceMax = 500 ;
for i=2,8 do -- 8x30 clips, 240 rounds
	__LN.PL[i] = {};
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.BR[1].connector_name = 'POINT_GUN_AK';

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_type63_mlrs";
GT.DisplayName = _("VAP VC Type63 107mm MLRS");
GT.DisplayNameShort = _("VC Type63");
GT.Rate = 6;

GT.Crew = 2;

GT.DetectionRange 	= 0;
GT.ThreatRangeMin	= GT.WS[1].LN[1].distanceMin;
GT.ThreatRange		= GT.WS[1].LN[1].distanceMax;

GT.mapclasskey = "P0091000208";
GT.mapclasskey 		= "P0091000208";
GT.attribute = {wsType_Ground, wsType_Tank,wsType_Miss,wsType_GenericMLRS, WSTYPE_PLACEHOLDER,
                 "MLRS",
                };
GT.category = "Artillery"
GT.tags  =
{
    "Artillery",
    "MRL",
}
GT.Countries = {"Vietnam"}