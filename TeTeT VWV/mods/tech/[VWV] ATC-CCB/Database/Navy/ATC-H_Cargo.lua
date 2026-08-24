-- ATC(C) "Tango" (cargo) --

dofile(current_mod_path.."/Database/Navy/ATC-H_common.lua")

vwv_atc_build_base()
vwv_atc_add_standard_turrets()

GT.numParking = 0

GT.Name             = "ATC_Cargo"
GT.DisplayName      = _("[VWV] ATC(C) Tango")
GT.DisplayNameShort = _("ATC(C) Tango")
