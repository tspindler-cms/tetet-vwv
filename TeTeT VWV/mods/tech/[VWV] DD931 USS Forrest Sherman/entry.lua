declare_plugin("jjj_forrest_sherman_67",
{
dirName		  = current_mod_path,
displayName   = _("USS Forrest Sherman"),
shortName	  = "Sherman",
version		  = "2.4.0",
state		  = "installed",
fileMenuName  = _("vwv Forrest Sherman"),
developerName = "TeTeT, James J Jackson",
info		  = _("USS Forrest Sherman, DD-931, circa 1967"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Forrest Sherman",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/forrest_sherman.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Forrest_Sherman_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
