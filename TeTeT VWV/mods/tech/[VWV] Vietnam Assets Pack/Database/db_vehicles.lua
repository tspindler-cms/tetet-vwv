-- db VAP Vehicles --

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
				positioning = "BYNORMAL";
				life		= GT.life or 6;
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


-- Utility Platform Truck - Mule
chassis_file("chassis/vap_mule_chassis.lua")
vehicle_file("vehicles/vap_mule.lua")

-- M151 MUTT
chassis_file("chassis/vap_mutt_chassis.lua")
vehicle_file("vehicles/vap_mutt.lua")
vehicle_file("vehicles/vap_mutt_gun.lua")


-- M35 Truck
chassis_file("chassis/vap_m35_chassis.lua")
vehicle_file("vehicles/vap_m35_truck.lua")
vehicle_file("vehicles/vap_m35_gun_truck.lua")


-- VC Type 63 MLRS
chassis_file("chassis/vap_type63_chassis.lua")
vehicle_file("vehicles/vap_type63_mlrs.lua")

-- VC Truck
chassis_file("chassis/vap_vc_zil_chassis.lua")
vehicle_file("vehicles/vap_vc_zil.lua")
chassis_file("chassis/vap_vc_zis_chassis.lua")
vehicle_file("vehicles/vap_vc_zis.lua")
vehicle_file("vehicles/vap_civ_zis.lua")

-- VC Truck AAA
vehicle_file("vehicles/vap_vc_zis_aa.lua")


-- Type 63 MLRS
chassis_file("chassis/vap_type63_chassis.lua")
vehicle_file("vehicles/vap_type63_mlrs.lua")

-- VC Bicycle
chassis_file("chassis/vap_vc_bicycle_chassis.lua")
vehicle_file("vehicles/vap_vc_bicycle.lua")
vehicle_file("vehicles/vap_vc_bicycle_mortar.lua")
vehicle_file("vehicles/vap_vc_bicycle_ak.lua")
vehicle_file("vehicles/vap_vc_bicycle_ammo.lua")




