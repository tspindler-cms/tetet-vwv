declare_plugin("JJJ_Oklahoma_City_67",
{
dirName		  = current_mod_path,
displayName   = _("USS Oklahoma City"),
shortName	  = "Oklahoma City",
version		  = "3.0.0",
state		  = "installed",
fileMenuName  = _("JJJ_Oklahoma_City"),
developerName = "James J. Jackson",
info		  = _("USS Oklahoma City, CLG-5, circa 1967"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "OKC",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/OKC.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/OKC_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path.."/Database/Sensors/OKC_sensors.lua")
dofile(current_mod_path..'/Weapons/OKC_Talos.lua')

dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
