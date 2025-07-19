-- Ship template by Joey45 edit as you see fit
-- CVA-31 Bon Homme Richard by TeTeT

GT = {};
-- TODO
dofile(current_mod_path..'/Database/EssexRunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "essex_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 6875; -- hit points
GT.mass = 27500000.00; -- KGs
GT.max_velocity = 16.9766667 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 243.238 -- o.a in meters
GT.Width = 31.289 --15 --meters
GT.Height = 58.30 --335.226 from sea level I think
GT.Length = 260.00 -- deck length I think
GT.DeckLevel = 16.95 -- height of deck
GT.X_nose = 126.0 -- bow wave
GT.X_tail = -120.0 -- -127.238 -- wake
GT.Tail_Width = 24 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 665.8 -- turn radius

GT.RCS = 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9 -- new in 2.7 not sure the params

-- TODO: ensure any of this works
GT.TACAN = true;		--If it has TACAN say true if not say false or not have this entry
GT.TACAN_position = {-72.5916, 16.95, -5.60511} -- { 5.7438, 88.422,  21.293 } -- position of tacan TX, center of wires


GT.ICLS = true; -- IF it has ICLS say true if not say false or not have this entry
GT.ICLS_Localizer_position =  {-31.699883,  17.116796,  -32.048683, 189.0}	-- {x [m], y [m], z [m], yaw [deg]} 
GT.ICLS_Glideslope_position = {-72.591599,  17.2, -5.60511,   3.5}	-- {x [m], y [m], z [m], glideslope = 3.5 [deg]}
--Optical Landing System
GT.OLS = {
	Type = GT_t.OLS_TYPE.IFLOLS,
	CutLightsArg = 44,
	DatumAndWaveOffLightsArg = 45,
	MeatBallArg = 151,
	GlideslopeBasicAngle = 3.5,
	VerticalCoverageAngle = 1.7
}

GT.distFindObstacles = 800

GT.numParking = 2 -- runways
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
GT.Landing_Point	= {-72.5916, 16.95, -5.60511}

-- smoke density and position
GT.exhaust = {
	  [1] = { size = 0.2 , pos = {3.9136, 34.468, 11.437 } }, --Y, Z, X
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

GT.animation_arguments.catapult_shuttles = {145, 146} -- shuttle args
GT.animation_arguments.arresting_wires = {400, 401, 402, 403} -- can't get the visibilty anim to work, differnt #arg numbers on the Stennis and SC
GT.animation_arguments.landing_strip_illumination = 40 --runway lights
GT.animation_arguments.water_propeller = 10
GT.animation_arguments.radar1_rotation = 1
GT.animation_arguments.radar2_rotation = 2
GT.animation_arguments.radar3_rotation = 3
-- GT.animation_arguments.radar4_rotation = 4

GT.radar1_period = 10; --speed
GT.radar2_period = 20; --speed
GT.radar3_period = 10; --speed
-- GT.radar4_period = 10; --speed

-- for lights you can look at the shps in the modelviewer 
--                             {int ArgumentNo, float OffValue, float OnValue, [float AnimationDuration],  [bool cycleAnimation]}
GT.carrierIlluminationStates = { 
								 {{901, 0.0, 1.0}}, --NAV_LIGHTS
								 {}, -- AC_LAUNCH_STATE
								 {}, -- AC_RECOVERY_STATE
								}
								
--Damage Model
GT.DM = {
    { area_name = "PALUBA_aft",            area_arg = 70, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_AFT", size = 0.8 }, belongsToRunway = true},
    { area_name = "PALUBA_cat",            area_arg = 71, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_CAT", size = 0.8 }, belongsToRunway = true},
    { area_name = "PALUBA_fore",           area_arg = 72, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_FORE", size = 0.8 }, belongsToRunway = true},
    { area_name = "PALUBA_island",         area_arg = 73, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_ISLAND", size = 0.8 }, belongsToRunway = true},
	{ area_name = "PALUBA_ele",            area_arg = 74, area_life = 300, armour = {width = 0.030}, area_fire = { connector = "FIRE_DECK_CAT", size = 0.8 }, belongsToRunway = true},
	{ area_name = "Deck LSO",              area_arg = 75, area_life = 50 },
    { area_name = "Hull Simple",           area_arg = 76, area_life = 150 },
    { area_name = "Island",                area_arg = 77, area_life = 150 },
	{ area_name = "SuperStructure", area_arg = 78, area_life = 500},
}

--GT.WS[ws].pointer = "BRIDGE" --possible CA or Weapon controls??
--GT.driverViewConnectorName = {"DRIVER_POINT", offset = {0.0, 0.0, 0.0}} --possible CA or weapon controls??
--GT.driverCockpit = "DriverCockpit/DriverCockpitWithIR" --possible CA or weapon controls??

GT.airWeaponDist = 15000  -- Max engagement range air threats (meters)
GT.airFindDist = 28000 -- Max detenction range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000; --450000
GT.WS.radar_type = 102 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws;

-- weapon systems goes here

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
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMax = 16642;
GT_t.LN_t.ship_mk12_127mm_AIR.max_trg_alt = 11339;
GT_t.LN_t.ship_mk12_127mm_AIR.reactionTime = 12;
GT_t.LN_t.ship_mk12_127mm_AIR.sensor = {};
-- set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[20]);
GT_t.LN_t.ship_mk12_127mm_AIR.PL = {};
GT_t.LN_t.ship_mk12_127mm_AIR.PL[1] = {
	shell_name = {"vwv_cva31_mk12_127mm_AIR"},
	automaticLoader = false,
	shot_delay = 3,
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
	shot_delay = 3,
	ammo_capacity = 352,
};

-------------------------------------------------------------------------------------------------
--   5inch turret 1
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 501;
GT.WS[ws].drawArgument2 = 502;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-0)
GT.WS[ws].angles = {
	{math.rad(-0), math.rad(-160), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1',
							recoilArgument = 205,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_1',
							recoilArgument = 206,
							recoilTime = 0.2 }}


-------------------------------------------------------------------------------------------------
--   5inch turret 2
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 503;
GT.WS[ws].drawArgument2 = 504;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-0)
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(-160), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_2',
							recoilArgument = 205,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_2',
							recoilArgument = 206,
							recoilTime = 0.2 }}


-------------------------------------------------------------------------------------------------
--   5inch turret 3
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 505;
GT.WS[ws].drawArgument2 = 506;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_3',
							recoilArgument = 209,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_3',
							recoilArgument = 210,
							recoilTime = 0.2 }}

