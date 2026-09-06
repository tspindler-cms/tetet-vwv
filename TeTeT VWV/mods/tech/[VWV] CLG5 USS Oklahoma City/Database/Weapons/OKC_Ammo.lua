-- Kudos to currenthill, original Shell name is ModernUSNShips_127_AA
-- Download from https://currenthill.com/
-- note that some characteristics have been changed by TeTeT, see the old value as comment

local WSN_20 = {};
WSN_20.deviation_error_azimuth 		= 0.0002;
WSN_20.deviation_error_elevation 	= 0.0002;
WSN_20.deviation_error_speed_sensor	= 0.0002;
WSN_20.deviation_error_stability 	= 0.0002;
WSN_20.deviation_error_distance 	= 0.0002;

GT_t.WSN_t[20] = WSN_20;

-------------------------------------------------------------------------------------------------
--   Mk16 6inch Ammo 
-------------------------------------------------------------------------------------------------
GT_t.WS_t.ship_6inch_47 = {name = "6Inch 152/47"}
GT_t.WS_t.ship_6inch_47.angles = {
					{math.rad(140), math.rad(-140), math.rad(-4), math.rad(60)},
					};
GT_t.WS_t.ship_6inch_47.omegaY = 0.6
GT_t.WS_t.ship_6inch_47.omegaZ = 0.6
GT_t.WS_t.ship_6inch_47.reference_angle_Z = 0
GT_t.WS_t.ship_6inch_47.LN = {}
GT_t.WS_t.ship_6inch_47.LN[1] = {}
GT_t.WS_t.ship_6inch_47.LN[1].type = 6
GT_t.WS_t.ship_6inch_47.LN[1].distanceMin = 50
GT_t.WS_t.ship_6inch_47.LN[1].distanceMax = 21381;
GT_t.WS_t.ship_6inch_47.LN[1].max_trg_alt = 7689
GT_t.WS_t.ship_6inch_47.LN[1].reactionTime = 10
GT_t.WS_t.ship_6inch_47.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_6inch_47.LN[1].sensor, GT_t.WSN_t[10])
GT_t.WS_t.ship_6inch_47.LN[1].PL = {}
GT_t.WS_t.ship_6inch_47.LN[1].PL[1] = {}
GT_t.WS_t.ship_6inch_47.LN[1].PL[1].ammo_capacity = 600
GT_t.WS_t.ship_6inch_47.LN[1].PL[1].shell_name = {"jjj_OKC_mk16_152mm_HC"};


GT_t.WS_t.ship_6inch_47.LN[1].PL[1].shot_delay = 6 
GT_t.WS_t.ship_6inch_47.LN[1].automaticLoader = false;
GT_t.WS_t.ship_6inch_47.LN[1].reload_time = 240 * 20
GT_t.WS_t.ship_6inch_47.LN[1].BR = { {pos = {8, 0, 0.1} }, {pos = {8, 0, 0.0} }, {pos = {8, 0, -0.1} } }

-------------------------------------------------------------------------------------------------
--   5inch  Ammo   
-------------------------------------------------------------------------------------------------

GT_t.WS_t.ship_mk12_2x127mm = {name = "Mk12 5inch 38cal Twin"};
GT_t.WS_t.ship_mk12_2x127mm.angles = {
					{math.rad(180), math.rad(-180), math.rad(-10), math.rad(85)},
					};
GT_t.WS_t.ship_mk12_2x127mm.omegaY = math.rad(10); -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.omegaZ = math.rad(10); -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.reference_angle_Z = 0;


