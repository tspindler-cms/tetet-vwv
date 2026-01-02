declare_plugin("tetet_fletcher",
----- FCE =  Fletcher Class Destroyer
{
    image     	 = "FLC.bmp",
    installed 	 = true,
    dirName	  	 = current_mod_path,

    fileMenuName = _("Fletcher"),
    version		 = "2.4.0",
    state		 = "installed",
    info		 = _("Wikipedia: The Fletcher class was a class of destroyers built by the United States during World War II. The class was designed in 1939, as a result of dissatisfaction with the earlier destroyer leader types of the Porter and Somers classes. Some went on to serve during the Korean War and into the Vietnam War."),

    encyclopedia_path = current_mod_path .. '/Encyclopedia',
})

mount_vfs_model_path	(current_mod_path.."/Shapes/")
mount_vfs_texture_path  (current_mod_path.."/Textures/")
mount_vfs_texture_path  (current_mod_path.."/Textures/fletcher_framii_main_1.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/fletcher_framii_main_2.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/fletcher_framii_main_3.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/fletcher_framii_liveries_1.zip")
mount_vfs_texture_path  (current_mod_path.."/Textures/fletcher_framii_liveries_2.zip")

mount_vfs_liveries_path (current_mod_path.."/Liveries")
----------------------------------------------------------------------------------------

dofile(current_mod_path.."/Weapons/uss_fletcher_framii_Ammo.lua")
dofile(current_mod_path.."/Database/db_ships.lua")

plugin_done()

