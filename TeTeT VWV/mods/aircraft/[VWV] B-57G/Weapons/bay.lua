-- One bay choice fills BAY_1..BAY_6. DistributeOverCarrierDirectly reads those
-- connector names on the aircraft. Loaded after m36.lua so M36 is already declared.
-- Mk-77 comes from the A-4E-C mod. Its weapon table is global when that mod loaded first.

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

local mk77_ws = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Fire, WSTYPE_PLACEHOLDER}
local mk77_mass = 340
local mk77_model = "A4E_Mk77mod0"
if mk77mod0 and mk77mod0.wsTypeOfWeapon then
	mk77_ws = mk77mod0.wsTypeOfWeapon
	mk77_mass = mk77mod0.mass
	mk77_model = mk77mod0.model
end

declare_loadout({
	category = CAT_BOMBS,
	CLSID = "{b57g_bay_mk77}",
	attribute = mk77_ws,
	displayName = _("6 x Mk-77 mod 0 - 750lb Fire Bomb LD"),
	Picture = "mk77mod0.png",
	Count = 6,
	Cx_pil = 0,
	Cx_item = 0,
	Weight = 6 * mk77_mass,
	ejectVelocity = 2,
	DistributeOverCarrierDirectly = true,
	Elements = bay_elements(mk77_model),
})
