-- M36 incendiary, the individual bomb (AN-M47A2 size: 48.9 in, 8.1 in diameter, about 70 lb ready).
-- The body falls like the AN-M81 bomb-common donor, so it does not sail like A-4 napalm.
-- char_time 20.60 released late: from 6000 ft the bursts landed about 190 m short.
-- 23.0 from 3000 ft AGL put the bursts 325 m past the column.
-- 21.0 from the same pass lands on the column and kills the trucks.
-- Bomblets use the BLU cluster burst (small impulse, effect_count = count) so each one detonates
-- on the impact instead of being thrown downrange.

local POUNDS_TO_KG = 0.45359237
local INCH_TO_METER = 0.0254

local M36_MASS = 70.0 * POUNDS_TO_KG
local M36_LENGTH = 48.9 * INCH_TO_METER
local M36_CALIBER = 8.1 * INCH_TO_METER
local M36_I = (1 / 12) * M36_MASS * M36_LENGTH * M36_LENGTH
local M36_BOMBLETS = 8

M36_CLUSTER =
{
	category = CAT_CLUSTER_DESC,
	char_time = 0,
	scheme = {
		cluster = {
			mass            = M36_MASS / M36_BOMBLETS,
			caliber         = 0.07,
			cx_coeff        = {1.000000, 0.390000, 0.380000, 0.236000, 1.310000},
			cx_factor       = 100,
			L               = 0.12,
			I               = 0.004,
			Ma              = 2.746331,
			Mw              = 2.146083,
			wind_sigma      = 20,
			count           = M36_BOMBLETS,
			effect_count    = M36_BOMBLETS,
			impulse_sigma   = 2,
			model_name      = "A4E_VOID",
			moment_sigma    = 0.0001,
		},
		warhead = {
			mass = 2.5,
			expl_mass = 2.5,
			other_factors = {1.0, 1.0, 1.0},
			obj_factors = {1, 1},
			concrete_factors = {1.0, 1.0, 1.0},
			cumulative_factor = 1,
			concrete_obj_factor = 1.0,
			cumulative_thickness = 1.0,
			piercing_mass = 1.0,
			caliber = 7,
		},
	},
	display_name = "M36_CLUSTER",
	mass = 0,
	model = "",
	name = "M36_CLUSTER",
	cluster_scheme = "cluster",
	type_name = "cluster",
	wsTypeOfWeapon = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Fire, WSTYPE_PLACEHOLDER},
}

declare_weapon(M36_CLUSTER)

