-- ***************** "Essex class CVA-31 Bon Homme Richard" ******************************

--   Runways and landing strip for 'CVA-31'
--MODIFIED TAXI AND LAUNCH SPOTS BY SEABAT 2023-12-26
-- You can get deck height from 3d software
-- you can use the carrier plugin in the modelviewer to help with the routes
GT.RunWays =
{     
-- landing strip definition (first in table)  
--	VppStartPoint; 		   azimuth (degree} 	  Length_Vpp; 	   Width_Vpp;
	{{-52.5916, 16.95, -10.298}, 348.6,		   97.0, 			   20.0,  --somewhere between last wire and model center / just past last wire 72 TO 52

-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	1, 			3.5, 		  		4.0, 					4.5, 			  4.5, 				5.0, 				5.5},

-- runways/Cats inbetween Hold back start and connect to front of ship not where the cat/start point connectors are
	{{50.5750,  16.95,    7.8285}, 	     	0.5, 		   	  72.5735, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 1 location
	{{50.67,  16.95,  -12.799 }, 		    2.0, 		   	  72.5735, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 2 location
};
GT.RunWays.RunwaysNumber = #GT.RunWays

-- from landing to Parking
-- kudos Citizen
GT.TaxiRoutes =
{
	{ -- 1 parking spot
		{{ 7.0,	    16.95, -5.7183 }, 		6.0},
		{{ 125.79,  16.95, 2.4326},		4.0}, 
		{{ 120.000, 16.95, 13.0}, -2.0,     0.0*0.0} 
	},
	{ -- 2 parking spot
		{{ 7.0,	    16.95, -5.7183}, 		6.0},
		{{ 113.79,  16.95, 2.4326},		4.0},
		{{ 108.000, 16.95, 13.0}, -2.0,    0.0*0.0 }
	},
	{ -- 3 parking spot
		{{ 7.0,	    16.95, -5.7183},		6.0},
		{{ 101.79,  16.95, 2.4326},		4.0},
		{{ 96.000,  16.95, 13.0},  -2.0,    0.0*0.0}
	},
	{ -- 4 parking spot
		{{ 7.0,	    16.95, -5.7183}, 				6.0},
		{{ 89.791,  16.95, 2.4326},			4.0},
		{{ 84, 	    16.95, 13.0},			-2.0,	0.0*0.0}
	},
	{ -- 5 parking spot
		{{ 7.0,     16.95, -5.7183}, 				6.0},
		{{ 77.791,  16.95, 2.4326},			4.0},
		{{ 72.000,  16.95, 13.0},			-2.0,	0.0*0.0}
	},
	{ -- 6 parking spot
		{{ 7.0,	    16.95, -5.7183}, 				6.0},
		{{ 65.791,  16.95, 2.4326},			4.0},
		{{ 60.000,  16.95, 13.0},			-2.0,	0.0*0.0}
	},
	{ -- 7 parking spot
		{{ 7.0,	    16.95, -5.7183}, 				6.0},
		{{ 53.791,  16.95, 2.4326},			4.0},
		{{ 48.000,  16.95, 13.0},			-2.0,	0.0*0.0}
	},
	{ -- 8 parking spot
		{{ 7.0,	    16.95, -5.7183}, 				6.0},
		{{ 41.791,  16.95, 2.4326},			4.0},
		{{ 36.000,  16.95, 13.0},			-2.0,	0.0*0.0}
	},
	{ -- 9 parking spot
		{{ 7.0,	    16.95, -5.7183}, 		6.0},
		{{ 83.684,  16.95, -0.64583},           6.0},
		{{ 125.79,  16.95, -3.5674}, 		4.0},
		{{ 120.000, 16.95, -14.0},		-1.0, 0.0 * 0.0}
	},
	{ -- 10 parking spot
		{{ 7.0,	    16.95, -5.7183}, 		6.0},
		{{ 83.684,  16.95, -0.64583},           6.0},
		{{ 113.79,  16.95, -3.5674}, 		4.0},
		{{ 108.000, 16.95, -14.0}, 		-1.0, 0.0 * 0.0} 
	},
	{ -- 11 parking spot
		{{ 7.0,	    16.95, -5.7183}, 		6.0},
		{{ 83.684,  16.95, -0.64583},           6.0},
		{{ 101.79,  16.95, -3.5674}, 		4.0},
		{{ 96.000,  16.95, -14.0},       -1.0, 0.0 * 0.0}
	},

	{ -- 12 parking spot
		{{ 7.0,	    16.95, -5.7183 }, 		6.0},
		{{ 83.684,  16.95, -0.64583},           6.0},
		{{ 89.791,  16.95, -3.5674}, 		4.0},
		{{ 84.000,  16.95, -14.0}, 		-1.0, 0.0 * 0.0}
	},
	{ -- 13 parking spot
		{{ 7.0,	    16.95,  -5.7183}, 				6.0},
		{{ 77.195,  16.95,  -3.5578},		4.0},
		{{ 71.487,  16.95,  -13.957},			-2.0,	0.0*0.0}
	},
	{ -- 14 parking spot
		{{ 7.0,	    16.95,  -5.7183}, 				6.0},
		{{ 64.615,  16.95,  -7.224},		4.0},
		{{ 58.907,  16.95,  -17.623},			-2.0,	0.0*0.0}
	},
	{ -- 15 parking spot
		{{ 7.0,	    16.95,  -5.7183}, 				6.0},
		{{ 51.747,  16.95,  -7.224},		4.0},
		{{ 46.039,  16.95,  -17.623},			-2.0,	0.0*0.0}
	},
	{ -- 16 parking spot
		{{ 7.0,	    16.95,  -5.7183}, 				6.0},
		{{ 38.305,  16.95,  -7.224},		4.0},
		{{ 32.597,  16.95,  -17.623},			-2.0,	0.0*0.0}
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
			{{27.0,	      16.95,       2.331755},       2.0}, --Spawn Location
			{{47.0,	      16.95,    8.761},       1.0},
			{{50.0,       16.95,    8.761},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 2 spawn 
			{{26.5,       16.95,    -14.076},       2.0},
			{{48.501,     16.95,    -11.527},       2.0},
			{{50.0,       16.95,    -11.481},        1.0},
			{{50.999,     16.95,    -11.451},        1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 3 spawn
			{{6.101,      16.95,	-5.53},       2.0}, --Spawn Location
			{{35.0,	      16.95,    4.331755},       2.0}, 
			{{47.0,	      16.95,    8.761},       1.0},
			{{50.0,       16.95,    8.761},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 4 spawn
			{{5.112,      16.95, -20.783},       2.0},
			{{30.0,       16.95,    -12.177},       2.0},
			{{50.0,       16.95,    -11.481},        1.0},
			{{50.999,     16.95,    -11.451},        1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 5 spawn
			{{-15.00,     16.95, -1.6011},       3.0}, --Spawn Location
			{{6.101,      16.95, -5.53},       2.0},
			{{35.0,	      16.95,  4.331755},       2.0},
			{{46.0,	      16.95,  8.3944},       2.0},
			{{47.0,	      16.95,  8.761},       1.0},
			{{50.0,       16.95,  8.761},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 6 spawn
			{{-17.00,     16.95, -16.745},       3.0},
			{{5.112,      16.95, -20.783},       2.0},
			{{30.0,       16.95,    -12.177},       2.0},
			{{50.0,       16.95,    -11.481},        1.0},
			{{50.999,     16.95,    -11.451},        1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 7 spawn 
			{{-38.00,     16.95, 2.7568} , 3.0}, --Spawn Location
			{{-15.00,     16.95, -1.6011},       3.0}, 
			{{6.101,      16.95, -5.53},       2.0},
			{{35.0,	      16.95,       4.331755},       2.0},
			{{46.0,	      16.95,       8.3944},       2.0},
			{{47.0,	      16.95,    8.761},       1.0},
			{{50.0,       16.95,    8.761},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 8 spawn
			{{-41.00,     16.95, -12.439}, 3.0}, -- Spawn Location
			{{-17.00,     16.95, -16.745},       3.0},
			{{5.112,      16.95, -20.783},       2.0},
			{{30.0,       16.95,    -12.177},       2.0},
			{{50.0,       16.95,    -11.481},        1.0},
			{{50.999,     16.95,    -11.451},        1.0}
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
        {{ -73.045, 16.95, -6.6389},   	0.0}
		}
	},
	{ TerminalIdx = 2, Points =
		{ -- 2 spawn spot
        {{ -103.04, 16.95, -1.2118},   	0.0}
		}
	},
	{ TerminalIdx = 3, Points =
		{ -- 3 spawn spot
        {{110.0, 16.95, -11.15}, 		0.0}
		}
	},
	{ TerminalIdx = 4, Points =
		{ -- 4 spawn spot
        {{ 80.0, 16.95, -11.15},   	0.0}
		}
	},
	{ TerminalIdx = 5, Points =
		{ -- 5 spawn spot
        {{ 50.0, 16.95, -13.723},   	0.0}
		}
	},	
	{ TerminalIdx = 6, Points =
		{ -- 6 spawn spot
        {{ 16.955, 16.95, -22.88},   	0.0}
		}
	},
	{ TerminalIdx = 7, Points =
		{ -- 7 spawn spot
        {{ -13.045, 16.95, -17.493},   	0.0}
		}
	},
	{ TerminalIdx = 8, Points =
		{ -- 8 spawn spot
        {{ -43.045, 16.95, -12.066},   	0.0}
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