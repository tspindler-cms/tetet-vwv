self_ID = "tetet_a-1_skyraider"
declare_plugin(self_ID,
{
	-- image     	 = "a_1_skyraider.bmp",
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,
	displayName  = _("vvw_a-1_skyraider"),
	developerName = _("TeTeT, Hawkeye60, seabat, Beldin"),

	fileMenuName = _("vwv_a-1_skyraider"),
	update_id        = "a-1_skyraider",
	version		 = "0.6.0",
	state		 = "installed",
	info		 = _("Wikipedia: The Douglas A-1 Skyraider (formerly designated AD before the 1962 unification of Navy and Air Force designations) is an American single-seat attack aircraft in service from 1946 to the early 1980s, which served during the Korean War and Vietnam War."),

	encyclopedia_path = current_mod_path .. "/Encyclopedia",

	Skins	=
		{
			{
				name		= _("a-1_skyraider"),
				dir			= "Theme"
			},
		},
	Missions =
		{
			{
				name		= _("a-1_skyraider"),
				dir			= "Missions",
			},
		},
	LogBook =
		{
			{
				name		= _("a-1_skyraider"),
				type		= "a-1_skyraider",
			},
		},

})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/a-1_skyraider.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/TinyTim.zip")
----------------------------------------------------------------------------------------
dofile(current_mod_path.."/a-1_skyraider.lua")
dofile(current_mod_path.."/tinytim.lua")
-------------------------------------------------------------------------------------
plugin_done()

