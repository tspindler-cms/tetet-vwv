-- VWV Ships --


local function ship_file(f)
	if dofile(current_mod_path..f) then
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
				
				positioning = GT.positioning or "BYNORMAL";
				--"BYNORMAL",	-- use normal from surface to form UP  ( y) axis 
				--"ONLYHEIGTH",	-- given position normalized ,  p.y  set to surface height value
				--"BY_XZ",	-- project x , z axis from given position projected to surface , 
				--"NO",			-- No transforms
				--"ADD_HEIGTH"	-- No transforms, only hight of surface are added to hight of object
				
				life		= GT.life or 6;
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
---------------------------------------------------------------------------------------

-- Ships --

ship_file("/Database/Navy/ATCH.lua")
ship_file("/Database/Navy/ATCH_Heavy.lua")

ship_file("/Database/Navy/CCB.lua")
