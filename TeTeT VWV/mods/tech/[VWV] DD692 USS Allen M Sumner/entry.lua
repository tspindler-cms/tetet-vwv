declare_plugin("tetet_sumner_64",
{
dirName		  = current_mod_path,
displayName   = _("USS Allen M. Sumner"),
shortName	  = "Sumner",
version		  = "2.2.0",
state		  = "installed",
fileMenuName  = _("vwv_Allen_M_Sumner"),
developerName = "TeTeT",
info		  = _("USS Allen M. Sumner, DD-692, circa 1964"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Sumner",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/sumner.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Sumner_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
