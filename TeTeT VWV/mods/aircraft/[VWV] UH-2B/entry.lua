declare_plugin("jjj_uh2b",
{
    displayName = _("UH-2B Seasprite"),
    shortName = "UH-2B",
    installed = true,
    dirName = current_mod_path,

    encyclopedia_path = current_mod_path..'/Encyclopedia',
    fileMenuName = _("UH-2B Seasprite"),
    version = "2.1.0",
    state = "installed",
    developerName = "TeTeT, James J Jackson",
    info = _("Wikipedia: The Kaman UH-2 Seasprite is a ship-based helicopter originally developed and produced by American manufacturer Kaman Aircraft Corporation. It has been typically used as a compact and fast-moving rotorcraft for utility and anti-submarine warfare missions."),
})

mount_vfs_model_path(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/Seaspriteb.zip")
mount_vfs_liveries_path (current_mod_path.."/Liveries")

dofile(current_mod_path..'/weapons/Uh2b_Ammo.lua')
add_aircraft(dofile(current_mod_path..'/Database/vwv_uh2b.lua'))


plugin_done()
