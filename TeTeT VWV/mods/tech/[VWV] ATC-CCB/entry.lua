declare_plugin("VWV ATC-CCB Boat",
{
dirName				= current_mod_path,
installed			= true,
displayName			= _("ATC-CCB Boat"),
shortName			= "ATC-CCB Boat",
state				= "installed",
developerName		= "FredyMaxiDevelopment & TeTeT",
version				= "2.3.0",
info				= _("Wikipedia: The Monitor was a highly modified version of the LCM-6 developed by the United States Navy for use as a mobile riverine assault boat in the Vietnam War. Another version served as a command and control boat (CCB or Charlie boat)."),
encyclopedia_path	= current_mod_path .. '/Encyclopedia',
})
---------------------------------------------------------------------------------------

mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures")

mount_vfs_texture_path  (current_mod_path .. "/Textures/CCB-ATC-H_boats.zip")
---------------------------------------------------------------------------------------

dofile(current_mod_path .. "/Database/db_ships.lua")
---------------------------------------------------------------------------------------

plugin_done()
