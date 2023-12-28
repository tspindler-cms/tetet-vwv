declare_plugin("crusader",
{
installed 	 = true, 
dirName	  	 = current_mod_path,
version		 = "KNN",
state		 = "installed",
info		 = _("crusader"),

InputProfiles =
	{
		["crusader"]     = current_mod_path .. '/Input/crusader',
	},


Skins	= 
	{
		{
			name	= "F-8 Crusader",
			dir	= "Skins/1"
		},
	},

Missions =
	{
		{
			name		= _("crusader"),
			dir		= "Missions",
		},
	},	

Options = 
	{
		{
			name		= _("crusader"),
			nameId		= "crusader",
			dir		= "Options",
		},
	},
LogBook =
	{
		{
			name		= _("crusader"),
			type		= "crusader",
		},
	},	
})

---------------------------------------------------------------------------------------
dofile(current_mod_path..'/Views.lua')
dofile(current_mod_path..'/crusader.lua')
make_view_settings('crusader', ViewSettings, SnapViews)


mount_vfs_model_path	(current_mod_path.."/Cockpit/Shape")
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/crusader")
local support_cockpit = current_mod_path..'/Cockpit/'
mount_vfs_texture_path (current_mod_path.."/Skins/1/ME") 

make_flyable('crusader', support_cockpit, {'crusader', nil, old=4}, current_mod_path..'/comm.lua')---6


-------------------------------------------------------------------------------------
plugin_done()
