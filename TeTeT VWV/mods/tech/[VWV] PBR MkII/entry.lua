declare_plugin("tetet_PBR_MKII",
{
    displayName   	= _("PBR MKII"),
    shortName	  	=   "PBR MKII",
    installed 	 	= true, 
    dirName	  	 	= current_mod_path,

    encyclopedia_path = current_mod_path..'/Encyclopedia',

    version		 	= "2.3.0",
    state		 	= "installed",
    fileMenuName  =   _("vwv_pbr_mkii"),
    developerName =   "TeTeT",
    info		 	= _("PBR MKII"),
})
--------------------------------------------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
--------------------------------------------------------------------------------------------------------------------------
-- liveries
-- mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
--------------------------------------------------------------------------------------------------------------------------
-- textures

mount_vfs_texture_path	(current_mod_path ..  "/Textures/pbr_mk2")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/vietnam_us_soldier")

--------------------------------------------------------------------------------------------------------------------------
-- weapons
-- dofile(current_mod_path..'/Database/Weapons/pbr_GunsAndAmmo.lua')
--------------------------------------------------------------------------------------------------------------------------
-- Ships
dofile(current_mod_path .."/pbr_mk2.lua")
--------------------------------------------------------------------------------------------------------------------------


plugin_done()

