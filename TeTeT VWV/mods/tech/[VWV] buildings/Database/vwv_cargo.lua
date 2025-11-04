-- Class/type of objects added; They will appear as "Cargos" inside "Static Objects" in ME

local function add_cargo(f)
	if(f) then
		f.shape_table_data =
		{
			{
				file  	    = f.ShapeName,
				life		= f.Life,
				username    = f.Name,
				desrt       = f.ShapeNameDestr,
				-- classname = "lLandCargo",
			}
		}
		if f.ShapeNameDestr then
			f.shape_table_data[#f.shape_table_data + 1] = 
			{
				name  = f.ShapeName,
				file  = f.ShapeNameDestr,
			}
		end

		f.mapclasskey 	= "P0091000352";
		f.attribute 		= {"Cargos"};
		f.category 		= "Cargo";

		add_surface_unit(f)
		GT = nil;
	else
		error("Can't add cargo")
	end;
end


--Cargo Object List
----------------------------------------------

add_cargo({
	Name 		 	=  "vwv_cgo_usConex",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] US Conex (half), Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_us_connex",
	ShapeNameDestr = "vwv_us_connex",
	Life		 	 	=  10,
	Rate		 	=  10,
	canExplode		= false,
	mass			= 1000,
	minMass		= 500,
	maxMass		= 2000,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
	-- type = "barrels_cargo"
})
---------------------------------------------
--- You can continue adding more cargo objets to the database following the structure above, between dot lines. Remember to add also a new *.csv file for each to Data folder
