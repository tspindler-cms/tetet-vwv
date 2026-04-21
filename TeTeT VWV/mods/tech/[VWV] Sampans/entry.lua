declare_plugin("tetet_Sampans",
{
    displayName   	= _("Sampans"),
    shortName	  	=   "Sampans",
    installed 	 	= true,
    dirName	  	 	= current_mod_path,

    encyclopedia_path = current_mod_path..'/Encyclopedia',
    version		 	= "3.1.0",
    state		 	= "installed",
    fileMenuName  =   _("vwv_sampans"),
    developerName =   "TeTeT",
    info		 	= _("Sampans"),
})
--------------------------------------------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
--------------------------------------------------------------------------------------------------------------------------
-- liveries
-- mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
--------------------------------------------------------------------------------------------------------------------------
-- textures
mount_vfs_texture_path	(current_mod_path .. "/Textures/sampans")

--------------------------------------------------------------------------------------------------------------------------
-- Ships
dofile(current_mod_path .. "/Database/db_ships.lua")
--------------------------------------------------------------------------------------------------------------------------

plugin_done()
