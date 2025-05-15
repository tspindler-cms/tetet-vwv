self_ID = "tetet_mig17f"
declare_plugin(self_ID, {
    installed = true, -- if false that will be place holder , or advertising
    dirName = current_mod_path,
    displayName = _("mig17f"),
    fileMenuName = _("mig17f"),
    developerName = _("Hawkeye, TeTeT"),
    update_id = "mig17f",
    version = "1.0.0",
    state = "installed",
    info = _("Wikipedia: The Mikoyan-Gurevich MiG-17 (Russian: Микоян и Гуревич МиГ-17; NATO reporting name: Fresco) is a high-subsonic fighter aircraft produced in the Soviet Union from 1952 and was operated by air forces internationally."),
    creditsFile = "credits.txt",
    Skins =
    {
        {
            name = _("mig17f"),
            dir = "Skins/1"
        }
    },
    Missions =
    {
        {
            name = _("mig17f"),
            dir = "Missions"
        }
    },
    LogBook = {
        {
            name = _("mig17f"),
            type = "mig17f"
        }
    },
})

-------------------------------------------------------------------------------------
mount_vfs_model_path(current_mod_path .. "/Shapes")
mount_vfs_liveries_path(current_mod_path .. "/Liveries")
mount_vfs_texture_path(current_mod_path .. "/Textures/mig17f")
-------------------------------------------------------------------------------------
add_aircraft(dofile(current_mod_path .. '/Database/mig17f.lua'))
add_aircraft(dofile(current_mod_path .. '/statics/mig_boarding_ladder.lua'))
-------------------------------------------------------------------------------------
plugin_done()
