Brok69_RIM24_Tartar = {
    category        = CAT_MISSILES,
    name            = "Brok69_RIM24_Tartar",
    user_name       = _("RIM-24B"),
    model           = 'Brok69_tartar',
    mass            = 707.0,
    wsTypeOfWeapon  = {4,4,34,WSTYPE_PLACEHOLDER},

 	Escort 			= 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type 		= 6, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing
	sigma 			= {80, 80, 80}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M 			    = 707.0, -- Mass of the missile at launch
	H_max 			= 29630.0, -- Maximum target altitude
	H_min 			= 45.0, -- minimum target altitude
	Diam 			= 34.3, -- Missile diameter in cm
	Cx_pil 			= 1, -- "Cx like pendants" - Moment of inertia??
	D_max 			= 29630.0, -- Maximum range firing at low altitude, in meters
	D_min 			= 3000.0, -- minimum range in meters
	Head_Form 		= 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time 		= 480.0, -- Battery life
	Nr_max 			= 16, -- Maximum g when turning
	v_min 			= 120.0, -- Minimum speed in m/s
	v_mid 			= 617.4, -- average speed in m/s
	Mach_max 		= 1.8, -- maximum Mach of the missile
	t_b 			= 0.0, -- Motor start delay
	t_acc 			= 5.0, -- motor burn time
	t_marsh 		= 36.0, -- cruise time, 0.0 if not applicable
	Range_max 		= 29630.0, -- Max range in meters 16nm
	H_min_t 		= 50.0, -- minimum target height above the terrain, m.
	Fi_start 		= 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak 			= 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort 		= 2.0, -- tracking angle (sighting) of the target by the missile.
	Fi_search 		= 99.9, -- limit angle of free search
	OmViz_max 		= 99.9, -- line-of-sight speed limit
	Engine_Type  	= 1,
	exhaust1 		= { 1, 1, 1, 1 },
	X_back 			= -3.0,
	Y_back 			= 0.0,
	Z_back 			= 0.0,
	exhaust2 		= {1, 1, 1, 1 },
	X_back_acc 		= -3.0,
	Y_back_acc 		= 0.0,
	Z_back_acc 		= 0.0,
	tail_scale 	 	= 8.5,
	Reflection 		= 0.25,
	KillDistance 	= 10.0,
	ccm_k0       	= 0.1,		

	PN_coeffs = {3, 				-- Number of Entries
				50000.0 ,1.0,		-- Less 5 km to target Pn = 1
				100000.0, 0.5,		-- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
				200000.0, 0.0};		-- Between 20 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 30 km Pn = 0.2.
	
	warhead = enhanced_a2a_warhead(60.0); 

    shape_table_data = {
        {
            name     = "Brok69_RIM24B_Tartar",
            file     = 'Brok69_tartar',
            life     = 1,
            fire     = {0, 1},
            username = _("RIM-24B"),
            index    = WSTYPE_PLACEHOLDER,
        },
    },
	
}

declare_weapon(Brok69_RIM24_Tartar)

GT_t.WS_t.Brok69_RIM24_Tartar = {name = "Brok69_RIM24B_Tartar", display_name = _("RIM-24B")}; 
GT_t.WS_t.Brok69_RIM24_Tartar.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.Brok69_RIM24_Tartar.moveable = false
GT_t.WS_t.Brok69_RIM24_Tartar.LN = {}
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1] = {}
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].type = 4
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].distanceMin = 500
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].distanceMax = 29630
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].reactionTime = 0.1;
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].launch_delay = 0.03;
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].reflection_limit = 1.8
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].ECM_K = 0.1
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].max_number_of_missiles_channels = 1
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].external_tracking_awacs = true
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].show_external_missile = true
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].PL = {}
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].PL[1] = {}
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].PL[1].ammo_capacity = 16
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].PL[1].type_ammunition = Brok69_RIM24_Tartar.wsTypeOfWeapon
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].PL[1].reload_time = 1000000; 
GT_t.WS_t.Brok69_RIM24_Tartar.LN[1].BR = { {pos = {0, 0, 0} } }
