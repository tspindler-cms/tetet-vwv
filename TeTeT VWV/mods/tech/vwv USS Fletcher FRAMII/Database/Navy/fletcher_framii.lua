-- MOD for DCS WORLD 
-- uss_fletcher_framii  by Markindel - Hawkeye60
-----             Cartella Shapes --------------------------------------------------

GT = {};
dofile(current_mod_path..'/Database/scripts/fletcher_framiiRunwaysAndRoutes.lua')
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship);

GT.visual = {};
GT.visual.shape = "uss_fletcher_framii_hedge_hog";
GT.visual.shape_dstr = "uss_fletcher_framii_Sunk.edm";

GT.animation_arguments = {
				radar1_rotation = 11, -- Flag Animation
				radar2_rotation = 2, -- Radar 2 Rotation
				radar3_rotation = 3, -- Radar 3 Rotation
				luna_lights = -1, -- Running Lights (Disabled)
				water_propeller = 65,
				flight_deck_fences = 88,
				nav_lights = 69,
};
GT.radar1_period = 1;
GT.radar2_period = 9;
GT.radar3_period = 6;

GT.exhaust = {
	[1] = { size = 0.60, pos = {7.65, 15, -0.27}},
	[2] = { size = 0.60, pos = {-6.34, 14, -0.27}}
};

GT.life = 1000;
GT.mass = 11339.809; -- KGs
GT.max_velocity = 18.0;
GT.race_velocity = 14.1;
GT.economy_velocity = 7.7;
GT.economy_distance = 12000;
GT.race_distance = 2.778e+006;
GT.shipLength = 114.76;
GT.Width = 12.09;
GT.Height = 18.5;
GT.Length = 115;
GT.DeckLevel = 3;
GT.draft = 5.6;
GT.X_nose = 74.52;
GT.X_tail = -67.38;
GT.Tail_Width = 8;
GT.Gamma_max = 0.35;
GT.Om = 0.05;
GT.speedup = 0.119249;
GT.R_min = 300;
GT.distFindObstacles = 148.7;

GT.airWeaponDist = 18650;
GT.airFindDist = 45000;

-- Aircraft complement
GT.numParking		= 1;
GT.Plane_Num_		= 1;
GT.Helicopter_Num_	= 1;
GT.Landing_Point = {-30.8,	 5.400, 0.00} ;

------------------------------------------------------------------------------------------------------------------------
--------------  Damage Model
------------------------------------------------------------------------------------------------------------------------
-----------  Attenzione: gli argument devono essere unici.

GT.DM = {
----- Scafo.
	{ area_name = "Scafo_Prua_Dx",		area_arg = 76,	area_life = 70, area_fire = { pos = {45.0, 4.0, 3.0}, size = 1.5}},
	{ area_name = "Scafo_Prua_Sx", 		area_arg = 73,	area_life = 74, area_fire = { pos = {30.0, 4.0,- 3.0}, size = 1.5}},
	{ area_name = "Scafo_Poppa_Dx", 	area_arg = 72,	area_life = 60, area_fire = { pos = {-20.0, 2.0, 3.0}, size = 1.5}},
    { area_name = "Scafo_Poppa_Sx", 	area_arg = 75,	area_life = 60, area_fire = { pos = {-10.0, 2.0, -3.0}, size = 1.5}},
	{ area_name = "BORT_L", 	area_arg = 79,	area_life = 60, area_fire = { pos = {-10.0, 2.0, -3.0}, size = 1.5}},
	{ area_name = "BORT_R", 	area_arg = 78,	area_life = 60, area_fire = { pos = {-10.0, 2.0, -3.0}, size = 1.5}},
 -------- Sovrastrutture
    { area_name = "flight_deck",    area_arg = 84,	area_life = 80, area_fire = { pos = {-35.0, 12.0, 0.0}, size = 1.5}},
	{ area_name = "Strutture_Poppa",    area_arg = 82,	area_life = 80, area_fire = { pos = {-35.0, 12.0, 0.0}, size = 1.5}},
	{ area_name = "Sala_Comando",	    area_arg = 83,	area_life = 80, area_fire = { pos = {30.0, 12.0, 0.0}, size = 1.5}},
--------- 4 Torri Binate da 380mm
	{ area_name = "Torre_380_Anton",	area_arg = 96,	area_life = 60, area_fire = { pos = {35.0, 5.0, 0.0}, size =  1.5}},
    { area_name = "Ponte Poppa",		area_arg = 85,	area_life = 60, area_fire = { pos = {-45.0, 3.0, 0.0}, size = 1.5}},
---- Fletcher sink
	{ area_name = "Fletcher_Distrutta", area_arg = 77,	area_life = 60, area_fire = { pos = {5.0, 12.0, 0.0}, size = 2.5}},
};

