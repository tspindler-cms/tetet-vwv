GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "sampan_open"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 30; -- hit points
GT.mass = 200.0; -- KGs
GT.max_velocity = 1.0; --M/S
GT.race_velocity = 1.0; --M/S
GT.economy_velocity = 0.8; --M/S
GT.economy_distance = 12000; -- KM
GT.race_distance = 2.778e+006;
GT.shipLength = 6.4939; -- o.a in meters
GT.Width = 1.1043; --15 --meters
GT.Height = 0.8622; --335.226 from sea level I think
GT.Length = 6.177; -- deck length I think
GT.DeckLevel = 0.6781; -- height of deck
GT.X_nose = 2.000;-- bow wave
GT.X_tail = -2.000; -- wake
GT.Tail_Width = 0.5; --wake width
GT.Gamma_max = 0.35; -- no idea
GT.Om = 0.05; --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 30; -- turn radius

GT.RCS = 10; -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9; -- new in 2.7 not sure the params

GT.TACAN = false;		--If it has TACAN say true if not say false or not have this entry
GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 60;

GT.animation_arguments = {
	nav_lights = 0,
	water_propeller = 14,
};

--Damage Model
GT.DM = {
	{ area_name = "Sampan", area_arg = 2001, area_life = 300},
};
-------------------------------------------------------------------------

GT.Name = "sampan_open"; -- folder name for Liveries
GT.DisplayName = _("[VWV] Sampan"); -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Sampan"); -- Label name
GT.Rate = 30.000000;
GT.riverCraft = true;
GT.draft = 0.10;

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
GT.Singleton		= "yes";
GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericCivShip,
				"low_reflection_vessel",
                "Light armed ships",
			    "NO_SAM",
				};

				-- categories in the mission editor
GT.tags  =
{
	"Civilian",
};
