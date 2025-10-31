declare_plugin("tetet_cva31",
{
	dirName		  = current_mod_path,
	displayName   = _("CVA-31 USS Bon Homme Richard"),
	shortName	  =   "CVA-31",
	version		  =   "2.2.0",
	state		  =   "installed",
	fileMenuName = _("vwv_cva31"),
	developerName =   "TeTeT",
	info		  =    _("Essex Class carrier CVA-31 Bon Homme Richard"),
	encyclopedia_path = current_mod_path .. '/Encyclopedia',

	Skins =
	{
		{
			name  = "CVA-31",
			dir   = "Skins/1"
		},
	},

})

mount_vfs_liveries_path (current_mod_path .. "/Liveries")
mount_vfs_model_path    (current_mod_path .. "/Shapes")
mount_vfs_texture_path	(current_mod_path .. "/Textures/cva-31.zip")

dofile(current_mod_path..'/Weapons/CVA-31_Ammo.lua') -- any custom weapons the mod has
dofile(current_mod_path .. "/Database/db_ships.lua")

plugin_done()
