-- ***************** "CVN-65 USS Enterprise" ******************************


--   Runways and landing strip for USS Enterprise in DCS, based upon:
--   Runways and landing strip for USS Forrestal in LCS

GT.RunWays =
{
-- landing strip definition (first in table)
--	VppStartPoint; 		   azimuth (degree} 	  Length_Vpp; 	   Width_Vpp;
	{{-45.42, 19.55, -12.65}, 348.5,   87.0,    20.0,  --somewhere between last wire and model center / just past last wire 72 TO 52

-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	1, 			3.5, 		  		4.0, 					4.5, 			  4.5, 				5.0, 				5.5},

-- runways/Cats inbetween Hold back start and connect to front of ship not where the cat/start point connectors are
-- 72.5735 and 62.5735 are short, are working runway lengths
	{{64.221, 19.55,     13.418 }, 	     	356.13, 		      90.9403, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 1 location
	{{64.432, 19.55,     -9.331 }, 		    002.075, 		      90.8136, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 2 location
	{{-42.709, 19.55,   -20.004 }, 		    353.19, 	    	  91.1863, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 3 location
	{{-54.178, 19.55,   -33.234 }, 		    000.06,		    	  66.2523, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 4 location
};

GT.RunWays.RunwaysNumber = #GT.RunWays

GT.TaxiRoutes =
-- taxi routes and parking spots in LCS
--    x				y        z			V_target
{
	{ -- 1st spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ -22.3,	19.55,		 15.0},  	3.0},
		{{ -22.3,	19.55,		 20.8},  	-3.0},
		{{ -22.8,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 2nd spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 4.5,		19.55,		 -4.2},  	4.0},
		{{ -9.8,	19.55,		 19.2},  	-3.0},
		{{ -9.8,	19.55,		 21.0},  	-3.0},
		{{ -9.8,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 3nd spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 4.5,		19.55,		 -4.2},  	4.0},
		{{   3.3,	19.55,		 17.4},  	-3.0},
		{{   3.3,	19.55,		 21.0},  	-3.0},
		{{   3.3,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 4th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 14.5,	19.55,		 -4.2},  	4.0},
		{{   15.8,	19.55,		 15.6},  	-3.0},
		{{   15.8,	19.55,		 21.6},  	-3.0},
		{{   15.8,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 5th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 24.5,	19.55,		 -4.2},  	4.0},
		{{ 27.3,	19.55,		 13.7},  	-3.0},
		{{ 27.3,	19.55,		 21.7},  	-3.0},
		{{ 27.3,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 6th spot,
		{{ 40.8,	19.55,		-26.2},  	6.0},
		{{ 35.5,	19.55,		 -9.7},  	4.0},
		{{ 34.5,	19.55,		 -4.2},  	4.0},
		{{ 40.8,	19.55,		 11.9},  	-3.0},
		{{ 40.8,	19.55,		 21.7},  	-3.0},
		{{ 40.8,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 7th spot,
		{{ 40.8,	19.55,		-20.2},  	6.0},
		{{ 36.0,    19.55,       -5.0},     4.0},
		{{-57.0,	19.55,		 11.2},  	4.0},
		{{-57.0,	19.55,		 15.8},  	-3.0},
		{{-57.0,	19.55,		 32.8},  	-2.0, 60.0}
	},
	{ -- 8th spot,
		{{ 40.8,	19.55,		-20.2},  	6.0},
		{{ 36.0,	19.55,		 -5.0},  	4.0},
		{{ -72.0,	19.55,		 13.0},  	3.0},
		{{ -72.0,	19.55,		 15.8},  	-3.0},
		{{ -72.0,	19.55,		 32.8},		-2.0, 60.0}
	},
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes


GT.TaxiForTORoutes =
-- taxi routes and parking spots in LCS
--    x				y        z			V_target
{
	{ RunwayIdx = 2, Points =
	{ -- 1: 1st in six pack -> cat 2
		{{ 36.2,	19.55,		   1.3}, 	2.0, 20.0},
		{{ 34.0,	19.55,		   -8.7},  	2.0},
		{{50.0,       19.55,    -9.3283},        1.0},
		{{51.0,       19.55,    -9.3283},        1.0}
}
	},
	{ RunwayIdx = 1, Points =
	{ -- 2: 2nd in six pack -> cat 1
		{{  22.2,	19.55,	      3.2}, 	 2.0, 20.0},
		{{  20.4,	19.55,		  -2.1},  	 2.0},
		{{  40.0,	19.55,    13.59},       1.0},
		{{  55.0,   19.55,    13.59},       1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 3: 3rd in six pack -> cat 3
		{{  8.2,	19.55,		   5.6}, 	3.0, 20.0},
		{{  5.2,	19.55,		  -6.0},  	4.0},
		{{  0.0,	19.55,		  -11.8},  	4.0},
		{{ -65.6,	19.55,		  -3.9},  	4.0},
		{{ -62.4,	19.55,		  -19.3},  	2.0},
		{{ -55.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 4: 4th in six pack -> cat 4
		{{  -7.8, 	19.55,		   7.8}, 	3.0, 20.0},
		{{  -10,	19.55,		  -3.9},  	4.0},
		{{ -65.4,	19.55,		  8.0},  	4.0},
		{{ -81.0,	19.55,		  -30.2},  	3.0},
		{{ -65.8,	19.55,		  -33.23},  	1.0}
	}
	},
	{ RunwayIdx = 1, Points =
	{ -- 5: Furthest directly forward from island -> cat 1
		{{   46,	19.55,		   33}, 	2.0},
		{{   46,	19.55,		  28.0},  	1.5},
		{{  50.0,	19.55,        13.59},       1.0},
		{{  55.0,   19.55,        13.59},       1.0}
	}
	},
	{ RunwayIdx = 2, Points =
	{ -- 6: Closest directly forward from island -> cat 2
		{{ 32.0,	19.55,		   33}, 	3.0},
		{{ 32.0,	19.55,		   21.8}, 	3.0},
		{{ 30.0,	19.55,		    6.8}, 	3.0},
		{{ 40.0,    19.55,    -9.3283},        1.0},
		{{ 51.0,    19.55,    -9.3283},        1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 7: Closest directly behind island -> cat 3
		{{  18.0,	19.55,		   33}, 	2.0},
		{{  18.0,	19.55,		   6.0}, 	3.0},
		{{ -65.6,	19.55,		  -3.9},  	4.0},
		{{ -62.4,	19.55,		  -19.3},  	2.0},
		{{ -55.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 8: 2nd directly behind island -> cat 4
		{{   4.0,	19.55,		   33}, 	0.5},
		{{   4.0,	19.55,		   6.0}, 	1.0},
		{{ -65.4,	19.55,		   8.0},  	4.0},
		{{ -81.0,	19.55,		  -27.2},  	3.0},
		{{ -65.8,	19.55,		  -33.23},  	1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 9: 3rd directly behind island -> cat 3
		{{  -10,	19.55,		   33}, 	2.0},
		{{  -10,	19.55,		   13.5}, 	2.0},
		{{ -65.6,	19.55,		  -3.9},  	4.0},
		{{ -62.4,	19.55,		  -19.3},  	2.0},
		{{ -55.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 10: 4th directly behind island -> cat 4
		{{  -24,	19.55,		   33}, 	0.5},
		{{  -24,	19.55,		    7.7}, 	0.5},
		{{ -65.4,	19.55,		    8.0},  	4.0},
		{{ -81.0,	19.55,		  -27.2},  	3.0},
		{{ -65.8,	19.55,		  -33.23},  1.0}
	}
	},
	{ RunwayIdx = 3, Points =
	{ -- 11: 5th directly behind island -> cat 3
		{{ -57,	    19.55,		   33}, 	0.5},
		{{ -57,	    19.55,		    7.7}, 	1.0},
		{{ -72,	    19.55,	  	   -3.9},  	4.0},
		{{ -65.4,	19.55,		  -19.3},  	2.0},
		{{ -55.6,	19.55,		  -19.611},  	1.0}
	}
	},
	{ RunwayIdx = 4, Points =
	{ -- 12: 6th directly behind island -> cat 4
		{{ -72,	    19.55,		   33}, 	0.5},
		{{ -72,	    19.55,		    5.7}, 	0.5},
		{{ -85, 	19.55,		  -2.2},  	4.0},
		{{ -81.0,	19.55,		  -30.2},  	3.0},
		{{ -65.8,	19.55,		  -33.23},  	1.0}
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
		{{   49.4,	19.55,	-29.9}, 	0.0}
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
		{{   155.0,	19.55,	-8.3}, 	0.0}
	}
	},
	{ TerminalIdx = 6, Points =
	{ -- 6
		{{   141.2,	19.55,	7.2}, 	0.0}
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
		{{   120.0,	19.55,	-9.3}, 	0.0}
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
