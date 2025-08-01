-- Ship template by Joey45 edit as you see fit
-- USS Allen M. Sumner 64 by James J Jackson

GT = {};
dofile(current_mod_path..'/Database/scripts/sumner_RunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "sumner_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 2200; -- hit points
GT.mass = 2200000.0; -- KGs
GT.max_velocity = 17.49111 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 115 -- o.a in meters
GT.Width = 13.16 --15 --meters
GT.Height = 18.5 --335.226 from sea level I think
GT.Length = 115 -- deck length I think
GT.DeckLevel = 3 -- height of deck
GT.X_nose = 56.0 -- bow wave
GT.X_tail = -57.5 -- wake
GT.Tail_Width = 8 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 300; -- turn radius

GT.RCS = 100000; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 150;

-- Aircraft complement
GT.numParking		= 1;
GT.Plane_Num_		= 0;
GT.Helicopter_Num_	= 1;
GT.Landing_Point = {-30.01,	5.961, 0};

-- smoke density and position
GT.exhaust = {
	[1] = { size = 0.60, pos = {6.65, 16.5, -0.27}},
	[2] = { size = 0.60, pos = {-7.34, 14.6, -0.27}}
};

GT.animation_arguments = {
	water_propeller = 6,
	radar1_rotation = 7,
	radar2_rotation = 8,
	nav_lights = 901,
};
GT.radar1_period = 4; --speed
GT.radar2_period = 4;

--Damage Model
GT.DM = {
	{ area_name = "FlightDeck", area_arg = 71, area_life = 50},
	{ area_name = "Turret_1", area_arg = 71, area_life = 100},
	{ area_name = "Turret_2", area_arg = 72, area_life = 100},
	{ area_name = "Turret_3", area_arg = 73, area_life = 100},
	{ area_name = "HullFront", area_arg = 74, area_life = 500},
	{ area_name = "HullRear", area_arg = 75, area_life = 500},
	{ area_name = "SuperStructure", area_arg = 76, area_life = 100},
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
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMax = 16642;
GT_t.LN_t.ship_mk12_127mm_AIR.max_trg_alt = 11339;
GT_t.LN_t.ship_mk12_127mm_AIR.reactionTime = 12;
GT_t.LN_t.ship_mk12_127mm_AIR.sensor = {};
-- set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[20]);
GT_t.LN_t.ship_mk12_127mm_AIR.PL = {};
GT_t.LN_t.ship_mk12_127mm_AIR.PL[1] = {
	shell_name = {"vwv_sumner_mk12_127mm_AIR"},
	automaticLoader = false,
	shot_delay = 5,
	ammo_capacity = 352,
};

GT_t.LN_t.ship_mk12_127mm = {}
GT_t.LN_t.ship_mk12_127mm.type = 6
GT_t.LN_t.ship_mk12_127mm.distanceMin = 20
--GT_t.LN_t.ship_mk12_127mm.distanceMax = 16642
--GT_t.LN_t.ship_mk12_127mm.max_trg_alt = 11339
GT_t.LN_t.ship_mk12_127mm.reactionTime = 12
GT_t.LN_t.ship_mk12_127mm.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm.sensor, GT_t.WSN_t[10])
GT_t.LN_t.ship_mk12_127mm.PL = {}
GT_t.LN_t.ship_mk12_127mm.PL[1] = {
	-- unclear why the 127_Mk49 shells not work
	shell_name = {"MK45_127"}, --shell_name = { "127_Mk49_HC_1", "127_Mk49_HC_2" },
	automaticLoader = false,
	shot_delay = 5,
	ammo_capacity = 352,
};

GT_t.WS_t.ship_sumner_oerlikon_20mm = { name = "Laffey Oerlikon 20mm"};
GT_t.WS_t.ship_sumner_oerlikon_20mm.angles = {
	{math.rad(180), math.rad(-180), math.rad(-15), math.rad(85)},
};
GT_t.WS_t.ship_sumner_oerlikon_20mm.omegaY = math.rad(10); -- Block 1B
GT_t.WS_t.ship_sumner_oerlikon_20mm.omegaZ = math.rad(10); -- Block 1B
GT_t.WS_t.ship_sumner_oerlikon_20mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_sumner_oerlikon_20mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_sumner_oerlikon_20mm.reference_angle_Z = 0;

GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR = {};
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.type = 3;
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.distanceMin = 20;
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.distanceMax = 4341;
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.max_trg_alt = 3083;
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.reactionTime = 6;
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.sensor = {};
set_recursive_metatable(GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.sensor, GT_t.WSN_t[20]);
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.reload_time = 20;
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.PL = {};
GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR.PL[1] = {
	shell_name = { "vwv_sumner_oerlikon_20mm_AIR" },
	shot_delay = 0.1333,
	shot_delay_lofi = 0.24,
	ammo_capacity = 300,
	portionAmmoCapacity = 60,
	reload_time = 20,
};

--------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'Turret_1'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].angles = {
	{math.rad(140), math.rad(-140), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1_1',
							recoilArgument = 33,
							recoilTime = 0.2 }};
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1_2',
							recoilArgument = 33,
							recoilTime = 0.2 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'Turret_1'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(140), math.rad(-140), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1_2',
							recoilArgument = 33,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_1_1',
							recoilArgument = 33,
							recoilTime = 0.2 }}

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'Turret_2'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].drawArgument1 = 2
GT.WS[ws].drawArgument2 = 3
GT.WS[ws].reference_angle_Z = math.rad(0)
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(140), math.rad(-140), math.rad(-10), math.rad(85)},

					};
-- first set of launchers					
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_2_1',
							recoilArgument = 33,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_2_2',
							recoilArgument = 33,
							recoilTime = 0.2 }}

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'Turret_2'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(140), math.rad(-140), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_2_2',
							recoilArgument = 33,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_2_1',
							recoilArgument = 33,
							recoilTime = 0.2 }}

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'Turret_3'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 4
GT.WS[ws].drawArgument2 = 5
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].angles = {
					{math.rad(-45), math.rad(45), math.rad(-10), math.rad(85)},
					};
-- first set of launchers					
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_3_1',
							recoilArgument = 33,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_3_2',
							recoilArgument = 33,
							recoilTime = 0.2 }}

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'Turret_3'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].angles = {
					{math.rad(140), math.rad(-140), math.rad(-10), math.rad(85)},
					};
GT.WS[ws].reference_angle_Z = math.rad(0);
-- second set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_3_2',
							recoilArgument = 33,
							recoilTime = 0.2 }};
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_127mm_3_1',
							recoilArgument = 33,
							recoilTime = 0.2 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_sumner_oerlikon_20mm)
GT.WS[ws].area = 'HullRear'
GT.WS[ws].center = 'CENTER_TURRET_04'
GT.WS[ws].drawArgument1 = 11
GT.WS[ws].drawArgument2 = 12
GT.WS[ws].reference_angle_Y = math.rad(-90)
GT.WS[ws].angles = {
					{math.rad(-20), math.rad(-175), math.rad(-5), math.rad(85)},
--					{math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--					{math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
					};
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_20mm_1',
							recoilArgument = 33,
							recoilTime = 0.2 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_sumner_oerlikon_20mm)
GT.WS[ws].area = 'HullRear'
GT.WS[ws].center = 'CENTER_TURRET_05'
GT.WS[ws].drawArgument1 = 13
GT.WS[ws].drawArgument2 = 14
GT.WS[ws].reference_angle_Y = math.rad(90)
GT.WS[ws].angles = {
					{math.rad(135), math.rad(10), math.rad(-5), math.rad(85)},
--					{math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--					{math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
					};
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_sumner_oerlikon_20mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_20mm_2',
							recoilArgument = 33,
							recoilTime = 0.2 }};

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable( GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].area = 'HullFront'
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_02', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_03', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_04', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
};
GT.WS[ws].LN[1].show_external_missile = false

-------------------------------------------------------------------------

GT.Name = "USS Sumner" -- folder name for Liveries
GT.DisplayName = _("[VWV] DD-692 USS Allen M. Sumner") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Sumner") -- Label name
GT.Rate = 2200.000000 

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
GT.mapclasskey		= "P0091000068"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"Cruisers",
						"RADAR_BAND1_FOR_ARM",
						"DetectionByAWACS",
};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
	{name = "Armed Ship"}, -- has weapons
	{name = "HelicopterCarrier"}
};
				
-- categories in the mission editor 
GT.tags  = 
{
	"Destroyer",
};
