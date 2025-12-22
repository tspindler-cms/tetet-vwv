-- USS Oklahoma City 67 by James J. Jackson

GT = {};
dofile(current_mod_path..'/Database/scripts/OKC_RunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "OKC_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 5500; -- hit points
GT.mass = 14358000; -- KGs
GT.max_velocity = 16.719 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 218.39 -- o.a in meters
GT.Width = 22.22 --meters
GT.Height = 50.237 --from sea level I think
GT.Length = 185.95 -- deck length I think
GT.DeckLevel = 7.2127 -- height of deck
GT.X_nose = 91.549 -- bow wave
GT.X_tail = -58 -- wake
GT.Tail_Width = 26 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 300; -- turn radius

GT.RCS = 1000000; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 130;

-- Aircraft complement
GT.numParking		= 1;
GT.Plane_Num_		= 0;
GT.Helicopter_Num_	= 1;
GT.Landing_Point = {-79.556,6.69,0};

-- smoke density and position
GT.exhaust = {
	[1] = { size = 0.20, pos = {4.0163, 23.819, 0}},
	[2] = { size = 0.20, pos = {-8.8353, 23.85, 0}}
};

GT.animation_arguments = {
	nav_lights = 0,
	radar1_rotation = 23,
	radar2_rotation = 24,
	radar3_rotation = 25,
	water_propeller = 26,
};
GT.radar1_period = 2.7; --speed
GT.radar2_period = 4;
GT.radar3_period = 5;

--Damage Model
GT.DM = {
	{ area_name = "FlightDeck", area_arg = 70, area_life = 50},
	{ area_name = "Turret_1", area_arg = 71, area_life = 100},
	{ area_name = "Turret_2", area_arg = 72, area_life = 100},
	{ area_name = "Turret_3", area_arg = 73, area_life = 100},
	{ area_name = "hull", area_arg = 74, area_life = 500},
	{ area_name = "Bridge", area_arg = 75, area_life = 100},
	{ area_name = "Mid_superstructure", area_arg = 76, area_life = 100},
	{ area_name = "Rear_superstructure", area_arg = 77, area_life = 100},
};

GT.airWeaponDist = 14630.0;  -- Max engagement range air threats (meters)
GT.airFindDist = 130000; -- Max detenction range air threats (meters)


--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 56000;
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
--   Mk16 6inch Ammo 
-------------------------------------------------------------------------------------------------
GT_t.WS_t.ship_6inch_47 = {name = "6Inch 152/47"}
GT_t.WS_t.ship_6inch_47.angles = {
					{math.rad(140), math.rad(-140), math.rad(-4), math.rad(60)},
					};
GT_t.WS_t.ship_6inch_47.omegaY = 0.6
GT_t.WS_t.ship_6inch_47.omegaZ = 0.6
GT_t.WS_t.ship_6inch_47.reference_angle_Z = 0
GT_t.WS_t.ship_6inch_47.LN = {}
GT_t.WS_t.ship_6inch_47.LN[1] = {}
GT_t.WS_t.ship_6inch_47.LN[1].type = 6
GT_t.WS_t.ship_6inch_47.LN[1].distanceMin = 50
GT_t.WS_t.ship_6inch_47.LN[1].distanceMax = 21381;
GT_t.WS_t.ship_6inch_47.LN[1].max_trg_alt = 7689
GT_t.WS_t.ship_6inch_47.LN[1].reactionTime = 10
GT_t.WS_t.ship_6inch_47.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_6inch_47.LN[1].sensor, GT_t.WSN_t[10])
GT_t.WS_t.ship_6inch_47.LN[1].PL = {}
GT_t.WS_t.ship_6inch_47.LN[1].PL[1] = {}
GT_t.WS_t.ship_6inch_47.LN[1].PL[1].ammo_capacity = 600
GT_t.WS_t.ship_6inch_47.LN[1].PL[1].shell_name = {"jjj_OKC_mk16_152mm_HC"};


GT_t.WS_t.ship_6inch_47.LN[1].PL[1].shot_delay = 6 
GT_t.WS_t.ship_6inch_47.LN[1].automaticLoader = false;
GT_t.WS_t.ship_6inch_47.LN[1].reload_time = 240 * 20
GT_t.WS_t.ship_6inch_47.LN[1].BR = { {pos = {8, 0, 0.1} }, {pos = {8, 0, 0.0} }, {pos = {8, 0, -0.1} } }

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
GT_t.LN_t.ship_mk12_127mm_AIR.reactionTime = 6;
GT_t.LN_t.ship_mk12_127mm_AIR.sensor = {};
-- set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[20]);
GT_t.LN_t.ship_mk12_127mm_AIR.PL = {};
GT_t.LN_t.ship_mk12_127mm_AIR.PL[1] = {
	shell_name = {"jjj_OKC_mk12_127mm_AIR"},
	automaticLoader = false,
	shot_delay = 3,
	ammo_capacity = 352,
};

GT_t.LN_t.ship_mk12_127mm = {}
GT_t.LN_t.ship_mk12_127mm.type = 6
GT_t.LN_t.ship_mk12_127mm.distanceMin = 20
GT_t.LN_t.ship_mk12_127mm.distanceMax = 16642
GT_t.LN_t.ship_mk12_127mm.max_trg_alt = 5410
GT_t.LN_t.ship_mk12_127mm.reactionTime = 6
GT_t.LN_t.ship_mk12_127mm.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm.sensor, GT_t.WSN_t[10])
GT_t.LN_t.ship_mk12_127mm.PL = {}
GT_t.LN_t.ship_mk12_127mm.PL[1] = {
	-- unclear why the 127_Mk49 shells not work
	shell_name = {"MK45_127"}, --shell_name = { "127_Mk49_HC_1", "127_Mk49_HC_2" },
	automaticLoader = false,
	shot_delay = 3,
	ammo_capacity = 352,
};

-------------------------------------------------------------------------------------------------
--   6inch turret 1  
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_6inch_47)
GT.WS[ws].area = 'Turret_1'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].drawArgument1 = 1111;
GT.WS[ws].drawArgument2 = 1112;
GT.WS[ws].angles = {
					{math.rad(140), math.rad(-140), math.rad(-5), math.rad(60)},
					};
GT.WS[ws].omegaY = math.rad(10);
GT.WS[ws].omegaZ = math.rad(11);
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(5);	
GT.WS[ws].LN[1].BR[1].recoilTime = 1.5;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_GUN_6inch_1_1',
		recoilArgument = 1113,recoilTime = 0.3
	},
	{
		connector_name = 'POINT_GUN_6inch_1_2',
		recoilArgument = 1114,recoilTime = 0.3
	},
	{
		connector_name = 'POINT_GUN_6inch_1_3',
		recoilArgument = 1115,recoilTime = 0.3
	}
}

-------------------------------------------------------------------------------------------------
--   5inch turret 1
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'Turret_2'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 1211;
GT.WS[ws].drawArgument2 = 1212;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
	{math.rad(140), math.rad(-140), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1_1',
			recoilArgument = 1213,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_1_2',
			recoilArgument = 1214,
			recoilTime = 0.5 }};

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
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1_2',
			recoilArgument = 1214,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_1_1',
			recoilArgument = 1213,
			recoilTime = 0.5 }};
-------------------------------------------------------------------------------------------------
--   MK7 Missile launcher
-------------------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.OKC_RIM8_Talos )
GT.WS[ws].area = 'Turret_3';
GT.WS[ws].center = 'CENTER_TURRET_03';
GT.WS[ws].drawArgument1 = 1311
GT.WS[ws].drawArgument2 = 1312
GT.WS[ws].angles_mech = {
					{math.rad(180), math.rad(-180), math.rad(-10), math.rad(90)},
					};
GT.WS[ws].angles = {
					{math.rad(-75), math.rad(75), math.rad(-10), math.rad(89.5)},
					};
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].LN[1].launch_delay = 2;
GT.WS[ws].LN[1].depends_on_unit = OKC_TRACKERS;
GT.WS[ws].LN[1].show_external_missile = true;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 46;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_ROCKET_1'},
	{connector_name = 'POINT_ROCKET_2'},
	};

--------------------------- OKC_radar ------------------------------------------
ws = GT_t.inc_ws()
local first_OKC_tracker_id = ws
GT.WS[ws] = {
	area = 'Bridge',
	center = 'Radar_1',
    omegaY = 2,
    omegaZ = 2,
    pidY = {p=100, i=0.05, d=12, inn = 50},
    pidZ = {p=100, i=0.05, d=12, inn = 50},
    angles = { {math.rad(180), math.rad(-180), math.rad(-90), math.rad(80)} },
    LN = {
        [1] = {
            type = 102,
            distanceMin = 1,
            distanceMax = 300000,
            reactionTime = 2.0,
            reflection_limit = 0.03,
			frequencyRange = {0.5e9, 0.58e9},
            ECM_K = 0.65,
            min_trg_alt = 5,
            max_trg_alt = 30480,
            max_number_of_missiles_channels = 2,
            beamWidth = math.rad(90),
        }
    }
}

local OKC_TRACKERS = {{{'self', ws}}}

for i=2,13 do 
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT.WS[first_OKC_tracker_id])
    table.insert(OKC_TRACKERS, {{'self', ws}})
end
--------------------------- OKC_SPG49 tracker radar ------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[1]);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].reference_angle_Z = math.rad(30)
GT.WS[ws].center = 'FCD_1'
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)},
                    };
GT.WS[ws].drawArgument1 = 1031
GT.WS[ws].LN[1].reactionTime = 1;
GT.WS[ws].LN[1].distanceMin = 400;
GT.WS[ws].LN[1].distanceMax = 180000;
GT.WS[ws].LN[1].min_trg_alt = 0;
GT.WS[ws].LN[1].max_trg_alt = 24400;
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[2]);
GT.WS[ws].base = ws-1;
local visual_tracker_ws1 = {{{"self", ws-1}}, {{"self", ws}}};



	
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[1]);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].reference_angle_Z = math.rad(30)
GT.WS[ws].center = 'FCD_2'
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)},
                    };
GT.WS[ws].drawArgument1 = 1032
GT.WS[ws].LN[1].reactionTime = 1;
GT.WS[ws].LN[1].distanceMin = 400;
GT.WS[ws].LN[1].distanceMax = 180000;
GT.WS[ws].LN[1].min_trg_alt = 0;
GT.WS[ws].LN[1].max_trg_alt = 24400;
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[2]);
GT.WS[ws].base = ws-1;
local visual_tracker_ws2 = {{{"self", ws-1}}, {{"self", ws}}};					
-------------------------------------------------------------------------

GT.Name = "USS Oklahoma City" -- folder name for Liveries
GT.DisplayName = _("[VWV] CLG-5 USS Oklahoma City") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Galveston class") -- Label name
GT.Rate = 14532.000000 

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR", "long-range air defence optics"}, --optics types
				RADAR = {"OKC air",
                    "OKC surface",}, --radar types
			};
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 15;
GT.sensor.max_range_finding_target = 500;
----------------------------------------------------
GT.DetectionRange  	= GT.airFindDist;
GT.ThreatRange 		= GT.airWeaponDist;
GT.Singleton		= "no";
GT.mapclasskey		= "P0091000066"; --map icon >>MissionEditor\data\NewMap\images
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
	{name = "HelicopterCarrier"}
};
				
-- categories in the mission editor 
GT.tags  = 
{
	"Heavy Cruiser",
};
