declare_plugin("jjj_Vietnam_Junk",
{
dirName		  = current_mod_path,
displayName   = _("Vietnam Junk"),
shortName	  = "Junk",
version		  = "3.1.0",
state		  = "installed",
fileMenuName  = _("vwv Junk"),
developerName = "James J Jackson",
info		  = _("Vietnam Junk, circa 1960"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Junk",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path .. "/Liveries")
mount_vfs_model_path    (current_mod_path .. "/Shapes")
mount_vfs_texture_path	(current_mod_path .. "/Textures/Junk.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path .."/Database/db_ships.lua")
dofile(current_mod_path.."/Database/Navy/junk_static.lua")

plugin_done()
