declare_plugin("jjj_Bradley_69",
{
dirName		  = current_mod_path,
displayName   = _("USS Bradley"),
shortName	  = "Bradley",
version		  = "3.3.1",
state		  = "installed",
fileMenuName  = _("VWV_Brdy"),
developerName = "James J Jackson",
info		  = _("USS Bradley, DE-1041, circa 1969"),

Skins =
{
	 {
	     name  = "DE-1041 1969",
		 dir   = "Skins/1"
	 },
},

})
mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Brdy.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path.."/Database/Sensors/Brdy_sensors.lua")
dofile(current_mod_path.."/Database/Weapons/Brdy_Ammo.lua") -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
