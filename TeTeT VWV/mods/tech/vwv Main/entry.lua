declare_plugin("tetet_vwv_main",
{
	dirName		  = current_mod_path,
	displayName   = _("Vietnam War Vessels"),
	shortName	  = "vwv",
	version		  = "0.5.0",
	state		  = "installed",
	fileMenuName  = _("Vietnam War Vessels"),
	developerName = "TeTeT",
	info		  = _("Vietnam War Vessels mod - currently composed of CVA-31 Bon Homme Richard, DD-731 Maddox, P4 Torpedo Boat, PBR MkII, A-1 Skyraider, F-8 Crusader, MiG-17 Fresco and H-2 Seasprite."),
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
