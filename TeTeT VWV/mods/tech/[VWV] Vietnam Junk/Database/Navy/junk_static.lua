-- Junk_static

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "Junk_static"
GT.visual.shape_dstr = ""

GT.life = 300; -- hit points
GT.mass = 20000.0; -- KGs
GT.max_velocity = 2.05777778; --M/S
GT.race_velocity = 2.05777778; --M/S
GT.economy_velocity = 1.3; --M/S 
GT.economy_distance = 12000; -- KM
GT.race_distance = 2.778e+006;
GT.shipLength = 64.939; -- o.a in meters
GT.Width = 5.7876; --15 --meters
GT.Height = 47.878; --335.226 from sea level I think
GT.Length = 62.4; -- deck length I think
GT.DeckLevel = 1.6781; -- height of deck
GT.X_nose = 28.273;-- bow wave
GT.X_tail = -17.816; -- wake
GT.Tail_Width = 8; --wake width
GT.Gamma_max = 0.35; -- no idea
GT.Om = 0.05; --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 300; -- turn radius

GT.RCS = 100000; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 120;

-- smoke density and position
--GT.exhaust = {
--	[1] = { size = 0.60, pos = {9.654,  17.13, 0}},
--	[2] = { size = 0.60, pos = {-8.024, 15.01, 0}}
--};

GT.animation_arguments = {
	nav_lights = 0,
	water_propeller = 14,
};
--[[GT.radar1_period = 2; --speed
GT.radar2_period = 4;
GT.radar3_period = 4;]]

--Damage Model
GT.DM = {
	{ area_name = "hull", area_arg = 2001, area_life = 300},
	{ area_name = "deck", area_arg = 2002, area_life = 120},
	{ area_name = "sail", area_arg = 2003, area_life = 20},
	{ area_name = "mast", area_arg = 2004, area_life = 50},
};


GT.Name = "junk static"
GT.DisplayName = _("[VWV] Vietnam Junk Static")
GT.DisplayNameShort = _("Junk Static"); -- Label name
GT.Rate = 300.000000;

GT.Sensors = {  OPTIC = {"long-range naval optics"}, --optics types
                RADAR = {}, --radar types
};
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 28.8;
GT.sensor.max_range_finding_target = 50;
----------------------------------------------------
GT.DetectionRange  	= GT.airFindDist;
GT.ThreatRange 		= GT.airWeaponDist;
GT.Singleton		= "no";
GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericCivShip,
				"low_reflection_vessel",
                "Light armed ships",
			    "NO_SAM",
				};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "HelicopterCarrier"}
					};	
					
					
-- categories in the mission editor 
add_surface_unit(GT)		