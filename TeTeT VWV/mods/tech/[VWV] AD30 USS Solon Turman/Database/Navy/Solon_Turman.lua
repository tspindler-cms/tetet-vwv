--DCS Mod AI Solon_Turman by Admiral189 
-- config edited by TeTeT for VWV

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "Solon_Turman"
GT.visual.shape_dstr = ""

GT.animation_arguments.radar1_rotation = 12; 
GT.radar1_period = 4;
GT.animation_arguments.radar2_rotation = -1;
GT.radar2_period = 2; 
GT.animation_arguments.radar3_rotation = -1; 
GT.animation_arguments.luna_lights = -1;

GT.animation_arguments.flag_animation = 11;
GT.animation_arguments.water_propeller = 8;

GT.life = 2300;
GT.mass = 11800e+007;
GT.max_velocity = 7.5333
GT.race_velocity = 7.5333
GT.economy_velocity = 10.2889
GT.economy_distance = 1.1112e+007
GT.race_distance = 2.778e+006
GT.shipLength = 180.0
GT.Width = 21.0
GT.Height = 29
GT.Length = 180.0
GT.DeckLevel = 8
GT.draft = 7.6

GT.X_nose = 92.8
GT.X_tail = -87.2
GT.Tail_Width = 21
GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 0.229734
GT.R_min = 345.6
GT.distFindObstacles = 200
GT.RCS = 100000

GT.trim = 0.5
GT.deltaWaterline = 4.0

GT.airWeaponDist = 13000
GT.airFindDist = 15000

GT.numParking = 1;
GT.Helicopter_Num_ = 2;
GT.Landing_Point = {-86.25, 8.65, 0.0}

GT.exhaust =
{
	{ size = 0.5 , connector = "SMOKE_PIPE_Mailn", preset = "Bazar/ParticleEffects/effects/SmokeShip.lua"},
 }

--------------------------------------------------------------------------------
-- DAMAGE MODEL AREAS
--------------------------------------------------------------------------------

GT.DM = {
    { area_name = "BOW",		    area_arg = 70,	area_life = 110, area_fire = { pos = {-18.0, 6.0, 0.0}, size = 0.8}},
    { area_name = "COMMAND",		area_arg = 71,	area_life = 110, area_fire = { pos = {-18.7, 6.0, 0.7}, size = 0.8}},
    }

GT.Name = "AD-30 Solon Turman"
GT.DisplayName = _("[VWV] AD-30 Solon Turman")
GT.DisplayNameShort = _("Solon Turman")
GT.Rate = 100

GT.sensor = {
	max_range_finding_target = 15000,
	min_range_finding_target = 0,
	max_alt_finding_target = 3000,
	min_alt_finding_target = 0,
	pos = {58.0, 17.5, 0.0},
}

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   = "no";
GT.mapclasskey = "P0000000634";
GT.attribute = {wsType_Navy, wsType_Ship, wsType_CivilShip, wsType_GenericCivShip,
				"Unarmed ships",
				};
				GT.Categories = {
					{name = "Armed Ship"},
					{name = "HelicopterCarrier"}
				};

GT.Countries = {"USA", };

add_surface_unit(GT)