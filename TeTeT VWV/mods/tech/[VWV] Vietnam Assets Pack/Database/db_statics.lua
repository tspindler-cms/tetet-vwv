-- db VAP Static --

local function add_structure(f)
	GT ={}
	set_recursive_metatable(GT, GT_t.generic_stationary)
	set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
	if(f) then
		GT.chassis.life = f.Life


		GT.visual.shape = f.ShapeName
		GT.visual.shape_dstr = f.ShapeNameDestr
		GT.CustomAimPoint = {1,1,0}
		GT.visual.fire_size = f.fire_size or 0
		GT.visual.fire_pos = {-2,0,0};
		GT.visual.fire_time = 30
		GT.time_agony = 0;

		GT.Name = f.Name
		GT.DisplayName = f.DisplayName
		GT.Rate = 1
		GT.shape_table_data = 
		{
			{
				file  	    = GT.visual.shape;
				username    = GT.Name;
				desrt       = GT.visual.shape_dstr;
			    classname 	= "lLandVehicle";
				positioning = "ONLYHEIGTH";
				life		= f.Life or 5;
			},
			{
				name  = GT.visual.shape_dstr;
				file  = GT.visual.shape_dstr;
			},
		}

		GT.DetectionRange  = 0;
		GT.ThreatRange = 0;
		GT.mapclasskey = "P0091000076";
		GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,wsType_GenericFort,
						"Fortifications",
						};
		GT.category = f.category;
		GT.positioning = "ONLYHEIGTH"
		
		add_surface_unit(GT)
	else
		error("Can't add structure")
	end;
end

-- -----------------
-- -- US Objects ---
-- -----------------


add_structure({
Name 		 =  "vap_us_hooch_LP",
DisplayName  = _("VAP US Hooch Low Poly"),
ShapeName	 =   "vap_us_hooch_LP",
ShapeNameDestr = "vap_us_hooch_LP",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
})

add_structure({
Name 		 =  "vap_ammo_50cal_line",
DisplayName  = _("VAP US Ammo 50Cal Line"),
ShapeName	 =   "vap_ammo_50cal_line",
ShapeNameDestr = "vap_ammo_50cal_line",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_ammo_50cal_pack",
DisplayName  = _("VAP US Ammo 50Cal Pack"),
ShapeName	 =   "vap_ammo_50cal_pack",
ShapeNameDestr = "vap_ammo_50cal_pack",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_barrels_line",
DisplayName  = _("VAP Barrels Line"),
ShapeName	 =   "vap_barrels_line",
ShapeNameDestr = "vap_barrels_line",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.2,
})

add_structure({
Name 		 =  "vap_barrels",
DisplayName  = _("VAP Barrels Pack"),
ShapeName	 =   "vap_barrels",
ShapeNameDestr = "vap_barrels",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_ammo_box_pile",
DisplayName  = _("VAP Ammo Box Pile"),
ShapeName	 =   "vap_ammo_box_pile",
ShapeNameDestr = "vap_ammo_box_pile",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_ammo_box_wood_long",
DisplayName  = _("VAP Ammo Box Long"),
ShapeName	 =   "vap_ammo_box_wood_long",
ShapeNameDestr = "vap_ammo_box_wood_long",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_ammo_box_wood_small",
DisplayName  = _("VAP Ammo Box Small"),
ShapeName	 =   "vap_ammo_box_wood_small",
ShapeNameDestr = "vap_ammo_box_wood_small",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_barrel_red",
DisplayName  = _("VAP Barrel Red"),
ShapeName	 =   "vap_barrel_red",
ShapeNameDestr = "vap_barrel_red",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_barrel_green",
DisplayName  = _("VAP Barrel Green"),
ShapeName	 =   "vap_barrel_green",
ShapeNameDestr = "vap_barrel_green",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_mre_boxes",
DisplayName  = _("VAP US MRE Boxes"),
ShapeName	 =   "vap_mre_boxes",
ShapeNameDestr = "vap_mre_boxes",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.2,
})



add_structure({
Name 		 =  "vap_mixed_cargo_1",
DisplayName  = _("VAP US Mixed Cargo 1"),
ShapeName	 =   "vap_mixed_cargo_1",
ShapeNameDestr = "vap_mixed_cargo_1",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})

add_structure({
Name 		 =  "vap_mixed_cargo_2",
DisplayName  = _("VAP US Mixed Cargo 2"),
ShapeName	 =   "vap_mixed_cargo_2",
ShapeNameDestr = "vap_mixed_cargo_2",
Life		 =  5,
Rate		 =  1,
category     =  'Fortification',
fire_size = 0.1,
})


-- --------------
--  Bamboo ------
-- --------------


add_structure({
	Name 		 =  "vap_watchtower",
	DisplayName  = _("VAP Vietcong Watchtower"),
	ShapeName	 =   "vap_watchtower",
	ShapeNameDestr = "vap_watchtower_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
})

add_structure({
	Name 		 =  "vap_house_high",
	DisplayName  = _("VAP Bamboo House High"),
	ShapeName	 =   "vap_house_high",
	ShapeNameDestr = "vap_house_high_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
	})

	
add_structure({
	Name 		 =  "vap_house_long",
	DisplayName  = _("VAP Bamboo House Long"),
	ShapeName	 =   "vap_house_long",
	ShapeNameDestr = "vap_house_long_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
})

add_structure({
	Name 		 =  "vap_house_small",
	DisplayName  = _("VAP Bamboo House Small"),
	ShapeName	 =   "vap_house_small",
	ShapeNameDestr = "vap_house_small_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
})

add_structure({
	Name 		 =  "vap_house_T",
	DisplayName  = _("VAP Bamboo House T-Shape"),
	ShapeName	 =   "vap_house_T",
	ShapeNameDestr = "vap_house_T_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
})

add_structure({
	Name 		 =  "vap_house_tiny",
	DisplayName  = _("VAP Bamboo House Tiny"),
	ShapeName	 =   "vap_house_tiny",
	ShapeNameDestr = "vap_house_tiny_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
})

add_structure({
	Name 		 =  "vap_house1",
	DisplayName  = _("VAP Bamboo House"),
	ShapeName	 =   "vap_house1",
	ShapeNameDestr = "vap_house1_dest",
	Life		 =  2,
	Rate		 =  1,
	category     =  'Fortification',
	positioning  = "ONLYHEIGTH",
	fire_size = 0.2,
})



