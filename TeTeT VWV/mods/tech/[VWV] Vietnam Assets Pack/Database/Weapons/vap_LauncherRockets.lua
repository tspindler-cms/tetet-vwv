-- VAP Launcher Rockets Weapons -- by FMD


-- === VAP Type 63 Launcher Rockets 107mm ===

GT_t.WS_t.vap_type63LR = {};
GT_t.WS_t.vap_type63LR.angles 				= {{math.rad(0.6), math.rad(-0.6), math.rad(0), math.rad(50.0)},};
GT_t.WS_t.vap_type63LR.reference_angle_Z 	= math.rad(10);
GT_t.WS_t.vap_type63LR.drawArgument2 		= 1;
GT_t.WS_t.vap_type63LR.omegaY 				= math.rad(1);
GT_t.WS_t.vap_type63LR.omegaZ 				= math.rad(5);
GT_t.WS_t.vap_type63LR.pidY 				= {p = 10, i = 0.0, d = 7, inn = 1};
GT_t.WS_t.vap_type63LR.pidZ 				= {p = 10, i = 0.0, d = 7, inn = 1};
GT_t.WS_t.vap_type63LR.mount_before_move 	= true;
GT_t.WS_t.vap_type63LR.canSetTacticalDir 	= true

GT_t.WS_t.vap_type63LR.LN = {};
GT_t.WS_t.vap_type63LR.LN[1] = {};
GT_t.WS_t.vap_type63LR.LN[1].type = 34;
GT_t.WS_t.vap_type63LR.LN[1].maxShootingSpeed 	= 0;
GT_t.WS_t.vap_type63LR.LN[1].out_velocity 		= 450;
GT_t.WS_t.vap_type63LR.LN[1].distanceMin 		= 60;
GT_t.WS_t.vap_type63LR.LN[1].distanceMax 		= 8500;
GT_t.WS_t.vap_type63LR.LN[1].reactionTimeLOFAC 	= 4;
GT_t.WS_t.vap_type63LR.LN[1].reactionTime 		= 10;
GT_t.WS_t.vap_type63LR.LN[1].launch_delay 		= 9/12; -- 12 Shoot in 7-9sec
GT_t.WS_t.vap_type63LR.LN[1].connectorFire 		= false
GT_t.WS_t.vap_type63LR.LN[1].barrels_reload_type = GT_t.BarrelsReloadTypes.SEQUENTIALY;
GT_t.WS_t.vap_type63LR.LN[1].sensor = {};
set_recursive_metatable(GT_t.WS_t.vap_type63LR.LN[1].sensor, GT_t.WSN_t[3]);

GT_t.WS_t.vap_type63LR.LN[1].PL = {};
GT_t.WS_t.vap_type63LR.LN[1].PL[1] = {};
GT_t.WS_t.vap_type63LR.LN[1].PL[1].ammo_capacity	= 24; -- 2x12 Tubes
GT_t.WS_t.vap_type63LR.LN[1].PL[1].reload_time 		= 180;
GT_t.WS_t.vap_type63LR.LN[1].PL[1].shot_delay 		= 0.01;
GT_t.WS_t.vap_type63LR.LN[1].PL[1].type_ammunition 	= "weapons.nurs.C_8OFP2";

-----------------------------------------------------------------------------------------------------

-- End for Launcher Rockets Weapons