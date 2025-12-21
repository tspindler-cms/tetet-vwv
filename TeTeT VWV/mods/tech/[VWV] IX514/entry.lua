declare_plugin("tetet_IX514",
{
--image     	 = "icon.png",
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
version		 = "2.3.0",
state		 = "installed",
info		 = _("Wikipedia: Baylander (IX-514), ex-YFU-79, was a United States Navy Helicopter Landing Trainer (HLT), billed as the world's smallest aircraft carrier."),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

}
)
---------------------------------------------------------------------------------------
-- shapes
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
-- textures
mount_vfs_texture_path	(current_mod_path ..  "/Textures/IX514")

dofile(current_mod_path..'/Database/ix514.lua')
dofile(current_mod_path..'/Database/ix514_armed.lua')

plugin_done()-- finish declaration , clear temporal data
