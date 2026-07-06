local unitPayloads = {
	["name"] = "vwv_mig17f",
	["payloads"] = {
		[1] = {
			["name"] = "Empty - all stations",
			["pylons"] = {
				[1] = { ["CLSID"] = "", ["num"] = 1 },
				[2] = { ["CLSID"] = "", ["num"] = 2 },
			},
			["tasks"] = {
				[1] = 15,	-- Nothing
			},
		},
		[2] = {
			["name"] = "CAP - Guns, 2 x Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "PTB400_MIG15", ["num"] = 1 },
				[2] = { ["CLSID"] = "PTB400_MIG15", ["num"] = 2 },
			},
			["tasks"] = {
				[1] = 11,	-- CAP
			},
		},
		[3] = {
			["name"] = "CAS - 2 x UB-16 S-5M",
			["pylons"] = {
				[1] = { ["CLSID"] = "{UB-16_S5M}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{UB-16_S5M}", ["num"] = 2 },
			},
			["tasks"] = {
				[1] = 31,	-- CAS
				[2] = 16,	-- AFAC
			},
		},
		[4] = {
			["name"] = "Strike - 2 x FAB-250",
			["pylons"] = {
				[1] = { ["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}", ["num"] = 2 },
			},
			["tasks"] = {
				[1] = 32,	-- Ground Attack
				[2] = 33,	-- Pinpoint Strike
			},
		},
	},
}
return unitPayloads