---------------------------------------------------------------------------------------------------------------------
------------          Specifiche Armamento
---------------------------------------------------------------------------------------------------------------------
local WSN_20 = {};
WSN_20.deviation_error_azimuth 		= 0.0002;
WSN_20.deviation_error_elevation 	= 0.0002;
WSN_20.deviation_error_speed_sensor	= 0.0002;
WSN_20.deviation_error_stability 	= 0.0002;
WSN_20.deviation_error_distance 	= 0.0002;

GT_t.WSN_t[20] = WSN_20;

---  Dalla Regia Nave Roma:
-- ship_Breda_37/54 (37 mm) naval AAA weapons. Source: https://en.wikipedia.org/wiki/Cannone-Mitragliera_da_37/54_%28Breda%29
-- Used default Mark 15 CIWS Phalanx Block 1 weapon system as template with alterations
GT_t.WS_t.ship_Breda_37_54 = {name = "3.7 cm Breda /54"};
GT_t.WS_t.ship_Breda_37_54.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)},
                    };
GT_t.WS_t.ship_Breda_37_54.omegaY = math.rad(115) -- Block 1B
GT_t.WS_t.ship_Breda_37_54.omegaZ = math.rad(116) -- Block 1B
GT_t.WS_t.ship_Breda_37_54.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_Breda_37_54.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_Breda_37_54.reference_angle_Z = 0
GT_t.WS_t.ship_Breda_37_54.LN = {}
GT_t.WS_t.ship_Breda_37_54.LN[1] = {}
GT_t.WS_t.ship_Breda_37_54.LN[1].type = 3
GT_t.WS_t.ship_Breda_37_54.LN[1].distanceMin = 10
GT_t.WS_t.ship_Breda_37_54.LN[1].distanceMax = 7800 -- effective shooting
GT_t.WS_t.ship_Breda_37_54.LN[1].max_trg_alt = 4000
GT_t.WS_t.ship_Breda_37_54.LN[1].reactionTime = 1.8
GT_t.WS_t.ship_Breda_37_54.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_Breda_37_54.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_Breda_37_54.LN[1].sensor, GT_t.WSN_t[20])
GT_t.WS_t.ship_Breda_37_54.LN[1].PL = {}
GT_t.WS_t.ship_Breda_37_54.LN[1].PL[1] = {}
GT_t.WS_t.ship_Breda_37_54.LN[1].PL[1].ammo_capacity = 2550;
GT_t.WS_t.ship_Breda_37_54.LN[1].PL[1].shell_name = {"Breda_37_HE"};
GT_t.WS_t.ship_Breda_37_54.LN[1].PL[1].shell_display_name = "37mm HE";
GT_t.WS_t.ship_Breda_37_54.LN[1].PL[1].shot_delay = 60/120 -- 120 rounds per minute average
GT_t.WS_t.ship_Breda_37_54.LN[1].PL[1].reload_time = 1000000; -- never during the mission (ship autogun)
GT_t.WS_t.ship_Breda_37_54.LN[1].BR = { {pos = {3.478, 0, 0} }, }


GT_t.WS_t.ship_mk12_2x127mm = {name = "Mk12 5inch 38cal Twin"};
GT_t.WS_t.ship_mk12_2x127mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(85)},
                    };
GT_t.WS_t.ship_mk12_2x127mm.omegaY = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.omegaZ = math.rad(10) -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.reference_angle_Z = 0

