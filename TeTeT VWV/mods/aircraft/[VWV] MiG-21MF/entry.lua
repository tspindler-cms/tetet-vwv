self_ID = "tetet_mig21mf"
declare_plugin(self_ID, {
    installed = true, -- if false that will be place holder , or advertising
    dirName = current_mod_path,
    displayName = _("MiG-21MF 'Fishbed J'"),
    fileMenuName = _("MiG-21MF"),
    developerName = _("TeTeT"),
    update_id = "mig21mf",
    version = "3.0.0",
    state = "installed",
    info = _("Wikipedia: Export variant of the MiG-21S with two major differences: the RP-22 radar of the MiG-21S was substituted with the older RP-21MA radar, and featured a built-in GSh-23L cannon instead of a cannon pod"),
    creditsFile = "credits.txt",
    Skins =
    {
        {
            name = _("MiG-21MF"),
            dir = "Theme/1"
        }
    },
    Missions =
    {
        {
            name = _("mig21mf"),
            dir = "Missions"
        }
    },
    LogBook = {
        {
            name = _("mig21mf"),
            type = "mig21mf"
        }
    },
})

-------------------------------------------------------------------------------------
mount_vfs_model_path(current_mod_path    .. "/Shapes")
mount_vfs_liveries_path(current_mod_path .. "/Liveries")
mount_vfs_texture_path(current_mod_path  .. "/Textures/mig21mf")
-------------------------------------------------------------------------------------
add_aircraft( dofile(current_mod_path .. "/Database/mig21mf.lua") )
-------------------------------------------------------------------------------------
plugin_done()
