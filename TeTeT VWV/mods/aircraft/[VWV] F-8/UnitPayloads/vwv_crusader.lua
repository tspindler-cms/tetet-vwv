local unitPayloads = {
	["name"] = "vwv_crusader",
	["payloads"] = {
		[1] = {
			["name"] = "Empty - all stations",
			["pylons"] = {
				[1] = { ["CLSID"] = "", ["num"] = 1 },
				[2] = { ["CLSID"] = "", ["num"] = 2 },
				[3] = { ["CLSID"] = "", ["num"] = 3 },
				[4] = { ["CLSID"] = "", ["num"] = 4 },
				[5] = { ["CLSID"] = "", ["num"] = 5 },
				[6] = { ["CLSID"] = "", ["num"] = 6 },
			},
			["tasks"] = {
				[1] = 15,	-- Nothing
			},
		},
		[2] = {
			["name"] = "CAP - 4 x AIM-9D, 2 x Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "{DFT-300gal_LR}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{F8_AIM-9D}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{F8_AIM-9D}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{F8_AIM-9D}", ["num"] = 4 },
				[5] = { ["CLSID"] = "{F8_AIM-9D}", ["num"] = 5 },
				[6] = { ["CLSID"] = "{DFT-300gal_LR}", ["num"] = 6 },
			},
			["tasks"] = {
				[1] = 11,	-- CAP
				[2] = 19,	-- Fighter Sweep
			},
		},
		[3] = {
			["name"] = "CAS - 2 x LAU-3 HE, 2 x AIM-9B",
			["pylons"] = {
				[1] = { ["CLSID"] = "LAU3_HE151", ["num"] = 1 },
				[2] = { ["CLSID"] = "{AIM-9B}", ["num"] = 2 },
				[5] = { ["CLSID"] = "{AIM-9B}", ["num"] = 5 },
				[6] = { ["CLSID"] = "LAU3_HE151", ["num"] = 6 },
			},
			["tasks"] = {
				[1] = 31,	-- CAS
			},
		},
		[4] = {
			["name"] = "Strike - 2 x Mk-84, 2 x AIM-9B",
			["pylons"] = {
				[1] = { ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{AIM-9B}", ["num"] = 2 },
				[5] = { ["CLSID"] = "{AIM-9B}", ["num"] = 5 },
				[6] = { ["CLSID"] = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}", ["num"] = 6 },
			},
			["tasks"] = {
				[1] = 32,	-- Ground Attack
				[2] = 33,	-- Pinpoint Strike
			},
		},
	},
}
return unitPayloads
