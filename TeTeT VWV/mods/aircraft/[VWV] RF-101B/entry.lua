self_ID = "tetet_rf101b"
declare_plugin(self_ID, {
    installed = true, -- if false that will be place holder , or advertising
    dirName = current_mod_path,
    displayName = _("RF-101B Voodoo"),
    fileMenuName = _("RF-101B"),
    developerName = _("Odyseus, TeTeT"),
    update_id = "rf-101b",
    version = "3.0.0",
    state = "installed",
    info = _("Wikipedia: In the early 1970s, a batch of 22 former RCAF CF-101Bs was delivered to the USAF and converted into RF-101B reconnaissance aircraft, each aircraft had its radar and weapons bay replaced with a set of three KS-87B cameras and two AXQ-2 TV cameras."),
    creditsFile = "credits.txt",
    Skins =
    {
        {
            name = _("RF-101B"),
            dir = "Theme/1"
        }
    },
    Missions =
    {
        {
            name = _("rf-101b"),
            dir = "Missions"
        }
    },
    LogBook = {
        {
            name = _("rf-101b"),
            type = "rf-101b"
        }
    },
})

-------------------------------------------------------------------------------------
mount_vfs_model_path(current_mod_path .. "/Shapes")
mount_vfs_liveries_path(current_mod_path .. "/Liveries")
mount_vfs_texture_path(current_mod_path .. "/Textures/rf101b")
-------------------------------------------------------------------------------------
add_aircraft(dofile(current_mod_path .. '/Database/rf101b.lua'))
-------------------------------------------------------------------------------------
plugin_done()
