
--Ammunition MG 20
local tracer_on_time = 0.01
declare_weapon({category = CAT_SHELLS,name =   "MG_20x64_APT",
  user_name		= _("MG_20x64_APT"),
  model_name    = "tracer_bullet_green",
  v0    		= 1050.0,
  Dv0   		= 0.0060,
  Da0    		= 0.0022,
  Da1     		= 0.0,
  mass      	= 0.034,
  round_mass 	= 0.086,
  explosive     = 0.10000,
  life_time     = 30,
  caliber     	= 20,
  s         	= 0.0,
  j         	= 0.0,
  l         	= 0.0,
  charTime      = 0,
  cx        	= {0.5,1.27,0.70,0.200,2.30},
  k1        	= 2.0e-08,
  tracer_off    = 3,
  tracer_on		= tracer_on_time,
  smoke_tail_life_time = 0.7,
  scale_tracer  = 1,
  cartridge 	= 0,
})


declare_weapon({category = CAT_SHELLS,name =   "MG_20x64_HEI",
  user_name		= _("MG_20x64_HEI"),
  model_name    = "tracer_bullet_white",
  v0    		= 1050.0,
  Dv0   		= 0.0060,
  Da0    		= 0.0022,
  Da1     		= 0.0,
  mass      	= 0.034,
  round_mass 	= 0.086,
  explosive     = 0.10000,
  life_time     = 30,
  caliber     	= 20,
  s         	= 0.0,
  j         	= 0.0,
  l         	= 0.0,
  charTime      = 0,
  cx        	= {0.5,1.27,0.70,0.200,2.30},
  k1        	= 2.0e-08,
  tracer_off    = 3,
  tracer_on		= tracer_on_time,
  smoke_tail_life_time = 0.7,
  scale_tracer  = 1,
  cartridge 	= 0,
})

