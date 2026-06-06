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
		GT.visual.fire_pos = f.fire_pos or {-2,0,0};
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
		GT.attribute = {wsType_Ground, wsType_Tank, wsType_NoWeapon, wsType_GenericFort,
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
	ShapeNameDestr = "guardTower_destroyed",
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

add_structure({
    Name 		 =  "vwv_bdg_usHangar",
    DisplayName  = _("[VWV] US Hangar"),
    ShapeName	 =   "vwv_us_hangar",
	ShapeNameDestr = "vwv_us_hangar",
    Life		 =  100,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_usBarrack",
    DisplayName  = _("[VWV] US Barrack"),
    ShapeName	 =   "vwv_us_barracks",
	ShapeNameDestr = "vwv_us_barracks",
    Life		 =  3,
    Rate		 =  1,
    category     =  'Fortification',
})

add_structure({
    Name 		 =  "vwv_bdg_vnHoiAn_M1",
    DisplayName  = _("[VWV] Hoi An Building M1"),
    ShapeName	 =   "vwv_vn_HoiAn_M1",
    ShapeNameDestr = "vwv_vn_HoiAn_M1_destroyed",
    Life		 =  3,
    Rate		 =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name 		 =  "vwv_bdg_vnHoiAn_M2",
    DisplayName  = _("[VWV] Hoi An Building M2"),
    ShapeName	 =   "vwv_vn_HoiAn_M2",
    ShapeNameDestr = "vwv_vn_HoiAn_M2_destroyed",
    Life		 =  3,
    Rate		 =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name 		 =  "vwv_bdg_vnHoiAn_M3",
    DisplayName  = _("[VWV] Hoi An Building M3"),
    ShapeName	 =   "vwv_vn_HoiAn_M3",
    ShapeNameDestr = "vwv_vn_HoiAn_M3_destroyed",
    Life		 =  4,
    Rate		 =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M4",
    DisplayName  = _("[VWV] Hoi An Building M4"),
    ShapeName    =   "vwv_vn_HoiAn_M4",
    ShapeNameDestr = "vwv_vn_HoiAn_M4_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M5",
    DisplayName  = _("[VWV] Hoi An Building M5"),
    ShapeName    =   "vwv_vn_HoiAn_M5",
    ShapeNameDestr = "vwv_vn_HoiAn_M5_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M6",
    DisplayName  = _("[VWV] Hoi An Building M6"),
    ShapeName    =   "vwv_vn_HoiAn_M6",
    ShapeNameDestr = "vwv_vn_HoiAn_M6_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M7",
    DisplayName  = _("[VWV] Hoi An Building M7"),
    ShapeName    =   "vwv_vn_HoiAn_M7",
    ShapeNameDestr = "vwv_vn_HoiAn_M7_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M8",
    DisplayName  = _("[VWV] Hoi An Building M8"),
    ShapeName    =   "vwv_vn_HoiAn_M8",
    ShapeNameDestr = "vwv_vn_HoiAn_M8_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M9",
    DisplayName  = _("[VWV] Hoi An Building M9"),
    ShapeName    =   "vwv_vn_HoiAn_M9",
    ShapeNameDestr = "vwv_vn_HoiAn_M9_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M10",
    DisplayName  = _("[VWV] Hoi An Building M10"),
    ShapeName    =   "vwv_vn_HoiAn_M10",
    ShapeNameDestr = "vwv_vn_HoiAn_M10_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M11",
    DisplayName  = _("[VWV] Hoi An Building M11"),
    ShapeName    =   "vwv_vn_HoiAn_M11",
    ShapeNameDestr = "vwv_vn_HoiAn_M11_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_M12",
    DisplayName  = _("[VWV] Hoi An Building M12"),
    ShapeName    =   "vwv_vn_HoiAn_M12",
    ShapeNameDestr = "vwv_vn_HoiAn_M12_destroyed",
    Life         =  4,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_m1__2",
    DisplayName  = _("[VWV] Hoi An Building m1__2"),
    ShapeName    =   "vwv_vn_HoiAn_m1__2",
    ShapeNameDestr = "vwv_vn_HoiAn_m1__2_destroyed",
    Life         =  2,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_m2__2",
    DisplayName  = _("[VWV] Hoi An Building m2__2"),
    ShapeName    =   "vwv_vn_HoiAn_m2__2",
    ShapeNameDestr = "vwv_vn_HoiAn_m2__2_destroyed",
    Life         =  2,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_m3__2",
    DisplayName  = _("[VWV] Hoi An Building m3__2"),
    ShapeName    =   "vwv_vn_HoiAn_m3__2",
    ShapeNameDestr = "vwv_vn_HoiAn_m3__2_destroyed",
    Life         =  2,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_m4__2",
    DisplayName  = _("[VWV] Hoi An Building m4__2"),
    ShapeName    =   "vwv_vn_HoiAn_m4__2",
    ShapeNameDestr = "vwv_vn_HoiAn_m4__2_destroyed",
    Life         =  2,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_m5__2",
    DisplayName  = _("[VWV] Hoi An Building m5__2"),
    ShapeName    =   "vwv_vn_HoiAn_m5__2",
    ShapeNameDestr = "vwv_vn_HoiAn_m5__2_destroyed",
    Life         =  2,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_bdg_vnHoiAn_m6__2",
    DisplayName  = _("[VWV] Hoi An Building m6__2"),
    ShapeName    =   "vwv_vn_HoiAn_m6__2",
    ShapeNameDestr = "vwv_vn_HoiAn_m6__2_destroyed",
    Life         =  2,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})

add_structure({
    Name         =  "vwv_vn_apartment_3GV73",
    DisplayName  = _("[VWV] Apartment 3GV73"),
    ShapeName    =   "vwv_vn_apartment_3GV73",
    ShapeNameDestr = "vwv_vn_apartment_3GV73_destroyed",
    Life         =  5,
    Rate         =  1,
    category     =  'Fortification',
    fire_pos     = {2,2,0},
})