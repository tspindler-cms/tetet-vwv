-- Ship template by Joey45 edit as you see fit
-- USNS Card 64 by James J Jackson

GT = {};
dofile(current_mod_path..'/Database/scripts/Card_RunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "card_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 3500; -- hit points
GT.mass = 8520000.0; -- KGs
GT.max_velocity = 7.7166667 --M/S
GT.race_velocity = 7.7166667 --M/S
GT.economy_velocity = 6.0 --M/S 
GT.economy_distance = 13000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 142.0 -- o.a in meters
GT.Width = 25.0 --15 --meters
GT.Height = 29.964 --335.226 from sea level I think
GT.Length = 142.0 -- deck length I think
GT.DeckLevel = 12.945 -- height of deck
GT.X_nose = 69.0 -- bow wave
GT.X_tail = -62 -- wake
GT.Tail_Width = 15 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 500; -- turn radius

GT.RCS = 100000; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 150;

-- Aircraft complement
GT.numParking		= 3;
GT.Plane_Num_		= 3;
GT.Helicopter_Num_	= 3;
GT.Landing_Point = {-54.327, 12.945, -5.1787};

-- smoke density and position
GT.exhaust = {
	[1] = { size = 0.60, pos = {-12.366, 23.747, 9.7058}},
};

GT.animation_arguments = {
	water_propeller = 6,
	radar1_rotation = 7,
	nav_lights = 901,
};
GT.radar1_period = 4; --speed

--Damage Model
GT.DM = {
	{ area_name = "flightdeck", area_arg = 71, area_life = 1500},
	{ area_name = "hull", area_arg = 72, area_life = 2000},
	{ area_name = "island", area_arg = 73, area_life = 500},
	{ area_name = "tower", area_arg = 76, area_life = 100},
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
-------------------------------------------------------------------------

GT.Name = "USNS Card" -- folder name for Liveries
GT.DisplayName = _("[VWV] T-AKV-40 USNS Card") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("T-AKV") -- Label name
GT.Rate = 3500.000000 

GT.Sensors = {  OPTIC = {"long-range naval optics"}, --optics types
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
GT.mapclasskey		= "P0091000065"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER, -- >> \DCS World Version\Scripts\Database\wsTypes.lua
						"Aircraft Carriers", 
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "AircraftCarrier"}, --aircraft carrier
						{name = "Armed Ship"}, -- has weapons
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Carrier"
};
