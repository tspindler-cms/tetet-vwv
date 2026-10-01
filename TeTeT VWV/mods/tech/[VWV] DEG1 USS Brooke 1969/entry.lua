declare_plugin("jjj_Brooke_69",
{
dirName		  = current_mod_path,
displayName   = _("USS Brooke"),
shortName	  = "Brooke",
version		  = "3.3.1",
state		  = "installed",
fileMenuName  = _("VWV_Brok69"),
developerName = "James J Jackson",
info		  = _("USS Brooke, DEG-1, circa 1969"),

Skins =
{
	 {
	     name  = "DEG-1 1967",
		 dir   = "Skins/1"
	 },
},

})
mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Brok69.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path.."/Database/Sensors/Brok69_sensors.lua")
dofile(current_mod_path.."/Database/Weapons/Brok69_Ammo.lua") -- any custom weapons the mod has
dofile(current_mod_path.."/Database/Weapons/Brok69_Tartar.lua")
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
