GT.RunWays =
{
-- landing strip definition (first in table)
--	VppStartPoint; 					azimuth (degree} 	Length_Vpp; 	Width_Vpp;
	{{-114.45,6.25,0}, 		45.0, 			25.0, 			25.0,
-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	0, 			8.5, 		  		9.0, 					9.5, 			  10.0, 				10.5, 				11.0},
    -- runways
    {{-114.45,6.25,0}, 	45, 			25.0, 			25.0, 		0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0},
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
			{ {-114.45,6.25,0}, 45.0 }
        }
    },
}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal