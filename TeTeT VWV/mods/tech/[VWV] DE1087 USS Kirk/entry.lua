declare_plugin("jjj_Kirk_75",
{
dirName		  = current_mod_path,
displayName   = _("USS Kirk"),
shortName	  = "Kirk",
version		  = "2.0.1",
state		  = "installed",
fileMenuName  = _("vwv Kirk"),
developerName = "James J Jackson",
info		  = _("USS Kirk, DE-1087, circa 1975"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Kirk",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/kirk.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/kirk_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
