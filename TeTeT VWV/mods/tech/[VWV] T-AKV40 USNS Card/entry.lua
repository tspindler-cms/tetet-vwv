declare_plugin("JJJ_Card_64",
{
dirName		  = current_mod_path,
displayName   = _("USNS Card"),
version		  = "3.0.0",
state		  = "installed",
fileMenuName  = _("vwv_Card"),
developerName = "James J Jackson",
info		  = _("USNS Card, T-AKV-40, circa 1964"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins =
{
	 {
	     name  = "Card",
		 dir   = "Skins/1"
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Card.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()
