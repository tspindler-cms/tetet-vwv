local unitPayloads = {
	["name"] = "vwv_mig21mf",
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
			["name"] = "CAP - 2 x R-13M, 2 x R-3S, Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "{R-13M}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{R-3S}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{PTB_490C_MIG21}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{R-3S}", ["num"] = 4 },
				[5] = { ["CLSID"] = "{R-13M}", ["num"] = 5 },
			},
			["tasks"] = {
				[1] = 11,	-- CAP
			},
		},
		[3] = {
			["name"] = "CAS - 2 x UB-16, 2 x UB-32, Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "{UB-16_S5M}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{UB-32_S5M}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{PTB_490C_MIG21}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{UB-32_S5M}", ["num"] = 4 },
				[5] = { ["CLSID"] = "{UB-16_S5M}", ["num"] = 5 },
			},
			["tasks"] = {
				[1] = 31,	-- CAS
			},
		},
		[4] = {
			["name"] = "Strike - 3 x FAB-500, 2 x FAB-250",
			["pylons"] = {
				[1] = { ["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{37DCC01E-9E02-432F-B61D-10C166CA2798}", ["num"] = 4 },
				[5] = { ["CLSID"] = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}", ["num"] = 5 },
			},
			["tasks"] = {
				[1] = 32,	-- Ground Attack
				[2] = 33,	-- Pinpoint Strike
			},
		},
	},
}
return unitPayloads