GT_t.LN_t.ship_mk12_127mm_AIR = {};
GT_t.LN_t.ship_mk12_127mm_AIR.type = 11;
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMin = 20;
GT_t.LN_t.ship_mk12_127mm_AIR.distanceMax = 9144;
GT_t.LN_t.ship_mk12_127mm_AIR.max_trg_alt = 11339;
GT_t.LN_t.ship_mk12_127mm_AIR.reactionTime = 6;
GT_t.LN_t.ship_mk12_127mm_AIR.sensor = {};
-- set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[1])
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm_AIR.sensor, GT_t.WSN_t[20]);
GT_t.LN_t.ship_mk12_127mm_AIR.PL = {};
GT_t.LN_t.ship_mk12_127mm_AIR.PL[1] = {
	shell_name = {"jjj_OKC_mk12_127mm_AIR"},
	automaticLoader = false,
	shot_delay = 3.5,
	ammo_capacity = 352,
};

GT_t.LN_t.ship_mk12_127mm = {}
GT_t.LN_t.ship_mk12_127mm.type = 6
GT_t.LN_t.ship_mk12_127mm.distanceMin = 20
GT_t.LN_t.ship_mk12_127mm.distanceMax = 16642
GT_t.LN_t.ship_mk12_127mm.max_trg_alt = 5410
GT_t.LN_t.ship_mk12_127mm.reactionTime = 4
GT_t.LN_t.ship_mk12_127mm.sensor = {}
set_recursive_metatable(GT_t.LN_t.ship_mk12_127mm.sensor, GT_t.WSN_t[10])
GT_t.LN_t.ship_mk12_127mm.PL = {}
GT_t.LN_t.ship_mk12_127mm.PL[1] = {
	-- unclear why the 127_Mk49 shells not work
	shell_name = {"MK45_127"}, --shell_name = { "127_Mk49_HC_1", "127_Mk49_HC_2" },
	automaticLoader = false,
	shot_delay = 3,
	ammo_capacity = 352,
};



declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "jjj_OKC_mk16_152mm_HC",
	user_name 				= _("152 mm HC"),
	model_name				= "pula",
	projectile	  		= "HE",
	payloadEffect   		= "Fragmentation",
	payloadMaterial 		= "RDX",
	v0						= 812, -- 2665.0 fps,
	Dv0						= 0.003, -- 0.001,
	Da0						= 0.0012, -- 0.0002,
	Da1						= 0.0001, -- 0.0001,
	mass	  				= 260.0,
	explosive	 			= 40.5881, -- about 6kg,
	life_time	 			= 300,
	caliber	 			= 152.0,
	s		 				= 0.0,
	j		 				= 0.0,
	l		 				= 0.0,
	charTime				= 0,
	cx						= {0.0,0.52,0.67,0.14,1.76},
	k1						= 9.6e-10,
	tracer_off				= 1.7,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 1.7,
	scale_tracer  			= 1,
	scale_smoke			= barrel_smoke_level,
	smoke_opacity  			= barrel_smoke_opacity,
	smoke_particle  		= 1,
	cartridge 				= 0,

	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 812.0 } -- intentionally not 812 to get less accurate
	}

});



declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "jjj_OKC_mk12_127mm_AIR",
	user_name 				= _("127 mm AA"),
	model_name				= "pula",
	projectile	  		= "HE",
	payloadEffect   		= "Fragmentation",
	payloadMaterial 		= "RDX",
	v0						= 762, -- 2500.0 fps,
	Dv0						= 0.001, -- 0.0002,
	Da0						= 0.0012, -- 0.00001,
	Da1						= 0.001, -- 0.0,
	mass	  				= 25.0,
	explosive	 			= 22.3235, -- about 3.3kg,
	life_time	 			= 100,
	caliber	 			= 127.0,
	s		 				= 0.0,
	j		 				= 0.0,
	l		 				= 0.0,
	charTime				= 0,
	cx						= {0.0,0.52,0.67,0.14,1.76},
	k1						= 7.6e-10,
	tracer_off				= 100,
	scale_tracer  			= 1,
	scale_smoke				= 12.0,
	smoke_opacity  			= 0.5,
	cartridge 				= 1,

	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true,
		precalculateAimingTable = true,
		[1] = { init_vel = 762.0 } -- intentionally not 792 to get less accurate
	}

});

