declare_plugin("jjj_Kaman",
{

    image     	 = "FC3.bmp",
    installed 	 = true, -- if false that will be place holder , or advertising
    dirName	  	 = current_mod_path,
    displayName  = _("H-2 Seasprite"),
    developerName = _("H-2 Seasprite"),

    encyclopedia_path = current_mod_path..'/Encyclopedia',
    update_id        = "H-2 Seasprite",
    fileMenuName = _("H-2 Seasprite"),
    version = "2.4.0",
    state = "installed",
    info = _("Wikipedia: The Kaman Seasprite is a ship-based helicopter originally developed and produced by American manufacturer Kaman Aircraft Corporation. It has been typically used as a compact and fast-moving rotorcraft for utility and anti-submarine warfare missions."),
})

mount_vfs_model_path(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/Seasprite1.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/Seasprite2.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/Seasprite_b.zip")
mount_vfs_liveries_path (current_mod_path.."/Liveries")

dofile(current_mod_path..'/weapons/Sh2f_Ammo.lua')
add_aircraft(dofile(current_mod_path..'/Database/sh2f.lua'))
add_aircraft(dofile(current_mod_path..'/Database/uh2a.lua'))
add_aircraft(dofile(current_mod_path..'/Database/uh2b.lua'))
add_aircraft(dofile(current_mod_path..'/Database/uh2c.lua'))


plugin_done()
