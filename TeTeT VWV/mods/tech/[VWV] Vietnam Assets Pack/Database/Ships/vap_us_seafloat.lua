-- VAP US seafloat --

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "vap_us_seafloat"
GT.visual.shape_dstr = ""
	
-----------------------------------------------------------------------------------------------------				
GT.life = 5
GT.mass = 3.456e+006
GT.max_velocity = 8.20222
GT.race_velocity = 6.17333
GT.economy_velocity = 6.17333
GT.economy_distance = 1.59272e+007
GT.race_distance = 1.59272e+007
GT.shipLength = 65
GT.Width = 10
GT.Height = 23
GT.Length = 52
GT.DeckLevel = 5.0
GT.X_nose = 22
GT.X_tail = -27
GT.Tail_Width = 10
GT.Gamma_max = 1.0
GT.Om = 0.02
GT.speedup = 0.101986
GT.R_min = 400.0
GT.distFindObstacles = 500
GT.RCS = 8000

-----------------------------------------------------------------------------------------------------
--Burning after hit
--GT.visual.fire_size = 0.4 --relative burning size
--GT.visual.fire_pos[1] = 0 -- center of burn at long axis shift(meters)
--GT.visual.fire_pos[2] = 0 -- center of burn shift at vertical shift(meters)
--GT.visual.fire_pos[3] = 0 -- center of burn at transverse axis shift(meters)
--GT.visual.fire_time = 500 --burning time (seconds)

GT.animation_arguments.radar1_rotation = 13; -- Top Radar
GT.radar1_period = 2;
--GT.animation_arguments.radar2_rotation = 14; -- Lower Radar
--GT.radar2_period = 1;
--GT.animation_arguments.radar3_rotation = 15; -- Front Radar
--GT.radar3_period = 1;

GT.numParking      = 4
GT.Helicopter_Num_ = 4

local deck_level = 1.51

GT.DeckLevel       = deck_level
GT.Landing_Point   = {-6.62, deck_level, -25.0}

GT.RunWays =
{
    -- landing strip definition (first in table)
    --  VppStartPoint            azimuth (degree}   Length_Vpp     Width_Vpp
    {{-10.0, deck_level,  -25.27},         0.0,             5.0,          14.0,
    -- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
       0,             2.5,              2.8,               3.0,               3.0,                 3.2,               3.5 },
    -- runways
    {{-6.62, deck_level,  -25.27},         0.0,             5.0,          14.0,         0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	{{-6.62, deck_level,  -8.4},         0.0,             5.0,          14.0,         0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	{{-6.62, deck_level,   8.4},         0.0,             5.0,          14.0,         0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
    {{-6.62, deck_level,   25.27},         0.0,             5.0,          14.0,         0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
}
GT.RunWays.RunwaysNumber = #GT.RunWays

GT.TaxiRoutes =
{

}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

GT.HelicopterSpawnTerminal =
{
    -- taxi routes and parking spots in LCS
    --    {x, y, z},  direction
    {
        TerminalIdx = 1, Points =
        { -- 1 spawn spot
            {{-6.62, deck_level,  -25.27},     0.0},
        }
    },
    {
        TerminalIdx = 2, Points =
        { -- 1 spawn spot
            {{-6.62, deck_level,  -8.4},     0.0},
        }
    },
	{
        TerminalIdx = 3, Points =
        { -- 1 spawn spot
            {{-6.62, deck_level,  8.4},     0.0},
        }
    },
	{
        TerminalIdx = 4, Points =
        { -- 1 spawn spot
            {{-6.62, deck_level,  25.27},     0.0},
        }
    },
}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal
				
GT.exhaust =
{
	{ size = 0.5 , connector = "SMOKE_PIPE", preset = "Bazar/ParticleEffects/effects/SmokeShip.lua"},
	-- { size = 0.5 , connector = "SMOKE_PIPE_1_R"},
 }			
			 
GT.driverViewConnectorName = "DRIVER_POINT";
GT.driverCockpit = "DriverCockpit/DriverCockpitWithLLTV";			 
				
GT.airWeaponDist = 0
GT.airFindDist = 0
GT.animation_arguments.locator_rotation = 11;
GT.radar_rotation_period = 1;
GT.animation_arguments.alarm_state = 3;
				
GT.sensor = {};
GT.sensor.max_range_finding_target = 0;
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_alt_finding_target = 0;
GT.sensor.height = 3.8;

-----------------------------------------------------------------------------------------------------
GT.WS = {};
GT.WS.maxTargetDetectionRange = 0;
GT.WS.radar_type = 0;
GT.WS.radar_rotation_type = 0;

-----------------------------------------------------------------------------------------------------
GT.Name = "vap_us_seafloat"
GT.DisplayName = _("VAP US Sea Float Barge")
GT.DisplayNameShort = _("US SeaFloat")
GT.Rate = 0
				
GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";

GT.mapclasskey = "P0091000039";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_AirCarrier,WSTYPE_PLACEHOLDER,
				"Aircraft Carriers",
				"Unarmed ships",
				"Straight_in_approach_type",	-- for aircraft style helicopter/stvol aircraft landing approch
				};
GT.Categories = {
                    {name = "HelicopterCarrier"},
					{ name = "AircraftCarrier" },
                };
GT.tags  =
{
	"Civilian",
}
GT.Countries = {"USA"}				                
