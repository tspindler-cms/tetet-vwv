-- ***************** "Essex class CVA-31 Bon Homme Richard" ******************************

--   Runways and landing strip for 'CVA-31'
--MODIFIED TAXI AND LAUNCH SPOTS BY SEABAT 2023-12-26
-- You can get deck height from 3d software
-- you can use the carrier plugin in the modelviewer to help with the routes
GT.RunWays =
{
-- landing strip definition (first in table)
--	VppStartPoint; 		   azimuth (degree} 	  Length_Vpp; 	   Width_Vpp;
	{{-52.5916, 19.55, -5.60511}, 349.0,		   97.0, 			   20.0,  --somewhere between last wire and model center / just past last wire 72 TO 52

-- alsArgument, lowGlidePath, slightlyLowGlidePath, onLowerGlidePath, onUpperGlidePath, slightlyHighGlidePath, highGlidePath
	1, 			3.5, 		  		4.0, 					4.5, 			  4.5, 				5.0, 				5.5},

-- runways/Cats inbetween Hold back start and connect to front of ship not where the cat/start point connectors are
	{{63.94,  19.55,    13.735 }, 	     	355.25, 		      72.5735, 		    20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 1 location
	{{63.719, 19.55,   -9.3283 }, 		    000.5, 		    	  72.5735, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 2 location
	{{-43.362, 19.55,  -19.611 }, 		    350.0, 		    	  72.5735, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 3 location
	{{-56.33,  19.55,  -33.23  }, 		    000.0, 		    	  72.5735, 	        20.0, 		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5},  --  Cat 4 location
};
GT.RunWays.RunwaysNumber = #GT.RunWays

-- from landing to Parking
-- kudos Citizen
GT.TaxiRoutes =
{
	{ -- 1 parking spot
		--{{ 5.0,  	    19.55,		-9.0},		3.0}, -- Landing location
		{{ 5, 19.55, -5 }, 				6.0},
		{{ 120.000, 19.55, -2 },		4.0}, -- WP 4
		{{ 120.000, 19.55, 13 },		4.0,     0.0*0.0} -- Park . 1.0*60 = time for pilot to despawn 60 seconds, this is an option
	},
	{ -- 2 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 108.000, 19.55, -2 },		4.0},
		{{ 108.000, 19.55, 13 },		4.0,    0.0*0.0 }
	},
	{ -- 3 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 96.000, 19.55, -2 },		4.0},
		{{ 96.000, 19.55, 13 },		4.0,	0.0*0.0}
	},
	{ -- 4 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 84, 19.55, -2 },			4.0},
		{{ 84, 19.55, 13 },			4.0,	0.0*0.0}
	},
	{ -- 5 parking spot
		{{ 19.574, 19.55, -5 }, 		6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 120.000, 19.55, -8}, 		4.0}, -- WP1
		{{ 120.000, 19.55, -13 },		1.0, 0.0 * 0.0}
	},
	{ -- 6 parking spot
		{{ 19.574, 19.55, -5 }, 		6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 108.000, 19.55, -8 }, 		4.0}, -- WP1
		{{ 108.000, 19.55, -13 }, 		1.0, 0.0 * 0.0} 
	},
	{ -- 7 parking spot
		{{ 19.574, 19.55, -5 }, 		6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 96.000, 19.55, -8.00 }, 	4.0}, -- WP1
		{{ 96.000, 19.55, -13 },       1.0, 0.0 * 0.0}
	},
	{ -- 13 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 120.000, 19.55, -2 },		4.0},
		{{ 120.000, 19.55, 0 },			3.0,	0.0*0.0}
	},

	{ -- 14 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 105.000, 19.55, -2 },		4.0},
		{{ 105.000, 19.55, 0 },			3.0,	0.0*0.0}
	},
	{ -- 8 parking spot
		{{ 19.574, 19.55, -5 }, 		6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 84.000, 19.55, -8.00 }, 		4.0}, -- WP1
		{{ 84.000, 19.55, -13 }, 		1.0, 0.0 * 0.0}
	},
	{ -- 9 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 72.000, 19.55, -2 },			4.0},
		{{ 72.000, 19.55, 13 },			4.0,	0.0*0.0}
	},
	{ -- 10 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 60.000, 19.55, -2 },			4.0},
		{{ 60.000, 19.55, 13 },			4.0,	0.0*0.0}
	},
	{ -- 11 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 48.000, 19.55, -2 },			4.0},
		{{ 48.000, 19.55, 13 },			4.0,	0.0*0.0}
	},
	{ -- 12 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 36.000, 19.55, -2 },			4.0},
		{{ 36.000, 19.55, 13 },			4.0,	0.0*0.0}
	},	

	{ -- 15 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 70.000, 19.55, 0},           6.0},
		{{ 90.000, 19.55, -2 },		4.0},
		{{ 90.000, 19.55, 0 },			2.0,	0.0*0.0}
	},	

	{ -- 16 parking spot
		{{ 7, 19.55, -5 }, 				6.0},
		{{ 75.000, 19.55, -2 },			4.0},
		{{ 75.000, 19.55, 1 },			1.0,	0.0*0.0}
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
		{ -- 5 spawn
			{{-15.00, 19.55, 10.00},       3.0}, --Spawn Location
			{{14.101, 19.55, 10.00},       2.0},
			{{35.0,	      19.55,       8.331755},       2.0},
			{{46.0,	      19.55,       13.735},       2.0},
			{{48.0,	      19.55,    13.735},       1.0},
			{{60.0,       19.55,    13.735},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 6 spawn
			{{-17.00, 19.55, -2.00},       3.0},
			{{12.112, 19.55, -4.00},       3.0},
			{{30.0,       19.55,    -9.3283},       2.0},
			{{50.0,       19.55,    -9.3283},        1.0},
			{{51.0,       19.55,    -9.3283},        1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 7 spawn
			{{-38.00, 19.55, 10.00} , 3.0}, --Spawn Location
			{{10.00, 19.55, 8.00},       3.0},
			{{14.101, 19.55, 8.00},       3.0},
			{{35.0,	      19.55,       8.331755},       2.0},
			{{46.0,	      19.55,       13.735},       2.0}, --Facing location
			{{48.0,	      19.55,    13.735},       1.0},
			{{60.0,       19.55,    13.735},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 8 spawn
			{{-41.00, 19.55, -2.00}, 3.0}, -- Spawn Location
			{{-12.00, 19.55, -4.00},       3.0},
			{{12.112, 19.55, -4.00},       3.0},
			{{30.0,       19.55,    -9.3283},       2.0},
			{{50.0,       19.55,    -9.3283},        1.0},
			{{51.0,       19.55,    -9.3283},        1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 1 spawn
			{{27.0,	      19.55,    10},       2.0}, --Spawn Location
			{{47.0,	      19.55,    13.935},       1.0},
			{{60.0,       19.55,    13.935},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 2 spawn 
			{{26.5,       19.55,    -2.0},       2.0},
			{{48.5,       19.55,    -9.3283},       2.0},
		    {{50.0,       19.55,    -9.3283},        1.0},
			{{51.0,       19.55,    -9.3283},        1.0}
		}
	},
	{ RunwayIdx = 1, Points =
		{ -- 3 spawn
			{{6.101, 19.55, 10.00}, 2}, --Spawn Location
			{{35.0,	      19.55,       8.331755},       2.0}, --Spawn Location
			{{47.0,	      19.55,    13.935},       1.0},
			{{60.0,       19.55,    13.935},       1.0}
		}
	},
	{ RunwayIdx = 2, Points =
		{ -- 4 spawn
			{{5.112, 19.55, -2.00},       2.0},
			{{30.0,       19.55,    -9.3283},       2.0},
		    {{50.0,       19.55,    -9.3283},        1.0},
			{{51.0,       19.55,    -9.3283},        1.0}
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
        {{120, 19.55, 0.0}, 		0.0}
		}
	},
	{ TerminalIdx = 2, Points =
		{ -- 2 spawn spot
        {{ 85, 19.55, 0.0},   	0.0}
		}
	},
	{ TerminalIdx = 3, Points =
		{ -- 3 spawn spot
        {{ 15, 19.55, -25},   	0.0}
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