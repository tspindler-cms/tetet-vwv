declare_plugin("tetet_EFL_67",
{
dirName		  = current_mod_path,
displayName   = _("USS Everett F. Larson"),
shortName	  = "Gearing class",
version		  = "3.0.0",
state		  = "installed",
fileMenuName  = _("vwv_EFL"),
developerName = "James J Jackson",
info		  = _("USS Everett F. Larson, DD-830, circa 1967"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "EFL",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/EFL.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/EFL_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
