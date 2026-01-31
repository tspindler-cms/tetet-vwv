declare_plugin("[VWV] Vietnam Assets Pack",

{
displayName   	= _("[VWV] Vietnam Assets Pack"),
shortName	  	=   "VAP",
installed 	 	= true, 
dirName	  	 	= current_mod_path,

encyclopedia_path = current_mod_path..'/Encyclopedia',
	
fileMenuName 	= _("VAP"),
version		 	= "3.0.0",		 
state		 	= "installed",
developerName	= "EightBall & Tobi & FMD",
info		 	= _("Supporting assets for the OH-6A mod and other assets"),

})
-- ------------------------------------------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes/vap_farps")
mount_vfs_model_path    (current_mod_path ..  "/Shapes/vap_huts")
mount_vfs_model_path    (current_mod_path ..  "/Shapes/vap_objects")
mount_vfs_model_path    (current_mod_path ..  "/Shapes/vap_vehicles")
-- ------------------------------------------------------------------------------------------------------------------------
-- liveries
mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
-- ------------------------------------------------------------------------------------------------------------------------
-- textures
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_mule")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_mutt")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_us_barge")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_m35_truck")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_m35_gun_truck")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_zil130")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_zil130_aa")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_zis150")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_prop")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_type63_mlrs")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_type96_gun")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_huts")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/pbr_mk2")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_bicycle")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_mortar")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_dummy")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vap_loudspeakers2Vietnam")
-- ------------------------------------------------------------------------------------------------------------------------
-- Weapons
dofile(current_mod_path .."/Database/db_weapons.lua")
-- ------------------------------------------------------------------------------------------------------------------------
-- Ground vehicles
dofile(current_mod_path .."/Database/db_vehicles.lua")
-- ------------------------------------------------------------------------------------------------------------------------
-- Ships
dofile(current_mod_path .."/Database/db_ships.lua")
-- ------------------------------------------------------------------------------------------------------------------------
-- Objects
dofile(current_mod_path .."/Database/db_cargo.lua")
dofile(current_mod_path .."/Database/db_farps.lua")
dofile(current_mod_path .."/Database/db_statics.lua")
dofile(current_mod_path .."/Database/db_fortifications.lua")
-- ------------------------------------------------------------------------------------------------------------------------


plugin_done()

