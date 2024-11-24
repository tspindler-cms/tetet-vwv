declare_plugin("tetet_vwv_buildings",

{
displayName   	= _("Vietnam War Vessels Buildings"),
shortName	  	=   "vwv_bdg",
installed 	 	= true, 
dirName	  	 	= current_mod_path,

encyclopedia_path = current_mod_path..'/Encyclopedia',

fileMenuName 	= _("VWV"),
version		 	= "0.8.0",
state		 	= "installed",
developerName	= "TeTeT, Pirat3n",
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
-- Huts
dofile(current_mod_path .."/Database/vwv_indohuts.lua")
-- ------------------------------------------------------------------------------------------------------------------------

plugin_done()