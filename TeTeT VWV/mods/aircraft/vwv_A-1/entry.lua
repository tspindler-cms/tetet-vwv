self_ID = "tetet_a-1_skyraider"
declare_plugin(self_ID,
{
	-- image     	 = "a_1_skyraider.bmp",
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,
	displayName  = _("A-1 Skyraider"),
	developerName = _("TeTeT, Hawkeye60, seabat, Beldin, Violent Nomad, dotbmp"),
	creditsFile = "credits.txt",
	fileMenuName = _("A-1 Skyraider"),
	update_id    = "a-1_skyraider",
	version		 = "1.0.0",
	state		 = "installed",
	info		 = _("Wikipedia: The Douglas A-1 Skyraider (formerly designated AD before the 1962 unification of Navy and Air Force designations) is an American single-seat attack aircraft in service from 1946 to the early 1980s, which served during the Korean War and Vietnam War."),

	encyclopedia_path = current_mod_path .. "/Encyclopedia",

	Skins	=
		{
			{
				name		= _("A-1 Skyraider"),
				dir			= "Skins/1"
			},
		},
	Missions =
		{
			{
				name		= _("A-1 Skyraider"),
				dir			= "Missions",
			},
		},
	LogBook =
		{
			{
				name		= _("A-1 Skyraider"),
				type		= "a-1_skyraider",
			},
		},

})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/a-1_skyraider.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/TinyTim.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/toilet_bomb.zip")
----------------------------------------------------------------------------------------
dofile(current_mod_path.."/a-1_skyraider.lua")
dofile(current_mod_path.."/tinytim.lua")
dofile(current_mod_path .."/toiletbomb.lua")
-------------------------------------------------------------------------------------
plugin_done()

