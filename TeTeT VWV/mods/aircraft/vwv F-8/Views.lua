ViewSettings = {
	Cockpit = {
	[1] = {-- player slot 1
		CockpitLocalPoint      = {5.19,0.75,0.00},--Cockpit nach = vorne,hoch 3.595000,1.236000,0.000000
		CameraViewAngleLimits  = {20.000000,160.000000},
		CameraAngleRestriction = {false,90.000000,0.400000},
		CameraAngleLimits      = {190.000000,-75.000000,115.000000},--Kopf drehen = links rechts,runter,hoch
		EyePoint               = {0.000000,0.000000,0.000000},--front/back,up/down,left/right}<-'neck dimension'in meters 
		limits_6DOF            = {x = {-0.050000,0.500000},y ={-0.250000,0.120000},z = {-0.300000,0.300000},roll = 90.000000},--Bewegen = hinten vorne,oben unten,links rechts
		ShoulderSize		   = 0.25,-- bewegt K�rper, wenn Azimuth Wert mehr als 90 Grad
		Allow360rotation	   = false,
	},	
	}, -- Cockpit 
	Chase = {
		LocalPoint      = { 0, 0, 0 }, -- {2.510000,3.604000,0.000000},
		AnglesDefault   = { 0, 0 }, -- {180.000000,-8.000000},
	}, -- Chase 
	Arcade = {
		LocalPoint      = { 0, 0, 0}, -- {-13.790000,6.204000,0.000000},
		AnglesDefault   = { 0, 0 }, -- {0.000000,-8.000000},
	}, -- Arcade 
}

SnapViews = {
[1] = {-- player slot 1
	[1] = {--LWin + Num0 : Snap View 0
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[2] = {--LWin + Num1 : Snap View 1
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[3] = {--LWin + Num2 : Snap View 2
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[4] = {--LWin + Num3 : Snap View 3
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[5] = {--LWin + Num4 : Snap View 4
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[6] = {--LWin + Num5 : Snap View 5
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[7] = {--LWin + Num6 : Snap View 6
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[8] = {--LWin + Num7 : Snap View 7
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[9] = {--LWin + Num8 : Snap View 8
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[10] = {--LWin + Num9 : Snap View 9
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[11] = {--look at left  mirror
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[12] = {--look at right mirror
		viewAngle = 60.000000,--FOV
		hAngle	 = 0.000000,
		vAngle	 = 0.000000,
		x_trans	 = 0.000000,
		y_trans	 = 0.000000,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
	[13] = {--default view
		viewAngle = 97.596001,--FOV
		hAngle	 = 0.000000,
		vAngle	 = -8.823118,
		x_trans	 = 0.360000,
		y_trans	 = -0.041337,
		z_trans	 = 0.000000,
		rollAngle = 0.000000,
	},
},
}