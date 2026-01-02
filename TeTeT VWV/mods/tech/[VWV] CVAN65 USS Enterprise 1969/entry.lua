declare_plugin("jjj_enterprise_69",
{
	dirName		  = current_mod_path,
	displayName   = _("CVAN-65 Enterprise 1969"),
	shortName	  =   "Big-E 1969",
	version		  =   "2.4.0",
	state		  =   "installed",
	fileMenuName = _("vwv Enterprise 69"),
	developerName =   "TeTeT, James J. Jackson, Riko, Tansoku102cm",
	info		  =    _("USS Enterprise, CVAN-65, circa 1969, Wikipedia:  In 1958, she became the first nuclear-powered aircraft carrier in the United States Navy, and the world, as well as the eighth United States naval vessel to bear the name."),
	encyclopedia_path = current_mod_path .. '/Encyclopedia',

	Skins =
	{
		{
			name  = "CVAN-6569",
			dir   = "Skins/1"
		},
	},

})

mount_vfs_liveries_path (current_mod_path .. "/Liveries")
mount_vfs_model_path    (current_mod_path .. "/Shapes")
mount_vfs_texture_path	(current_mod_path .. "/Textures/CVAN_6569.zip")

dofile(current_mod_path .. "/Database/db_ships.lua")

plugin_done()
