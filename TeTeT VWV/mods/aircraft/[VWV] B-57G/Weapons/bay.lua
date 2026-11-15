-- One bay choice fills BAY_1..BAY_6. DistributeOverCarrierDirectly reads those
-- connector names on the aircraft. Loaded after m36.lua so M36 is already declared.

local function bay_elements(shape)
	local elements = {}
	for i = 1, 6 do
		elements[i] = { ShapeName = shape, connector_name = "BAY_" .. i }
	end
	return elements
end

declare_loadout({
	category = CAT_BOMBS,
	CLSID = "{b57g_bay_mk82}",
	attribute = "weapons.bombs.Mk_82",
	displayName = _("6 x Mk-82 - 500lb GP Bomb LD"),
	Picture = "mk82.png",
	Count = 6,
	Cx_pil = 0,
	Cx_item = 0,
	Weight = 6 * 228,
	ejectVelocity = 2,
	DistributeOverCarrierDirectly = true,
	Elements = bay_elements("Mk-82"),
	settings = Get_Fuze_GUISettings_Preset("MDRN_B_A_GPLD"),
})

declare_loadout({
	category = CAT_BOMBS,
	CLSID = "{b57g_bay_gbu12}",
	attribute = "weapons.bombs.GBU_12",
	displayName = _("6 x GBU-12 - 500lb Laser Guided Bomb"),
	Picture = "GBU12.png",
	Count = 6,
	Cx_pil = 0,
	Cx_item = 0,
	Weight = 6 * 277,
	ejectVelocity = 2,
	DistributeOverCarrierDirectly = true,
	Elements = bay_elements("GBU-12"),
	settings = Get_Combined_GUISettings_Preset("Paveway_II"),
})

declare_loadout({
	category = CAT_BOMBS,
	CLSID = "{b57g_bay_m36}",
	attribute = M36.wsTypeOfWeapon,
	displayName = _("6 x M36 - 100lb Incendiary Bomb LD"),
	Picture = "mk82.png",
	Count = 6,
	Cx_pil = 0,
	Cx_item = 0,
	Weight = 6 * M36.mass,
	ejectVelocity = 2,
	DistributeOverCarrierDirectly = true,
	Elements = bay_elements(M36.model),
})
