declare_plugin("tetet_vwv_buildings",

{
displayName   	= _("Vietnam War Vessels Buildings"),
shortName	  	=   "vwv_bdg",
installed 	 	= true,
dirName	  	 	= current_mod_path,

encyclopedia_path = current_mod_path..'/Encyclopedia',

fileMenuName 	= _("VWV"),
version		 	= "2.2.0",
state		 	= "installed",
developerName	= "TeTeT, Pirat3n, Odyseus",
info		 	= _("Buildings for the VWV mod"),

})
-- ------------------------------------------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
------------------------------------------------------------------------------------------------------------------------
-- liveries
mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
-- ------------------------------------------------------------------------------------------------------------------------
-- textures
mount_vfs_texture_path	(current_mod_path ..  "/Textures/indohut")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/GuardTower")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/us_watch_tower")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_barrels")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_boomgate")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_half_connex")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_barbwire_fence")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_guard_shed")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_marsdenmat")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_revetment_panels")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_hangar")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vwv_us_barracks")

-- Huts and more, excuse the misnomer
dofile(current_mod_path .."/Database/vwv_indohuts.lua")
-- Cargo
dofile(current_mod_path .."/Database/vwv_cargo.lua")
-- armed buildings
dofile(current_mod_path .. "/Database/vwv_forts.lua")
-- farps
dofile(current_mod_path .. "/Database/vwv_farps.lua")
-- ------------------------------------------------------------------------------------------------------------------------

plugin_done()
