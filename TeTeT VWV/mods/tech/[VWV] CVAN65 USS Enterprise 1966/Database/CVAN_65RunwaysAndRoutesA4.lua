-- ***************** "CV-59 USS Forrestal" ******************************

--   Runways and landing strip for USS Forrestal in LCS

GT.RunWays =
{
-- landing strip definition (first in table)
--	VppStartPoint; 		   azimuth (degree} 	  Length_Vpp; 	   Width_Vpp;
	{{-66.699, 19.55, -4.1029}, 348.0,		   97.0, 			   20.0,  --somewhere between last wire and model center / just past last wire 72 TO 52

-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	1, 			3.5, 		  		4.0, 					4.5, 			  4.5, 				5.0, 				5.5},

-- runways/Cats inbetween Hold back start and connect to front of ship not where the cat/start point connectors are
-- 72.5735 and 62.5735 are short, are working runway lengths
	{{61.721, 19.55,     13.59 }, 	     	355.25, 		      90.9403, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 1 location
	{{61.721, 19.55,   -9.3283 }, 		    000.5, 		    	  90.8136, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 2 location
	{{-43.362, 19.55,  -19.611 }, 		    353.00, 	    	  91.1863, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 3 location
	{{-56.33,  19.55,  -33.23  }, 		    000.0, 		    	  66.2523, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 4 location
};

GT.RunWays.RunwaysNumber = #GT.RunWays

GT.TaxiRoutes =
-- taxi routes and parking spots in LCS
--    x				y        z			V_target
{
	{ -- 1st spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ -22.3,	19.55,		 20.8},  	3.0},
		{{ -22.3,	19.55,		 32.8},  	3.0}
	},
	{ -- 2nd spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 4.5,		19.55,		 -4.2},  	4.0},
		{{ -11.8,	19.55,		 19.2},  	3.0},
		{{ -11.8,	19.55,		 21.0},  	3.0},
		{{ -11.8,	19.55,		 32.8},  	3.0}
	},
	{ -- 3nd spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 4.5,		19.55,		 -4.2},  	4.0},
		{{   -1.3,	19.55,		 17.4},  	3.0},
		{{   -1.3,	19.55,		 21.0},  	3.0},
		{{   -1.3,	19.55,		 32.8},  	3.0}
	},
	{ -- 4th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 14.5,	19.55,		 -4.2},  	4.0},
		{{   8.8,	19.55,		 15.6},  	3.0},
		{{   8.8,	19.55,		 21.6},  	3.0},
		{{   8.8,	19.55,		 32.8},  	3.0}
	},
	{ -- 5th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 24.5,		19.55,		 -4.2},  	4.0},
		{{ 18.3,	19.55,		 13.7},  	3.0},
		{{ 18.3,	19.55,		 21.7},  	3.0},
		{{ 18.3,	19.55,		 32.8},  	3.0}
	},
	{ -- 6th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 34.5,	19.55,		 -4.2},  	4.0},
		{{ 30.8,	19.55,		 11.9},  	3.0},
		{{ 30.8,	19.55,		 21.7},  	3.0},
		{{ 30.8,	19.55,		 32.8},  	3.0}
	},
	{ -- 7th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 41.8,	19.55,		 -11.2},  	4.0},
		{{ 40.8,	19.55,		 7.8},  	3.0},
		{{ 40.6,	19.55,		 0.5},  	3.0},
		{{ 40.0,	19.55,		 20.8},  	3.0},
		{{ 40.0,	19.55,		 32.8},  	3.0}
	},
	{ -- 8th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 42.8,	19.55,		 -11.2},  	4.0},
		{{ 44.8,	19.55,		 7.8},  	3.0},
		{{ 49.8,	19.55,		 20.8},  	3.0},
		{{ 49.8,	19.55,		 32.8},		3.0}
	},
	--{ -- 9th spot, onto port elevator.
	--	{{ 48.8,	19.55,		-25.0},  	6.0},
	--	{{ 58.0,	19.55,		 1.0},  	4.0},
	--	{{ 59.0,	19.55,		-33.4},  	-3.0, 3.0*60.0}  -- Should be despawining?
	--},
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes


