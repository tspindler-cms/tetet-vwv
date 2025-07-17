--dofile("Scripts/Database/Weapons/warheads.lua")
--local GALLON_TO_KG = 3.785 * 0.8

local pylon_mass 	= 0.0
local dragonfly_fuel_tanks_name 	= 'dragonfly_fuel_tanks' --

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = dragonfly_fuel_tanks_name,
        displayName = _("A-37 Fuel Tank"),
        Picture     = "dragonfly_fuel_tanks.png",
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "dragonfly_fuel_tanks",

        Weight_Empty 	= 50 + pylon_mass,
        Weight 			= 50 + 416 + pylon_mass,--daher würde ich hier statt 520 221 nehmen und davon dann 2 unter jeden Flügel, das ist allerdings nicht G91Y sondern G91-R4
        Cx_pil 			= 0.00042, --von 0.00148 zu 0.00115//Sidewinder mit Adapter ist 0.00014. Gegentesten und ggf. anpassen...angepasst auf 0.000151 zu 0.0032
        shape_table_data =
        {
            {
                name = dragonfly_fuel_tanks_name,
                file = "dragonfly_fuel_tanks",
                life = 1,
                fire = { 0, 1},
                username = dragonfly_fuel_tanks_name,
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "dragonfly_fuel_tanks",
            },
        },
    }
)
