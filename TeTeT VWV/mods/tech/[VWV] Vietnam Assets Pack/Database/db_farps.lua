-- db VAP FARPS --

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

-- FARPS List
----------------------------------------------
   
add_structure({
    Name 		 =  "VAP FARP 1",
    DisplayName  = _("VAP FARP 1"),
    ShapeName	 =   "vap_us_farp_1",
    Life		 =  2500,
    Rate		 =  100,
    category     =  'Heliport',
    SeaObject    = 	false,
    isPutToWater =  false,
    positioning  = 	"ONLYHEIGTH",
    -- classname    =  "lOilPlatform",
    classname    =  "lHeliport",
    numParking   =  1,
    })

add_structure({
    Name 		 =  "VAP FARP 2",
    DisplayName  = _("VAP FARP 2"),
    ShapeName	 =   "vap_us_farp_2",
    Life		 =  2500,
    Rate		 =  100,
    category     =  'Heliport',
    SeaObject    = 	false,
    isPutToWater =  false,
    positioning  = 	"ONLYHEIGTH",
    -- classname    =  "lOilPlatform",
    classname    =  "lHeliport",
    numParking   =  1,
    })
	
add_structure({
    Name 		 =  "VAP FARP 3",
    DisplayName  = _("VAP FARP 3"),
    ShapeName	 =   "vap_us_farp_3",
    Life		 =  2500,
    Rate		 =  100,
    category     =  'Heliport',
    SeaObject    = 	false,
    isPutToWater =  false,
    positioning  = 	"ONLYHEIGTH",
    -- classname    =  "lOilPlatform",
    classname    =  "lHeliport",
    numParking   =  1,
    })	
	
add_structure({
    Name 		 =  "VAP FARP 4",
    DisplayName  = _("VAP FARP 4"),
    ShapeName	 =   "vap_us_farp_4",
    Life		 =  2500,
    Rate		 =  100,
    category     =  'Heliport',
    SeaObject    = 	false,
    isPutToWater =  false,
    positioning  = 	"ONLYHEIGTH",
    -- classname    =  "lOilPlatform",
    classname    =  "lHeliport",
    numParking   =  1,
    })		