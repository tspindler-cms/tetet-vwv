-- ***************** "LPD Foudre" ******************************

--   Runways and landing strip for Foudre in DCS

GT.RunWays =
{     
-- landing strip definition (first in table)
--	VppStartPoint; 					azimuth (degree} 	Length_Vpp; 	Width_Vpp;
	{{-30.8,	 5.400, 0.0}, 		360.8641, 			240.0, 			25.0, 		
-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	0, 			2.5, 		  		2.8, 					3.0, 			  3.0, 				3.2, 				3.5},
    -- runways
    {{-30.8,	5.400, 0.0}, 	1.22, 			360, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	{{-30.8, 5.400, 0.0}, 	1.22, 			360, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	{{-30.8, 5.400, 0.0}, 	1.22, 			360, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	{{-30.8, 5.400, 0.0},	1.22, 			360, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	{{-30.8, 5.400, 0.0}, 1.22, 			360, 			36.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},
	
	
	  
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
            --{{16.9, deck_level_f,   3.7},   0.0},
			{{-30.8,	5.400, 0.0}, 0.0}	
        }
    },
    {
        TerminalIdx = 2, Points =
        { -- 2 spawn spot
            --{{16.9,  deck_level_r,   0.0},   0.0},
			{{-30.8, 5.400, 0.0}, 0.0}	
        }
    },
	{
        TerminalIdx = 3, Points =
        { -- 3 spawn spot
            --{{16.9, deck_level_f,   3.7},   0.0},
			{{-30.8, 5.400, 0.0}, 0.0}	
        }
    },
    {
        TerminalIdx = 4, Points =
        { -- 4 spawn spot
            --{{16.9, deck_level_r,   0.0},   0.0},
			{{-30.8, 5.400, 0.0}, 0.0}	
        }
    },
	{
        TerminalIdx = 5, Points =
        { -- 5 spawn spot
            --{{16.9, deck_level_r,   0.0},   0.0},
			{{-30.8,  5.400, 0.0}, 0.0}	
        }
    },
}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal