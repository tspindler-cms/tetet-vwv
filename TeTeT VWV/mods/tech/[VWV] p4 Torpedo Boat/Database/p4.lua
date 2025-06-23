-- Ship template by Joey45 edit as you see fit 
-- P 4 torpedo boat by TeTeT

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "p4_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

-- most values taken from https://en.wikipedia.org/wiki/P_4-class_torpedo_boat
-- and the speedboat: https://github.com/Quaggles/dcs-lua-datamine/blob/master/_G/db/Units/Ships/Ship/speedboat.lua

GT.life = 200 -- 7200; -- hit points
GT.mass = 2000 -- should be heavier? -- 11339.809; -- KGs
GT.max_velocity = 28 -- 14.4 --M/S
GT.race_velocity =  23 -- 12.1 --M/S
GT.economy_velocity = 15 -- 7.7 --M/S 
GT.economy_distance = 930 -- 13,000 -- KM
GT.race_distance = 200000 -- 2.778e+006
GT.shipLength = 18.7 -- 225.20 -- o.a in meters
GT.Width = 3.4 -- 43.90 --15 --meters
GT.Height = 3 -- 35.226 --335.226 from sea level I think
GT.Length = 18.7 -- 225.20 -- deck length I think
GT.DeckLevel = 1 -- 11.816 -- height of deck
GT.X_nose = 9.7 -- 107.0 -- bow wave
GT.X_tail = -9 -- -104.5 -- wake
GT.Tail_Width = 2 -- 8 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.08 -- 0.119249; --time it takes to accelerate
GT.R_min = 100 -- 665.8 -- turn radius

GT.RCS = 100 -- 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.05 -- 0.9 -- new in 2.7 not sure the params

GT.distFindObstacles = 350 -- 10000

GT.animation_arguments = {
	water_propeller = 2,
}

								
--Damage Model
GT.DM = {
	{ area_name = "BOAT", 				area_arg = 70, area_life = 100 },
	{ area_name = "TURRET", 			area_arg = 71, area_life = 50 }
}

GT.airWeaponDist = 1000 -- 15000  -- Max engagement range air threats (meters)
GT.airFindDist = 3000 -- 28000 -- Max detection range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 5000 -- 25000; --450000
GT.WS.radar_type = 104 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws;

-- weapon systems goes here
GT_t.WS_t.ship_dshk_2x12mm = {name = "2x12.7mm DShK"};
GT_t.WS_t.ship_dshk_2x12mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
                    };
GT_t.WS_t.ship_dshk_2x12mm.omegaY = math.rad(115) -- Block 1B
GT_t.WS_t.ship_dshk_2x12mm.omegaZ = math.rad(116) -- Block 1B
GT_t.WS_t.ship_dshk_2x12mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_dshk_2x12mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_dshk_2x12mm.reference_angle_Z = 0
GT_t.WS_t.ship_dshk_2x12mm.LN = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1] = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1].type = 3
GT_t.WS_t.ship_dshk_2x12mm.LN[1].distanceMin = 10
GT_t.WS_t.ship_dshk_2x12mm.LN[1].distanceMax = 1200 -- effective shooting
GT_t.WS_t.ship_dshk_2x12mm.LN[1].max_trg_alt = 500
GT_t.WS_t.ship_dshk_2x12mm.LN[1].reactionTime = 3
GT_t.WS_t.ship_dshk_2x12mm.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_dshk_2x12mm.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_dshk_2x12mm.LN[1].sensor, GT_t.WSN_t[3])
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1] = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].ammo_capacity = 2000;
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].shell_name = {"Utes_12_7x108_T", "Utes_12_7x108", "Utes_12_7x108", "Utes_12_7x108", "Utes_12_7x108"};
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].shell_display_name = "12.7mm";
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].shot_delay = 0.08;
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].reload_time = 15;
GT_t.WS_t.ship_dshk_2x12mm.LN[1].BR = 
{ {
	pos = { 2, 0, -0.1 }
}, {
	pos = { 2, 0, 0.1 }
} }

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_dshk_2x12mm)
GT.WS[ws].area = 'BOAT'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
-- GT.WS[ws].reference_angle_Z = math.rad(0) -- same as in line 171?
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_12_7mm_1',
					--		recoilArgument = 150,
						},
						{
							connector_name = 'POINT_12_7mm_2',
					--		recoilArgument = 150,
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].area = 'BOAT'
GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0}
};
GT.WS[ws].LN[1].show_external_missile = false

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].area = 'BOAT'
GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_02', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
};
GT.WS[ws].LN[1].show_external_missile = false

-------------------------------------------------------------------------

GT.Name = "P4" -- folder name for Liveries
GT.DisplayName = _("P 4 Torpedo Boat") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("P 4") -- Label name
GT.Rate = 4000 -- 5500.000000 

-- most likely not correct
GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV"}, --optics types
                RADAR = {"ticonderoga search radar"}, --radar types
            };
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 2;
GT.sensor.max_range_finding_target = 500;

 ----------------------------------------------------
GT.DetectionRange	= GT.airFindDist;
GT.ThreatRange		= GT.airWeaponDist;
GT.Singleton		= "no";
GT.mapclasskey		= "P0091000039"; -- "P0091000065"; --map icon >>MissionEditor\data\NewMap\images
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"low_reflection_vessel", 
						-- "Light armed ships", 
						"NO_SAM", "Armed Ship"
					};

GT.Categories = {
					{name = "Armed Ship"},
				};					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Fast Attack Craft"
}

GT.type = "speedboat"

-- add_surface_unit(GT)