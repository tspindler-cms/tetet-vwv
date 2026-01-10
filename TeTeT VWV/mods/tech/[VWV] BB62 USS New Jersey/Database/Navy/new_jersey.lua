-- USS New Jersey 68 by James J. Jackson

GT = {};
dofile(current_mod_path..'/Database/scripts/new_jersey_RunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "new_jersey_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 12200; -- hit points
GT.mass = 61000000; -- KGs
GT.max_velocity = 18.1084444 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 270.54 -- o.a in meters
GT.Width = 32.95 --meters
GT.Height = 54.2 --from sea level I think
GT.Length = 270.54 -- deck length I think
GT.DeckLevel = 6.13 -- height of deck
GT.X_nose = 130.2 -- bow wave
GT.X_tail = -75 -- wake
GT.Tail_Width = 25 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 300; -- turn radius

GT.RCS = 1000000; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 500;

-- Aircraft complement
GT.numParking		= 1;
GT.Plane_Num_		= 0;
GT.Helicopter_Num_	= 1;
GT.Landing_Point = {-114.45,6.25,0};

-- smoke density and position
GT.exhaust = {
	[1] = { size = 0.20, pos = {-3.22, 28.761, 0}},
	[2] = { size = 0.20, pos = {-28.765, 28.427, 0}}
};

GT.animation_arguments = {
	water_propeller = 12,
	radar1_rotation = 13,
	radar2_rotation = 14,
	nav_lights = 901,
};
GT.radar1_period = 4; --speed
GT.radar2_period = 4;

--Damage Model
GT.DM = {
	{ area_name = "nj_flight_deck", area_arg = 970, area_life = 50},
	{ area_name = "nj_16in50_mk7_T1", area_arg = 971, area_life = 100},
	{ area_name = "nj_16in50_mk7_T2", area_arg = 972, area_life = 100},
	{ area_name = "nj_16in50_mk7_T3", area_arg = 973, area_life = 100},
	{ area_name = "hull", area_arg = 974, area_life = 500},
	{ area_name = "SuperStructure", area_arg = 977, area_life = 100},
	{ area_name = "nj_5in38_mk32_T1", area_arg = 978, area_life = 50},
	{ area_name = "nj_5in38_mk32_T2", area_arg = 979, area_life = 50},
	{ area_name = "nj_5in38_mk32_T3", area_arg = 980, area_life = 50},
	{ area_name = "nj_5in38_mk32_T4", area_arg = 981, area_life = 50},
	{ area_name = "nj_5in38_mk32_T5", area_arg = 982, area_life = 50},
	{ area_name = "nj_5in38_mk32_T6", area_arg = 983, area_life = 50},
	{ area_name = "nj_5in38_mk32_T7", area_arg = 984, area_life = 50},
	{ area_name = "nj_5in38_mk32_T8", area_arg = 985, area_life = 50},
	{ area_name = "nj_5in38_mk32_T9", area_arg = 986, area_life = 50},
	{ area_name = "nj_5in38_mk32_T10", area_arg = 987, area_life = 50},
};

GT.airWeaponDist = 14630.0;  -- Max engagement range air threats (meters)
GT.airFindDist = 130000; -- Max detenction range air threats (meters)


--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 28000;
GT.WS.radar_type = 102 --optical in wstypes
GT.WS.searchRadarMaxElevation = math.rad(60);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}};
local ws;

-- weapon systems goes here
-- we will use the https://en.wikipedia.org/wiki/5-inch/38-caliber_gun as main armament
-- dcs-lua-datamine _G["db"]["Units"]["GT_t"]["LN_t"]["Mk12_5in38cal"]

-- Kudos to currenthill for allowing to use his code for the ship armament launchers
-- Original launcher are ModernUSNShips_Mark45_M4 and ModernUSNShips_Mark45_M4_AIR
-- Download currenthill's mod from https://currenthill.com/

local WSN_20 = {};
WSN_20.deviation_error_azimuth 		= 0.0002;
WSN_20.deviation_error_elevation 	= 0.0002;
WSN_20.deviation_error_speed_sensor	= 0.0002;
WSN_20.deviation_error_stability 	= 0.0002;
WSN_20.deviation_error_distance 	= 0.0002;

GT_t.WSN_t[20] = WSN_20;


