-- Ship template by Joey45 edit as you see fit 
-- USS Maddox 65 by TeTeT

GT = {};
-- dofile(current_mod_path..'/scripts/ShipnameRunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "maddox_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 1000; -- hit points
GT.mass = 11339.809; -- KGs
GT.max_velocity = 14.4 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13,000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 115 -- o.a in meters
GT.Width = 13.16 --15 --meters
GT.Height = 18.5 --335.226 from sea level I think
GT.Length = 115 -- deck length I think
GT.DeckLevel = 3 -- height of deck
GT.X_nose = 57.0 -- bow wave
GT.X_tail = -57.5 -- wake
GT.Tail_Width = 8 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 300 -- turn radius

GT.RCS = 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9 -- new in 2.7 not sure the params


GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry

GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 10000

-- smoke density and position
GT.exhaust = {
	[1] = { size = 0.60, pos = {6.65, 14, -0.27}},
	[2] = { size = 0.60, pos = {-7.34, 13, -0.27}}
}

GT.animation_arguments = {
	water_propeller = 6,
	radar1_rotation = 7,
	radar2_rotation = 8
}
GT.radar1_period = 5; --speed
GT.radar2_period = 30; 

--Damage Model
GT.DM = {
	{ area_name = "TurretFront", area_arg = 71, area_life = 200},
	{ area_name = "TurretRear", area_arg = 72, area_life = 100},
	{ area_name = "HullFront", area_arg = 73, area_life = 500},
	{ area_name = "HullRear", area_arg = 74, area_life = 500},
}


GT.airWeaponDist = 58000  -- Max engagement range air threats (meters)
GT.airFindDist = 58000 -- Max detenction range air threats (meters)

--Radar info
GT.WS = {};
GT.WS.maxTargetDetectionRange = 450000;
GT.WS.radar_type = 102;
GT.WS.searchRadarMaxElevation = math.rad(90);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}};

--Test Optical 
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000;
GT.WS.radar_type = 109 --optical in wstypes
GT.WS.searchRadarMaxElevation = math.rad(90);
local ws;

-- weapon systems goes here
-- we will use the https://en.wikipedia.org/wiki/5-inch/38-caliber_gun as main armament
-- dcs-lua-datamine _G["db"]["Units"]["GT_t"]["LN_t"]["Mk12_5in38cal"] 

GT_t.WS_t.ship_mk12_2x127mm = {name = "Mk12 5inch 38cal Twin"};
GT_t.WS_t.ship_mk12_2x127mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
                    };
GT_t.WS_t.ship_mk12_2x127mm.omegaY = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.omegaZ = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.reference_angle_Z = 0
GT_t.WS_t.ship_mk12_2x127mm.LN = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1] = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1].type = 12
GT_t.WS_t.ship_mk12_2x127mm.LN[1].distanceMin = 10
GT_t.WS_t.ship_mk12_2x127mm.LN[1].distanceMax = 56000 -- effective shooting
GT_t.WS_t.ship_mk12_2x127mm.LN[1].max_trg_alt = 11300
GT_t.WS_t.ship_mk12_2x127mm.LN[1].reactionTime = 1
GT_t.WS_t.ship_mk12_2x127mm.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_mk12_2x127mm.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_mk12_2x127mm.LN[1].sensor, GT_t.WSN_t[1])
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1] = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].ammo_capacity = 352;
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].shell_name = { "127_Mk49_AAC_1", "127_Mk49_AAC_2", "127_Mk49_HC_1", "127_Mk49_HC_2" };
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].shell_display_name = "127mm";
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].shot_delay = 2;
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].reload_time = 15000000; -- never
GT_t.WS_t.ship_mk12_2x127mm.LN[1].BR =
{ {
    pos = { 5.2, 0, -0.1 }
}, {
    pos = { 5.2, 0, 0.1 }
} }

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'TurretFront'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-5), math.rad(75)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR =
					{
						{
							connector_name = 'POINT_GUN_127mm_1_1',
						},
						{
							connector_name = 'POINT_GUN_127mm_1_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'TurretFront'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].drawArgument1 = 2
GT.WS[ws].drawArgument2 = 3
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-5), math.rad(75)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_GUN_127mm_2_1',
						},
						{
							connector_name = 'POINT_GUN_127mm_2_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'TurretRear'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].drawArgument1 = 4
GT.WS[ws].drawArgument2 = 5
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-5), math.rad(75)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_GUN_127mm_3_1',
						},
						{
							connector_name = 'POINT_GUN_127mm_3_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'HullRear'
GT.WS[ws].center = 'CENTER_TURRET_04'
GT.WS[ws].drawArgument1 = 9
GT.WS[ws].drawArgument2 = 10
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_20mm_1',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'HullRear'
GT.WS[ws].center = 'CENTER_TURRET_05'
GT.WS[ws].drawArgument1 = 11
GT.WS[ws].drawArgument2 = 12
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_20mm_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'HullRear'
GT.WS[ws].center = 'CENTER_TURRET_06'
GT.WS[ws].drawArgument1 = 13
GT.WS[ws].drawArgument2 = 14
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_20mm_3',
						}
					};


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

GT.Name = "USS Maddox" -- folder name for Liveries
GT.DisplayName = _("USS Maddox (DD-731)") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Maddox") -- Label name
GT.Rate = 5500.000000 

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR", "long-range air defence optics"}, --optics types
                RADAR = {"ticonderoga search radar"}, --radar types
            };
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 15;
GT.sensor.max_range_finding_target = 500;
----------------------------------------------------
GT.DetectionRange	= 20000;
GT.ThreatRange		= 12000;
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
}
