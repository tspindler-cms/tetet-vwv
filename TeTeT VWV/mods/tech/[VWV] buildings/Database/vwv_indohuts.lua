-- Shameless copy from VAP

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

-----------------------
-- Indochina Objects---
-----------------------

add_structure({
    Name 		 =  "vwv_bdg_indohut1",
    DisplayName  = _("[VWV] Indochina Hut High"),
    ShapeName	 =   "indo_hut1",
    ShapeNameDestr = "indo_hut1",
    Life		 =  5,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_indohut2",
    DisplayName  = _("[VWV] Indochina Hut Low"),
    ShapeName	 =   "indo_hut2",
    ShapeNameDestr = "indo_hut2",
    Life		 =  5,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_guardTower",
    DisplayName  = _("[VWV] Guard Tower"),
    ShapeName	 =   "guardTower",
	ShapeNameDestr = "guardTower",
    Life		 =  5,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usWatchTower",
    DisplayName  = _("[VWV] US Watch Tower"),
    ShapeName	 =   "vwv_us_watchtower",
	ShapeNameDestr = "vwv_us_watchtower",
    Life		 =  5,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrelGasoline",
    DisplayName  = _("[VWV] US Barrel Gasoline"),
    ShapeName	 =   "vwv_us_barrel_gasoline",
	ShapeNameDestr = "vwv_us_barrel_gasoline",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrelGasoline2",
    DisplayName  = _("[VWV] US Barrel Gasoline 2"),
    ShapeName	 =   "vwv_us_barrel_gasoline2",
	ShapeNameDestr = "vwv_us_barrel_gasoline2",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrelGasolineSpigot",
    DisplayName  = _("[VWV] US Barrel Gasoline Spigot"),
    ShapeName	 =   "vwv_us_barrel_gasoline_spigot",
	ShapeNameDestr = "vwv_us_barrel_gasoline_spigot",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrelMotorfuel",
    DisplayName  = _("[VWV] US Barrel Motor Fuel"),
    ShapeName	 =   "vwv_us_barrel_motorfuel",
	ShapeNameDestr = "vwv_us_barrel_motorfuel",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrelWastefuel",
    DisplayName  = _("[VWV] US Barrel Waste Fuel"),
    ShapeName	 =   "vwv_us_barrel_wastefuel",
	ShapeNameDestr = "vwv_us_barrel_wastefuel",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrelWasteoil",
    DisplayName  = _("[VWV] US Barrel Waste Oil"),
    ShapeName	 =   "vwv_us_barrel_wasteoil",
	ShapeNameDestr = "vwv_us_barrel_wasteoil",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBoomgate",
    DisplayName  = _("[VWV] US Boomgate"),
    ShapeName	 =   "vwv_us_boomgate_closed",
	ShapeNameDestr = "vwv_us_boomgate_closed",
    Life		 =  3,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usConnex",
    DisplayName  = _("[VWV] US Connex (half)"),
    ShapeName	 =   "vwv_us_connex",
	ShapeNameDestr = "vwv_us_connex",
    Life		 =  4,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarbedWire",
    DisplayName  = _("[VWV] US Barbed Wire (1)"),
    ShapeName	 =   "vwv_us_barbedWire",
	ShapeNameDestr = "vwv_us_barbedWire",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarbedWireOpen",
    DisplayName  = _("[VWV] US Barbed Wire Open (2)"),
    ShapeName	 =   "vwv_us_barbedWire_open",
	ShapeNameDestr = "vwv_us_barbedWire_open",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarbedWireOpen20",
    DisplayName  = _("[VWV] US Barbed Wire Open (20)"),
    ShapeName	 =   "vwv_us_barbedWire_open_20",
	ShapeNameDestr = "vwv_us_barbedWire_open_20",
    Life		 =  8,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usGuardHouse",
    DisplayName  = _("[VWV] US Guard House"),
    ShapeName	 =   "vwv_us_guardHouse",
	ShapeNameDestr = "vwv_us_guardHouse",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usMarsdenMat",
    DisplayName  = _("[VWV] US Marsden Mat"),
    ShapeName	 =   "vwv_us_marsdenmat",
	ShapeNameDestr = "vwv_us_marsdenmat",
    Life		 =  1,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usRevetment",
    DisplayName  = _("[VWV] US Revetment"),
    ShapeName	 =   "vwv_us_revetments",
	ShapeNameDestr = "vwv_us_revetments",
    Life		 =  2,
    Rate		 =  1,
    category     =  'Fortification',
})
