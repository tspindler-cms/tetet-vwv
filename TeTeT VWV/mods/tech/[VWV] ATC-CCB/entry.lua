-- ATC(H) & CCB Boat --

declare_plugin("VWV ATC-CCB Boat",
{
dirName				= current_mod_path,
installed			= true,
displayName			= _("ATC-CCB Boat"),
shortName			= "ATC-CCB Boat",
state				= "installed",
developerName		= "upuaut - FMD & TeTeT",
version				= "3.0.0",
info				= _("Adds various Boat Vietnam units to DCS world."),
encyclopedia_path	= current_mod_path .. "/Encyclopedia",
})

---------------------------------------------------------------------------------------
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures")

mount_vfs_texture_path  (current_mod_path.."/Textures/CCB-ATCH_boats.zip")

---------------------------------------------------------------------------------------
dofile(current_mod_path.."/Database/db_ships.lua")

---------------------------------------------------------------------------------------

plugin_done()