GT_t.LN_t.ship_mk12_127mm_AIR = {}
GT_t.LN_t.ship_mk12_127mm_AIR.type = 11
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMin = 20
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMax = 16642
GT_t.LN_t.ship_mk12_127mm_AIR.max_trg_alt = 11339
GT_t.LN_t.ship_mk12_127mm_AIR.reactionTime = 12
GT_t.LN_t.ship_mk12_127mm_AIR.sensor = {}
-- set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[20])
GT_t.LN_t.ship_mk12_127mm_AIR.PL = {}
GT_t.LN_t.ship_mk12_127mm_AIR.PL[1] = {
							shell_name = {"vwv_mk12_127mm_AIR"},
							automaticLoader = false,
							shot_delay = 5,
							ammo_capacity = 352,
						}

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
						}


-------------------------------------------------------------------------------------------
--  Armi
-------------------------------------------------------------------------------------------
-- weapon systems
GT.WS = {}
local ws;
GT.WS.maxTargetDetectionRange = 45000;
GT.WS.radar_type = 102;

local WSN_20 = {};
WSN_20.deviation_error_azimuth 		= 0.0002;
WSN_20.deviation_error_elevation 	= 0.0002;
WSN_20.deviation_error_speed_sensor	= 0.0002;
WSN_20.deviation_error_stability 	= 0.0002;
WSN_20.deviation_error_distance 	= 0.0002;

GT_t.WSN_t[20] = WSN_20;
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------- 5 postazoni Binate  -------------------------------------------------------------------------
--- Mini GUN di PRUA lato Sinistro Prua
--------------------------------------------------------------------------------------------------------------------------------------- 
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 )
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_06'
GT.WS[ws].drawArgument1 = 59
GT.WS[ws].drawArgument2 = 60
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(150), math.rad(-5), math.rad(85)},
};
GT.WS[ws].reference_angle_Y = math.rad(35);  -- valore originale 90
GT.WS[ws].LN[1].BR[1].recoilArgument = 127;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_MGUN_1_1',
		recoilArgument = 127,
	},
	{
		connector_name = 'POINT_MGUN_1_2',
		recoilArgument = 127,
	}
};

---------------------------------------------------------------------------------------------------------------------------------------
--- Mini GUN di PRUA lato Destro Prua

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 )
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].area = 'Sala_Comando';
GT.WS[ws].center = 'CENTER_TOWER_07';
GT.WS[ws].drawArgument1 = 51;
GT.WS[ws].drawArgument2 = 52;
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(150), math.rad(-5), math.rad(85)},
};
GT.WS[ws].reference_angle_Y = math.rad(-35);  -- valore originale 90
GT.WS[ws].LN[1].BR[1].recoilArgument = 128;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_MGUN_2_1',
		recoilArgument = 128,
	},
	{
		connector_name = 'POINT_MGUN_2_2',
		recoilArgument = 128,
	}
};
---------------------------------------------------------------------------------------------------------------------------------------
--- Mini GUN  Centrale

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 )
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].area = 'Sala_Comando';
GT.WS[ws].center = 'CENTER_TOWER_08';
GT.WS[ws].drawArgument1 = 53;
GT.WS[ws].drawArgument2 = 54;
---GT.WS[ws].angles[1][1] = math.rad(150);
---GT.WS[ws].angles[1][2] = math.rad(-150);
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(10), math.rad(-5), math.rad(85)},
};
GT.WS[ws].LN[1].BR[1].recoilArgument = 129;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_MGUN_3_1',
		recoilArgument = 129,
	},
	{
		connector_name = 'POINT_MGUN_3_2',
		recoilArgument = 129,
	}
};

