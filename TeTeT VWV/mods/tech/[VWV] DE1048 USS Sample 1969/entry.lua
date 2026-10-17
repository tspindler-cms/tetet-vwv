declare_plugin("jjj_Sample_69",
{
dirName		  = current_mod_path,
displayName   = _("USS Sample"),
shortName	  = "Sample",
version		  = "3.3.1",
state		  = "installed",
fileMenuName  = _("VWV_Smpl"),
developerName = "James J Jackson",
info		  = _("USS Sample, DE-1048, circa 1969"),

Skins =
{
	 {
	     name  = "DE-1048 1969",
		 dir   = "Skins/1"
	 },
},

})
mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Smpl.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path.."/Database/Sensors/Smpl_sensors.lua")
dofile(current_mod_path.."/Database/Weapons/Smpl_Ammo.lua") -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
