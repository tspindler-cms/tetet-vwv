-- copied from VAP
local function add_structure(f)
	if(f) then
		f.shape_table_data =
		{
			{
				file  	    = f.ShapeName,
				life		= f.Life,
				username    = f.Name,
				desrt       = f.ShapeNameDestr or "self",
			    classname 	= f.classname   or "lLandVehicle",
				positioning = f.positioning or "BYNORMAL"	--available: {"BYNORMAL", "ONLYHEIGTH", "BY_XZ", "ADD_HEIGTH"}
			}
		}
		if f.ShapeNameDestr then
			f.shape_table_data[#f.shape_table_data + 1] =
			{
				name  = f.ShapeName,
				file  = f.ShapeNameDestr,
			}
		end

		f.mapclasskey = "P0091000022";
		f.attribute = {wsType_Static, wsType_Standing} -- if 'attribute' == nil then insertion will be aborted

		add_surface_unit(f)
		GT = nil;
	else
		error("Can't add structure")
	end;
end

add_structure({
    Name 		 =  "vwv_farp_marsdenmat",
    DisplayName  = _("[VWV] Marsden Mat"),
    ShapeName	 =   "vwv_us_marsdenmat",
    Life		 =  2500,
    Rate		 =  100,
    category     =  'Heliport',
    SeaObject    = 	false,
    isPutToWater =  false,
    positioning  = 	"ONLYHEIGTH",
    classname    =  "lHeliport",
    numParking   =  1,
})

--[[
  Does not work, planes don't spawn in hangar and helicopters spawn on it's top
add_structure({
    Name 		 =  "vwv_farp_hangar",
    DisplayName  = _("[VWV] Hangar"),
    ShapeName	 =   "vwv_us_hangar",
    Life		 =  5000,
    Rate		 =  500,
    category     =  'Heliport',
    SeaObject    = 	false,
    isPutToWater =  false,
    positioning  = 	"ONLYHEIGTH",
    classname    =  "lHeliport",
    numParking   =  1,
})
]]
