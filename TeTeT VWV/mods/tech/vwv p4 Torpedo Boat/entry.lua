declare_plugin("tetet_p4",
{
dirName		  = current_mod_path,
displayName   = _("p4 Torpedo Boat"),
shortName	  =   "p4",
version		  =   "0.5.0",
state		  =   "installed",
fileMenuName  =   _("vwv_p4"),
developerName =   "TeTeT",
info		  =    _("p4 Torpedo Boat"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins = 
{
	 {     
	    name  = "P4 Torpedo Boat", 
	 	dir   = "Skins/1" 
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/p4.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

-- dofile(current_mod_path..'/Weapons/Weapon.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
