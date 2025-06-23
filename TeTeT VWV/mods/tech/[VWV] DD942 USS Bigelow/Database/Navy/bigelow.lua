-- Ship template by Joey45 edit as you see fit
-- USS Bigelow 67 by James J. Jackson

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "bigelow_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 2800; -- hit points
GT.mass = 2800000.0; -- KGs
GT.max_velocity = 16.719444; --M/S
GT.race_velocity = 14.1; --M/S
GT.economy_velocity = 7.7; --M/S 
GT.economy_distance = 12000; -- KM
GT.race_distance = 2.778e+006;
GT.shipLength = 127; -- o.a in meters
GT.Width = 14; --15 --meters
GT.Height = 18.5; --335.226 from sea level I think
GT.Length = 124; -- deck length I think
GT.DeckLevel = 3; -- height of deck
GT.X_nose = 62.0;-- bow wave
GT.X_tail = -57.5; -- wake
GT.Tail_Width = 8; --wake width
GT.Gamma_max = 0.35; -- no idea
GT.Om = 0.05; --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 300; -- turn radius

GT.RCS = 100000; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 170;

-- smoke density and position
GT.exhaust = {
	[1] = { size = 0.60, pos = {9.654,  17.13, 0}},
	[2] = { size = 0.60, pos = {-8.024, 15.01, 0}}
};

GT.animation_arguments = {
	water_propeller = 13,
	radar1_rotation = 11,
	radar2_rotation = 12,
	nav_lights = 0,
};
GT.radar1_period = 4; --speed
GT.radar2_period = 4;

--Damage Model
GT.DM = {
	{ area_name = "Hull", area_arg = 1001, area_life = 500},
	{ area_name = "SuperStructure", area_arg = 1002, area_life = 500},
	{ area_name = "fs_t1", area_arg = 1003, area_life = 100},
	{ area_name = "fs_t2", area_arg = 1004, area_life = 100},
	{ area_name = "fs_t3", area_arg = 1005, area_life = 100},
	{ area_name = "mk33_mount_JJJ_1", area_arg = 1006, area_life = 80},
	{ area_name = "mk33_mount_JJJ_1.001", area_arg = 1007, area_life = 80},
};

GT.airWeaponDist = 18650.0;  -- Max engagement range air threats (meters)
GT.airFindDist = 45000; -- Max detenction range air threats (meters)

--Radar info
GT.WS = {};
GT.WS.maxTargetDetectionRange = GT.airFindDist+10000;
GT.WS.radar_type = 102;
GT.WS.searchRadarMaxElevation = math.rad(90);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}};

--Test Optical
GT.WS = {}
GT.WS.maxTargetDetectionRange = 45000;
GT.WS.radar_type = 109 --optical in wstypes
GT.WS.searchRadarMaxElevation = math.rad(90);
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

GT_t.WS_t.ship_mk42_1x127mm = {name = "Mk42 5inch 54cal"};
GT_t.WS_t.ship_mk42_1x127mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(85)},
                    };
GT_t.WS_t.ship_mk42_1x127mm.omegaY = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk42_1x127mm.omegaZ = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk42_1x127mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk42_1x127mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk42_1x127mm.reference_angle_Z = 0


GT_t.LN_t.ship_mk42_127mm_AIR = {}
GT_t.LN_t.ship_mk42_127mm_AIR.type = 11
GT_t.LN_t.ship_mk42_127mm_AIR.distanceMin = 20
GT_t.LN_t.ship_mk42_127mm_AIR.distanceMax = 16642
GT_t.LN_t.ship_mk42_127mm_AIR.max_trg_alt = 11339
GT_t.LN_t.ship_mk42_127mm_AIR.reactionTime = 12
GT_t.LN_t.ship_mk42_127mm_AIR.sensor = {}
-- set_recursive_metatable(GT_t.LN_t.ship_mk42_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk42_127mm_AIR.sensor, GT_t.WSN_t[20])
GT_t.LN_t.ship_mk42_127mm_AIR.PL = {}
GT_t.LN_t.ship_mk42_127mm_AIR.PL[1] = {
							shell_name = {"vwv_bigelow_mk42_127mm_AIR"},
							automaticLoader = true,
							shot_delay = 1.5,
							ammo_capacity = 352,
						}

GT_t.LN_t.ship_mk42_127mm = {}
GT_t.LN_t.ship_mk42_127mm.type = 6
GT_t.LN_t.ship_mk42_127mm.distanceMin = 20
--GT_t.LN_t.ship_mk42_127mm.distanceMax = 16642
--GT_t.LN_t.ship_mk42_127mm.max_trg_alt = 11339
GT_t.LN_t.ship_mk42_127mm.reactionTime = 12
GT_t.LN_t.ship_mk42_127mm.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk42_127mm.sensor, GT_t.WSN_t[10])
GT_t.LN_t.ship_mk42_127mm.PL = {}
GT_t.LN_t.ship_mk42_127mm.PL[1] = {
							-- unclear why the 127_Mk49 shells not work
							shell_name = {"MK45_127"}, --shell_name = { "127_Mk49_HC_1", "127_Mk49_HC_2" },
							automaticLoader = true,
							shot_delay = 1.5,
							ammo_capacity = 352,
						}

GT_t.WS_t.ship_mk33_76mm = { name = "Mk33 3 inch"};
GT_t.WS_t.ship_mk33_76mm.angles = {
	{math.rad(180), math.rad(-180), math.rad(-15), math.rad(85)},
	};
