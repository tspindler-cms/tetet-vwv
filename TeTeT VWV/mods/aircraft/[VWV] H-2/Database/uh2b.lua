local uh2b = dofile(current_mod_path.."/Database/uh2_base.lua")

uh2b.Name 						= "uh2b"
uh2b.DisplayName 				= _("[VWV] UH-2B Seasprite")
uh2b.DisplayNameShort 			= _("UH-2B")
uh2b.date_of_introduction		= 1963.08
uh2b.Shape 						= "uh2b"
uh2b.WorldID					=  WSTYPE_PLACEHOLDER
uh2b.livery_entry 				= "uh2b"
uh2b.shape_table_data[1].file		= "uh2b"
uh2b.shape_table_data[1].index		= WSTYPE_PLACEHOLDER
uh2b.shape_table_data[1].username 	= "uh2b"
uh2b.attribute					= {wsType_Air, wsType_Helicopter, wsType_Cruiser, WSTYPE_PLACEHOLDER ,"Transport helicopters",}
-- uh2b.rotor_animation.rotor_models.modelRotorHub_EDM = "sh2f_rotor_hub"
-- uh2b.rotor_animation.rotor_locations = {pos = { 0.5824, 1.8477, 0.0}, pitch = -0.01}
-- uh2b.rotor_animation.tail_rotor.blades_count = 3

-- UH-2B was the "Austere" version. 
-- IFR gear and auto-stabilization removed = Lighter empty weight.
uh2b.M_empty		= 2675		-- Empty mass [kg] (~5,900 lbs) - Lighter than UH-2A
uh2b.M_nominal		= 3850		-- Normal mission mass [kg]

-- Vertical Performance (Meters)
-- Slight improvement in hover performance due to weight reduction
uh2b.H_stat_max_L	= 1600		-- Hover OGE (Lightweight) [m]
uh2b.H_stat_max		= 950		-- Hover OGE (Max weight) [m]

uh2b.flight_time_typical = 155	-- Slightly longer endurance due to lower empty weight
uh2b.flight_time_maximum = 215
uh2b.range			= 1100		-- Ferry range [km]
uh2b.Vy_max			= 10.9		-- Max climb spee

uh2b.rotor_height	= 1.080367	-- Front hub height in the 3D model itself, in its geographic coordinate frame (not from the ground!) [meters]

return uh2b