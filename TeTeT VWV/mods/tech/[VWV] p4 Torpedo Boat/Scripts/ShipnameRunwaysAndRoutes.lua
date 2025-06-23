-- ***************** "Name of Ship" ******************************

--   Runways and landing strip for 'Name of Ship' in LCS
-- You can get deck hieght from 3d software
-- you can use the carrier plugin in the modelviewer to help with the routes
GT.RunWays =
{     
-- landing strip definition (first in table)  
--	VppStartPoint; 		   azimuth (degree} 	  Length_Vpp; 	   Width_Vpp;
	{{0.0, 0.0, 0.0}, 		   000, 			       0.0, 			0.0,  --somewhere between last wire and model center / just past last wire

-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	1, 			3.5, 		  		4.0, 					4.5, 			  4.5, 				5.0, 				5.5},

-- runways/Cats inbetween Hold back start and connect to front of ship not where the cat/start point connectors are
	{{0.0,  0.0,    0.0}, 		000, 		    	  62.684, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat locations
	{{0.0,  0.0,    0.0}, 		000, 		    	  65.568, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat Locations 
	{{0.0,  0.0,    0.0}, 		000, 		          62.684, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat locations
	{{0.0,  0.0,    0.0}, 		000, 		    	  65.568, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat Locations 

	};

GT.RunWays.RunwaysNumber = #GT.RunWays

-- from landing to Parking 
--{{ X,  	    Z,		Y},		Speed},
GT.TaxiRoutes = 
	-- taxi routes and parking spots in LCS
	--    x				z          y			V_target
{					
	{ -- 1 parking spot
		--{{ 5.0,  	    11.816,		-9.0},		3.0}, -- Landing location
		{{ 18.163,	    11.816,	 -12.604},		5.0}, -- WP1
		{{ 53.028,	    11.816,		3.06},		5.0}, -- WP2
		{{ 103.983,	    11.816,	   4.318},		2.0}, -- WP 4
		{{ 108.0,	    11.816,		 7.0},		2.0,	1.0*60.0} -- Park . 1.0*60 = time for pilot to despawn 60 seconds, this is an option
	},
	{ -- 2 parking spot 
		{{5.0,      	11.816,		-9.0},	    3.0},
		{{ 18.163,	    11.816,	 -12.604},		5.0},
		{{ 53.028,	    11.816,	    3.06},		5.0},
		{{ 79.691,	    11.816,	   2.247},		2.0},
		{{ 91.334,	    11.816,	   3.318},		2.0},
		{{ 95.461,	    11.816,	    7.58},		2.0,	1.0*60.0}
	},
	{ -- 3 parking spot
		{{ 5.0,  	    11.816,		-9.0},		3.0},
		{{ 45.845,	    11.816,	  -1.042},		5.0},
	    {{ 68.384,	    11.816,		3.075},		5.0},
		{{ 80.17,	    11.816,		3.546},		2.0},
		{{ 83.747,	    11.816,		8.748},		2.0,	1.0*60.0}
	},
	{ -- 4 parking spot
		{{ 5.0,  	    11.816,		-9.0},		3.0},
		{{ 18.163,	    11.816,	 -12.604},		5.0},
	    {{ 48.392,	    11.816,		-3.07},		5.0},
		{{ 60.524,	    11.816,		0.161},		2.0},
		{{ 69.388,	    11.816,		4.769},		2.0},
		{{ 73.796,	    11.816,		9.939},		2.0,	1.0*60.0}
	},	
	{ -- 5 parking spot	
	    {{ 5.0,  	    11.816,		-9.0},		3.0},
		{{ 18.163,	    11.816,	   -12.604},	5.0},
		{{ 38.994,	    11.816,		-7.656},	5.0},
	    {{ 58.181,	    11.816,	     4.276},	2.0},
		{{ 61.021,	    11.816,		 8.748},	2.0,	1.0*60.0}
	},
	{ -- 6 parking spot	
	    {{ 5.0,  	    11.816,		-9.0},		3.0},
		{{ 18.163,	    11.816,	   -12.604},	5.0},
		{{ 28.378,	    11.816,		-10.97},	5.0},
	    {{ 36.906,	    11.816,	     1.665},	2.0},
		{{ 45.2,	    11.816,		 8.357},	2.0},
		{{ 49.895,	    11.816,		11.796},	2.0,	1.0*60.0}
	},
	{ -- 7 parking spot	
	    {{ 5.0,  	    11.816,		-9.0},		3.0},
		{{ 18.163,	    11.816,	    -13.86},	5.0},
		{{ 31.686,	    11.816,		-3.617},	5.0},
	    {{ 35.196,	    11.816,	     4.665},	2.0},
		{{ 38.768,	    11.816,	    14.898},	2.0,	1.0*60.0}
	},
	{ -- 8 parking spot	
	    {{ 5.0,  	    11.816,		-9.0},		3.0},
		{{ 18.163,	    11.816,	   -12.604},	5.0},
		{{ 25.026,	    11.816,		-13.86},	5.0},
	    {{ 31.52,	    11.816,	   -20.589},	2.0},
		{{ 35.794,	    11.816,		 -21.0},	2.0,	1.0*60.0}
		--{{ 35.794,	    11.816,		 -18.0},	2.0}
};
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

-- Spawn to take off 
GT.TaxiForTORoutes = 
	-- taxi routes and parking spots in LCS
	--    L/R         U/D       F/B
	--    x				z        y		V_target
	{		
	{ RunwayIdx = 1, Points =
		{ -- 1 spawn 
			{{29.259,	  11.816,       5.243},       2.0}, --Spawn Location   
			{{35.366,	  11.816,       5.243},       2.0}, --Facing location
			{{49.07,      11.816,       5.268},       1.0}  --behind holdback start
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 2 spawn 
			{{17.435,	  11.816,       4.889},       2.0},
	        {{22.193,	  11.816,      -2.840},       2.0},
			{{22.986,	  11.816,      -4.08},        2.0}, 
		    {{29.575,	  11.816,      -5.532},       2.0}, --JBD
			{{38.806,	  11.816,      -5.381},       1.0}, --Center Line
			{{46.186,	  11.816,      -5.381},       1.0} -- Hold back start
		}
	},

	{ RunwayIdx = 1, Points =
		{ -- 3 spawn 
			{{7.945,	  11.816,      5.057},        2.0}, --start
			{{15.187,	  11.816,     -2.840},        2.0}, --face
			{{18.478,	  11.816,     -4.112},        2.0}, -- Wp1
			{{25.618,     11.816,      0.686},        2.0}, --wp2
			{{35.003,     11.816,      5.295},        2.0}, --cat 1 
			{{40.434,     11.816,      5.268},        1.0}, --cat 1
			{{49.07,      11.816,       5.268},       1.0}  --cat 1
		}
	},	

	{ RunwayIdx = 2, Points =
		{ -- 4 spawn  
			{{-3.357,	  11.816,      5.898},        3.0},
			{{6.709,	  11.816,     -2.403},        3.0},
			{{12.6,	      11.816,     -7.505},        3.0}, -- wp1
			{{23.898,	  11.816,     -6.183},        2.0}, -- wp2
		    {{29.575,	  11.816,     -5.532},        2.0}, --Cat 2
			{{38.806,	  11.816,     -5.381},        1.0}, --cat 2
			{{46.186,	  11.816,     -5.381},        1.0}  --cat 2
		}
	},	
	
	{ RunwayIdx = 2, Points =
		{ -- 5 spawn 
			{{-17.484,	  11.816,      11.301},       3.0}, --s
			{{-16.714,	  11.816,     4.874},       3.0}, --f
			{{-12.714,	  11.816,     -5.874},       3.0}, -- wp1
			{{9.347,	  11.816,     -6.769},       3.0}, -- wp 2
			--{{23.5347,	  11.816,     -4.769},       3.0}, -- wp 3
			{{23.532,	  11.816,     -6.033},       3.0}, --wp2
		    {{29.575,	  11.816,     -5.532},       2.0}, --Cat 2
			{{38.806,	  11.816,     -5.381},       1.0}, --cat 2
			{{46.186,	  11.816,     -5.381},       1.0}  --cat 2
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 6 spawn 
			{{-25.138,	  11.816,      9.612},       3.0}, --s
			{{-18.956,	  11.816,      0.655},       3.0}, --f
			{{-3.548,	  11.816,     -7.354},       3.0}, -- wp1
			{{23.532,	  11.816,     -6.033},       3.0}, --wp2
		    {{29.575,	  11.816,     -5.532},       2.0}, --Cat 2
			{{38.806,	  11.816,     -5.381},       1.0}, --cat 2
			{{46.186,	  11.816,     -5.381},       1.0}  --cat 2
		}
	},

	{ RunwayIdx = 1, Points =
		{ -- 7 spawn
			{{-36.141,     11.816,     10.585},       3.0}, -- s
			{{-30.918,     11.816,      9.196},       3.0}, -- f
			{{-15.918,     11.816,      3.796},       3.0}, -- f
			{{-6.921,      11.816,    -10.343},       3.0}, -- wp1
			{{21.5347,	  11.816,     -4.769},       3.0}, -- wp 1a
			{{27.686,      11.816,      2.841},       2.0},  --wp 2
			{{35.003,      11.816,      4.295},       2.0}, --cat 1 
			{{40.434,      11.816,      5.268},       1.0}, --cat 1
			{{49.07,       11.816,      5.268},       1.0}  --cat 1
			
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 8 spawn
			{{-100.888,     11.816,     -14.0},      3.0}, -- s
			{{-100.888,     11.816,    -4.625},      3.0}, -- f
			{{-17.069,      11.816,      -5.5},      3.0}, -- wp1
			{{23.922,       11.816,      -5.888},    2.0}, --wp2
		    {{29.575,	    11.816,     -5.532},     2.0}, --Cat 2
			{{38.806,	    11.816,     -5.381},     1.0}, --cat 2
			{{46.186,	    11.816,     -5.381},     1.0}  --cat 2
		
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
        {{ 99.507,   11.816,     0.0}, 	0.0}			
		}
	},
	{ TerminalIdx = 2, Points =
		{ -- 2 spawn spot
        {{ 79.196,    11.816,    0.0},   0.0}			
		}
	},
	{ TerminalIdx = 3, Points =
		{ -- 3 spawn spot
        {{ 57.566,    11.816,     0.0},   0.0}
		}
	},	
	{ TerminalIdx = 4, Points =
		{ -- 4 spawn spot
        {{28.162,    11.816,   -9.870},  0.0}
		}
	},	
	{ TerminalIdx = 5, Points =
		{ -- 5 spawn spot
        {{4.672,     11.816,   -7.974},  0.0}
		}
	},
	{ TerminalIdx = 6, Points =
		{ -- 6 spawn spot
        {{-19.451,    11.816,   -4.939}, 270}
		}
	},
	{ TerminalIdx = 7, Points =
		{ -- 7 spawn spot
        {{-79.846,    11.816,   6.21}, 0.0}
		}
	},
	{ TerminalIdx = 8, Points =
		{ -- 8 spawn spot
        {{-98.171,    11.816,   -7.246},   0.0}
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
}
GT.Elevators.ElevatorsNumber = #GT.Elevators	