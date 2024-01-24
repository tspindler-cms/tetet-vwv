self_ID = "tetet_crusader"
declare_plugin(self_ID,
{
image     	 = "FC3.bmp",
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName  = _("crusader"),

fileMenuName = _("crusader"),
update_id        = "crusader",
version		 = "0.3.0",
state		 = "installed",
-- info		 = _("Die Ling-Temco-Vought A-7 Corsair II ist ein einstrahliges Kampfflugzeug aus US-amerikanischer Produktion. Sie basierte auf der F-8 Crusader. Die A-7 war bei der US Navy und US Air Force im Dienst. Spaeter wurde sie von der Air National Guard bis 1998 eingesetzt. Das Modell uebernahmen auch Griechenland, Portugal (Einsatz bis 1999) und Thailand. In Griechenland sind A-7 bis heute bei der 336. Staffel des 116. Kampfgeschwaders in Araxos im Einsatz. Die Ausserdienststellung der A-7E war fuer Ende 2013 geplant, waehrend die TA-7C noch etwas laenger genutzt werden sollen."),

Skins	=
	{
		{
		    name	= _("crusader"),
			dir		= "Skins/1"
		},
	},
Missions =
	{
		{
			name		    = _("crusader"),
			dir			    = "Missions",
  		},
	},
LogBook =
	{
		{
			name		= _("crusader"),
			type		= "crusader",
		},
	
	},	
		
InputProfiles =
	{
		["crusader"] = current_mod_path .. '/Input/crusader',
		["crusader_np"] = current_mod_path .. '/Input/crusader_np',
	},
})
----------------------------------------------------------------------------------------
mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/crusader")

-------------------------------------------------------------------------------------

dofile(current_mod_path.."/Weapons/F8_AIM-9C.lua")
dofile(current_mod_path.."/Weapons/F8_AIM-9D.lua")
dofile(current_mod_path.."/Views.lua")
make_view_settings('crusader', ViewSettings, SnapViews)
make_flyable('crusader'	, current_mod_path..'/Cockpit/A10A/', {nil, old = true}, current_mod_path..'/comm.lua/')
make_view_settings('crusader_np', ViewSettings, SnapViews)
make_flyable('crusader_np'	, current_mod_path..'/Cockpit/A10A/', {nil,old = true}, current_mod_path..'/comm.lua/')
-------------------------------------------------------------------------------------

dofile(current_mod_path..'/crusader.lua')
dofile(current_mod_path..'/crusader_np.lua')
-------------------------------------------------------------------------------------
plugin_done()
