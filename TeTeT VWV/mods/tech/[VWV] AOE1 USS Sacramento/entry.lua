declare_plugin("JJJ_Sacramento_68",
{
dirName		  = current_mod_path,
displayName   = _("USS Sacramento"),
shortName	  = "Sacramento",
version		  = "3.3.0",
state		  = "installed",
fileMenuName  = _("JJJ_Sacramento"),
developerName = "James J. Jackson",
info		  = _("USS Sacramento, AOE-1, circa 1968"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Sacramento 68",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Sacramento.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path.."/Database/Sensors/sac_sensors.lua")
dofile(current_mod_path..'/Weapons/sac_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
