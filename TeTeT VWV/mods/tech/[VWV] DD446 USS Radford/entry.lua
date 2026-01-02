declare_plugin("jjj_Radford_66",
{
dirName		  = current_mod_path,
displayName   = _("USS Radford"),
shortName	  = "Radford",
version		  = "2.4.0",
state		  = "installed",
fileMenuName  = _("vwv Radford"),
developerName = "TeTeT, James J Jackson",
info		  = _("USS Radford, DD-446, circa 1966"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Radford",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Radf.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Radf_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
