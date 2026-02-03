local self_ID = "tetet_O1"
declare_plugin(self_ID,
{
	image     	 = "O1BD.bmp",
	installed 	 = true, -- if false that will be place holder , or advertising
	displayName     = _("O-1E Bird Dog"),
	developerName   = "VWV Team, Violent Nomad",
	dirName	  	 = current_mod_path,
	creditsFile = "credits.txt",
	fileMenuName = _("O-1E Bird Dog"),
	version		 = "3.0.0",
	state		 = "installed",
	info		 = _("Wikipedia: The Cessna O-1 Bird Dog is a liaison and observation aircraft that first flew on December 14, 1949, and entered service in 1950 as the L-19 in the Korean War. It went to serve in many branches of the U.S. Armed Forces, was not retired until the 1970s in a number of variants, and also served in the Vietnam War."),

	Skins	=
	{
		{
			name	= "O-1 Bird Dog",
			dir		= "Skins/1"
		},
	},

	LogBook =
	{
		{
			name		= _("O-1 Bird Dog"),
			type		= "O1BD",
		},
	},

})

---------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/O-1.zip")
mount_vfs_liveries_path (current_mod_path.."/Liveries")

local vwv_o1_birddog = dofile(current_mod_path .. '/o1.lua')
add_aircraft(vwv_o1_birddog)

plugin_done()







