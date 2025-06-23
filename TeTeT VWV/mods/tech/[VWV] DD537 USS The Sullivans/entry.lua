declare_plugin("jjj_thesullivans_64",
{
dirName		  = current_mod_path,
displayName   = _("USS The Sullivans"),
shortName	  = "The Sullivans",
version		  = "1.1.0",
state		  = "installed",
fileMenuName  = _("vwv The Sullivans"),
developerName = "TeTeT, James J Jackson",
info		  = _("USS The Sullivans, DD-537, circa 1964"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "TheSullivans",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/the_sullivans.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/TheSullivans_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")

plugin_done()
