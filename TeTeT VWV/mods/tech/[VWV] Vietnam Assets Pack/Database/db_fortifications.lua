-- db VAP Fortifications --

local plugin_db_path = current_mod_path..'/Database/'

local function chassis_file(f)
    if dofile(plugin_db_path..f) then
		error("can't load file "..f)
		return
	end
end

local function vehicle_file(f)
	if dofile(plugin_db_path..f) then
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
			    classname 	= "lLandVehicle";
				positioning = "ONLYHEIGTH";
				life		= GT.life or 5;
			},
			{
				name  = GT.visual.shape_dstr;
				file  = GT.visual.shape_dstr;
			},
		}
		GT.MaxSpeed = GT.chassis and GT.chassis.max_road_velocity and (GT.chassis.max_road_velocity * 3.6)
		add_surface_unit(GT)
		GT = nil;
	else
		error("GT empty in file "..f)
	end;
end

--- BEGIN Vehicles
GT = nil;


-- US Hooches
vehicle_file("fortifications/vap_us_hooch_radio.lua")
vehicle_file("fortifications/vap_us_hooch_closed.lua")

-- VC Bunker
vehicle_file("fortifications/vap_vc_bunker_single.lua")

-- VC MG Nest
vehicle_file("fortifications/vap_vc_mg_nest.lua")

-- VC Tunnel
vehicle_file("fortifications/vap_vc_tunnel.lua")


-- Loudspeaker
vehicle_file("fortifications/vap_loudspeakersVietnam.lua")