---------------------------------------------------------------------------------------------------------------------------------------
--- Mini GUN di POPPA Sinistra

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 )
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].area = 'Sala_Comando';
GT.WS[ws].center = 'CENTER_TOWER_15';
GT.WS[ws].drawArgument1 = 67;
GT.WS[ws].drawArgument2 = 68;
---GT.WS[ws].angles[1][1] = math.rad(150);
---GT.WS[ws].angles[1][2] = math.rad(-150);
GT.WS[ws].angles = {
	{math.rad(150), math.rad(-10), math.rad(-5), math.rad(85)},
};
GT.WS[ws].reference_angle_Y = math.rad(90);  -- valore originale 90
GT.WS[ws].LN[1].BR[1].recoilArgument = 136;
GT.WS[ws].LN[1].fireAnimationArgument = -90;  
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_MGUN_4_1',
		recoilArgument = 136,
	},
	{
		connector_name = 'POINT_MGUN_4_2',
		recoilArgument = 136,
	}
};

---------------------------------------------------------------------------------------------------------------------------------------
--- Mini GUN di POPPA Destra

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20 )
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].area = 'Sala_Comando';
GT.WS[ws].center = 'CENTER_TOWER_16';
GT.WS[ws].drawArgument1 = 69;
GT.WS[ws].drawArgument2 = 70;
GT.WS[ws].angles = {
	{math.rad(-10), math.rad(150), math.rad(-5), math.rad(85)},
};
GT.WS[ws].reference_angle_Y = math.rad(0);  -- valore originale 90
GT.WS[ws].LN[1].BR[1].recoilArgument = 137;
GT.WS[ws].LN[1].fireAnimationArgument = -90;  
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_MGUN_5_1',
		recoilArgument = 137,
	},
	{
		connector_name = 'POINT_MGUN_5_2',
		recoilArgument = 137,
	}
};

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5 Torrette Principali
--------------  Torretta Cannone di Prua 1 ----------------------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].area = 'Torre_380_Anton';
GT.WS[ws].center = 'CENTER_TOWER_01';
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].angles = {
	{math.rad(150), math.rad(-150), math.rad(-5), math.rad(85)},
};
GT.WS[ws].reference_angle_Z = math.rad(0);
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_01',
							recoilArgument = 33,
							recoilTime = 1.0 }};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_01',
							recoilArgument = 33,
							recoilTime = 1.0 }};

--- Torretta Cannone di Poppa  5 --------------------------------------------------------------------------------------
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].area = 'Ponte Poppa';
GT.WS[ws].center = 'CENTER_TOWER_05';
GT.WS[ws].omegaY = math.rad(30);
GT.WS[ws].omegaZ = math.rad(20);
GT.WS[ws].drawArgument1 = 19;
GT.WS[ws].drawArgument2 = 20;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
	{math.rad(-45), math.rad(45), math.rad(-5), math.rad(85)},
};
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm_AIR);
__LN.sightMaxTanVel = 300;
__LN.BR = {{ connector_name = 'POINT_GUN_05',
							recoilArgument = 37,
							recoilTime = 1.0 }};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.ship_mk12_127mm);
__LN.BR = {{ connector_name = 'POINT_GUN_05',
							recoilArgument = 37,
							recoilTime = 1.0 }};

---------------------------------------------------------------------------------------------

-- local ws;

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_02', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_03', recoilArgument = 179, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_04', recoilArgument = 180, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_05', recoilArgument = 181, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_06', recoilArgument = 182, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
}

GT.WS[ws].LN[1].show_external_missile = false;
----------------------------------------------------------------------------------------------------------------------------------
---  Parte Finale
----------------------------------------------------------------------------------------------------------------------------------

-- TODO: Change to Radford, Jekins or Nicholas
GT.Name = "USS Fletcher";
GT.DisplayName = _("USS Fletcher FRAM II Destroyer");
GT.DisplayNameShort = _("Fletcher"); -- Label name
GT.Rate = 4000;

GT.Sensors = {  
	OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR", "long-range air defence optics"},    RADAR = {
        "ticonderoga search radar",
    }
};

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 15;
GT.sensor.max_range_finding_target = 500;

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000068";

GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
	"Cruisers",
	"RADAR_BAND1_FOR_ARM",
	"DetectionByAWACS",
};

GT.Categories = {
	{name = "Armed Ship"},
	{name = "HelicopterCarrier"}
};


-- TeTeT: For whatever reason this does not work
-- categories in the mission editor
--[[
GT.tags  =
{
	"Destroyer",
};
]]