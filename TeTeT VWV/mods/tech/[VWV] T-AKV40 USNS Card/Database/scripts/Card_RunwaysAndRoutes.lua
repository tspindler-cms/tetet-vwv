GT.RunWays =
{
-- landing strip definition (first in table)
--	VppStartPoint; 					azimuth (degree} 	Length_Vpp; 	Width_Vpp;
	{{-54.327, 12.945, -5.1787}, 		360.8641, 			240.0, 			25.0,
-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	0, 			2.5, 		  		2.8, 					3.0, 			  3.0, 				3.2, 				3.5},
    -- runways
    {{-54.327, 12.945, -5.1787}, 	1.22, 			360, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
};
GT.RunWays.RunwaysNumber = #GT.RunWays

GT.TaxiRoutes =
{
    -- taxi routes and parking spots
    --    {x, y, z},  direction
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

GT.HelicopterSpawnTerminal =
	-- taxi routes and parking spots in LCS
	--    x				y        z			direction
{
	{ TerminalIdx = 1, Points =
		{ -- 1 spawn spot
        {{ 1.327, 13.176, -5.1787},   	0.0}
		}
	},
	{ TerminalIdx = 2, Points =
		{ -- 2 spawn spot
        {{ -24.327, 13.068, -5.1787},   	0.0}
		}
	},
	{ TerminalIdx = 3, Points =
		{ -- 3 spawn spot
        {{-54.327, 12.945, -5.1787}, 		0.0}
		}
	},
}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal