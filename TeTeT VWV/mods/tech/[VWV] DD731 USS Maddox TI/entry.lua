declare_plugin("tetet_maddox_TI",
{
dirName		  = current_mod_path,
displayName   = _("USS Maddox T"),
shortName	  = "Maddox",
version		  = "2.0.1",
state		  = "installed",
fileMenuName  = _("vwv_Maddox_TI"),
developerName = "TeTeT",
info		  = _("USS Maddox, DD-731, circa Tonkin Incident"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Maddox TI",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/maddox_t.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Maddox_t_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
