declare_plugin("jjj_mullany_67",
{
dirName		  = current_mod_path,
displayName   = _("USS Mullany"),
shortName	  = "Mullany",
version		  = "2.0.1",
state		  = "installed",
fileMenuName  = _("vwv Mullany"),
developerName = "TeTeT, James J Jackson",
info		  = _("USS Mullany, DD-528, circa 1967"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Mullany",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Mullany.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Mullany_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
