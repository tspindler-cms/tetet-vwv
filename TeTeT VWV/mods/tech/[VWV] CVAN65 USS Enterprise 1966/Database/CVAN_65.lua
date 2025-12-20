-- Ship template by Joey45 edit as you see fit
-- CVAN-65 Enterprise by TeTeT, James J. Jackson, Tansoku102cm

GT = {};
-- TODO
dofile(current_mod_path..'/Database/CVAN_65RunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "cvan65_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 7200; -- hit points
GT.mass = 11339.809; -- KGs
GT.max_velocity = 18.0 --M/S
GT.race_velocity = 15.4 --M/S
GT.economy_velocity = 11.3 --M/S
GT.economy_distance = 33000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 332.000 -- o.a in meters
GT.Width = 40.5 --15 --meters
GT.Height = 58.30 --335.226 from sea level I think
GT.Length = 332.00 -- deck length I think
GT.DeckLevel = 19.52 -- height of deck
GT.X_nose = 151.0 -- bow wave
GT.X_tail = -150.0 -- -127.238 -- wake
GT.Tail_Width = 32 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 665.8 -- turn radius

GT.RCS = 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9 -- new in 2.7 not sure the params

-- TODO: ensure any of this works
GT.TACAN = true;		--If it has TACAN say true if not say false or not have this entry
GT.TACAN_position = {-40.89, 66.38, 25.78}

GT.ICLS = true; -- IF it has ICLS say true if not say false or not have this entry
GT.ICLS_Localizer_position =  {-153, 12, 9.4, 191.2}
GT.ICLS_Glideslope_position = {-118.3, 25.05, 26.72, 3.5}

--Optical Landing System
GT.OLS = {
	Type = GT_t.OLS_TYPE.IFLOLS,
	CutLightsArg = 404,
	DatumAndWaveOffLightsArg = 405,
	MeatBallArg = 151,
	GlideslopeBasicAngle = 3.5,
	VerticalCoverageAngle = 1.7
}

GT.distFindObstacles = 160

GT.numParking = 4 -- runways
GT.Plane_Num_ = 8 --number of planes, not sure if it matters in game
GT.Helicopter_Num_ = 3 -- Number heli spawns

------------------------ Landing Signal Officer (Left Alt + F9) -- updated by Toan, 2024-01-22 -------------------------------
-- LSO view          high quality edm file, whatever you named the connector , Visiblity arg   , Position of camera

local LSO_Station = {
	HQ_model = "empty",
	dockConnector  = "FIRE_DECK_AFT",
	hide_argument = 821,
	cameraPos = {-119+1,18.3,-15,180}  -- this camera pos works, was -110, 19.8, -18 by Toan, 2024-01-22 updated 2024-01-26
}

GT.Stations = { LSO = LSO_Station, } -- connector was LSO_VIEW, update by Toan to FIRE_DECK_AFT, 2024-01-22 -------

GT.LSOView = {cockpit = "empty", position = {offset = {0.0, 0.0, 0.0, 0.0, 0.0}}} -- this offset has no effect but the line needs to be here
------------------------- End Landing Signal Officer --------------------------------------------------------------------------- 

-- Landing point
GT.Landing_Point	= {-104.86,  19.52, -33.97}

-- smoke density and position
GT.exhaust = {
	-- nuclear carrier without smoke
}

--[[
GT.animation_arguments.holdback_bars_pos = {817, 818, 819, 820} 
GT.animation_arguments.holdback_bars_angle = {808, 809, 810, 811} 
GT.animation_arguments.holdback_bars_color = {812, 813, 814, 815}
GT.animation_arguments.holdback_bars_deck_cleat = {804, 805, 806, 807} --that little thing for the holdback bar
GT.animation_arguments.elevators = {57, 58, 59, 60}; --lifts
GT.animation_arguments.elevators_doors = {47, 48, 53, 54}; --anger doors
GT.animation_arguments.elevators_fences_top = {27, 29, 31, 33}; --deck elevator fences
GT.animation_arguments.elevators_fences_bottom = {28, 30, 32, 34}; --hanger fences
GT.animation_arguments.alarm_state = 10; -- for the nets around the boat and or weapon stations or other stuff like antennas going up or platforms going from green state to red state
GT.animation_arguments.bubbles = {138, 139} -- doesn't go back down ED bug
 ]]

GT.animation_arguments.catapult_shuttles = {145, 146, 147, 148} -- shuttle args
GT.animation_arguments.arresting_wires = {400, 401, 402, 403} -- can't get the visibilty anim to work, differnt #arg numbers on the Stennis and SC
GT.animation_arguments.landing_strip_illumination = 150 --runway lights
GT.animation_arguments.water_propeller = 10
GT.animation_arguments.radar1_rotation = 1
GT.animation_arguments.radar2_rotation = 2
GT.animation_arguments.radar3_rotation = 3
GT.radar1_period = 4; --speed
GT.radar2_period = 4.5; --speed
GT.radar3_period = 2; --speed

-- Lighting lua def copied from Forrestal
--Lighting
	--150: Runway
	--790: Launch floods
	--791: 59 Illum
	--792: Underway/Navigation
	--793: Square Island 
	--794: Island interior Red

	--Navigation: Runway + Nav + Cockpit
	--Launch: Floods + Runway + Cockpit + Square + Nav
	--Recovery: Square + Runway + Cockpit + Nav

	--{int ArgumentNo, float OffValue, float OnValue, [float AnimationDuration],  [bool cycleAnimation]}

GT.carrierIlluminationStates = {
	{{792, 0.0, 1.0}, {794, 0.0, 1.0}, {150, 0.0, 1.0}  }, --NAV_LIGHTS
	{{790, 0.0, 1.0}, {792, 0.0, 1.0}, {793, 0.0, 1.0}, {794, 0.0, 1.0}, {150, 0.0, 1.0}  }, -- AC_LAUNCH_STATE
	{{793, 0.0, 1.0}, {794, 0.0, 1.0}, {792, 0.0, 1.0}, {150, 0.0, 1.0}  }, -- AC_RECOVERY_STATE
}

--Damage Model
GT.DM = {
    { area_name = "PALUBA_aft",            area_arg = 70, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_AFT", size = 0.8 }, belongsToRunway = true},
    { area_name = "PALUBA_cat",            area_arg = 71, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_CAT", size = 0.8 }, belongsToRunway = true},
    { area_name = "PALUBA_fore",           area_arg = 72, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_FORE", size = 0.8 }, belongsToRunway = true},
    { area_name = "PALUBA_island",         area_arg = 73, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_ISLAND", size = 0.8 }, belongsToRunway = true},
	{ area_name = "Deck LSO",              area_arg = 74, area_life = 50 },
    { area_name = "Hull",           area_arg = 75, area_life = 5000 },
    { area_name = "Island",                area_arg = 76, area_life = 150 },
    { area_name = "FlightDeck",                area_arg = 77, area_life = 5000 },
}

--GT.WS[ws].pointer = "BRIDGE" --possible CA or Weapon controls??
--GT.driverViewConnectorName = {"DRIVER_POINT", offset = {0.0, 0.0, 0.0}} --possible CA or weapon controls??
--GT.driverCockpit = "DriverCockpit/DriverCockpitWithIR" --possible CA or weapon controls??

GT.airWeaponDist = 25000  -- Max engagement range air threats (meters)
GT.airFindDist = 50000 -- Max detenction range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000
GT.WS.radar_type = 102 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws

-- weapon systems goes here

-------------------------------------------------------------------------

GT.Name = "USS Enterprise 1966" -- folder name for Liveries
GT.DisplayName = _("[VWV] CVAN-65 USS Enterprise '66") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Big E") -- Label name
GT.Rate = 5500.000000

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"}, --optics types
                RADAR = {"seasparrow tr", "carrier search radar"}, --radar types
            };
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 30;
GT.sensor.max_range_finding_target = 500;

----------------------------------------------------
GT.DetectionRange	= GT.airFindDist;
GT.ThreatRange		= GT.airWeaponDist;
GT.Singleton		= "yes";
GT.mapclasskey		= "P0091000065"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER, 
						"Aircraft Carriers", 
						"Arresting Gear",  
						"catapult", 
						"RADAR_BAND1_FOR_ARM",
						"RADAR_BAND2_FOR_ARM",
						"Datalink",
						"Link4",
						"ACLS",
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "AircraftCarrier"}, 
						{name = "AircraftCarrier With Catapult"}, 
						{name = "AircraftCarrier With Tramplin"}, 
						{name = "Armed Ship"},
						{name = "AircraftCarrier With Arresting Gear"} 
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Carrier"
};
GT.Countries = { "USA" };