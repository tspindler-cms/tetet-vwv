local self_ID = "vwv_b57g"
declare_plugin(self_ID,
{
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,
	displayName      = _("[VWV] B-57G Canberra"),
	developerName    = _("TeTeT"),

	fileMenuName     = _("B-57G"),
	update_id        = "b57g",
	version		 = "3.4.0",
	state		 = "installed",
	info		 = _("Martin B-57G night intruder. Two J65 turbojets, fixed wing, land-based."),
	Skins	=
	{
		{
			name		= _("B-57G"),
			dir			= "Theme/1"
		},
	},
})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/b57g.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/m36.zip")
----------------------------------------------------------------------------------------
dofile(current_mod_path.."/Database/sensors.lua")
dofile(current_mod_path.."/Weapons/m36.lua")
add_aircraft(dofile(current_mod_path.."/Database/b57g.lua"))

-------------------------------------------------------------------------------------
plugin_done()
