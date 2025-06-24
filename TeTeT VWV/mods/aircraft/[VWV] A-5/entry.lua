self_ID = "tetet_ra5"
declare_plugin(self_ID,
{
	image     	 = "FC3.bmp",
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,
	displayName  = _("RA-5C Vigilante"),
	developerName = _("TeTeT, Hawkeye60"),

	fileMenuName = _("RA-5C Vigilante"),
	update_id    = "ra5-vigilante",
	version		 = "2.0.0",
	state		 = "installed",
	info		 = _("ChatGPT: The RA-5C Vigilante was a supersonic, carrier-based reconnaissance aircraft used by the U.S. Navy during the Cold War, known for its advanced sensors and sleek design."),
	creditsFile = "credits.txt",
	Skins	=
	{
		{
			name		= _("RA5C Vigilante"),
			dir			= "Theme/1"
		},
	},
	Missions =
	{
		{
			name		= _("ra5c-vigilante"),
			dir			= "Missions",
		},
	},
	LogBook =
	{
		{
			name		= _("ra5c-vigilante"),
			type		= "ra5c-vigilante",
		},
	},
})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/ra5c-vigilante")
----------------------------------------------------------------------------------------
add_aircraft(dofile(current_mod_path.."/Database/ra5c-vigilante.lua"))

-------------------------------------------------------------------------------------
plugin_done()
