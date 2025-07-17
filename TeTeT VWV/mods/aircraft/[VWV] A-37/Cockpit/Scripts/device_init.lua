dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path.."devices.lua")


attributes = {
	"support_for_cws",
}

creators = {}


creators[devices.SYSTEM]	    = {"avLuaDevice",LockOn_Options.script_path.."SYSTEM/init.lua"}
creators[devices.KNEEBOARD]		= {"avLuaDevice",LockOn_Options.script_path.."Kneeboard/declare_kneeboard_device"}
creators[devices.AERO_SURFACES]	= {"avLuaDevice",LockOn_Options.script_path.."Aero_Surfaces/aero_surfaces.lua"}

indicators = {}

indicators[#indicators + 1]	= {"ccKneeboard",LockOn_Options.common_script_path.."KNEEBOARD/indicator/init.lua",devices.KNEEBOARD,{{},{sx_l = -0.65,sz_l =  0.15,sy_l = -0.5,ry_l =  10, rz_l = 85 ,sw = 0.142 * 0.5 - 0.1,sh = 0.214 * 0.5 - 0.1},nil}}