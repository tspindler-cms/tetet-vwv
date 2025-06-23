-- ***************** "Essex class CVA-31 Bon Homme Richard" ******************************

--   Runways and landing strip for 'CVA-31'
--MODIFIED TAXI AND LAUNCH SPOTS BY SEABAT 2023-12-26
-- You can get deck height from 3d software
-- you can use the carrier plugin in the modelviewer to help with the routes
GT.RunWays =
{     
-- landing strip definition (first in table)  
--	VppStartPoint; 		   azimuth (degree} 	  Length_Vpp; 	   Width_Vpp;
	{{-49.5916, 17.004, -5.60511}, 349.0,		   97.0, 			   20.0,  --somewhere between last wire and model center / just past last wire 72 TO 52

-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	1, 			3.5, 		  		4.0, 					4.5, 			  4.5, 				5.0, 				5.5},

-- runways/Cats inbetween Hold back start and connect to front of ship not where the cat/start point connectors are
	{{50.5750,  17.004,    9.330 }, 	     	000, 		    	  72.5735, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 1 location
	{{50.6561,  17.004,  -11.781}, 		    002.4, 		    	  72.5735, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 2 location
	};

GT.RunWays.RunwaysNumber = #GT.RunWays

-- from landing to Parking 
-- kudos Citizen
GT.TaxiRoutes = 
{
	{ -- 1 parking spot
		{{   5.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 127.00, 16.95,  -2 },	4.0}, -- WP 4 
		{{ 127.00, 16.95,  12 },	4.0,     0.0*0.0} -- Park . 1.0*60 = time for pilot to despawn 60 seconds, this is an option 
	},
	{ -- 2 parking spot 
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 115.00, 16.95,  -2 },	4.0},
		{{ 115.000, 16.95, 12 },	4.0,    0.0*0.0 }
	},
	{ -- 3 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 103.00, 16.95,  -2 },	4.0},
		{{ 103.00, 16.95,  12 },	4.0,	0.0*0.0}
	},
	{ -- 4 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 91.00, 16.95,   -2 },	4.0},
		{{ 91.00, 16.95,   12 },	4.0,	0.0*0.0}
	},
	{ -- 5 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 127.00, 16.95,  -1 },	4.0}, -- WP 4 
		{{ 127.00, 16.95, -13.5 },	4.0,     0.0*0.0} -- Park . 1.0*60 = time for pilot to despawn 60 seconds, this is an option 
	},
	{ -- 6 parking spot 
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 115.00, 16.95,  -1 },	4.0},
		{{ 115.00, 16.95, -13.5 },	4.0,    0.0*0.0 }
	},
	{ -- 7 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 103.00, 16.95,  -1 },	4.0},
		{{ 103.00, 16.95, -13.5 },	4.0,	0.0*0.0}
	},	
	{ -- 8 parking spot
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 91.00, 16.95,   -1 },	4.0},
		{{ 91.00, 16.95,  -13.5 },	3.0,	0.0*0.0}
	},
	{ -- 9 parking spot
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 79.00, 16.95,  -2 },	4.0}, -- WP 4 
		{{ 79.00, 16.95,  12 },	4.0,     0.0*0.0} -- Park . 1.0*60 = time for pilot to despawn 60 seconds, this is an option 
	},
	{ -- 10 parking spot 
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 67.00, 16.95,  -2 },	4.0},
		{{ 67.000, 16.95, 12 },	4.0,    0.0*0.0 }
	},
	{ -- 11 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 55.00, 16.95,  -2 },	4.0},
		{{ 55.00, 16.95,  12 },	4.0,	0.0*0.0}
	},
	{ -- 12 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -4 }, 	6.0},
		{{ 43.00, 16.95,   -2 },	4.0},
		{{ 43.00, 16.95,   12 },	4.0,	0.0*0.0}
	},
	{ -- 13 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{  79.00, 16.95,  -1 },	4.0}, -- WP 4 
		{{  79.00, 16.95, -13.5 },	4.0,     0.0*0.0} -- Park . 1.0*60 = time for pilot to despawn 60 seconds, this is an option 
	},
	{ -- 14 parking spot 
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 67.00, 16.95,  -1 },	4.0},
		{{ 67.00, 16.95, -13.5 },	4.0,    0.0*0.0 }
	},
	{ -- 15 parking spot
		{{  7.00, 16.95,   -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 55.00, 16.95,   -1 },	4.0},
		{{ 55.00, 16.95, -14.5 },	4.0,	0.0*0.0}
	},	
	{ -- 16 parking spot
		{{   7.00, 16.95,  -5 }, 	6.0},
		{{  35.00, 16.95,  -5 }, 	6.0},
		{{ 43.00, 16.95,   -1 },	4.0},
		{{ 43.00, 16.95,  -14.5 },	3.0,	0.0*0.0}
	},	
		
}

GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

-- Spawn to take off 
GT.TaxiForTORoutes = 
	-- taxi routes and parking spots in CVA-31
	--    L/R         U/D       F/B
	--    x				z        y		V_target
{		
 	
	{ RunwayIdx = 1, Points =
		{ -- 1 spawn 
			{{20.0,	      16.95,     2.0},      2.0},
			{{25.0,	      16.95,     2.0},      2.0},
			{{36.0,       16.95,     2.2},      3.5},
			{{39.0,       16.95,     9.0},      3.0},
			{{40.0,	      16.95,    9.50},      2.5},
			{{48.0,	      16.95,    9.75},      1.0}  
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 2 spawn 
			{{20.0,	      16.95,    -7.5},      0.3},
			{{25.0,	      16.95,    -7.5},      0.3},  
			{{36.0,       16.95,   -8.75},      0.4},
			{{39.0,       16.95,    -9.0},      0.5},
			{{40.5,       16.95,   -13.5},      0.5},
 			{{43.5,       16.95,   -12.25},     0.6},
			{{50.0,       16.95,   -12.25},     0.6},
 			{{51.0,       16.95,   -12.25},     1.0}   
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 3 spawn 
			{{-3.0,	      16.95,     2.0},      1.0}, 
			{{36.0,       16.95,     2.0},      2.0},
			{{39.0,       16.95,     9.0},      2.0},
			{{40.0,	      16.95,     10.5},     1.5},
			{{48.0,	      16.95,     10.9},     1.0} 
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 4 spawn 
			{{-3.0,	      16.95,    -7.5},      1.0}, 
			{{36.0,       16.95,    -7.5},      2.0},
			{{39.0,       16.95,    -9.0},      2.0},
			{{40.5,       16.95,   -13.5},      1.5},
 			{{43.5,       16.95,   -12.25},     1.5},
			{{50.0,       16.95,   -12.25},     1.5},
 			{{51.0,       16.95,   -12.25},     1.0}    
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 5 spawn 
 			{{-62.0,      	16.95,     8.5},      1.0},
			{{-62.0,      	16.95,      5.0},      2.0},
			{{ 27.0,       	16.95,     -1.0},       1.0},
			{{ 36.0,      	16.95,      1.0},       2.0}, 
			{{ 40.0,	16.95,     12.0},       2.0},
			{{ 50.5,	16.95,     11.0},       1.0} 
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 6 spawn 
 			{{-93.0,      	16.95,     8.5},      1.0},
			{{-93.0,      	16.95,      3.0},      1.0},
			{{ 27.0,       	16.95,     -10.0},     1.0},
			{{ 37.5,       	16.95,     -10.0},     2.0},
			{{ 40.5,      	16.95,     -12.0},     1.0}, 
 			{{ 43.5,      	16.95,     -11.0},     1.0},
			{{ 50.0,       	16.95,     -11.7},     1.0},
 			{{ 51.0,      	16.95,   - 11.78},     1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 7 spawn 
			{{-117.0,     	16.95,      7.1},     1.0},
			{{-116.0,     	16.95,      7.05},     1.0},
			{{-64.0,      	16.95,      7.1},     1.0}, 
			{{ 27.0,       	16.95,     -1.0},       1.0},
			{{ 36.0,      	16.95,      1.0},       2.0}, 
			{{ 40.0,	16.95,     12.0},       2.0},
			{{ 50.5,	16.95,     11.0},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 8 spawn 
			{{-118.0,       16.95,   -10.5},      1.0},
			{{-117.0,       16.95,   -10.55},      1.0},  
			{{ 27.0,      	16.95,    -10.5},       2.0},
			{{ 37.5,      	16.95,    -12.0},       1.0},
			{{ 40.5,      	16.95,    -12.0},       1.0}, 
 			{{ 43.5,       	16.95,    -12.5},       1.0},
			{{ 50.0,       	16.95,    -12.5},       1.0},
 			{{  51.0,       16.95,   -11.78},       1.0}
		}
	},
}
GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes

--Helicopter Spawns
GT.HelicopterSpawnTerminal = 
	-- taxi routes and parking spots in LCS
	--    x				y        z			direction
{		
	{ TerminalIdx = 1, Points =
		{ -- 1 spawn spot
        {{-25, 16.95, -6.5}, 	0.0}			
		}
	},
	{ TerminalIdx = 2, Points =
		{ -- 2 spawn spot
        {{ -45, 16.95, -6.5},   0.0}			
		}
	},
	{ TerminalIdx = 3, Points =
		{ -- 3 spawn spot
        {{ -65, 16.95, -6.0},   0.0}
		}
	},
	{ TerminalIdx = 4, Points =
		{ -- 4 spawn spot
        {{ -85, 16.95, -6.0},  0.0}
		}
	},
	{ TerminalIdx = 5, Points =
		{ -- 5 spawn spot
        {{126, 16.95, -11.0}, 	0.0}			
		}
	},
	{ TerminalIdx = 6, Points =
		{ -- 6 spawn spot
        {{ 104, 16.95, -11.0},  0.0}
		}
	},
	{ TerminalIdx = 7, Points =
		{ -- 7 spawn spot
        {{ 126, 16.95, 9.0},   	0.0}			
		}
	},
	{ TerminalIdx = 8, Points =
		{ -- 8 spawn spot
        {{ 104, 16.95, 9.0},  0.0}
		}
	},
	{ TerminalIdx = 9, Points =
		{ -- 9 spawn spot
        {{82, 16.95, -11.0}, 	0.0}			
		}
	},
	{ TerminalIdx = 10, Points =
		{ -- 10 spawn spot
        {{60, 16.95, -11.0},   	0.0}
		}
	},
	{ TerminalIdx = 11, Points =
		{ -- 11 spawn spot
        {{82, 16.95,   9.0},   	0.0}			
		}
	},
	{ TerminalIdx = 12, Points =
		{ -- 12 spawn spot
        {{60, 16.95,   9.0},   	0.0}
		}
	},
	{ TerminalIdx = 13, Points =
		{ -- 13 spawn spot
        {{38, 16.95, -17.0}, 	0.0}			
		}
	},
	{ TerminalIdx = 14, Points =
		{ -- 14 spawn spot
        {{ 16, 16.95, -25.0},   0.0}			
		}
	},
	{ TerminalIdx = 15, Points =
		{ -- 15 spawn spot
        {{ -6, 16.95, -25.0},   0.0}
		}
	},
	{ TerminalIdx = 16, Points =
		{ -- 16 spawn spot
        {{ -28, 16.95, -25.0},  0.0}
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
	--    x				z        y			V_target
{		
--[[ 
	{ 	ElevatorIdx = 1, ElevatorType = 2, TerminalIdx = 1,	Points =
		{ 
			{{ 35.794,	5.164,	  -21.0}, 	1.0},
			{{ 35.784,	5.164,	  1.119}, 	1.0},
			{{ 3.69,	5.164,	  1.119}, 	1.0}
		}
	},
	{
		ElevatorIdx = 2, ElevatorType = 1, TerminalIdx = 2,	Points =
		{ 
			{{-59.722,	5.164,	  0.0},   	1.0},
			{{-36.13,	5.164,	  0.0}, 	1.0}
		}
	},	
	 ]]
}
GT.Elevators.ElevatorsNumber = #GT.Elevators	