-------------------------------------------------------------------------------------------------
--   Mk7 16inch Ammo 
-------------------------------------------------------------------------------------------------
GT_t.WS_t.ship_16inch_50 = {name = "16Inch 406/50"}
GT_t.WS_t.ship_16inch_50.angles = {
					{math.rad(140), math.rad(-140), math.rad(-2), math.rad(45)},
					};
GT_t.WS_t.ship_16inch_50.omegaY = 0.6
GT_t.WS_t.ship_16inch_50.omegaZ = 0.6
GT_t.WS_t.ship_16inch_50.reference_angle_Z = 0
GT_t.WS_t.ship_16inch_50.LN = {}
GT_t.WS_t.ship_16inch_50.LN[1] = {}
GT_t.WS_t.ship_16inch_50.LN[1].type = 6
GT_t.WS_t.ship_16inch_50.LN[1].distanceMin = 50
GT_t.WS_t.ship_16inch_50.LN[1].distanceMax = 38720;
GT_t.WS_t.ship_16inch_50.LN[1].max_trg_alt = 11535
GT_t.WS_t.ship_16inch_50.LN[1].reactionTime = 15
GT_t.WS_t.ship_16inch_50.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_16inch_50.LN[1].sensor, GT_t.WSN_t[10])
GT_t.WS_t.ship_16inch_50.LN[1].PL = {}
GT_t.WS_t.ship_16inch_50.LN[1].PL[1] = {}
GT_t.WS_t.ship_16inch_50.LN[1].PL[1].ammo_capacity = 402
GT_t.WS_t.ship_16inch_50.LN[1].PL[1].shell_name = {"vwv_mk7_406mm_HC"};


GT_t.WS_t.ship_16inch_50.LN[1].PL[1].shot_delay = 26 
GT_t.WS_t.ship_16inch_50.LN[1].automaticLoader = false;
GT_t.WS_t.ship_16inch_50.LN[1].reload_time = 240 * 20
GT_t.WS_t.ship_16inch_50.LN[1].BR = { {pos = {8, 0, 0.1} }, {pos = {8, 0, 0.0} }, {pos = {8, 0, -0.1} } }

-------------------------------------------------------------------------------------------------
--   5inch  Ammo   
-------------------------------------------------------------------------------------------------

GT_t.WS_t.ship_mk12_2x127mm = {name = "Mk12 5inch 38cal Twin"};
GT_t.WS_t.ship_mk12_2x127mm.angles = {
					{math.rad(180), math.rad(-180), math.rad(-10), math.rad(85)},
					};
GT_t.WS_t.ship_mk12_2x127mm.omegaY = math.rad(10); -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.omegaZ = math.rad(10); -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.reference_angle_Z = 0;


GT_t.LN_t.ship_mk12_127mm_AIR = {};
GT_t.LN_t.ship_mk12_127mm_AIR.type = 11;
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMin = 20;
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMax = 9144;
GT_t.LN_t.ship_mk12_127mm_AIR.max_trg_alt = 11339;
GT_t.LN_t.ship_mk12_127mm_AIR.reactionTime = 2;
GT_t.LN_t.ship_mk12_127mm_AIR.sensor = {};
-- set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[20]);
GT_t.LN_t.ship_mk12_127mm_AIR.PL = {};
GT_t.LN_t.ship_mk12_127mm_AIR.PL[1] = {
	shell_name = {"vwv_nj_mk12_127mm_AIR"},
	automaticLoader = false,
	shot_delay = 3.5,
	ammo_capacity = 352,
};

GT_t.LN_t.ship_mk12_127mm = {}
GT_t.LN_t.ship_mk12_127mm.type = 6
GT_t.LN_t.ship_mk12_127mm.distanceMin = 20
GT_t.LN_t.ship_mk12_127mm.distanceMax = 16642
GT_t.LN_t.ship_mk12_127mm.max_trg_alt = 5410
GT_t.LN_t.ship_mk12_127mm.reactionTime = 4
GT_t.LN_t.ship_mk12_127mm.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm.sensor, GT_t.WSN_t[10])
GT_t.LN_t.ship_mk12_127mm.PL = {}
GT_t.LN_t.ship_mk12_127mm.PL[1] = {
	-- unclear why the 127_Mk49 shells not work
	shell_name = {"MK45_127"}, --shell_name = { "127_Mk49_HC_1", "127_Mk49_HC_2" },
	automaticLoader = false,
	shot_delay = 3.5,
	ammo_capacity = 352,
};


