-- db VAP Cargo, class/type of objects added; They will appear as "Cargos" inside "Static Objects" in ME --


local function add_cargo(f)
	if(f) then
		f.shape_table_data = 
		{
			{
				file  	    = f.ShapeName,
				life		= f.Life,
				username    = f.Name,
				desrt       = f.ShapeNameDestr,
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
		f.category 		= 'Cargo';
		
		add_surface_unit(f)
		GT = nil;
	else
		error("Can't add cargo")
	end;
end


-- Cargo Object List
----------------------------------------------


add_cargo({
Name 		 	=  "vap_oh6_cargo", 
DisplayName  	=  _("VAP OH-6 Cargo"), 
ShapeName	 	=   "vap_oh6_cargo",
ShapeNameDestr = "vap_oh6_cargo",
Life		 	 	=  100,
Rate		 	=  100,
canExplode		= true,
mass			= 790,
minMass		= 700,
maxMass		= 890,
couldCargo		= true,
topdown_view 	=  topdown_view,
})

