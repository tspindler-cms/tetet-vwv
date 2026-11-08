-- Class/type of objects added; They will appear as "Cargos" inside "Static Objects" in ME

local function add_cargo(f)
	if(f) then
		-- desrt = "self" keeps the live mesh on impact. DCS still looks for
		-- <ShapeName>_dam on cargo damage; those .lods files alias the live model.
		f.shape_table_data =
		{
			{
				file  	    = f.ShapeName,
				life		= f.Life,
				username    = f.Name,
				desrt       = f.ShapeNameDestr or "self",
				-- classname = "lLandCargo",
			}
		}
		if f.ShapeNameDestr and f.ShapeNameDestr ~= f.ShapeName and f.ShapeNameDestr ~= "self" then
			f.shape_table_data[#f.shape_table_data + 1] =
			{
				name  = f.ShapeNameDestr,
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
	Life		 	 	=  1,
	Rate		 	=  2,
	canExplode		= false,
	mass			= 1000,
	minMass		= 500,
	maxMass		= 2000,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
	-- type = "barrels_cargo"
})

--[[
add_cargo({
	Name 		 	=  "vwv_cgo_usBlu82",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] US blu82, Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_us_blu82",
	ShapeNameDestr = "vwv_us_blu82",
	Life		 	 	=  10,
	Rate		 	=  10,
	canExplode		= false,
	mass			= 6800,
	minMass		= 6800,
	maxMass		= 6800,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
	-- type = "barrels_cargo"
})
]]

add_cargo({
	Name 		 	=  "vwv_cgo_usBlu82C130",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] US blu82 for C130, Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_us_blu82_c130",
	Life		 	 	=  1,
	Rate		 	=  2,
	canExplode		= true,
	mass			= 6800,
	minMass		= 6800,
	maxMass		= 6800,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
	AttachPointAirdrop = "ATTACH_POINT",
	-- type = "gbu_43b_airdrop"
})
---------------------------------------------
add_cargo({
	Name 		 	=  "vwv_cgo_usM113",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] US M113, Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_us_m113_cargo",
	Life		 	 	=  1,
	Rate		 	=  4,
	canExplode		= false,
	mass			= 1000,
	minMass		= 4000, -- real: 12300,
	maxMass		= 5000, -- real: 18000,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
})

add_cargo({
	Name 		 	=  "vwv_cgo_bedford_MWD",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] Bedfort MWD, Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_bedford_mwd_cargo",
	Life		 	 	=  1,
	Rate		 	=  4,
	canExplode		= false,
	mass			= 1000,
	minMass		= 2850,
	maxMass		= 3000,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
})

add_cargo({
	Name 		 	=  "vwv_cgo_mutt",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] Mutt, Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_mutt_cargo",
	Life		 	 	=  1,
	Rate		 	=  3,
	canExplode		= false,
	mass			= 1000,
	minMass		= 1100,
	maxMass		= 1633,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
})

add_cargo({
	Name 		 	=  "vwv_cgo_mule",
	--Name that will appear inside ME
	DisplayName  	=  _("[VWV] Mule, Cargo"),
	--Shape EDM name
	ShapeName	 	=   "vwv_mule_cargo",
	Life		 	 	=  1,
	Rate		 	=  3,
	canExplode		= false,
	mass			= 1000,
	minMass		= 361,
	maxMass		= 454,
	couldCargo		= true,
	topdown_view 	=  topdown_view,
})

--- You can continue adding more cargo objets to the database following the structure above, between dot lines. Add Data/<ShapeName>.csv for each; the filename is the shape, not the unit name.
