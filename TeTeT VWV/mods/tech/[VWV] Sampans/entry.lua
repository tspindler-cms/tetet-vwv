declare_plugin("tetet_Sampans",
{
dirName       = current_mod_path,
displayName   = _("Sampans"),
shortName     = "Sampans",
version       = "3.2.0",
state         = "installed",
installed     = true,
fileMenuName  = _("vwv_sampans"),
developerName = "TeTeT",
info          = _("Sampans"),
encyclopedia_path = current_mod_path..'/Encyclopedia',
})
--------------------------------------------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
--------------------------------------------------------------------------------------------------------------------------
-- liveries
-- mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
--------------------------------------------------------------------------------------------------------------------------
-- textures
mount_vfs_texture_path  (current_mod_path .. "/Textures/sampans")

--------------------------------------------------------------------------------------------------------------------------
-- Ships
dofile(current_mod_path .. "/Database/db_ships.lua")
--------------------------------------------------------------------------------------------------------------------------

plugin_done()
