declare_plugin("tetet_vwv_main",
{
	dirName		  = current_mod_path,
	displayName   = _("Vietnam War Vessels"),
	shortName	  = "vwv",
	version		  = "0.6.0",
	state		  = "installed",
	fileMenuName  = _("vwv"),
	developerName = "TeTeT",
	info		  = _("Vietnam War Vessels mod"),
	-- encyclopedia_path = current_mod_path .. '/Encyclopedia',

	Skins =
	{
		{
			name  = "Vietnam War Vessels",
			dir   = "Skins/1"
		},
	},

})

plugin_done()
