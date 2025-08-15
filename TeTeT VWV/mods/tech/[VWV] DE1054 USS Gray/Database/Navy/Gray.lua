-- Ship template by Joey45 edit as you see fit
-- USS Gray 73 by James J. Jackson

GT = {};
dofile(current_mod_path..'/Database/scripts/Gray_RunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "Gray_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 3000; -- hit points
GT.mass = 4130000.0; -- KGs
GT.max_velocity = 13.89; --M/S
GT.race_velocity = 14.25; --M/S
GT.economy_velocity = 7.7; --M/S 
GT.economy_distance = 12000; -- KM
GT.race_distance = 2.778e+006;
GT.shipLength = 134; -- o.a in meters
GT.Width = 14; --15 --meters
GT.Height = 18.5; --335.226 from sea level I think
GT.Length = 134; -- deck length I think
GT.DeckLevel = 3; -- height of deck
GT.X_nose = 64.0;-- bow wave
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

-- Aircraft complement
GT.numParking		= 1;
GT.Plane_Num_		= 0;
GT.Helicopter_Num_	= 1;
GT.Landing_Point = {-44.375,6.566,0};

-- smoke density and position
--GT.exhaust = {
--	[1] = { size = 0.60, pos = {9.654,  17.13, 0}},
--	[2] = { size = 0.60, pos = {-8.024, 15.01, 0}}
--};

GT.animation_arguments = {
	nav_lights = 0,
	water_propeller = 1,
	radar1_rotation = 2,
	radar2_rotation = 3,
	radar3_rotation = 4,
};
GT.radar1_period = 2; --speed
GT.radar2_period = 4;
GT.radar3_period = 4;

--Damage Model
GT.DM = {
	{ area_name = "Hull", area_arg = 1001, area_life = 500},
	{ area_name = "SuperStructure", area_arg = 1002, area_life = 500},
	{ area_name = "kx_t1", area_arg = 1003, area_life = 100},
	{ area_name = "kx_t2", area_arg = 1004, area_life = 100},
	{ area_name = "kx_t3", area_arg = 1005, area_life = 100},
	{ area_name = "FlightDeck", area_arg = 1006, area_life = 100},
};

GT.airWeaponDist = 18650.0;  -- Max engagement range air threats (meters)
GT.airFindDist = 45000; -- Max detenction range air threats (meters)

-- weapon systems
GT.WS = {}
GT.WS.maxTargetDetectionRange = 250000;
GT.WS.radar_type = 102
GT.WS.searchRadarMaxElevation = math.rad(60);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}}

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
GT_t.LN_t.ship_mk42_127mm_AIR.distanceMax = 14155
GT_t.LN_t.ship_mk42_127mm_AIR.max_trg_alt = 15728
GT_t.LN_t.ship_mk42_127mm_AIR.reactionTime = 2
GT_t.LN_t.ship_mk42_127mm_AIR.sensor = {}
-- set_recursive_metatable(GT_t.LN_t.ship_mk42_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk42_127mm_AIR.sensor, GT_t.WSN_t[20])
GT_t.LN_t.ship_mk42_127mm_AIR.PL = {}
GT_t.LN_t.ship_mk42_127mm_AIR.PL[1] = {
							shell_name = {"vwv_gra_mk42_127mm_AIR"},
							automaticLoader = true,
							shot_delay = 2.1428,
							ammo_capacity = 352,
						}

GT_t.LN_t.ship_mk42_127mm = {}
GT_t.LN_t.ship_mk42_127mm.type = 6
GT_t.LN_t.ship_mk42_127mm.distanceMin = 20
GT_t.LN_t.ship_mk42_127mm.distanceMax = 23691
GT_t.LN_t.ship_mk42_127mm.max_trg_alt = 8534
GT_t.LN_t.ship_mk42_127mm.reactionTime = 12
GT_t.LN_t.ship_mk42_127mm.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk42_127mm.sensor, GT_t.WSN_t[10])
GT_t.LN_t.ship_mk42_127mm.PL = {}
GT_t.LN_t.ship_mk42_127mm.PL[1] = {
							-- unclear why the 127_Mk49 shells not work
							shell_name = {"MK45_127"}, --shell_name = { "127_Mk49_HC_1", "127_Mk49_HC_2" },
							automaticLoader = true,
							shot_delay = 2.1428,
							ammo_capacity = 352,
						}