GT.TaxiForTORoutes =
-- taxi routes and parking spots in LCS
--    x				y        z			V_target
{
	{ RunwayIdx = 2, Points =
	{ -- 1: 1st in six pack -> cat 2
		{{ 38.2,	19.55,		   1.3}, 	2.0, 20.0},
		{{ 36.0,	19.55,		   -8.7},  	2.0},
		{{50.0,       19.55,    -9.3283},        1.0},
		{{51.0,       19.55,    -9.3283},        1.0}
}
	},
	{ RunwayIdx = 1, Points =
	{ -- 2: 2nd in six pack -> cat 1
		{{  27.2,	19.55,	      3.2}, 	 2.0, 20.0},
		{{  26.2,	19.55,		  -2.1},  	 2.0},
		{{  48.0,	19.55,    13.735},       1.0},
		{{  60.0,   19.55,    13.735},       1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 3: 3rd in six pack -> cat 3
		{{ 16.0,	19.55,		   5.6}, 	3.0, 20.0},
		{{ 11.9,	19.55,		  -15.0},  	4.0},
		{{ 10.5,	19.55,		  -15.2},  	4.0},
		{{ -47.6,	19.55,		  -3.9},  	4.0},
		{{ -59.4,	19.55,		  -9.3},  	2.0},
		{{ -48.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 4: 4th in six pack -> cat 4
		{{  4.4,	19.55,		   7.8}, 	3.0, 20.0},
		{{  1.6,	19.55,		  -3.9},  	4.0},
		{{ -60.4,	19.55,		  -2.2},  	4.0},
		{{ -72.0,	19.55,		  -30.2},  	3.0},
		{{ -81.0,	19.55,		  -30.2},  	3.0},
		{{ -60.8,	19.55,		  -33.23},  	1.0}
	}
	},
	{ RunwayIdx = 1, Points =
	{ -- 5: Furthest directly forward from island -> cat 1
		{{ 49.8,	19.55,		   32.6}, 	2.0},
		{{ 49.8,	19.55,		  28.0},  	1.5},
		{{  52.0,	19.55,    13.735},       1.0},
		{{  60.0,   19.55,    13.735},       1.0}
	}
	},
	{ RunwayIdx = 2, Points =
	{ -- 6: Closest directly forward from island -> cat 2
		{{ 38.0,	19.55,		   32.6}, 	3.0},
		{{ 38.0,	19.55,		   21.8}, 	3.0},
		{{ 33.0,	19.55,		    6.8}, 	3.0},
		{{50.0,       19.55,    -9.3283},        1.0},
		{{51.0,       19.55,    -9.3283},        1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 7: Closest directly behind island -> cat 3
		{{  27.8,	19.55,		   32.6}, 	2.0},
		{{  27.8,	19.55,		   6.0}, 	3.0},
		{{ -47.6,	19.55,		  -3.9},  	4.0},
		{{ -59.4,	19.55,		  -9.3},  	2.0},
		{{ -48.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 8: 2nd directly behind island -> cat 4
		{{  18.3,	19.55,		   32.6}, 	0.5},
		{{  18.3,	19.55,		   6.0}, 	1.0},
		{{ -60.4,	19.55,		  -2.2},  	4.0},
		{{ -72.0,	19.55,		  -30.2},  	3.0},
		{{ -81.0,	19.55,		  -27.2},  	3.0},
		{{ -60.8,	19.55,		  -33.23},  	1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 9: 3rd directly behind island -> cat 3
		{{  8.8,	19.55,		   32.6}, 	2.0},
		{{  8.8,	19.55,		   13.5}, 	2.0},
		{{ -47.6,	19.55,		  -3.9},  	4.0},
		{{ -59.4,	19.55,		  -9.3},  	2.0},
		{{ -48.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 10: 4th directly behind island -> cat 4
		{{  -3.3,	19.55,		   32.6}, 	0.5},
		{{  -3.3,	19.55,		    7.7}, 	0.5},
		{{ -60.4,	19.55,		  -2.2},  	4.0},
		{{ -72.0,	19.55,		  -30.2},  	3.0},
		{{ -81.0,	19.55,		  -27.2},  	3.0},
		{{ -60.8,	19.55,		  -33.23},  	1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 11: 5th directly behind island -> cat 3
		{{ -14.8,	19.55,		   32.6}, 	0.5},
		{{ -14.8,	19.55,		    7.7}, 	1.0},
		{{ -47.6,	19.55,		  -3.9},  	4.0},
		{{ -59.4,	19.55,		  -9.3},  	2.0},
		{{ -48.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 12: 6th directly behind island -> cat 4
		{{ -25.3,	19.55,		   32.6}, 	0.5},
		{{ -25.3,	19.55,		    5.7}, 	0.5},
		{{ -60.4,	19.55,		  -2.2},  	4.0},
		{{ -72.0,	19.55,		  -30.2},  	3.0},
		{{ -81.0,	19.55,		  -27.2},  	3.0},
		{{ -60.8,	19.55,		  -33.23},  	1.0}
	}
	},
}
GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes


GT.HelicopterSpawnTerminal =
-- taxi routes and parking spots in LCS
--    x				y        z			direction
{
	{ TerminalIdx = 1, Points =
	{ -- 1
		{{ -58.2,	19.55,	-31.9}, 	2.0}
	}
	},
	{ TerminalIdx = 2, Points =
	{ -- 2
		{{   59.4,	19.55,	-29.9}, 	0.0}
	}
	},
	{ TerminalIdx = 3, Points =
	{ -- 3
		{{   -119.6,	19.55,	-9.3}, 	0.0}
	}
	},
	{ TerminalIdx = 4, Points =
	{ -- 4
		{{   -96.4,	19.55,	7.1}, 	0.0}
	}
	},
	{ TerminalIdx = 5, Points =
	{ -- 5
		{{   171.0,	19.55,	-8.3}, 	0.0}
	}
	},
	{ TerminalIdx = 6, Points =
	{ -- 6
		{{   151.2,	19.55,	7.2}, 	0.0}
	}
	},
	{ TerminalIdx = 7, Points =
	{ -- 7
		{{   -70.0,	19.55,	-9.3}, 	0.0}
	}
	},
	{ TerminalIdx = 8, Points =
	{ -- 8
		{{   -46.9,	19.55,	7.1}, 	0.0}
	}
	},
	{ TerminalIdx = 9, Points =
	{ -- 9
		{{   -21.3,	19.55,	-9.3}, 	0.0}
	}
	},
	{ TerminalIdx = 10, Points =
	{ -- 10
		{{   1.9,	19.55,	7.1}, 	0.0}
	}
	},
	{ TerminalIdx = 11, Points =
	{ -- 11
		{{   28.3,	19.55,	-9.3}, 	0.0}
	}
	},
	{ TerminalIdx = 12, Points =
	{ -- 12
		{{   51.5,	19.55,	7.1}, 	0.0}
	}
	},
	{ TerminalIdx = 13, Points =
	{ -- 13
		{{   78.5,	19.55,	-9.3}, 	0.0}
	}
	},
	{ TerminalIdx = 14, Points =
	{ -- 14
		{{   101.7,	19.55,	7.1}, 	0.0}
	}
	},
	{ TerminalIdx = 15, Points =
	{ -- 15
		{{   128.0,	19.55,	-9.3}, 	0.0}
	}
	},
	{ TerminalIdx = 16, Points =
	{ -- 16
		{{   3.0,	19.55,	-29.7}, 	0.0}
	}
	},
}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal

GT.ArrestingGears =
{
	--[[
	--[example]
	{
		-- coordinates for spools (Left and Right) in LCS:
		-- if connector exists write connector name
		-- else write position coordinates manually  -- [pos] omitted when [connector_name] exists
		Left =	{ connector_name = '',	pos = {xl,yl,zl} },
		Right =	{ connector_name = '',	pos = {xr,yr,zr} }
	},
	--]]
	{
		Left = {	connector_name = 'POINT_TROS_01_01' },
		Right = {	connector_name = 'POINT_TROS_01_02' }
	},
	{
		Left = {	connector_name = 'POINT_TROS_02_01' },
		Right = {	connector_name = 'POINT_TROS_02_02' }
	},
	{
		Left = {	connector_name = 'POINT_TROS_03_01' },
		Right = {	connector_name = 'POINT_TROS_03_02' }
	},
	{
		Left = {	connector_name = 'POINT_TROS_04_01' },
		Right = {	connector_name = 'POINT_TROS_04_02' }
	},
}

GT.ArrestingGears.ArrestingGearsNumber = #GT.ArrestingGears

GT.Elevators =
-- ElevatorTypes :	SPAWN	= 0, DESPAWN = 1, BOTH	= 2
-- elevator routes and parking spots in LCS
--    x				y        z			V_target
{
	--{ 	ElevatorIdx = 4, ElevatorType = 1, TerminalIdx = 1,	Points =
	--	{
	--		{{59.0,		 7.05,		-33.4}, 	1.0},
	--		{{59.0,		 7.05,		 0.0}, 	1.0},
	--		{{20.0,		 7.05,		 0.0}, 	1.0}
	--	}
	--},
	--{ 	ElevatorIdx = 2, ElevatorType = 1, TerminalIdx = 1,	Points =
	--	{
	--		{{-22.5,	 7.05,		 36.0}, 	1.0},
	--		{{-22.5,	 7.05,		 -3.0}, 	1.0},
	--		{{-36.5,	 7.05,		 -4.5}, 	1.0}
	--	}
	--},
	--{
	--	ElevatorIdx = 3, ElevatorType = 1, TerminalIdx = 1,	Points =
	--	{
	--		{{-67.0,	 7.05,		 36.0}, 	1.0},
	--		{{-67.0,	 7.05,		 -3.0}, 	1.0},
	--		{{-53.0,	 7.05,		 -4.5}, 	1.0}
	--	}
	--},
}
GT.Elevators.ElevatorsNumber = #GT.Elevators
