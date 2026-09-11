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

GT.airWeaponDist = 160000.0;  -- Max engagement range air threats (meters)
GT.airFindDist = 480000; -- Max detenction range air threats (meters)


--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 275000;
GT.WS.radar_type = 102 --optical in wstypes
GT.WS.searchRadarMaxElevation = math.rad(60);
GT.WS.searchRadarFrequencies = {{5.9e9}, {5.4e9}};
local ws;

-- weapon systems goes here
-- we will use the https://en.wikipedia.org/wiki/5-inch/38-caliber_gun as main armament
-- dcs-lua-datamine _G["db"]["Units"]["GT_t"]["LN_t"]["Mk12_5in38cal"]

-- Kudos to currenthill for allowing to use his code for the ship armament launchers
-- Original launcher are ModernUSNShips_Mark45_M4 and ModernUSNShips_Mark45_M4_AIR
-- Download currenthill's mod from https://currenthill.com/

-------------------------------------------------------------------------------------------------
--   6inch turret 1  
-------------------------------------------------------------------------------------------------
--GT.WS[1].LN[1]
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
--GT.WS[2]
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
--GT.WS[2].LN[1]
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1_1',
			recoilArgument = 1213,
			recoilTime = 0.5 },
		   { connector_name = 'POINT_GUN_5inch_1_2',
			recoilArgument = 1214,
			recoilTime = 0.5 }};

--GT.WS[3].LN[1]
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

--------------------------- OKC_radar ------------------------------------------
--GT.WS[4-13]
ws = GT_t.inc_ws()
local first_OKC_tracker_id = ws
GT.WS[ws] = {
	--area = 'Bridge',
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
            distanceMax = 275000,
            reactionTime = 2.0,
            reflection_limit = 2.2,
			frequencyRange = {5.4e9,5.9e9},
            ECM_K = 0.5,
            min_trg_alt = 5,
            max_trg_alt = 30480,
            max_number_of_missiles_channels = 1,
            beamWidth = math.rad(1.8),
        }
    }
}

local OKC_tracker_ws = {{{'self', ws}}}

for i=2,10 do 
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT.WS[first_OKC_tracker_id])
    table.insert(OKC_tracker_ws, {{'self', ws}})
end;

-------------------------------------------------------------------------------------------------
--   MK7 Missile launcher
-------------------------------------------------------------------------------------------------
--GT.WS[14].LN[1]
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
GT.WS[ws].LN[1].depends_on_unit = OKC_tracker_ws;
GT.WS[ws].LN[1].show_external_missile = true;
--GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 46;
GT.WS[ws].LN[1].PL[1].shot_delay = 45 
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_ROCKET_1', recoilArgument = 5555, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1.0, recoilTime = 2},
	{connector_name = 'POINT_ROCKET_2', recoilArgument = 6666, recoilT0 = -2, recoilT1 = -1, recoilT2 = 1.0, recoilTime = 2},
	};
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
GT.WS[ws].LN[1].distanceMax = 275000;
GT.WS[ws].LN[1].min_trg_alt = 0;
GT.WS[ws].LN[1].max_trg_alt = 30480;
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
GT.WS[ws].LN[1].distanceMax = 275000;
GT.WS[ws].LN[1].min_trg_alt = 0;
GT.WS[ws].LN[1].max_trg_alt = 30480;
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
                    "OKC surface",} --radar types
			};

----------------------------------------------------
GT.DetectionRange  	= GT.airFindDist;
GT.ThreatRange 		= GT.airWeaponDist;
GT.ThreatRangeMin = 21381;
GT.ThreatRangeMax = 160000;
GT.Singleton		= "no";
GT.mapclasskey		= "P0091000066"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,WSTYPE_PLACEHOLDER,
						"Aircraft Carriers", 
						"AircraftCarrier",
						"Cruisers",
						"RADAR_BAND1_FOR_ARM",
						"RADAR_BAND2_FOR_ARM",
						"DetectionByAWACS",
						"Datalink",
};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
	{name = "Armed Ship"}, -- has weapons
	{name = "HelicopterCarrier"}
};
				
-- categories in the mission editor 
GT.tags  = 
{
	"Cruiser",
};

GT.Countries = {"USA"}

add_surface_unit(GT)	