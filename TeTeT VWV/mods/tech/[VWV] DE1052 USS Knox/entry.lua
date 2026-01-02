declare_plugin("jjj_Knox_72",
{
dirName		  = current_mod_path,
displayName   = _("USS Knox"),
shortName	  = "Knox",
version		  = "2.4.0",
state		  = "installed",
fileMenuName  = _("vwv Knox"),
developerName = "James J Jackson",
info		  = _("USS Knox, DE-1052, circa 1972"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Knox",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/knox.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/knox_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
