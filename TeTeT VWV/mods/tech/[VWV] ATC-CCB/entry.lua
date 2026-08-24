-- ATC(H) & CCB Boat --

declare_plugin("VWV ATC-CCB Boat",
{
    dirName       = current_mod_path,
    displayName   = _("ATC-CCB Boat"),
    shortName     = "ATC-CCB Boat",
    version       = "3.3.0",
    state         = "installed",
    installed     = true,
    developerName = "upuaut - FMD & TeTeT, Odyseus",
    info          = _("Adds various Boat Vietnam units to DCS world."),
    encyclopedia_path = current_mod_path .. "/Encyclopedia",
})

---------------------------------------------------------------------------------------
mount_vfs_model_path    (current_mod_path .. "/Shapes")
mount_vfs_texture_path  (current_mod_path .. "/Textures")
mount_vfs_texture_path  (current_mod_path .. "/Textures/vwv_CCB.zip")
mount_vfs_texture_path  (current_mod_path .. "/Textures/vwv_ATC.zip")
mount_vfs_liveries_path (current_mod_path .. "/Liveries")
---------------------------------------------------------------------------------------
dofile(current_mod_path .. "/Database/Weapons/vwv_ammunition.lua")
dofile(current_mod_path .. "/Database/db_ships.lua")

---------------------------------------------------------------------------------------

plugin_done()
