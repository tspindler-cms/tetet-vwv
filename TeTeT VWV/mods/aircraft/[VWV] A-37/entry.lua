local self_ID = "h60_a37_dragonfly"

declare_plugin(self_ID,
{
installed 	 = true,
dirName	  	 = current_mod_path,
displayName      = _("A-37 Dragonfly"),
fileMenuName     = _("A-37 Dragonfly"),
version		 = "3.2.1",
state		 = "installed",
info		 = _("Wikipedia: The Cessna A-37 Dragonfly, or Super Tweet, is a jet-powered, light attack aircraft designed and produced by the American aircraft manufacturer Cessna."),
developerName    = "Hawkeye60",

InputProfiles =
{
    ["a_37_dragonfly"] = current_mod_path .. '/Input/a37_dragonfly',
},

Skins	=
	{
		{
			name	= _("A-37 Dragonfly"),
			dir		= "Theme"
		},
	},

Missions =
	{
		{
			name		= _("A-37 Dragonfly"),
			dir			= "Missions",
		},
	},

LogBook =
	{
		{
			name		= _("A-37 Dragonfly"),
			type		= "a_37_dragonfly",
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

load_immediately = true

mount_vfs_sound_path (current_mod_path.."/Sounds")
dofile(current_mod_path.."/Views.lua")

make_view_settings('a_37_dragonfly', ViewSettings, SnapViews)

local support_cockpit = current_mod_path..'/Cockpit/Scripts/'
-- dofile(current_mod_path..'/Weapons/napalm.lua')
dofile(current_mod_path..'/Weapons/Weapons.lua')
dofile(current_mod_path..'/Database/a37_dragonfly.lua')
make_flyable('a_37_dragonfly', support_cockpit, nil, current_mod_path..'/comm.lua')
plugin_done()