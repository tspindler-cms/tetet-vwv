-- ATC(H) "Tango" --

dofile(current_mod_path.."/Database/Navy/ATC-H_common.lua")

vwv_atc_build_base()
vwv_atc_add_standard_turrets()

GT.numParking    = 1
GT.Landing_Point = {6.9, 2.83, 0.0}

GT.Name             = "ATCH"
GT.DisplayName      = _("[VWV] ATC(H) Tango")
GT.DisplayNameShort = _("ATC(H) Tango")
