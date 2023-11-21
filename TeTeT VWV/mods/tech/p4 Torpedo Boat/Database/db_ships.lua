local function ship_file(f)
	if dofile(f) then
		error("can't load file "..f)
		return
	end
	if(GT) then
		GT.shape_table_data = 
		{
			{
				file  	    = GT.visual.shape;
				username    = GT.Name;
				desrt       = GT.visual.shape_dstr;
			    classname 	= "lLandShip";
				positioning = "BYNORMAL";
			},
			{
				name  = GT.visual.shape_dstr;
				file  = GT.visual.shape_dstr;
			},
		}
		add_surface_unit(GT)
		GT = nil;
	else
		error("GT empty in file "..f)
	end;
end
--^^ this is normal on all ships

ship_file(current_mod_path.."/Database/p4.lua") -- this is the ship or ships lua files
-- ship_file(current_mod_path.."/Database/something else.lua") -- if there is more that one file then add more

--add anything else here like LSO POS and Hanger stuff