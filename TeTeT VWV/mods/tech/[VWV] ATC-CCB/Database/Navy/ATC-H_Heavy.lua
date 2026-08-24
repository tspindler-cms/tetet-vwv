-- ATC(H) "Tango Heavy" --

dofile(current_mod_path.."/Database/Navy/ATC-H_common.lua")

vwv_atc_build_base()
vwv_atc_add_standard_turrets()

-- Deck machine guns: 2x M2 aft, 4x M240C
vwv_atc_add_mg({
	center = "MG_starboard_aft_empty", connector_name = "MG_starboard_aft_muzzle",
	template = GT_t.LN_t.machinegun_12_7_M2,
	angles = {{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)}},
	reference_angle_Y = math.rad(-90), reference_angle_Z = math.rad(20),
	drawArgument1 = 27, drawArgument2 = 28,
})
vwv_atc_add_mg({
	center = "MG_port_aft_empty", connector_name = "MG_port_aft_muzzle",
	template = GT_t.LN_t.machinegun_12_7_M2,
	angles = {{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)}},
	reference_angle_Y = math.rad(90), reference_angle_Z = math.rad(20),
	drawArgument1 = 21, drawArgument2 = 22,
})
vwv_atc_add_mg({
	center = "MG_starboard_mid_empty", connector_name = "MG_starboard_mid_muzzle",
	template = GT_t.LN_t.machinegun_M240C, type = 10,
	angles = {{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)}},
	reference_angle_Y = math.rad(-90), reference_angle_Z = math.rad(20),
	drawArgument1 = 29, drawArgument2 = 30,
})
vwv_atc_add_mg({
	center = "MG_starboard_fore_empty", connector_name = "MG_starboard_fore_muzzle",
	template = GT_t.LN_t.machinegun_M240C, type = 10,
	angles = {{math.rad(-35), math.rad(-145), math.rad(-9), math.rad(45)}},
	reference_angle_Y = math.rad(-90), reference_angle_Z = math.rad(20),
	drawArgument1 = 31, drawArgument2 = 32,
})
vwv_atc_add_mg({
	center = "MG_port_mid_empty", connector_name = "MG_port_mid_muzzle",
	template = GT_t.LN_t.machinegun_M240C, type = 10,
	angles = {{math.rad(145), math.rad(35), math.rad(-9), math.rad(45)}},
	reference_angle_Y = math.rad(90), reference_angle_Z = math.rad(20),
	drawArgument1 = 23, drawArgument2 = 24,
})
vwv_atc_add_mg({
	center = "MG_port_fore_empty", connector_name = "MG_port_fore_muzzle",
	template = GT_t.LN_t.machinegun_M240C, type = 10,
	angles = {{math.rad(145), math.rad(35), math.rad(-5), math.rad(45)}},
	reference_angle_Y = math.rad(90), reference_angle_Z = math.rad(20),
	drawArgument1 = 25, drawArgument2 = 26,
})

GT.Landing_Point = {6.9, 2.83, 0.0}

GT.Name             = "ATCH_Heavy"
GT.DisplayName      = _("[VWV] ATC(H) Tango Heavy")
GT.DisplayNameShort = _("ATC(H) Tango Heavy")

-- add_surface_unit(GT)