-------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'kx_t1'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 101;
GT.WS[ws].drawArgument2 = 102;
GT.WS[ws].reference_angle_Z = math.rad(5)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-15), math.rad(85)},
                    };
-- first set of launchers

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1',
							recoilArgument = 1111,
							recoilTime = 0.4 }};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk42_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1',
							recoilArgument = 1111,
							recoilTime = 0.4 }};

-------------------------------------------------------------------------------------------------
--   ASROC  
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_HARPOON )
GT.WS[ws].area = 'kx_t2'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].drawArgument1 = 201
GT.WS[ws].drawArgument2 = 202
GT.WS[ws].angles = {
					{math.rad(120), math.rad(-120), math.rad(0), math.rad(45)},
					};
GT.WS[ws].omegaY = math.rad(8);
GT.WS[ws].omegaZ = math.rad(8);
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].LN[1].launch_delay = 12;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 16;
GT.WS[ws].LN[1].show_external_missile = true 
GT.WS[ws].LN[1].max_number_of_missiles_channels = 8;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'ASROC_1', recoilArgument = 211, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_2', recoilArgument = 212, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_3', recoilArgument = 213, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_4', recoilArgument = 214, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_5', recoilArgument = 215, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_6', recoilArgument = 216, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_7', recoilArgument = 217, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
	{connector_name = 'ASROC_8', recoilArgument = 218, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1, recoilTime = 2},
					};

-------------------------------------------------------------------------------------------------
--   SEA SPARROW  
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.seasparrow )
GT.WS[ws].area = 'kx_t3'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].drawArgument1 = 219
GT.WS[ws].drawArgument2 = 220
GT.WS[ws].angles = {
					{math.rad(-45), math.rad(45), math.rad(0), math.rad(45)},
					};
GT.WS[ws].omegaY = math.rad(8);
GT.WS[ws].omegaZ = math.rad(8);
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].LN[1].launch_delay = 12;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 8;
GT.WS[ws].LN[1].show_external_missile = true 
GT.WS[ws].LN[1].max_number_of_missiles_channels = 8;
GT.WS[ws].LN[1].BR = {
						{connector_name = 'SP_1', drawArgument = 221},
						{connector_name = 'SP_2', drawArgument = 222},
						{connector_name = 'SP_3', drawArgument = 223},
						{connector_name = 'SP_4', drawArgument = 224},
						{connector_name = 'SP_5', drawArgument = 225},
						{connector_name = 'SP_6', drawArgument = 226},
						{connector_name = 'SP_7', drawArgument = 227},
						{connector_name = 'SP_8', drawArgument = 228},
					}
-------------------------------------------------------------------------------------------------
--   Torpedos
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable( GT.WS[ws], GT_t.WS_t.ship_mk46 );
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_02', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_03', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_04', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
};
GT.WS[ws].LN[1].show_external_missile = false
-------------------------------------------------------------------------

GT.Name = "USS Gray"; -- folder name for Liveries
GT.DisplayName = _("[VWV] DE-1054 USS Gray"); -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Knox class (DASH/BPDMS)"); -- Label name
GT.Rate = 3000.000000;

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR", "long-range air defence optics"}, --optics types
                RADAR = {"ticonderoga search radar"}, --radar types
};
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 28.8;
GT.sensor.max_range_finding_target = 500;
----------------------------------------------------
GT.DetectionRange  	= GT.airFindDist;
GT.ThreatRange 		= GT.airWeaponDist;
GT.Singleton		= "yes";
GT.mapclasskey		= "P0091000070"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"Frigate",
						"RADAR_BAND1_FOR_ARM",
						"DetectionByAWACS",
					"HeavyArmoredUnits",
					"Heavy armed ships", 
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "Armed Ship"},
						{name = "HelicopterCarrier"}
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Frigate",
};
