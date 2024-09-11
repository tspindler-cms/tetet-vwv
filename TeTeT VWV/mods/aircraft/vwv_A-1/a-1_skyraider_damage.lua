Damage = {

	[0] =  {critical_damage = 15, args = {296}},  -- pilot area
	[1] =  {critical_damage = 15, args = {297}},  -- copilot area
	[2] =  {critical_damage = 15, args = {146}},  -- nose bottom
	[3] =  {critical_damage = 2, args = {235}},   -- elevator left
	[4] =  {critical_damage = 2, args = {233}},   -- elevator right
	[5] =  {critical_damage = 20, args = {213}},  -- pod left
	[6] =  {critical_damage = 20, args = {223}},  -- pod right
	[7] =  {critical_damage = 5, args = {159}},   -- Vertical stabilizer
	[8] =  {critical_damage = 20, args = {152}},  -- fuselage bottom
	[9] =  {critical_damage = 15, args = {154}},  -- cabin left
	[10] =  {critical_damage = 15, args = {153}}, -- cabin right
	[11] =  {critical_damage = 20, args = {156}}, -- under tail	
	[12] =  {critical_damage = 8, args = {157}}, -- fuselage rear left
	[13] =  {critical_damage = 8, args = {158}}, -- fuselage rear right
	[12] =  {critical_damage = 15, args = {260}},  -- copilot area
	[13] =  {critical_damage = 15, args = {261}},  -- nose bottom
	[14] =  {critical_damage = 2, args = {262}},   -- elevator left
	[15] =  {critical_damage = 2, args = {263}},   -- elevator right
	[16] =  {critical_damage = 20, args = {264}},  -- pod left
	[17] =  {critical_damage = 20, args = {265}},  -- pod right
	[18] =  {critical_damage = 5, args = {266}},   -- Vertical stabilizer

    -- Undercarriage
    ["WHEEL_REAR"] = {
        critical_damage = 2, args = {134}, damage_boundary = 1.0,
        construction = {durability = 0.15, skin = "Rubber", refractory = true},
        innards = {
            {id = "XUCShockC", skin = "Steel", wall = 0.010},
        },
    },
    ["WHEEL_R"] = {
        critical_damage = 3, args = {135}, damage_boundary = 1.0,
        construction = {durability = 0.25, skin = "Rubber", refractory = true},
        innards = {
            {id = "XUCShockRH", skin = "Steel", wall = 0.009},
        },
    },
    ["WHEEL_L"] = {
        critical_damage = 3, args = {136}, damage_boundary = 1.0,
        construction = {durability = 0.25, skin = "Rubber", refractory = true},
        innards = {
            {id = "XUCShockLH", skin = "Steel", wall = 0.009},
        },
    },

}