function MG_20(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "MG_20"
	tbl.supply 	 = 
	{
		shells = {"MG_20x64_API","MG_20x64_HEI"},
		mixes  = {{1,2,1,1,2,1}},   
		count  = 200,	---144
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 267,
		rates 			 = {1200},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= {0,-1,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 0
	tbl.muzzle_pos				= tbl.muzzle_pos 		 or  {0,0,0} -- all position from connector
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector 		 or  "Gun_point" -- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 350 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

  
crusader =  {
        
	Name 				=   'crusader',
	DisplayName			= _('F-8 Crusader'),
	HumanCockpit 		= true,
    	HumanCockpitPath    	= current_mod_path..'/Cockpit/',
	Picture 			= "crusader.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "crusader",
	
	shape_table_data 	= 
	{
		{
			file  	 	= 'crusader';
			life  	 	= 20; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'crusader-oblomok'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'crusader';
			index    	=  WSTYPE_PLACEHOLDER;
			classname   = "lLandPlane";
	    		positioning = "BYNORMAL";
		},
		{
			name  = "crusader-oblomok";
			file  = "crusader-oblomok";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER,
        "Multirole fighters", "Refuelable",},
	Categories= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	M_empty 					= 7037, -- kg			**(11125 lbs - Standard Aircraft Characteristics - SAC)
	M_nominal 					= 10732, -- kg			**(15681 lbs - Combat Weight - SAC)
	M_max 						= 15549, -- kg			**(20611 lbs - Max TO - SAC)
	M_fuel_max 					= 4158, -- kg			**(435 gallons - 1.6467m3 - 779 kg/m3)
	H_max 					 	= 12983, -- m
	average_fuel_consumption 	= 0.005, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 60, -- minimal indicated airspeed*?
	-- M = 15600 lbs
	V_opt 						= 210,-- Cruise speed (for AI)*
	V_take_off 					= 73, -- Take off speed in m/s (for AI)*	(122)
	V_land 						= 78, -- Land speed in m/s (for AI) (152kn - final approach, 126kn - touchdown)
	V_max_sea_level 			= 303, -- Max speed at sea level in m/s (for AI) (589kn)
	V_max_h 					= 450, -- Max speed at max altitude in m/s (for AI)	(522kn)
	Vy_max 						= 118.72, -- Max climb speed in m/s (for AI)	(9000ft/min)
	Mach_max 					= 1.65, -- Max speed in Mach (for AI)	???
	Ny_min 						= -2, -- Min G (for AI)
	Ny_max 						= 8.0,  -- Max G (for AI)
	Ny_max_e 					= 8.0, -- ?? Max G (for AI)
	AOA_take_off 				= 0.17, -- AoA in take off radians (for AI)
	bank_angle_max 				= 30, -- Max bank angle (for AI)
	has_afteburner	=	true,
	has_speedbrake	=	true,
	radar_can_see_ground	=	true,	
		
		nose_gear_pos = 	{0.98, -2.100,	0},	----1.990
		main_gear_pos = 	{-6.95, -1.90, 1.4},	----2.012
		wing_tip_pos =  	{-10.214,-0.7, 5.35},-- wingtip coords for visual effects  

		
		AOA_take_off	=	0.16,
		stores_number	=	10,		
		tand_gear_max	=	3.73,		
		tanker_type	=	2,
	wing_area	=	34.84,
	wing_span	=	10.87,
	wing_type = 1,-- FIXED_WING = 0/VARIABLE_GEOMETRY = 1/FOLDED_WING = 2/ARIABLE_GEOMETRY_FOLDED = 3
		thrust_sum_max	=	15200,
		thrust_sum_ab	=	25000,
	length	=	16.53,
	height	=	4.8,
	flaps_maneuver	=	0.5,
	Mach_max	=	1.6,
	range	=	2372,
	crew_size	=	1,
	RCS	=	1.8,			
		IR_emission_coeff	=	0.58,
		IR_emission_coeff_ab	=	2.5,
		engines_count	=	1,
		nose_gear_wheel_diameter	=	0.566,
		main_gear_wheel_diameter	=	0.778,
		
		
	
	--engines_nozzles = {
	--	[1] = 
	--	{
	--		pos			= {-13.2,	-0.8,	0}, -- nozzle coords
	--		elevation			= -0.1, -- AFB cone elevation
	--		diameter			= 0., -- AFB cone diameter
	--		exhaust_length_ab	= 4, -- lenght in m
	--		exhaust_length_ab_K = 0.707, -- AB animation
	--		smokiness_level     = 0.05, 
	--	}, -- end of [1]		
	----}, -- end of engines_nozzles
	
	
	
	crew_members = 
	{
		[1] = 
		{
			ejection_seat_name = "pilot_f86_seat",
			drop_canopy_name   = "F9F-canopy",
			pilot_name		   = "pilot_f86",
			pos 	   =  {1.7, 0.5 ,	0},
			canopy_pos = {1.607000 ,1.181,0},
			canopy_ejection_dir = {-1.0,0.2,0},
			g_suit = 0.7,
		}, -- end of [1]
	}, -- end of crew_members

	
		
		
		brakeshute_name	=	0,
		is_tanker	=	false,
		air_refuel_receptacle_pos = 	{0.75,	-0.25,	-0.3},	---?
		
		
		
		fires_pos = 
		{
			[1] = 	{-0.40,		-0.46,	 0.0},		-- Fuselage					10 - fuselage right
			[2] = 	{-1.114,	-0.29,	 0.901},	-- Wing inner Right
			[3] = 	{-1.268,	-0.29,	-1.162},	-- Wing inner Left
			[4] = 	{ 0.215,	-0.26,	 1.195},	-- Wing middle Right
			[5] = 	{-1.582,	-0.26,	-1.687},	-- Wing middle Left
			[6] = 	{-0.80,		-0.26,	 2.2},		-- Wing outer Right
			[7] = 	{-1.0,		-0.29,	-0.806},	-- Wing outer Left
			[8] = 	{0.0,		 0.0,	 0.0},		-- Engine (inner Right)
			[9] = 	{-7.75,		 0.3,	 0.0},		-- Engine (inner Left)
		}, -- end of fires_pos
		
	   Countermeasures = {
ECM = "AN/ALQ-165"
},


	
		passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 500,
		chaff = {default = 0, increment = 8, chargeSz = 1},
		flare = {default = 500,  increment = 8, chargeSz = 1},
	},

	chaff_flare_dispenser 	= {
	
		
		{ dir =  {0, -1, 0}, pos =  {-1.1850,  -1.72, -0.878}, }, -- Flares 
		{ dir =  {0, -1, 0}, pos =  {-1.1850,  -1.72, 0.878}, }, -- Flares 
	},

		mechanimations = {
        	FoldableWings = {
            	{Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0}}}}, Flags = {"Reversible"}},
            	{Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 15.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
        },
    }, -- end of mechanimations	
		
          
       LandRWCategories = 
        {
        [1] = 
        {
			Name = "AircraftCarrier",
        },
        [2] = 
        {
            Name = "AircraftCarrier With Catapult",
        }, 
        [3] = 
        {
            Name = "AircraftCarrier With Tramplin",
        }, 
    }, -- end of LandRWCategories
        TakeOffRWCategories = 
        {
        [1] = 
        {
			Name = "AircraftCarrier",
        },
        [2] = 
        {
            Name = "AircraftCarrier With Catapult",
        }, 
        [3] = 
        {
            Name = "AircraftCarrier With Tramplin",
        }, 
    }, -- end of TakeOffRWCategories

			
	--sensors
	detection_range_max		 = 120,
	radar_can_see_ground 	 = true, 
	CanopyGeometry = {
    azimuth = {-145.0, 145.0},
    elevation = {-50.0, 90.0}
        },

Sensors = {
RADAR = "AN/APG-71",
IRST = "OLS-27",
OPTIC = {"TADS DTV", "TADS DVO", "TADS FLIR"},
RWR = "Abstract RWR"
},

	Failures = {
			{ id = 'asc', 		label = _('ASC'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'eos',  		label = _('EOS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			--{ id = 'mlws',  	label = _('MLWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },		
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	

Guns = {

		    --left
			MG_20({muzzle_pos = {1.2,   -1.2,  0.65 }  	, rates = {500},mixes = {{2,1,2,1,2,1}},effect_arg_number = 350,azimuth_initial = 0,elevation_initial = 0,supply_position = {2, -0.3, -0.4}}), --up   
			MG_20({muzzle_pos = {0.8,   -0.9,  0.6}	, rates = {500},mixes = {{1,2,2,1,2,1}},effect_arg_number =350,azimuth_initial = 0,elevation_initial = 0,supply_position = {2, -0.3, -0.4}}), --center
			MG_20({muzzle_pos = {1.2,  -1.2, -0.45 }	, rates = {500},mixes = {{1,1,2,1,2,1}},effect_arg_number = 350,azimuth_initial = 0,elevation_initial = 0,supply_position = {2, -0.3,  0.4}}), --up
			MG_20({muzzle_pos = {0.8,  -0.9, -0.4}	, rates = {500},mixes = {{1,2,1,2,2,1}},effect_arg_number = 350,azimuth_initial = 0,elevation_initial = 0,supply_position = {2, -0.3,  0.4}}), --center
			
			 },



	

	
		Pylons =     {
         pylon(1, 0, 1.2, 2.50, -1.60,
            {
                use_full_connector_position = false,connector = "pylon_1",
            },
            {
				{ CLSID = "LAU3_HE151" }, --LAU-3 HE M151
                { CLSID = "{LAU-115 - AIM-7E}" }, --AIM-7E	
                { CLSID = "LAU3_HE5" }, --LAU-3 HEAT Mk5
				{ CLSID = "{BRU33_2*LAU10}"},
                { CLSID = "{BRU41_6X_MK-82}" },
            }
        ),
       pylon(2, 0, 1.2, 2.40, -1.75,
            {
				use_full_connector_position = false,connector = "pylon_3",
            },
            {
				--{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,attach_point_position = {0.4,  0.2, 0.0}}, --AIM-9M
                { CLSID = "{AIM-9B}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9B
                { CLSID = "{AIM-9L}" ,attach_point_position = {0.5,  0.05, 0.0}}, --AIM-9L
			--	{ CLSID = "{HVARx2}"},
            }
        ),
        pylon(3, 0, 1.2, 1.34, 1.75,
            {
				use_full_connector_position = false,connector = "pylon_6",
            },
            {
				--{ CLSID = "{AIM-9M-ON-ADAPTER}" ,attach_point_position = {-0.2,  0.05, 0.0}}, --AIM-9M
                { CLSID = "{GAR-8}" ,attach_point_position = {-0.4,  0.05, 0.0}}, --AIM-9B
                { CLSID = "{LAU-7 - AIM-9L}" ,attach_point_position = {-0.4,  0.05, 0.0}}, --AIM-9L
			--	{ CLSID = "{HVARx2}"},	
            }
        ),
		pylon(4, 0, 1.2, 1.34, 1.60,
            {
				use_full_connector_position = false,connector = "pylon_4",
            },
            {
				--{ CLSID = "{AIM-9M-ON-ADAPTER}" ,attach_point_position = {-0.4,  0.05, 0.0}}, --AIM-9M
                { CLSID = "{GAR-8}" ,attach_point_position = {-0.2,  0.05, 0.0}}, --AIM-9B
                { CLSID = "{LAU-7 - AIM-9L}" ,attach_point_position = {-0.2,  0.05, 0.0}}, --AIM-9L
			--	{ CLSID = "{HVARx2}"},
            }
        ),
      	pylon(5, 0, 1.2, 1.34, 1.75,
            {
				use_full_connector_position = false,connector = "pylon_5",
            },
            {
				--{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}" ,attach_point_position = {0.0,  0.2, 0.0}}, --AIM-9M
                { CLSID = "{AIM-9B}"  ,attach_point_position = {0.0,  0.05, 0.0}}, --AIM-9B
                { CLSID = "{AIM-9L}" ,attach_point_position = {0.0,  0.05, 0.0}}, --AIM-9L
			--	{ CLSID = "{HVARx2}"},
            }
        ),
		pylon(6, 0, 1.2, 1.34, 1.60,
            {
				use_full_connector_position = false,connector = "pylon_2",
            },
            {
				{ CLSID = "LAU3_HE151" }, --LAU-3 HE M151
                { CLSID = "{LAU-115 - AIM-7E}" }, --AIM-7E	
                { CLSID = "LAU3_HE5" }, --LAU-3 HEAT Mk5
				{ CLSID = "{BRU33_2*LAU10}"},
                { CLSID = "{BRU41_6X_MK-82}" },
            }
        ),	
				pylon(7, 0, 1.2, 1.34, 1.60,
            {
				use_full_connector_position = false,connector = "pylon_7",
            },
            {
			
            }
        ),
      
     },
	
	Tasks = {
        aircraft_task(CAP),
     	aircraft_task(Escort),
      	aircraft_task(FighterSweep),
		aircraft_task(Intercept),
		aircraft_task(Reconnaissance),
--  	aircraft_task(GroundAttack),
--     	aircraft_task(CAS),
--      aircraft_task(AFAC),
--	    aircraft_task(RunwayAttack),
--  	aircraft_task(AntishipStrike),
    },	
	DefaultTask = aircraft_task(FighterSweep),

	
	
SFM_Data = {
	aerodynamics = --changed to F104T Data via BGDam_Sample SFM
		{
			Cy0			    =	0,
			Mzalfa		  =	5, -- changed to 1.8 / rechanged due to strange elevator behavior to 5
			Mzalfadt	  =	1.2, -- changed to 1.2 / rechanged due to strange elevator behavior to 1 and changed back to 1.2
			kjx 		  = 2.150, -- changed and corrected
			kjz 		  = 0.0011, -- changed
			Czbe 		  = -0.06, -- changed
			cx_gear 	  = 0.0268, -- left unchanged
			cx_flap 	  = 0.184, -- changed
			cy_flap 	  = 0.37, -- changed
			cx_brk 		  = 0.026, -- changed was 0.014
			table_data  = 
			{--									changed							   changed
			--      M	 Cx0		 Cya		 B		 	B4	      Omxmax		Aldop		Cymax
				{0,	    0.015,		0.025,		0.010,		0.057,		0.5,		16,			0.1}, -- changed + B4 added + Cya from 0.009 to 0.025 + Cymax from 1.17 to 0.1 + Aldop from 15 
				{0.1,	0.015,		0.038,		0.015,		0.037,		1.011,		16,			0.45}, -- added (eyeballed) + B4 added + Cya from 0.015 to 0.038 + Omxmax from 1.511 to 1.011 + Cymax from 1.17 to 0.45 + Aldop from 15
				{0.2,	0.015,		0.051,		0.025,		0.025,		2.511,		17,			0.88}, -- changed + B4 added + Cya from 0.043 to 0.051 + Omxmax from 3.197 to 2.511 + Cymax from 1.17 to 0.88+ Aldop was 15
				{0.4,	0.015,		0.064,		0.055,		0.025,		3.014,		18,			0.932}, -- changed + B4 added + Aldop was 15
				{0.6,	0.015,		0.065,		0.175,		0.025,		2.687,		18,			0.901}, -- changed and corrected and recorrected + Cymax from 0.854 to 0.901 + Aldop was 15
				{0.7,	0.015,		0.071,		0.175,		0.025,		2.242,		20,			0.714}, -- changed + B4 added + Cymax from 0.845 to 0.714
				{0.8,	0.015,		0.072,		0.175,		0.025,		2.580,		22,			0.732}, -- changed + B4 added + Cymax from 0.865 to 0,732
				{0.9,	0.018,		0.078,		0.175,		0.025,		2.923,		22,			0.807}, -- changed + B4 added + Cymax from 0.985 to 0.807
				{1	,	0.045,		0.089,		0.175,		0.025,		3.161,		22,			1.028}, -- changed + B4 added + Cymax 1.185 to 1.028
				{1.05,	0.046,		0.087,		0.189,		0.077,		3.049,		21,			1.185}, -- changed + B4 added
				{1.1,	0.047,		0.086,		0.204,		0.138,		2.937,		21,			1.185}, -- changed + B4 added
				{1.2,	0.047,		0.080,		0.218,		0.196,		3.209,		21,			1}, -- changed + B4 added
				{1.3,	0.048,		0.074,		0.235,		0.250,		2.055,		21,			1}, -- changed + B4 added
				{1.5,	0.050,		0.063,		0.278,		0.336,		2.179,		20,			1}, -- changed + B4 added
				{1.7,	0.04,	  	0.051,		0.339,		0.414,		2.113,		19,			0.8}, -- changed + B4 added
				{1.8,	0.035,		0.046,		0.381,		2.051,		2.218,		18,			0.7}, -- changed + B4 added + B4eyeball
				{2,	    0.025,		0.034,		0.506,		3.855,		2.399,		17,			0.6}, -- changed + B4 added + B4eyeball
				{2.1,	0.02,		0.029,		0.606,		4.010,		2.47,		16,			0.6}, -- changed + B4 added + B4eyeball
				{2.2,	0.0385,		0.023,		0.755,		5.551,		2.136,		11,			0.6}, -- changed + B4 added + B4eyeball
				{2.5,	0.042,		0.021,		0.885,		6.055,		1.572,		10,			0.6},-- added with approx. values see below 	
				{3.9,	0.065,		0.019,		0.950,		6.555,		0.7,		 9,			0.6}, -- changed + B4 added + B4eyeball
			}, -- end of table_data
    }, -- end of aerodynamics
		engine = 
		{
			Nmg		=	67.5, --rpm at idle
			MinRUD	=	0,    -- min state of throttle
			MaxRUD	=	1,    -- max state of throttle
			MaksRUD	=	0.85, -- mil power state of throttle
			ForsRUD	=	0.91, -- AB state of throttle
			type	=	"TurboJet",
			hMaxEng	=	22.86, -- changed to F104G specs
			dcx_eng	=	0.0085, -- changed to F104G specs
			cemax	=	0.85, -- changed to F-104G specs
			cefor	=	1.112, -- changed to F-104G specs
			dpdh_m	=	2250, -- changed to F-104G specs
			dpdh_f	=	7000, -- changed to F-104G specs and corrected to 7000
			table_data = {
			--   M		Pmax		 Pfor
				{0,	    55227,		85976},	-- changed and corrected +49/25%
				{0.2,	50227,		84720}, -- changed and corrected +49/25%
				{0.4,	46919,		86763},	-- changed and corrected +49/25%
				{0.6,	48412,		93186},	-- changed and corrected +49/25%
				{0.7,	46745,		98684},	-- changed and corrected +49/25%
				{0.8,	47610,		110545},	-- changed and corrected +49/25%// von 105345 zu 110545
				{0.9,	48699,		125441},	-- changed and corrected +49/25%//von 106441 zu 125441
				{1,	    47711,		123384},	-- changed and corrected +49/25%//von 109384 zu 123384
				{1.1,	44357,		129721}, -- changed and corrected +49/25%//von 109721 zu 129721
				{1.2,	44305,		123014}, -- changed and corrected +49/25%//von 115514 zu 123014
				{1.3,	44490,		138879}, -- changed and corrected +49/25%// von 121879 zu 138879
				{1.5,	44571,		144333}, -- changed and corrected +49/25%//von 136444 zu 144333
				{1.8,	43834,		145223}, -- changed and corrected +49/25%//von 136823 zu 145223
				{2,	    42010,		136524}, -- changed and corrected +49/25% 
				{2.1,	17688,		136524}, -- changed and corrected +49/25%
				{2.5,	17068,		34750}, -- changed and corrected +49/25%
				{3,	    15517,		34750}, -- changed and corrected +49/25%
			}, -- end of table_data
		}, -- end of engine
	},

	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
	[0]  = {critical_damage = 5,  args = {146}},--NOSE_CENTER
	[1]  = {critical_damage = 3,  args = {296}},--NOSE_LEFT_SIDE
	[2]  = {critical_damage = 3,  args = {297}},--NOSE_RIGHT_SIDE
	[3]  = {critical_damage = 8,  args = {65}}, --CABINA
	[4]  = {critical_damage = 2,  args = {298}},--CABIN_LEFT_SIDE
	[5]  = {critical_damage = 2,  args = {301}},--CABIN_RIGHT_SIDE
	[7]  = {critical_damage = 2,  args = {249}},--GUN
	[8]  = {critical_damage = 3,  args = {265}},--FRONT_GEAR_BOX
	[9]  = {critical_damage = 3,  args = {154}},--FUSELAGE_LEFT_SIDE
	[10] = {critical_damage = 3,  args = {153}},--FUSELAGE_RIGHT_SIDE
	[11] = {critical_damage = 1,  args = {167}},--ENGINE_L_IN
	[12] = {critical_damage = 1,  args = {161}},--ENGINE_R_IN
	[13] = {critical_damage = 2,  args = {169}},--MTG_L_BOTTOM
	[14] = {critical_damage = 2,  args = {163}},--MTG_R_BOTTOM
	[15] = {critical_damage = 2,  args = {267}},--LEFT_GEAR_BOX
	[16] = {critical_damage = 2,  args = {266}},--RIGHT_GEAR_BOX
	[17] = {critical_damage = 2,  args = {168}},--MTG_L  (ENGINE)
	[18] = {critical_damage = 2,  args = {162}},--MTG_R  (ENGINE)
	[20] = {critical_damage = 2,  args = {183}},--AIR_BRAKE_R
	[23] = {critical_damage = 5,  args = {223}},--WING_L_OUT
	[24] = {critical_damage = 5,  args = {213}},--WING_R_OUT
	[25] = {critical_damage = 2,  args = {226}},--ELERON_L
	[26] = {critical_damage = 2,  args = {216}},--ELERON_R
	[29] = {critical_damage = 5,  args = {224}, deps_cells = {23, 25}},--WING_L_CENTER
	[30] = {critical_damage = 5,  args = {214}, deps_cells = {24, 26}},--WING_R_CENTER
	[35] = {critical_damage = 6,  args = {225}, deps_cells = {23, 29, 25, 37}},--WING_L_IN
	[36] = {critical_damage = 6,  args = {215}, deps_cells = {24, 30, 26, 38}},--WING_R_IN
	[37] = {critical_damage = 2,  args = {228}},--FLAP_L
	[38] = {critical_damage = 2,  args = {218}},--FLAP_R
	[39] = {critical_damage = 2,  args = {244}, deps_cells = {53}},--FIN_L_TOP
	[40] = {critical_damage = 2,  args = {241}, deps_cells = {54}},--FIN_R_TOP
	[43] = {critical_damage = 2,  args = {243}, deps_cells = {39, 53}},--FIN_L_BOTTOM
	[44] = {critical_damage = 2,  args = {242}, deps_cells = {40, 54}},--FIN_R_BOTTOM
	[51] = {critical_damage = 2,  args = {240}},--ELEVATOR_L
	[52] = {critical_damage = 2,  args = {238}},--ELEVATOR_R
	[53] = {critical_damage = 2,  args = {248}},--RUDDER_L
	[54] = {critical_damage = 2,  args = {247}},--RUDDER_R
	[56] = {critical_damage = 2,  args = {158}},--TAIL_LEFT_SIDE
	[57] = {critical_damage = 2,  args = {157}},--TAIL_RIGHT_SIDE
	[59] = {critical_damage = 3,  args = {148}},--NOSE_BOTTOM
	[61] = {critical_damage = 2,  args = {147}},--FUEL_TANK_F
	[82] = {critical_damage = 2,  args = {152}},--FUSELAGE_BOTTOM
	},
	
	
	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
				[0] = {critical_damage = 5, args = {82}},
				[3] = {critical_damage = 10, args = {65}},
				[8] = {critical_damage = 10},
				[11] = {critical_damage = 3},
				[12] = {critical_damage = 3},
				[15] = {critical_damage = 10},
				[16] = {critical_damage = 10},
				[17] = {critical_damage = 3},
				[18] = {critical_damage = 3},
				[25] = {critical_damage = 5, args = {53}},
				[26] = {critical_damage = 5, args = {54}},
				[35] = {critical_damage = 10, args = {67}, deps_cells = {25, 37}},
				[36] = {critical_damage = 10, args = {68}, deps_cells = {26, 38}},
				[37] = {critical_damage = 20, args = {55}},
				[38] = {critical_damage = 20, args = {56}},
				[43] = {critical_damage = 20, args = {61}, deps_cells = {53}},
				[44] = {critical_damage = 20, args = {62}, deps_cells = {54}},
				[47] = {critical_damage = 5, args = {63}, deps_cells = {51}},
				[48] = {critical_damage = 5, args = {64}, deps_cells = {52}},
				[51] = {critical_damage = 20, args = {59}},
				[52] = {critical_damage = 20, args = {60}},
				[53] = {critical_damage = 30, args = {57}},
				[54] = {critical_damage = 2, args = {58}},
				[55] = {critical_damage = 5, args = {81}},
				[83]	= {critical_damage = 3, args = {134}}, -- nose wheel                                  
				[84]	= {critical_damage = 3, args = {136}}, -- left wheel                                  
				[85]	= {critical_damage = 3, args = {135}}, -- right wheel
	},
	
	DamageParts = 
	{  
		[1] = "crusader-oblomok", 
		[2] = "crusader-oblomok", 
		
	},
	
	lights_data = {
	typename = "collection",
	lights = {
    
	[1] = { typename = "collection",
							lights = {-- Landing light
									  {typename = "spotlight",
									   connector = "MAIN_SPOT_PTR_02",
									   argument = 209,
									   dir_correction = {elevation = math.rad(-1)}
									  },
									  {-- Landing/Taxi light
									   typename = "spotlight",
									   connector = "MAIN_SPOT_PTR_01",
									   argument = 208,
									   dir_correction = {elevation = math.rad(3)}
									  }
									 }
						},
    [2]	= {	typename = "collection",
								lights = {-- Left Position Light (red)
								{typename = "omnilight",
								 connector = "BANO_1",
								 color = {0.99, 0.11, 0.3},
								 pos_correction  = {0.1, 0, -0.2},
								 argument  = 190
								},
								 -- Right Position Light (green)
								{typename = "omnilight",
								connector = "BANO_2",
								color = {0, 0.894, 0.6},
								pos_correction = {0.1, 0, 0.2},
								argument  = 191
								},
								-- Tail Position Light (white)
								{typename = "omnilight",
								connector = "BANO_0",
								color = {1, 1, 1},
								pos_correction  = {0, 0, 0},
								argument  = 192
								}}
							},

	[3]	= {typename = "collection",
			lights = {
						{typename = "collection",
						lights = {{
								-- Right Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(150), elevation = math.rad(5)},
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {
								-- Left Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(-150), elevation = math.rad(5)},
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {typename  = "argumentlight", argument = 212},
						},
					},
					{typename = "collection",
						lights = {{
								-- Left Nose Floodlight
								typename  = "spotlight",
								position  = {0, -0.3, -5.80},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0, angle_max = 0.45,
								direction = {azimuth = math.rad(45)},
								argument = 211,
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {
								-- Right Nose Floodlight
								typename = "spotlight",
								position  = {0, -0.3, 5.80},
								color = {1.0, 1.0, 1.0},
								intensity_max = 0.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(-45)},
								argument = 210,
								dont_change_color = false,
								angle_change_rate = 0
							   }
						}
					},
					-- UARRSI light
					{
						typename = "omnilight", position  = {6.5, 0.4, 0}, color = {6, 6, 2}
					}
				  },
			}
		}
	},
}

add_aircraft(crusader)