GT_t.WS_t.ship_mk33_76mm.omegaY = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk33_76mm.omegaZ = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk33_76mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk33_76mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk33_76mm.reference_angle_Z = 0

GT_t.LN_t.ship_mk33_76mm_AIR = {};
GT_t.LN_t.ship_mk33_76mm_AIR.type = 11
GT_t.LN_t.ship_mk33_76mm_AIR.distanceMin = 20
GT_t.LN_t.ship_mk33_76mm_AIR.distanceMax = 13341
GT_t.LN_t.ship_mk33_76mm_AIR.max_trg_alt = 9083
GT_t.LN_t.ship_mk33_76mm_AIR.reactionTime = 15
GT_t.LN_t.ship_mk33_76mm_AIR.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk33_76mm_AIR.sensor, GT_t.WSN_t[20])
GT_t.LN_t.ship_mk33_76mm_AIR.PL = {}
GT_t.LN_t.ship_mk33_76mm_AIR.PL[1] = {
							shell_name = {"vwv_bigelow_mk33_76mm_AIR"},
							automaticLoader = false,
							shot_delay = 1.3333,
							ammo_capacity = 352,
						};

-------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'fs_t1'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 1;
GT.WS[ws].drawArgument2 = 2;
GT.WS[ws].reference_angle_Z = math.rad(5)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-15), math.rad(85)},
                    };
-- first set of launchers

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1',
							recoilArgument = 33,
							recoilTime = 0.2 }};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1',
							recoilArgument = 33,
							recoilTime = 0.2 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'fs_t2'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-45), math.rad(45), math.rad(-15), math.rad(85)},
                    };
GT.WS[ws].drawArgument1 = 3;
GT.WS[ws].drawArgument2 = 4;
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].reference_angle_Y = math.rad(-180)
-- second set of launchers

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_2',
							recoilArgument = 33,
							recoilTime = 0.2 }};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_2',
							recoilArgument = 33,
							recoilTime = 0.2 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'fs_t3'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(-45), math.rad(45), math.rad(-15), math.rad(85)},
                    };
GT.WS[ws].drawArgument1 = 5;
GT.WS[ws].drawArgument2 = 6;
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].reference_angle_Y = math.rad(-180)
-- third set of launchers

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_3',
							recoilArgument = 33,
							recoilTime = 0.2 }};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_3',
							recoilArgument = 33,
							recoilTime = 0.2 }};
							

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk33_76mm);
GT.WS[ws].area = 'mk33_mount_JJJ_1';
GT.WS[ws].center = 'CENTER_TURRET_04';
GT.WS[ws].drawArgument1 = 7;
GT.WS[ws].drawArgument2 = 8;
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(0), math.rad(85)},
                    };
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk33_76mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_3inch_1_1',
			recoilArgument = 33,
			recoilTime = 0.2 },
		   { connector_name = 'POINT_GUN_3inch_1_2',
			recoilArgument = 33,
			recoilTime = 0.2 }};
							
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk33_76mm);
GT.WS[ws].area = 'mk33_mount_JJJ_1.001';
GT.WS[ws].center = 'CENTER_TURRET_05';
GT.WS[ws].drawArgument1 = 9;
GT.WS[ws].drawArgument2 = 10;
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
	{math.rad(-45), math.rad(45), math.rad(0), math.rad(85)},
};
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk33_76mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_3inch_2_1',
			recoilArgument = 33,
			recoilTime = 0.2 },
		   { connector_name = 'POINT_GUN_3inch_2_2',
			recoilArgument = 33,
			recoilTime = 0.2 }};


-------------------------------------------------- Torpedo Launcher-------------------------------------------------------------
-- Mark 32 Surface Vessel Torpedo Tubes

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk46 );
GT.WS[ws].area = 'SuperStructure';
GT.WS[ws].center = 'CENTER_TURRET_06';
GT.WS[ws].drawArgument1 = 501;
GT.WS[ws].drawArgument2 = 503;
GT.WS[ws].angles = {{math.rad (-20), math.rad (-160), math.rad(0), math.rad(0)},}
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].LN[1].launch_delay = 1;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01' }, 
	{connector_name = 'TPO_02' }, 
	{connector_name = 'TPO_03' }, 
}
GT.WS[ws].LN[1].customViewPoint = { "genericMissile", {-2.0, 0.75, 0.0}, }; 

-- ======================================================================================

-- Mark 32 Surface Vessel Torpedo Tubes

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk46 );
GT.WS[ws].area = 'SuperStructure';
GT.WS[ws].center = 'CENTER_TURRET_07';
GT.WS[ws].drawArgument1 = 502;
GT.WS[ws].drawArgument2 = 504;
GT.WS[ws].angles = {{math.rad (160), math.rad (20), math.rad(0), math.rad(0)},}
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].LN[1].launch_delay = 1;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_04' },  
	{connector_name = 'TPO_05' },  
	{connector_name = 'TPO_06' },  
}
GT.WS[ws].LN[1].customViewPoint = { "genericMissile", {-2.0, 0.75, 0.0}, }; 



-------------------------------------------------------------------------

GT.Name = "USS Bigelow"; -- folder name for Liveries
GT.DisplayName = _("USS Bigelow (DD-942)"); -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Bigelow"); -- Label name
GT.Rate = 2800.000000;

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
GT.Singleton		= "yes";
GT.mapclasskey		= "P0091000068"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"Cruisers",
						"RADAR_BAND1_FOR_ARM",
						"DetectionByAWACS",
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "Armed Ship"} -- has weapons
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Destroyer",
};
