declare_plugin("jjj_new_jersey_68",
{
dirName		  = current_mod_path,
displayName   = _("USS New Jersey"),
shortName	  = "Big J",
version		  = "2.0.1",
state		  = "installed",
fileMenuName  = _("vwv_New_Jersey"),
developerName = "James J. Jackson",
info		  = _("USS New Jersey, BB-62, circa 1968"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "New_Jersey",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/new_jersey.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/New_Jersey_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")
--dofile(current_mod_path .."/MissionEditor/data/NewMap/classifier_jjj.lua")

plugin_done()
