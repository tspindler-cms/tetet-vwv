-- Based on HandyWind

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)
GT.chassis.armour_thickness = 0.0005;

GT.visual = {}
GT.visual.shape = "PBR_MKII"
GT.visual.shape_dstr = ""

GT.snd.engine = "Ships/speedboat";
GT.snd.move = "Ships/speedboatMove";

GT.IR_emission_coeff = 0.35
GT.animation_arguments.crew_presence = 50;

GT.life = 20
GT.mass = 1500
GT.max_velocity = 37
GT.race_velocity = 24
GT.economy_velocity = 15
GT.economy_distance = 300000
GT.race_distance = 200000
GT.shipLength = 7.1
GT.Width = 2.9
GT.Height = 2.8
GT.Length = 10
GT.DeckLevel = 1.0
GT.X_nose = 3
GT.X_tail = -3
GT.Tail_Width = 2
GT.Gamma_max = 1.0
GT.Om = 5.0
GT.speedup = 8.0
GT.R_min = 10.0
GT.distFindObstacles = 50
GT.RCS = 100  -- estimated RCS in square meters / оценочная ЭПР в кв.м.

GT.riverCraft = true

GT.animation_arguments = {
	radar1_rotation = 1,
	radar2_rotation = 2,
	radar3_rotation = 3,
	--radar4_rotation = 4,
	--radar5_rotation = 5,
	nav_lights = 69, -- навигационные огни
	--flight_deck_fences = 150, -- на посадочной площадке
	--deck_illumination = 152,
	--flag_animation = -1,
	water_propeller = 65,
	alarm_state = -1,
}

GT.radar1_period = 3.0;
GT.radar2_period = 1.0;



GT.airWeaponDist = 5200
GT.airFindDist = 40000

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",} };
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 3;
GT.sensor.max_range_finding_target = 500;

-----------------------------------------------------------------------------------
--  Damage Section
----------------------------------------------------------------------------------
GT.DM = {
	----- Scafo.
		{ area_name = "AMIDSHIPS", 	area_arg = 70,  area_life = 27, area_fire = { pos = {3.7, 17.15, -6.25}, size = 0.5}},
		{ area_name = "BOW", 	area_arg = 71,  area_life = 27, area_fire = { pos = {3.7, 17.15, -6.25}, size = 0.5}},
		{ area_name = "STERN", 	area_arg = 72,  area_life = 27, area_fire = { pos = {3.7, 17.15, -6.25}, size = 0.5}},
}

-- ============================= WEAPONS =====================================================

GT.WS = {}
local ws;
GT.WS.maxTargetDetectionRange = 10000;
GT.WS.radar_type = 104
GT.WS.searchRadarMaxElevation = math.rad(70)

-- ============================ M2 machine gun Bow =======================================================================

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'BOW'
GT.WS[ws].center = 'CENTER_TOWER_01'
GT.WS[ws].angles = {
                    {math.rad(125), math.rad(-125), math.rad(-4), math.rad(30)},
                   };
GT.WS[ws].canSetTacticalDir = true 
GT.WS[ws].drawArgument1 = 21
GT.WS[ws].drawArgument2 = 22
GT.WS[ws].omegaY = math.rad(100);
GT.WS[ws].omegaZ = math.rad(100); 
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(0);	

--[[__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'POINT_GUN_01_L';
for i=7,10 do
	__LN.PL[i] = {}
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.fireAnimationArgument = 44;
]]
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_GUN_01_L',
						}
					};

							
-- =========================== M2 machine gun Stern =======================================

ws = GT_t.inc_ws();
GT.WS[ws] = {}
-- set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)

GT.WS[ws].area = 'STERN';
GT.WS[ws].center = 'CENTER_TOWER_02'
GT.WS[ws].drawArgument1 = 23   
GT.WS[ws].drawArgument2 = 24  
GT.WS[ws].omegaY = math.rad(90);
GT.WS[ws].omegaZ = math.rad(90);  
GT.WS[ws].angles = {
                    {math.rad(160), math.rad(-160), math.rad(-5), math.rad(70)},
                   };
GT.WS[ws].reference_angle_Y = math.rad(180);	
GT.WS[ws].reference_angle_Z = math.rad(0);						

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.BR[1].connector_name = 'POINT_GUN_02';
__LN.fireAnimationArgument = 119;


--[[
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'POINT_GUN_02';
for i=7,10 do
	__LN.PL[i] = {}
	set_recursive_metatable(__LN.PL[i], __LN.PL[1]);
end
__LN.fireAnimationArgument = 119;
]]
--[[
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_GUN_02',
						}
					};
]]

GT.Name = "PBR_MKII";
GT.DisplayName = _("Patrol Boat, River MkII");
GT.DisplayNameShort = _("PBR MkII")
GT.Rate = 5;


GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_CivilShip,wsType_GenericCivShip,
				"Unarmed ships",
				"Light armed ships",
				"low_reflection_vessel",
				"NO_SAM"
				};
GT.Categories = {
                    {name = "Armed Ship"},
                };
			

add_surface_unit(GT)