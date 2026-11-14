local self_ID = "vwv_b57g"
declare_plugin(self_ID,
{
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,
	displayName      = _("[VWV] B-57G Canberra"),
	developerName    = _("TeTeT"),
	creditsFile = "credits.txt",
	fileMenuName     = _("B-57G"),
	update_id        = "b57g",
	version		 = "3.4.1",
	state		 = "installed",
	info		 = _("Wikipedia: Converted as a specialized night-intruder and interdiction aircraft during the Vietnam War to hunt supply traffic along the Ho Chi Minh Trail."),
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
-- no liveries for now: mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/b57g.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/m36.zip")
----------------------------------------------------------------------------------------
dofile(current_mod_path.."/Database/sensors.lua")
dofile(current_mod_path.."/Weapons/m36.lua")
dofile(current_mod_path.."/Weapons/bay.lua")
add_aircraft(dofile(current_mod_path.."/Database/b57g.lua"))

-------------------------------------------------------------------------------------
plugin_done()
