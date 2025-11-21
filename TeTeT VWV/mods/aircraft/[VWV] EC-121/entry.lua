self_ID = "tetet_ec121"
declare_plugin(self_ID,
{
	image     	 = "FC3.bmp",
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,
	displayName  = _("EC-121 Warning Star"),
	developerName = _("TeTeT"),

	fileMenuName = _("EC-121 Warning Star"),
	update_id    = "ec121_warningStar",
	version		 = "2.2.2",
	state		 = "installed",
	info		 = _("Wikipedia: The Lockheed EC-121 Warning Star is an American airborne early warning and control radar surveillance aircraft operational in the 1950s in both the United States Navy (USN) and United States Air Force (USAF)."),
	creditsFile = "credits.txt",
	Skins	=
	{
		{
			name		= _("EC-121 Warning Star"),
			dir			= "Skins/1"
		},
	},
	Missions =
	{
		{
			name		= _("EC-121 Warning Star"),
			dir			= "Missions",
		},
	},
	LogBook =
	{
		{
			name		= _("EC-121 Warning Star"),
			type		= "ec121-warningstar",
		},
	},
})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/EC121.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/EC121_USAF.zip")
----------------------------------------------------------------------------------------
add_aircraft(dofile(current_mod_path.."/Database/ec121.lua"))
add_aircraft(dofile(current_mod_path.."/Database/l1049.lua"))

-------------------------------------------------------------------------------------
plugin_done()
