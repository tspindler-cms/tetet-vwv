local unitPayloads = {
	["name"] = "vwv_b-57g",
	["unitType"] = "vwv_b-57g",
	["tasks"] = {
	},
	["payloads"] = {
		[1] = {
			["name"] = "Mk-82*4",
			["pylons"] = {
				[1] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 4 },
			},
			["tasks"] = {
				[1] = 32, -- Ground Attack
				[2] = 31, -- CAS
				[3] = 34, -- Runway Attack
				[4] = 17, -- Reconnaissance
			},
		},
		[2] = {
			["name"] = "GBU-12*4",
			["pylons"] = {
				[1] = { ["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", ["num"] = 4 },
			},
			["tasks"] = {
				[1] = 32,
				[2] = 31,
				[3] = 34,
				[4] = 17,
			},
		},
		[3] = {
			["name"] = "M36*4",
			["pylons"] = {
				[1] = { ["CLSID"] = "{m36}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{m36}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{m36}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{m36}", ["num"] = 4 },
			},
			["tasks"] = {
				[1] = 32,
				[2] = 31,
				[3] = 34,
				[4] = 17,
			},
		},
		[4] = {
			["name"] = "Mk-77 mod 0*4",
			["pylons"] = {
				[1] = { ["CLSID"] = "{mk77mod0}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{mk77mod0}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{mk77mod0}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{mk77mod0}", ["num"] = 4 },
			},
			["tasks"] = {
				[1] = 32,
				[2] = 31,
				[3] = 34,
				[4] = 17,
			},
		},
		-- Last payload that lists Ground Attack. The mission generator keeps the last match for the default task.
		[5] = {
			["name"] = "Night Mission",
			["pylons"] = {
				[1] = { ["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{m36_rack}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{m36_rack}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", ["num"] = 4 },
			},
			["tasks"] = {
				[1] = 32,
				[2] = 31,
				[3] = 34,
				[4] = 17,
			},
		},
	},
}
return unitPayloads
