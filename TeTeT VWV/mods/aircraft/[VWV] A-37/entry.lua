local self_ID = "h60_a37_dragonfly"

declare_plugin(self_ID,
{
installed 	 = true,
dirName	  	 = current_mod_path,
version		 = "1.2.0",
state		 = "installed",
info		 = _("a37_dragonfly"),
developerName= _("Hawkeye60"),

InputProfiles =
{
    ["a37_dragonfly"] = current_mod_path .. '/Input/a37_dragonfly',
},

Skins	=
	{
		{
			name	= _("a37_dragonfly"),
			dir		= "Theme"
		},
	},

Missions =
	{
		{
			name		= _("a37_dragonfly"),
			dir			= "Missions",
		},
	},

LogBook =
	{
		{
			name		= _("a37_dragonfly"),
			type		= "a37_dragonfly",
		},
	},
}
)
mount_vfs_texture_path(current_mod_path ..  "/Theme/ME")--for simulator loading window
--mount_vfs_texture_path  (current_mod_path ..  "/Cockpit/Textures/a_37_dragonfly-CPT-TEXTURES")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures/A-10A_2-CPT-TXT.zip")
mount_vfs_model_path    (current_mod_path.."/Cockpit/Shape")
mount_vfs_texture_path  (current_mod_path.."/Skins/1/ME")
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/A_37.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/")

dofile(current_mod_path.."/Cockpit/Scripts/mainpanel_init.lua")
-- make_flyable('a37_dragonfly',current_mod_path..'/Cockpit/Scripts/', true, current_mod_path..'/comm.lua')--SFM
load_immediately = true

mount_vfs_sound_path (current_mod_path.."/Sounds")
dofile(current_mod_path.."/Views.lua")

-- Unclear why there are two entries for views?
--make_view_settings('A37_Dragonfly', ViewSettings, SnapViews)
make_view_settings('a37_dragonfly', ViewSettings, SnapViews)

local support_cockpit = current_mod_path..'/Cockpit/Scripts/'
-- dofile(current_mod_path..'/Weapons/napalm.lua')
dofile(current_mod_path..'/Weapons/Weapons.lua')
dofile(current_mod_path..'/Database/a37_dragonfly.lua')
-- Not sure why we have two make_flyable calls here
----------------------------------------------------------------------------------------
make_flyable('a37_dragonfly', support_cockpit, nil, current_mod_path..'/comm.lua')
----------------------------------------------------------------------------------------
plugin_done()