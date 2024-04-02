self_ID = "mig17f"
declare_plugin(self_ID,
{
image     	 = "mig17f.bmp",
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName  = _("mig17f"),
--developerName = _("Modell (VNAO)"),

fileMenuName = _("mig17f"),
update_id        = "mig17f",
version		 = "2.5.5",
state		 = "installed",
info		 = _("mig17f."),

Skins	=
	{
		{
		    name	= _("mig17f"),
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name		    = _("mig17f"),
			dir			    = "Missions",
  		},
	},
LogBook =
	{
		{
			name		= _("mig17f"),
			type		= "mig17f",
		},
		{
			name		= _("mig17pm"),
			type		= "mig17pm",
		},
	},	
	Options =
	{
		{
			name		= _("mig17f"),
			nameId		= "mig17f",
			dir			= "Options",
		},
	},	
InputProfiles =
	{
		["mig17f"] = current_mod_path .. '/Input/mig17f',
		["mig17pm"] = current_mod_path .. '/Input/mig17pm',
	},
	
})


----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/Avionics")
mount_vfs_texture_path  (current_mod_path.."/Textures/mig17f")
mount_vfs_model_path    (current_mod_path ..  "/Cockpit/Shape")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_sound_path	(current_mod_path.."/Sounds")
-------------------------------------------------------------------------------------
local cfg_path = current_mod_path ..  "/FM/F15/config.lua"
dofile(cfg_path)
F15FM[1] 				= self_ID
F15FM[2] 				= 'F15'
F15FM.config_path 		= cfg_path
F15FM.old 				= 54


dofile(current_mod_path..'/mig17f.lua')
dofile(current_mod_path..'/mig17pm.lua')


dofile(current_mod_path.."/Views17e.lua")
make_view_settings('mig17f' , ViewSettings, SnapViews)
make_flyable('mig17f', current_mod_path..'/Cockpit/Scripts/', {nil,old = 16}, current_mod_path..'/Comm.lua')
dofile(current_mod_path.."/Views17PM.lua")
make_view_settings('mig17pm' , ViewSettings, SnapViews)
make_flyable('mig17pm', current_mod_path..'/Cockpit/Scripts/', {nil,old = 3}, current_mod_path..'/Comm.lua')
-------------------------------------------------------------------------------------
plugin_done()
