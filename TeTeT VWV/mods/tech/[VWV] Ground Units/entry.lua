declare_plugin("tetet_vwv_ground_units",
{
dirName       = current_mod_path,
displayName   = _("Vietnam War Ground Units"),
shortName     = "vwv_gu",
version       = "3.3.0",
state         = "installed",
installed     = true,
fileMenuName  = _("VWV"),
developerName = "TeTeT",
info          = _("Ground units for the VWV mod"),
encyclopedia_path = current_mod_path..'/Encyclopedia',
})
-- ---------------------------------------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
---------------------------------------------------------------------------------------------------------------------
-- liveries
--mount_vfs_liveries_path (current_mod_path ..  "/Liveries") ---------------------------------------------------------------------------------------------------------------------
-- textures
mount_vfs_texture_path  (current_mod_path ..  "/Textures/vwv_dshk")

-- sounds
mount_vfs_sound_path(current_mod_path.."/Sounds")

-- DSHK
dofile(current_mod_path .."/Database/vwv_dshk.lua")
------------------------------------------------------------------------------------------------------------------------

plugin_done()
