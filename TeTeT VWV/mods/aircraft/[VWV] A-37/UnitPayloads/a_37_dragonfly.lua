local unitPayloads = {
	["name"] = "a_37_dragonfly",
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
				[7] = { ["CLSID"] = "", ["num"] = 7 },
				[8] = { ["CLSID"] = "", ["num"] = 8 },
				[9] = { ["CLSID"] = "", ["num"] = 9 },
			},
			["tasks"] = {
				[1] = 15,	-- Nothing
			},
		},
		[2] = {
			["name"] = "CAP - 2 x AIM-9B, Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "{AIM-9B}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{AIM-9B}", ["num"] = 8 },
				[3] = { ["CLSID"] = "dragonfly_fuel_tanks", ["num"] = 9 },
			},
			["tasks"] = {
				[1] = 11,	-- CAP
			},
		},
		[3] = {
			["name"] = "CAS - 6 x M260 Hydra, 2 x AIM-9B, Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "{AIM-9B}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{M260_HYDRA}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{M260_HYDRA}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{M260_HYDRA}", ["num"] = 4 },
				[5] = { ["CLSID"] = "{M260_HYDRA}", ["num"] = 5 },
				[6] = { ["CLSID"] = "{M260_HYDRA}", ["num"] = 6 },
				[7] = { ["CLSID"] = "{M260_HYDRA}", ["num"] = 7 },
				[8] = { ["CLSID"] = "{AIM-9B}", ["num"] = 8 },
				[9] = { ["CLSID"] = "dragonfly_fuel_tanks", ["num"] = 9 },
			},
			["tasks"] = {
				[1] = 31,	-- CAS
				[2] = 16,	-- AFAC
			},
		},
		[4] = {
			["name"] = "Strike - 8 x Mk-82, Fuel",
			["pylons"] = {
				[1] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 1 },
				[2] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 2 },
				[3] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 3 },
				[4] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 4 },
				[5] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 5 },
				[6] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 6 },
				[7] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 7 },
				[8] = { ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", ["num"] = 8 },
				[9] = { ["CLSID"] = "dragonfly_fuel_tanks", ["num"] = 9 },
			},
			["tasks"] = {
				[1] = 32,	-- Ground Attack
				[2] = 33,	-- Pinpoint Strike
			},
		},
	},
}
return unitPayloads