-------------------------------------------------------------------------------------------------
--   16inch turret 1  
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_16inch_50)
GT.WS[ws].area = 'nj_16in50_mk7_T1'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].angles = {
					{math.rad(150), math.rad(-150), math.rad(-2), math.rad(45)},
					};
GT.WS[ws].omegaY = math.rad(4);
GT.WS[ws].omegaZ = math.rad(12);
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(5);	
GT.WS[ws].LN[1].BR[1].recoilTime = 0.2;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_GUN_16inch_1_1',
		recoilArgument = 1111,
	},
	{
		connector_name = 'POINT_GUN_16inch_1_2',
		recoilArgument = 1112,
	},
	{
		connector_name = 'POINT_GUN_16inch_1_3',
		recoilArgument = 1113,
	}
}

-------------------------------------------------------------------------------------------------
--   16inch turret 2  
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_16inch_50)
GT.WS[ws].area = 'nj_16in50_mk7_T2'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].drawArgument1 = 4
GT.WS[ws].drawArgument2 = 5
GT.WS[ws].angles = {
					{math.rad(150), math.rad(-150), math.rad(0), math.rad(45)},
					};
GT.WS[ws].omegaY = math.rad(4);
GT.WS[ws].omegaZ = math.rad(12);
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(5);	
GT.WS[ws].LN[1].BR[1].recoilTime = 0.2;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_GUN_16inch_2_1',
		recoilArgument = 1121,
	},
	{
		connector_name = 'POINT_GUN_16inch_2_2',
		recoilArgument = 1122,
	},
	{
		connector_name = 'POINT_GUN_16inch_2_3',
		recoilArgument = 1123,
	}
}

-------------------------------------------------------------------------------------------------
--   16inch turret 3  
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_16inch_50)
GT.WS[ws].area = 'nj_16in50_mk7_T3'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].drawArgument1 = 8
GT.WS[ws].drawArgument2 = 9
GT.WS[ws].angles = {
					{math.rad(-30), math.rad(30), math.rad(-2), math.rad(45)},
					};
GT.WS[ws].omegaY = math.rad(4);
GT.WS[ws].omegaZ = math.rad(12);
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].reference_angle_Z = math.rad(5);	
GT.WS[ws].LN[1].BR[1].recoilTime = 0.2;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_GUN_16inch_3_1',
		recoilArgument = 1131,
	},
	{
		connector_name = 'POINT_GUN_16inch_3_2',
		recoilArgument = 1132,
	},
	{
		connector_name = 'POINT_GUN_16inch_3_3',
		recoilArgument = 1133,
	}
}

-------------------------------------------------------------------------------------------------
--   5inch turret 1
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T1'
GT.WS[ws].center = 'CENTER_TURRET_04'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 15;
GT.WS[ws].drawArgument2 = 16;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-0)
GT.WS[ws].angles = {
	{math.rad(-0), math.rad(-170), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1_1',
			recoilArgument = 1211,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_1_2',
			recoilArgument = 1212,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T1'
GT.WS[ws].center = 'CENTER_TURRET_04'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-0), math.rad(-170), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1_2',
			recoilArgument = 1212,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_1_1',
			recoilArgument = 1211,
			recoilTime = 0.5 }};
