declare_plugin("Solon_Turman by Admiral189",
----- Solon_Turman = Bulk Cargo Vessel
{
image     	 = "Solon_Turman.bmp",
installed 	 = true, 
dirName	  	 = current_mod_path,

fileMenuName = _("vwv_Solon_Turman"),
version		 = "3.0.0",
state		 = "installed",
info		 = _("Solon Turman is a General Cargo Ship built in 1961. In DCS we depict it as militarized version in form of a Destroyer Tender with a helicopter landing pad."),


encyclopedia_path = current_mod_path .. '/Encyclopedia',
})
----------------------------------------------------------------------------------------
---General
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_texture_path  (current_mod_path.."/Textures/SolonTurman.zip")

--Ship
dofile(current_mod_path..'/Database/Navy/Solon_Turman.lua')
plugin_done()
