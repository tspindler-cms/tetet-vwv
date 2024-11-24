local self_ID = "tetet_sh2"
declare_plugin(self_ID,
{
	image     	 = "kaman_h2.bmp",
	installed 	 = true, -- if false that will be place holder , or advertising
	dirName	  	 = current_mod_path,

	fileMenuName = _("H-2 Seasprite"),
	version		 = "0.8.0",
	state		 = "installed",
	info		 = _("Wikipedia: The Kaman SH-2 Seasprite is a ship-based helicopter originally developed and produced by American manufacturer Kaman Aircraft Corporation. It has been typically used as a compact and fast-moving rotorcraft for utility and anti-submarine warfare missions."),

	Skins	=
		{
			{
				name	= "H-2 Seasprite",
				dir		= "Skins/1"
			},
		},

})
----------------------------------------------------------------------------------------

mount_vfs_texture_path  (current_mod_path.."/Textures/rescue_pilots.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/seasprite_sh2f.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/stretcher_sling.zip")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_model_path	(current_mod_path.."/Shapes")

dofile(current_mod_path..'/vwv_sh2f_statics.lua')
dofile(current_mod_path..'/vwv_sh2f.lua')
dofile(current_mod_path..'/vwv_hh2d.lua')

plugin_done()