-------------------------------------------------------------------------------------------------
--   5inch turret 4
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_04'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 507;
GT.WS[ws].drawArgument2 = 508;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-180)
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(-180), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_4',
							recoilArgument = 209,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_4',
							recoilArgument = 210,
							recoilTime = 0.2 }}


-------------------------------------------------------------------------------------------------
--   5inch turret 5
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_05'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 509;
GT.WS[ws].drawArgument2 = 510;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
	{math.rad(160), math.rad(0), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_5',
							recoilArgument = 203,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_5',
							recoilArgument = 204,
							recoilTime = 0.2 }}

-------------------------------------------------------------------------------------------------
--   5inch turret 6
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_06'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 511;
GT.WS[ws].drawArgument2 = 512;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
	{math.rad(160), math.rad(10), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_6',
							recoilArgument = 203,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_6',
							recoilArgument = 204,
							recoilTime = 0.2 }}


-------------------------------------------------------------------------------------------------
--   5inch turret 7
-------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'SuperStructure'
GT.WS[ws].center = 'CENTER_TURRET_07'
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 513;
GT.WS[ws].drawArgument2 = 514;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
	{math.rad(180), math.rad(10), math.rad(-10), math.rad(85)},
};
-- first set of launchers
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_7',
							recoilArgument = 207,
							recoilTime = 0.2 }}
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_5inch_7',
							recoilArgument = 208,
							recoilTime = 0.2 }}

-------------------------------------------------------------------------

GT.Name = "USS Bon Homme Richard" -- folder name for Liveries
GT.DisplayName = _("[VWV] CVA-31 Bon Homme Richard") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Bonnie Dick") -- Label name
GT.Rate = 27500.000000 

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"}, --optics types
                RADAR = {"Tor 9A331", "carrier search radar"}, --radar types
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
GT.attribute		= {wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER, -- >> \DCS World Version\Scripts\Database\wsTypes.lua
						"Aircraft Carriers", 
						"Arresting Gear",  --if it has arrester wires
						"catapult", --if it has catapults
						"RADAR_BAND1_FOR_ARM",
						"RADAR_BAND2_FOR_ARM",
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "AircraftCarrier"}, --aircraft carrier
						{name = "AircraftCarrier With Catapult"}, --if it has catapults
						{name = "Armed Ship"}, -- has weapons
						{name = "AircraftCarrier With Arresting Gear"} 
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Carrier"
}
