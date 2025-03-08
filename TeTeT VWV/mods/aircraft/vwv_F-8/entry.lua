self_ID = "tetet_crusader"
declare_plugin(self_ID,
{
	image = "FC3.bmp",
	installed = true, -- if false that will be place holder , or advertising
	dirName = current_mod_path,
	displayName = _("crusader"),

	fileMenuName = _("crusader"),
	update_id = "crusader",
	version = "0.9.1",
	state = "installed",
	info = _("Wikipedia: The Vought F-8 Crusader (originally F8U) is a single-engine, supersonic, carrier-based air superiority jet aircraft designed and produced by the American aircraft manufacturer Vought. It was the last American fighter that had guns as the primary weapon, earning it the title 'The Last of the Gunfighters'."), 

	Skins	=
		{
			{
				name	= _("F-8 Crusader"),
				dir		= "Skins/1"
			},
		},
	Missions =
		{
			{
				name		    = _("crusader"),
				dir			    = "Missions",
			},
		},
	LogBook =
		{
			{
				name		= _("crusader"),
				type		= "crusader",
			},
		},
	InputProfiles =
		{
			["crusader"] = current_mod_path .. '/Input/crusader',
			["crusader_np"] = current_mod_path .. '/Input/crusader_np',
		},
})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/crusader")

-------------------------------------------------------------------------------------

dofile(current_mod_path.."/Weapons/F8_AIM-9C.lua")
dofile(current_mod_path.."/Weapons/F8_AIM-9D.lua")
dofile(current_mod_path.."/Weapons/bombs.lua")
-- dofile(current_mod_path.."/Weapons/ammo.lua")
dofile(current_mod_path.."/Views.lua")
make_view_settings('vwv_crusader', ViewSettings, SnapViews)
make_flyable('vwv_crusader'	, current_mod_path..'/Cockpit/A10A/', {nil, old = 6}, current_mod_path..'/comm.lua')
-- make_view_settings('crusader_np', ViewSettings, SnapViews)
-- make_flyable('crusader_np'	, current_mod_path..'/Cockpit/A10A/', {nil, old = 6}, current_mod_path..'/comm.lua')
-------------------------------------------------------------------------------------
dofile(current_mod_path..'/crusader.lua')
dofile(current_mod_path..'/crusader_np.lua')
-------------------------------------------------------------------------------------
plugin_done()
