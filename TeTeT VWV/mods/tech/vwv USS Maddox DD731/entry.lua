declare_plugin("tetet_maddox_64",
{
dirName		  = current_mod_path,
displayName   = _("USS Maddox"),
shortName	  = "Maddox",
version		  = "0.6.0",
state		  = "installed",
fileMenuName  = _("vwv_Maddox"),
developerName = "TeTeT",
info		  = _("USS Maddox, DD-731, circa 1964"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Maddox",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/maddox.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Maddox_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
