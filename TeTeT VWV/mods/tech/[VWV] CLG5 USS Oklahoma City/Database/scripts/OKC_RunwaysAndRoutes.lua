GT.RunWays =
{
-- landing strip definition (first in table)
--	VppStartPoint; 					azimuth (degree} 	Length_Vpp; 	Width_Vpp;
	{{-81.724,7.1576,0}, 		90.0, 			240.0, 			25.0,
-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	0, 			2.5, 		  		2.8, 					3.0, 			  3.0, 				3.2, 				3.5},
    -- runways
    {{-79.556,6.6695,0}, 	1.22, 			90.0, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
};
GT.RunWays.RunwaysNumber = #GT.RunWays

GT.TaxiRoutes =
{
    -- taxi routes and parking spots
    --    {x, y, z},  direction
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

GT.HelicopterSpawnTerminal =
{
    -- taxi routes and parking spots in LCS
	--    x				y        z			direction
    {
        TerminalIdx = 1, Points =
        { -- 1 spawn spot
			{ {-79.556,6.6695,0}, 90.0 }
        }
    },
}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal