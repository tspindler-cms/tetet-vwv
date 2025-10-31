declare_plugin("tetet_sh2f",
{
    displayName = _("SH-2F Seasprite"),
    shortName = "SH-2F",
    installed = true,
    dirName = current_mod_path,

    encyclopedia_path = current_mod_path..'/Encyclopedia',
    fileMenuName = _("SH-2F Seasprite"),
    version = "2.2.0",
    state = "installed",
    developerName = "TeTeT, James J Jackson",
    info = _("Wikipedia: The Kaman SH-2 Seasprite is a ship-based helicopter originally developed and produced by American manufacturer Kaman Aircraft Corporation. It has been typically used as a compact and fast-moving rotorcraft for utility and anti-submarine warfare missions."),
})

mount_vfs_model_path(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/Seasprite.zip")
mount_vfs_liveries_path (current_mod_path.."/Liveries")

dofile(current_mod_path..'/weapons/Sh2f_Ammo.lua')
add_aircraft(dofile(current_mod_path..'/Database/vwv_sh2f.lua'))


plugin_done()
