declare_plugin("jjj_Gray_73",
{
dirName		  = current_mod_path,
displayName   = _("USS Gray"),
shortName	  = "Gray",
version		  = "2.4.0",
state		  = "installed",
fileMenuName  = _("vwv Gray"),
developerName = "James J Jackson",
info		  = _("USS Gray, DE-1054, circa 1973"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Gray",
		 dir   = "Skins/1"
	 },
},

})

---General
mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Gray.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

-- sensors
dofile(current_mod_path.."/Database/Sensors/Gray_sensors.lua")

-- weapons
dofile(current_mod_path..'/Weapons/Gray_Ammo.lua') -- any custom weapons the mod has

--Ship
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