-------------------------------------------------------------------------------------------------
--   5inch turret 2
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T2'
GT.WS[ws].center = 'CENTER_TURRET_05'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 17;
GT.WS[ws].drawArgument2 = 18;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
	{math.rad(170), math.rad(0), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_2_1',
			recoilArgument = 1221,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_2_2',
			recoilArgument = 1222,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T2'
GT.WS[ws].center = 'CENTER_TURRET_05'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(170), math.rad(0), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_2_2',
			recoilArgument = 1222,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_2_1',
			recoilArgument = 1221,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 3
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T3'
GT.WS[ws].center = 'CENTER_TURRET_06'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 19;
GT.WS[ws].drawArgument2 = 20;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-0)
GT.WS[ws].angles = {
	{math.rad(-0), math.rad(-170), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_3_1',
			recoilArgument = 1231,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_3_2',
			recoilArgument = 1232,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T3'
GT.WS[ws].center = 'CENTER_TURRET_06'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-0), math.rad(-170), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_3_2',
			recoilArgument = 1232,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_3_1',
			recoilArgument = 1231,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 4
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T4'
GT.WS[ws].center = 'CENTER_TURRET_07'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 21;
GT.WS[ws].drawArgument2 = 22;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
	{math.rad(170), math.rad(0), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_4_1',
			recoilArgument = 1241,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_4_2',
			recoilArgument = 1242,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T4'
GT.WS[ws].center = 'CENTER_TURRET_07'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(170), math.rad(0), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_4_2',
			recoilArgument = 1242,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_4_1',
			recoilArgument = 1241,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 5
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T5'
GT.WS[ws].center = 'CENTER_TURRET_08'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 23;
GT.WS[ws].drawArgument2 = 24;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(-180), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_5_1',
			recoilArgument = 1251,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_5_2',
			recoilArgument = 1252,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T5'
GT.WS[ws].center = 'CENTER_TURRET_08'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-10), math.rad(-180), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_5_2',
			recoilArgument = 1252,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_5_1',
			recoilArgument = 1251,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 6
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T6'
GT.WS[ws].center = 'CENTER_TURRET_09'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 25;
GT.WS[ws].drawArgument2 = 26;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
	{math.rad(180), math.rad(10), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_6_1',
			recoilArgument = 1261,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_6_2',
			recoilArgument = 1262,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T6'
GT.WS[ws].center = 'CENTER_TURRET_09'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(180), math.rad(10), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_6_2',
			recoilArgument = 1262,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_6_1',
			recoilArgument = 1261,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 7
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T7'
GT.WS[ws].center = 'CENTER_TURRET_10'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 27;
GT.WS[ws].drawArgument2 = 28;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-90)
GT.WS[ws].angles = {
	{math.rad(-20), math.rad(-160), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_7_1',
			recoilArgument = 1271,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_7_2',
			recoilArgument = 1272,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T7'
GT.WS[ws].center = 'CENTER_TURRET_10'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-20), math.rad(-160), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_7_2',
			recoilArgument = 1272,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_7_1',
			recoilArgument = 1271,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 8
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T8'
GT.WS[ws].center = 'CENTER_TURRET_11'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 29;
GT.WS[ws].drawArgument2 = 30;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(90)
GT.WS[ws].angles = {
	{math.rad(160), math.rad(20), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_8_1',
			recoilArgument = 1281,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_8_2',
			recoilArgument = 1282,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T8'
GT.WS[ws].center = 'CENTER_TURRET_11'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(160), math.rad(20), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_8_2',
			recoilArgument = 1282,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_8_1',
			recoilArgument = 1281,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 9
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T9'
GT.WS[ws].center = 'CENTER_TURRET_12'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 31;
GT.WS[ws].drawArgument2 = 32;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(-180), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_9_1',
			recoilArgument = 1291,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_9_2',
			recoilArgument = 1292,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T9'
GT.WS[ws].center = 'CENTER_TURRET_12'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-10), math.rad(-180), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_9_2',
			recoilArgument = 1292,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_9_1',
			recoilArgument = 1291,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------------------------------
--   5inch turret 10
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T10'
GT.WS[ws].center = 'CENTER_TURRET_13'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 33;
GT.WS[ws].drawArgument2 = 34;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
	{math.rad(180), math.rad(10), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_10_1',
			recoilArgument = 1201,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_10_2',
			recoilArgument = 1202,
			recoilTime = 0.5 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'nj_5in38_mk32_T10'
GT.WS[ws].center = 'CENTER_TURRET_13'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(180), math.rad(10), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_10_2',
			recoilArgument = 1202,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_10_1',
			recoilArgument = 1201,
			recoilTime = 0.5 }};

-------------------------------------------------------------------------

GT.Name = "USS New Jersey" -- folder name for Liveries
GT.DisplayName = _("[VWV] BB-62 USS New Jersey 1968") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Big J") -- Label name
GT.Rate = 61000.000000 

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR", "long-range air defence optics"}, --optics types
				RADAR = {"ticonderoga search radar"}, --radar types
			};
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 15;
GT.sensor.max_range_finding_target = 500;
----------------------------------------------------
GT.DetectionRange  	= GT.airFindDist;
GT.ThreatRange 		= GT.airWeaponDist;
GT.Singleton		= "no";
GT.mapclasskey		= "P0091000066"; --map icon >>MissionEditor\data\NewMap\images P00910000114514 for BB symbol
GT.attribute		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"Aircraft Carriers", 
						"AircraftCarrier", 
						"Cruisers",
						"RADAR_BAND1_FOR_ARM",
						"DetectionByAWACS",
};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
	{name = "Armed Ship"}, -- has weapons
	{name = "AircraftCarrier"}
};
				
-- categories in the mission editor 
GT.tags  = 
{
	"Battleship",
};
