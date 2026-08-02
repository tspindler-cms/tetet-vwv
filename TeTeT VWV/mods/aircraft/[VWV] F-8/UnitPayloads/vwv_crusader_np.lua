-- F-8E(FN): fuselage stations 2-5 carry AAMs only; wing stations 1 and 6 are clean-only
-- (no air-to-ground stores defined), so the CAS/Strike presets below are effectively gun-only.
local unitPayloads = {
	["name"] = "vwv_crusader_np",
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
			["name"] = "CAP - 4 x R550 Magic 1",
			["pylons"] = {
				[1] = { ["CLSID"] = "{R550_Magic_1}", ["num"] = 2 },
				[2] = { ["CLSID"] = "{R550_Magic_1}", ["num"] = 3 },
				[3] = { ["CLSID"] = "{R550_Magic_1}", ["num"] = 4 },
				[4] = { ["CLSID"] = "{R550_Magic_1}", ["num"] = 5 },
			},
			["tasks"] = {
				[1] = 11,	-- CAP
				[2] = 19,	-- Fighter Sweep
			},
		},
		[3] = {
			["name"] = "CAS - Guns, 2 x AIM-9B",
			["pylons"] = {
				[1] = { ["CLSID"] = "{AIM-9B}", ["num"] = 2 },
				[2] = { ["CLSID"] = "{AIM-9B}", ["num"] = 5 },
			},
			["tasks"] = {
				[1] = 31,	-- CAS
			},
		},
		[4] = {
			["name"] = "Strike - Guns, 2 x AIM-9B",
			["pylons"] = {
				[1] = { ["CLSID"] = "{AIM-9B}", ["num"] = 2 },
				[2] = { ["CLSID"] = "{AIM-9B}", ["num"] = 5 },
			},
			["tasks"] = {
				[1] = 32,	-- Ground Attack
				[2] = 33,	-- Pinpoint Strike
			},
		},
	},
}
return unitPayloads
