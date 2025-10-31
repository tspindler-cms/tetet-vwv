declare_plugin("tetet_ch46d",
{
    displayName = _("CH-46D Sea Knight"),
    shortName = "CH-46D",
    installed = true,
    dirName = current_mod_path,

    encyclopedia_path = current_mod_path..'/Encyclopedia',
    fileMenuName = _("CH-46D Sea Knight"),
    version = "2.2.0",
    state = "installed",
    developerName = "TeTeT, Odyseus",
    info = _("Wikipedia: The one true Phrog"),

	Skins	=
		{
			{
				name		= _("CH-46D Sea Knight"),
				dir			= "Skins/1"
			},
		},
	Missions =
		{
			{
				name		= _("CH-46D Sea Knight"),
				dir			= "Missions",
			},
		},
	LogBook =
		{
			{
				name		= _("CH-46D Sea Knight"),
				type		= "ch-46d_seaknight",
			},
		},

})

mount_vfs_model_path(current_mod_path.."/Shapes")
mount_vfs_texture_path(current_mod_path.."/Textures/CH46D.zip")
mount_vfs_texture_path(current_mod_path.."/Textures/CH46D-pilot.zip")
mount_vfs_liveries_path(current_mod_path.."/Liveries")

add_aircraft(dofile(current_mod_path..'/Database/vwv_ch46d_early.lua'))
add_aircraft(dofile(current_mod_path..'/Database/vwv_ch46d_late.lua'))

plugin_done()
