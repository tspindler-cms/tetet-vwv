local tracer_on_time = 0.02
declare_weapon({
    category = CAT_SHELLS,
    name = "N37_37x155_HEI_T",
    user_name = _("N37_37x155_HEI_T"),
    model_name = "tracer_bullet_crimson",
    v0 = 690,
    Dv0 = 0.0060,
    Da0 = 0.0017,
    Da1 = 0.0,
    mass = 0.722,
    round_mass = 1.250 + 0.115, -- round + link
    cartridge_mass = 0.0, -- 0.413+0.115, cartridges are ejected
    explosive = 0.410,
    life_time = 5.0,
    caliber = 37.0,
    s = 0.0,
    j = 0.0,
    l = 0.0,
    charTime = 0,
    cx = {0.5, 0.80, 0.90, 0.080, 2.15},
    k1 = 5.7e-09,
    tracer_off = 1.5,
    tracer_on = tracer_on_time,
    scale_tracer = 2,
    scale_smoke = 2.0,
    smoke_tail_life_time = 1.0,
    cartridge = 0,
    visual_effect_correction = 3.0
})

declare_weapon({
    category = CAT_SHELLS,
    name = "N37_37x155_API_T",
    user_name = _("N37_37x155_API_T "),
    model_name = "tracer_bullet_crimson",
    v0 = 675,
    Dv0 = 0.0060,
    Da0 = 0.0017,
    Da1 = 0.0,
    mass = 0.765,
    round_mass = 1.294 + 0.115, -- round + link
    cartridge_mass = 0.0, -- 0.413+0.115, cartridges are ejected
    explosive = 0.410,
    life_time = 5.0,
    caliber = 37.0,
    s = 0.0,
    j = 0.0,
    l = 0.0,
    charTime = 0,
    cx = {0.5, 0.80, 0.90, 0.080, 2.15},
    k1 = 5.7e-09,
    tracer_off = 1.5,
    tracer_on = tracer_on_time,
    scale_tracer = 2,
    scale_smoke = 2.0,
    smoke_tail_life_time = 1.0,
    cartridge = 0,
    visual_effect_correction = 3.0
})

declare_weapon({
    category = CAT_SHELLS,
    name = "NR23_23x115_HEI_T",
    user_name = _("NR23_23x115_HEI_T"),
    model_name = "tracer_bullet_crimson",
    v0 = 680,
    Dv0 = 0.0050,
    Da0 = 0.0007,
    Da1 = 0.0,
    mass = 0.196,
    round_mass = 0.340 + 0.071, -- round + link
    cartridge_mass = 0.0, -- 0.111+0.071, cartridges are ejected
    explosive = 0.011,
    life_time = 5.0,
    caliber = 23.0,
    s = 0.0,
    j = 0.0,
    l = 0.0,
    charTime = 0,
    cx = {1.0, 0.74, 0.65, 0.150, 1.78},
    k1 = 2.3e-08,
    tracer_off = 1.5,
    tracer_on = tracer_on_time,
    scale_tracer = 2,
    scale_smoke = 2.0,
    smoke_tail_life_time = 1.0,
    cartridge = 0
})

declare_weapon({
    category = CAT_SHELLS,
    name = "NR23_23x115_API",
    user_name = _("NR23_23x115_API"),
    model_name = "tracer_bullet_crimson",
    v0 = 680,
    Dv0 = 0.0050,
    Da0 = 0.0007,
    Da1 = 0.0,
    mass = 0.199,
    round_mass = 0.340 + 0.071, -- round + link
    cartridge_mass = 0.0, -- 0.111+0.071, cartridges are ejected
    explosive = 0.000,
    life_time = 5.0,
    caliber = 23.0,
    s = 0.0,
    j = 0.0,
    l = 0.0,
    charTime = 0,
    cx = {1.0, 0.74, 0.65, 0.150, 1.78},
    k1 = 2.3e-08,
    tracer_off = -1,
    tracer_on = tracer_on_time,
    scale_tracer = 2,
    scale_smoke = 2.0,
    smoke_tail_life_time = 1.0,
    cartridge = 0
})

function nr23(tbl)

    tbl.category = CAT_GUN_MOUNT
    tbl.name = "NR-23"
    tbl.display_name = "NR-23"
    tbl.supply = {
        shells = {"NR23_23x115_HEI_T", "NR23_23x115_API"},
        mixes = {{1, 2, 2, 1, 2, 2}}, --  
        count = 140 ---80
    }
    if tbl.mixes then
        tbl.supply.mixes = tbl.mixes
        tbl.mixes = nil
    end
    tbl.gun = {
        max_burst_length = 80,
        rates = {850},
        recoil_coeff = 1,
        barrels_count = 1
    }
    if tbl.rates then
        tbl.gun.rates = tbl.rates
        tbl.rates = nil
    end
    tbl.ejector_pos = tbl.ejector_pos or {-0.4, -1.2, 0.18}
    tbl.ejector_dir = tbl.ejector_dir or {0, 2, 0}
    tbl.supply_position = tbl.supply_position or {0, 0.3, -0.3}
    tbl.aft_gun_mount = false
    tbl.effective_fire_distance = 1000
    tbl.drop_cartridge = 204 -- shell_50cal
    tbl.muzzle_pos = {0, 0, 0} -- all position from connector
    tbl.azimuth_initial = tbl.azimuth_initial or 0
    tbl.elevation_initial = tbl.elevation_initial or 0
    if tbl.effects == nil then
        tbl.effects = {
            {name = "FireEffect", arg = tbl.effect_arg_number or 436}, {
                name = "HeatEffectExt",
                shot_heat = 7.823,
                barrel_k = 0.462 * 2.7,
                body_k = 0.462 * 14.3
            }, {name = "SmokeEffect"}
        }
    end
    return declare_weapon(tbl)
end

function n37(tbl)

    tbl.category = CAT_GUN_MOUNT
    tbl.name = "N-37"
    tbl.display_name = "N-37"
    tbl.supply = {
        shells = {"N37_37x155_HEI_T", "N37_37x155_API_T"},
        mixes = {{1, 1, 1, 2}}, --  Calculated by weight (55 kg)
        count = 140 ---40
    }
    if tbl.mixes then
        tbl.supply.mixes = tbl.mixes
        tbl.mixes = nil
    end
    tbl.gun = {
        max_burst_length = 40,
        rates = {400},
        recoil_coeff = 1,
        barrels_count = 1
    }
    if tbl.rates then
        tbl.gun.rates = tbl.rates
        tbl.rates = nil
    end
    tbl.ejector_pos = tbl.ejector_pos or {-0.4, -1.2, 0.18}
    tbl.ejector_dir = tbl.ejector_dir or {0, 3, 0}
    tbl.supply_position = tbl.supply_position or {0, 0.3, -0.3}
    tbl.aft_gun_mount = false
    tbl.effective_fire_distance = 1000
    tbl.drop_cartridge = 203 -- shell_30mm
    tbl.muzzle_pos = {0, 0, 0} -- all position from connector
    tbl.azimuth_initial = tbl.azimuth_initial or 0
    tbl.elevation_initial = tbl.elevation_initial or 0
    if tbl.effects == nil then
        tbl.effects = {
            {name = "FireEffect", arg = tbl.effect_arg_number or 436}, {
                name = "HeatEffectExt",
                shot_heat = 7.823,
                barrel_k = 0.462 * 2.7,
                body_k = 0.462 * 14.3
            }, {name = "SmokeEffect"}
        }
    end
    return declare_weapon(tbl)
end
