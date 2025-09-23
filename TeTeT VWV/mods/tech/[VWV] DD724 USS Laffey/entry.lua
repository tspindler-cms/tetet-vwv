declare_plugin("tetet_laffey_64",
{
dirName		  = current_mod_path,
displayName   = _("USS Laffey"),
shortName	  = "Laffey",
version		  = "2.1.0",
state		  = "installed",
fileMenuName  = _("vwv_Laffey"),
developerName = "TeTeT",
info		  = _("USS Laffey, DD-724, circa 1967"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Laffey",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/laffey.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Laffey_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