M36 =
{
	category          = CAT_BOMBS,
	name              = "m36-WPN",
	model             = "m36_bomb",
	user_name         = _("M36"),
	displayName       = _("M36 - 100lb Incendiary Bomb LD"),
	wsTypeOfWeapon    = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Fire, WSTYPE_PLACEHOLDER},
	scheme            = "bomb-cassette-2",
	class_name        = "wAmmunition",
	type              = 0,
	mass              = M36_MASS,
	hMin              = 10.0,
	hMax              = 12000.0,
	Cx                = 0.000124,
	VyHold            = -100.0,
	Ag                = -1.23,
	fm = {
		mass            = M36_MASS,
		caliber         = M36_CALIBER,
		cx_coeff        = {1.000000, 0.390000, 0.380000, 0.236000, 1.310000},
		cx_factor       = 100,
		L               = M36_LENGTH,
		I               = M36_I,
		Ma              = 2.746331,
		Mw              = 2.146083,
		wind_time       = 1000.0,
		wind_sigma      = 50,
	},
	control =
	{
		check_obj_delay = 0.0,
		default_delay = 0.0,
		default_open_height = 100,
	},
	warhead = simple_warhead(18),
	launcher =
	{
		blocks  = {"cluster"},
		cluster = M36_CLUSTER.descriptor
	},
	shape_table_data =
	{
		{
			name     = "m36-WPN",
			file     = "m36_bomb",
			life     = 1,
			fire     = {0, 1},
			username = "M36",
			index    = WSTYPE_PLACEHOLDER,
		},
	},
	-- The cassette AI releases from this table. char_time alone made it overfly and circle.
	-- 20.60 is the bomb-common value that did release; the table is the Mk-77 solution.
	targeting_data =
	{
		char_time = 21.0,
		v0 = 200,
		data =
		{
			{1.000000, 21.147949, 0.002807},
			{10.000000, 28.262668, -0.017193},
			{20.000000, 29.687629, -0.016767},
			{30.000000, 30.394407, -0.015892},
			{40.000000, 30.826322, -0.015080},
			{50.000000, 31.133114, -0.014428},
			{60.000000, 31.361560, -0.013889},
			{70.000000, 31.543970, -0.013440},
			{80.000000, 31.690640, -0.013045},
			{90.000000, 31.814418, -0.012713},
			{100.000000, 31.920050, -0.012425},
			{200.000000, 32.511629, -0.010723},
			{300.000000, 32.789778, -0.009863},
			{400.000000, 32.963413, -0.009307},
			{500.000000, 33.086372, -0.008907},
			{600.000000, 33.179450, -0.008596},
			{700.000000, 33.253103, -0.008346},
			{800.000000, 33.312920, -0.008139},
			{900.000000, 33.362577, -0.007968},
			{1000.000000, 33.404350, -0.007824},
			{1100.000000, 33.439925, -0.007702},
			{1200.000000, 33.470498, -0.007599},
			{1300.000000, 33.496988, -0.007513},
			{1400.000000, 33.520106, -0.007440},
			{1500.000000, 33.540403, -0.007378},
			{1600.000000, 33.558365, -0.007327},
			{1700.000000, 33.574326, -0.007285},
			{1800.000000, 33.588629, -0.007251},
			{1900.000000, 33.601489, -0.007224},
			{2000.000000, 33.613137, -0.007202},
			{3000.000000, 33.690673, -0.007191},
			{4000.000000, 33.737805, -0.007357},
			{5000.000000, 33.773738, -0.007590},
			{6000.000000, 33.802367, -0.007864},
			{7000.000000, 33.824277, -0.008170},
			{8000.000000, 33.839206, -0.008505},
			{9000.000000, 33.846586, -0.008868},
			{10000.000000, 33.845625, -0.009258},
		},
	},
}

declare_weapon(M36)

declare_loadout({
	category    = CAT_BOMBS,
	CLSID       = "{m36}",
	attribute   = M36.wsTypeOfWeapon,
	Count       = 1,
	Cx_pil      = M36.Cx,
	Picture     = "mk82.png",
	displayName = M36.displayName,
	Weight      = M36.mass,
	Elements    =
	{
		{
			Position  = {0, 0, 0},
			ShapeName = M36.model,
		}
	},
})

-- Twin saddle. The shape origin is the top eye; Point01 is the left bomb and Point02 the right.
-- Empty-rack mass is a sheet-steel estimate of the saddle, not a weighed figure.
-- Cx stays above 2 * M36.Cx so a release does not leave the station with negative drag.
local M36_RACK_MASS = 20.0

declare_loadout({
	category       = CAT_BOMBS,
	CLSID          = "{m36_rack}",
	attribute      = {wsType_Weapon, wsType_Bomb, wsType_Container, WSTYPE_PLACEHOLDER},
	wsTypeOfWeapon = M36.wsTypeOfWeapon,
	Count          = 2,
	Cx_pil         = 2 * M36.Cx + 0.00008,
	Picture        = "mk82.png",
	displayName    = _("2 x M36 - 100lb Incendiary Bomb LD"),
	Weight         = M36_RACK_MASS + 2 * M36.mass,
	Elements       =
	{
		{
			Position  = {0, 0, 0},
			ShapeName = "m36_rack",
			IsAdapter = true,
		},
		{
			ShapeName      = M36.model,
			connector_name = "Point01",
		},
		{
			ShapeName      = M36.model,
			connector_name = "Point02",
		},
	},
})
