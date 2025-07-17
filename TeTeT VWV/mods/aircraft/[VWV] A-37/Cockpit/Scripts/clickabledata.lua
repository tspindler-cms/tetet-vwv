dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."config.lua")
dofile(LockOn_Options.script_path.."sounds.lua")

local gettext = require("i_18n")
_ = gettext.translate

cursor_mode = 
{ 
    CUMODE_CLICKABLE = 0,
    CUMODE_CLICKABLE_AND_CAMERA  = 1,
    CUMODE_CAMERA = 2,
};

clickable_mode_initial_status  = cursor_mode.CUMODE_CLICKABLE
use_pointer_name			   = true

function default_button(hint_,device_,command_,arg_,arg_val_,arg_lim_)

	local   arg_val_ = arg_val_ or 1
	local   arg_lim_ = arg_lim_ or {0,1}

	return  {	
				class 				= {class_type.BTN},
				hint  				= hint_,
				device 				= device_,
				action 				= {command_},
				stop_action 		= {command_},
				arg 				= {arg_},
				arg_value			= {arg_val_}, 
				arg_lim 			= {arg_lim_},
				use_release_message = {true}
			}
end

function default_2_position_tumb(hint_, device_, command_, arg_)
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {1,-1}, 
				arg_lim   	= {{0,1},{0,1}},
				updatable 	= true, 
				use_OBB 	= true
			}
end

function default_3_position_tumb(hint_,device_,command_,arg_,cycled_,inversed_)
	local cycled = true
	
	
	local val =  1
	if inversed_ then
	      val = -1
	end
	if cycled_ ~= nil then
	   cycled = cycled_
	end
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {val,-val}, 
				arg_lim   	= {{-1,1},{-1,1}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle       = cycled
			}
end

function default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_, cycled_)
	
	local relative = false
	if relative_ ~= nil then
		relative = relative_
	end

	local gain = gain_ or 0.1
	local cycled = cycled_ or false
	
	local default = default_ or 1
	return  {	
				class 		= {class_type.LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {default}, 
				arg_lim   	= {{0,1}},
				updatable 	= {updatable_}, 
				use_OBB 	= true,
				gain		= {gain},
				relative    = {relative},  
				cycle		= cycled
			}
end

function default_axis_limited(hint_,device_,command_,arg_,gain_,updatable_,relative_, _arg_lim, cycled_)
	
	local relative = false
	if relative_ ~= nil then
		relative = relative_
	end
	
	local cycled = cycled_ or false

	local gain = gain_ or 0.1
	return  {	
				class 		= {class_type.LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {1}, 
				arg_lim   	= {_arg_lim},
				updatable 	= {updatable_}, 
				use_OBB 	= false,
				gain		= {gain},
				relative    = {relative},  
				cycle		= cycled
			}
end


function multiposition_switch(hint_,device_,command_,arg_,count_,delta_,min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-delta_,delta_}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				updatable 	= true, 
				use_OBB 	= true
			}
end

function multiposition_switch_intercom(hint_,device_,command_,arg_,count_,delta_,min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {delta_,-delta_}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				animated        = {true,true},
			    animation_speed = {1.5, 1.5},
				cycle       = false,
				updatable 	= true, 
				use_OBB 	= true
			}
end

function multiposition_switch_limited(hint_,device_,command_,arg_,count_,delta_,min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-delta_,delta_}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle     	= false, 
			}
end

function intercom_rotate_tumb(hint_, device_,command_1, command_2, arg_1, arg_2)
return {
			class		=	{class_type.TUMB, class_type.TUMB, class_type.LEV},
			hint		=	hint_,
			device		=	device_,
			action		=	{command_1, command_1, command_2},
			arg			=	{arg_1, arg_1, arg_2},
			arg_value	= 	{1, -1, 1},
			arg_lim		= 	{{0, 1}, {0, 1}, {0,1}},
			--animated        = {false,false,false},
			--animation_speed = {0, 0, 0.5},
			relative	= 	{false, false, false},
			updatable 	= 	false, 
			use_OBB 	= 	false,
			gain 		=   {1.0, 1.0, 0.1},
			cycle 		=   false,
	}
end

function default_button_axis(hint_, device_,command_1, command_2, arg_1, arg_2)
return {
			class		=	{class_type.BTN, class_type.LEV},
			hint		=	hint_,
			device		=	device_,
			action		=	{command_1, command_2},
			stop_action =   {command_1, 0},
			arg			=	{arg_1, arg_2},
			arg_value	= 	{1, 0.5},
			arg_lim		= 	{{0, 1}, {0,1}},
			animated        = {false,false},
			animation_speed = {0, 0.4},
			gain = {0, 0.1},
			relative	= 	{false, false},
			updatable 	= 	true, 
			use_OBB 	= 	true,
			use_release_message = {true, false},
			cycle = false
	}
end

function electrically_held_switch(hint_, device_, command_on_, command_off_, arg_)
	return {class 		        = {class_type.BTN},
	        hint  		        = hint_,
	        device 		        = device_,
	        action 		        = {command_on_},
			stop_action         = {command_off_},
	        arg 	  	        = {arg_},
	        arg_value 	        = {1, -1}, 
	        arg_lim   	        = {{0, 1}},
	        updatable 	        = true,
	        use_release_message = {true}
	       }
end

-- A-10C
elements = {}

---------------------------------------------

MFCD_ADJ_Increase 	= device_commands.Button_21
MFCD_ADJ_Decrease 	= device_commands.Button_22
MFCD_ADJ_Stop 		= device_commands.Button_23

MFCD_DSP_Increase 	= device_commands.Button_24
MFCD_DSP_Decrease 	= device_commands.Button_25
MFCD_DSP_Stop 		= device_commands.Button_26

MFCD_BRT_Increase	= device_commands.Button_27
MFCD_BRT_Decrease 	= device_commands.Button_28
MFCD_BRT_Stop 		= device_commands.Button_29

MFCD_CON_Increase 	= device_commands.Button_30
MFCD_CON_Decrease 	= device_commands.Button_31
MFCD_CON_Stop 		= device_commands.Button_32

MFCD_SYM_Up			= device_commands.Button_33
MFCD_SYM_Dn			= device_commands.Button_34
MFCD_SYM_Stop		= device_commands.Button_35


-- Left MFCDI
elements["PNT-BTN-MFD-L-01"]		= {class = {class_type.BTN}, hint = _("OSB 1"), device = devices.MFCD_LEFT, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {300}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-02"]		= {class = {class_type.BTN}, hint = _("OSB 2"), device = devices.MFCD_LEFT, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {301}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-03"]		= {class = {class_type.BTN}, hint = _("OSB 3"), device = devices.MFCD_LEFT, action = {device_commands.Button_3}, stop_action = {device_commands.Button_3}, arg = {302}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-04"]		= {class = {class_type.BTN}, hint = _("OSB 4"), device = devices.MFCD_LEFT, action = {device_commands.Button_4}, stop_action = {device_commands.Button_4}, arg = {303}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-05"]		= {class = {class_type.BTN}, hint = _("OSB 5"), device = devices.MFCD_LEFT, action = {device_commands.Button_5}, stop_action = {device_commands.Button_5}, arg = {304}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-06"]		= {class = {class_type.BTN}, hint = _("OSB 6"), device = devices.MFCD_LEFT, action = {device_commands.Button_6}, stop_action = {device_commands.Button_6}, arg = {305}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-07"]		= {class = {class_type.BTN}, hint = _("OSB 7"), device = devices.MFCD_LEFT, action = {device_commands.Button_7}, stop_action = {device_commands.Button_7}, arg = {306}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-08"]		= {class = {class_type.BTN}, hint = _("OSB 8"), device = devices.MFCD_LEFT, action = {device_commands.Button_8}, stop_action = {device_commands.Button_8}, arg = {307}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-09"]		= {class = {class_type.BTN}, hint = _("OSB 9"), device = devices.MFCD_LEFT, action = {device_commands.Button_9}, stop_action = {device_commands.Button_9}, arg = {308}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-10"]		= {class = {class_type.BTN}, hint = _("OSB 10"), device = devices.MFCD_LEFT, action = {device_commands.Button_10}, stop_action = {device_commands.Button_10}, arg = {309}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-11"]		= {class = {class_type.BTN}, hint = _("OSB 11"), device = devices.MFCD_LEFT, action = {device_commands.Button_11}, stop_action = {device_commands.Button_11}, arg = {310}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-12"]		= {class = {class_type.BTN}, hint = _("OSB 12"), device = devices.MFCD_LEFT, action = {device_commands.Button_12}, stop_action = {device_commands.Button_12}, arg = {311}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-13"]		= {class = {class_type.BTN}, hint = _("OSB 13"), device = devices.MFCD_LEFT, action = {device_commands.Button_13}, stop_action = {device_commands.Button_13}, arg = {312}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-14"]		= {class = {class_type.BTN}, hint = _("OSB 14"), device = devices.MFCD_LEFT, action = {device_commands.Button_14}, stop_action = {device_commands.Button_14}, arg = {313}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-15"]		= {class = {class_type.BTN}, hint = _("OSB 15"), device = devices.MFCD_LEFT, action = {device_commands.Button_15}, stop_action = {device_commands.Button_15}, arg = {314}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-16"]		= {class = {class_type.BTN}, hint = _("OSB 16"), device = devices.MFCD_LEFT, action = {device_commands.Button_16}, stop_action = {device_commands.Button_16}, arg = {315}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-17"]		= {class = {class_type.BTN}, hint = _("OSB 17"), device = devices.MFCD_LEFT, action = {device_commands.Button_17}, stop_action = {device_commands.Button_17}, arg = {316}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-18"]		= {class = {class_type.BTN}, hint = _("OSB 18"), device = devices.MFCD_LEFT, action = {device_commands.Button_18}, stop_action = {device_commands.Button_18}, arg = {317}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-19"]		= {class = {class_type.BTN}, hint = _("OSB 19"), device = devices.MFCD_LEFT, action = {device_commands.Button_19}, stop_action = {device_commands.Button_19}, arg = {318}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-L-20"]		= {class = {class_type.BTN}, hint = _("OSB 20"), device = devices.MFCD_LEFT, action = {device_commands.Button_20}, stop_action = {device_commands.Button_20}, arg = {319}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFCD-L-ADJ-UP"]		= {class = {class_type.BTN}, hint = _("Moving Map Scale Adjust Increase"), device = devices.MFCD_LEFT, action = {MFCD_ADJ_Increase}, stop_action = {MFCD_ADJ_Stop}, arg = {320}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFCD-L-ADJ-DN"]		= {class = {class_type.BTN}, hint = _("Moving Map Scale Adjust Decrease"), device = devices.MFCD_LEFT, action = {MFCD_ADJ_Decrease}, stop_action = {MFCD_ADJ_Stop}, arg = {320}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFCD-L-DSP-UP"]		= {class = {class_type.BTN}, hint = _("Increase Backlight Brightness"), device = devices.MFCD_LEFT, action = {MFCD_DSP_Increase}, stop_action = {MFCD_DSP_Stop}, arg = {321}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFCD-L-DSP-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Backlight Brightness"), device = devices.MFCD_LEFT, action = {MFCD_DSP_Decrease}, stop_action = {MFCD_DSP_Stop}, arg = {321}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFD-L-BRT-UP"]		= {class = {class_type.BTN}, hint = _("Increase Brightness"), device = devices.MFCD_LEFT, action = {MFCD_BRT_Increase}, stop_action = {MFCD_BRT_Stop}, arg = {322}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFD-L-BRT-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Brightness"), device = devices.MFCD_LEFT, action = {MFCD_BRT_Decrease}, stop_action = {MFCD_BRT_Stop}, arg = {322}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFD-L-CON-UP"]		= {class = {class_type.BTN}, hint = _("Increase Contrast"), device = devices.MFCD_LEFT, action = {MFCD_CON_Increase}, stop_action = {MFCD_CON_Stop}, arg = {323}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFD-L-CON-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Contrast"), device = devices.MFCD_LEFT, action = {MFCD_CON_Decrease}, stop_action = {MFCD_CON_Stop}, arg = {323}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFD-L-SYM-UP"]		= {class = {class_type.BTN}, hint = _("Increase Symbol Levels"), device = devices.MFCD_LEFT, action = {MFCD_SYM_Up}, stop_action = {MFCD_SYM_Stop}, arg = {324}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFD-L-SYM-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Symbol Levels"), device = devices.MFCD_LEFT, action = {MFCD_SYM_Dn}, stop_action = {MFCD_SYM_Stop}, arg = {324}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-LVR-MFD-L"]			= {class = {class_type.TUMB, class_type.TUMB}, hint  = _("DAY/NIGHT/OFF"), device = devices.MFCD_LEFT, action = {device_commands.Button_36, device_commands.Button_36}, arg = {325, 325}, arg_value = {0.1, -0.1}, arg_lim = {{0.0, 0.2}, {0.0, 0.2}}}

---------------------------------------------
-- Right MFCDI
elements["PNT-BTN-MFD-R-01"]		= {class = {class_type.BTN}, hint = _("OSB 1"), device = devices.MFCD_RIGHT, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {326}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-02"]		= {class = {class_type.BTN}, hint = _("OSB 2"), device = devices.MFCD_RIGHT, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {327}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-03"]		= {class = {class_type.BTN}, hint = _("OSB 3"), device = devices.MFCD_RIGHT, action = {device_commands.Button_3}, stop_action = {device_commands.Button_3}, arg = {328}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-04"]		= {class = {class_type.BTN}, hint = _("OSB 4"), device = devices.MFCD_RIGHT, action = {device_commands.Button_4}, stop_action = {device_commands.Button_4}, arg = {329}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-05"]		= {class = {class_type.BTN}, hint = _("OSB 5"), device = devices.MFCD_RIGHT, action = {device_commands.Button_5}, stop_action = {device_commands.Button_5}, arg = {330}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-06"]		= {class = {class_type.BTN}, hint = _("OSB 6"), device = devices.MFCD_RIGHT, action = {device_commands.Button_6}, stop_action = {device_commands.Button_6}, arg = {331}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-07"]		= {class = {class_type.BTN}, hint = _("OSB 7"), device = devices.MFCD_RIGHT, action = {device_commands.Button_7}, stop_action = {device_commands.Button_7}, arg = {332}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-08"]		= {class = {class_type.BTN}, hint = _("OSB 8"), device = devices.MFCD_RIGHT, action = {device_commands.Button_8}, stop_action = {device_commands.Button_8}, arg = {333}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-09"]		= {class = {class_type.BTN}, hint = _("OSB 9"), device = devices.MFCD_RIGHT, action = {device_commands.Button_9}, stop_action = {device_commands.Button_9}, arg = {334}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-10"]		= {class = {class_type.BTN}, hint = _("OSB 10"), device = devices.MFCD_RIGHT, action = {device_commands.Button_10}, stop_action = {device_commands.Button_10}, arg = {335}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-11"]		= {class = {class_type.BTN}, hint = _("OSB 11"), device = devices.MFCD_RIGHT, action = {device_commands.Button_11}, stop_action = {device_commands.Button_11}, arg = {336}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-12"]		= {class = {class_type.BTN}, hint = _("OSB 12"), device = devices.MFCD_RIGHT, action = {device_commands.Button_12}, stop_action = {device_commands.Button_12}, arg = {337}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-13"]		= {class = {class_type.BTN}, hint = _("OSB 13"), device = devices.MFCD_RIGHT, action = {device_commands.Button_13}, stop_action = {device_commands.Button_13}, arg = {338}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-14"]		= {class = {class_type.BTN}, hint = _("OSB 14"), device = devices.MFCD_RIGHT, action = {device_commands.Button_14}, stop_action = {device_commands.Button_14}, arg = {339}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-15"]		= {class = {class_type.BTN}, hint = _("OSB 15"), device = devices.MFCD_RIGHT, action = {device_commands.Button_15}, stop_action = {device_commands.Button_15}, arg = {340}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-16"]		= {class = {class_type.BTN}, hint = _("OSB 16"), device = devices.MFCD_RIGHT, action = {device_commands.Button_16}, stop_action = {device_commands.Button_16}, arg = {341}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-17"]		= {class = {class_type.BTN}, hint = _("OSB 17"), device = devices.MFCD_RIGHT, action = {device_commands.Button_17}, stop_action = {device_commands.Button_17}, arg = {342}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-18"]		= {class = {class_type.BTN}, hint = _("OSB 18"), device = devices.MFCD_RIGHT, action = {device_commands.Button_18}, stop_action = {device_commands.Button_18}, arg = {343}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-19"]		= {class = {class_type.BTN}, hint = _("OSB 19"), device = devices.MFCD_RIGHT, action = {device_commands.Button_19}, stop_action = {device_commands.Button_19}, arg = {344}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-MFD-R-20"]		= {class = {class_type.BTN}, hint = _("OSB 20"), device = devices.MFCD_RIGHT, action = {device_commands.Button_20}, stop_action = {device_commands.Button_20}, arg = {345}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFCD-R-ADJ-UP"]		= {class = {class_type.BTN}, hint = _("Moving Map Scale Adjust Increase"), device = devices.MFCD_RIGHT, action = {MFCD_ADJ_Increase}, stop_action = {MFCD_ADJ_Stop}, arg = {346}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFCD-R-ADJ-DN"]		= {class = {class_type.BTN}, hint = _("Moving Map Scale Adjust Decrease"), device = devices.MFCD_RIGHT, action = {MFCD_ADJ_Decrease}, stop_action = {MFCD_ADJ_Stop}, arg = {346}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFCD-R-DSP-UP"]		= {class = {class_type.BTN}, hint = _("Increase Backlight Brightness"), device = devices.MFCD_RIGHT, action = {MFCD_DSP_Increase}, stop_action = {MFCD_DSP_Stop}, arg = {347}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFCD-R-DSP-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Backlight Brightness"), device = devices.MFCD_RIGHT, action = {MFCD_DSP_Decrease}, stop_action = {MFCD_DSP_Stop}, arg = {347}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFD-R-BRT-UP"]		= {class = {class_type.BTN}, hint = _("Increase Brightness"), device = devices.MFCD_RIGHT, action = {MFCD_BRT_Increase}, stop_action = {MFCD_BRT_Stop}, arg = {348}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFD-R-BRT-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Brightness"), device = devices.MFCD_RIGHT, action = {MFCD_BRT_Decrease}, stop_action = {MFCD_BRT_Stop}, arg = {348}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFD-R-CON-UP"]		= {class = {class_type.BTN}, hint = _("Increase Contrast"), device = devices.MFCD_RIGHT, action = {MFCD_CON_Increase}, stop_action = {MFCD_CON_Stop}, arg = {349}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFD-R-CON-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Contrast"), device = devices.MFCD_RIGHT, action = {MFCD_CON_Decrease}, stop_action = {MFCD_CON_Stop}, arg = {349}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-MFD-R-SYM-UP"]		= {class = {class_type.BTN}, hint = _("Increase Symbol Levels"), device = devices.MFCD_RIGHT, action = {MFCD_SYM_Up}, stop_action = {MFCD_SYM_Stop}, arg = {350}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-MFD-R-SYM-DN"]		= {class = {class_type.BTN}, hint = _("Decrease Symbol Levels"), device = devices.MFCD_RIGHT, action = {MFCD_SYM_Dn}, stop_action = {MFCD_SYM_Stop}, arg = {350}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-LVR-MFD-R"]			= {class = {class_type.TUMB, class_type.TUMB}, hint  = _("DAY/NIGHT/OFF"), device = devices.MFCD_RIGHT, action = {device_commands.Button_36, device_commands.Button_36}, arg = {351, 351}, arg_value = {0.1, -0.1}, arg_lim = {{0.0, 0.2}, {0.0, 0.2}}}

---------------------------------------------
-- CMSP
elements["PNT-BTN-CMSP-ARW1"]			= {class = {class_type.BTN}, hint = _("Edit Program Value"), device = devices.CMSP, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {352}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CMSP-ARW2"]			= {class = {class_type.BTN}, hint = _("Edit Program Value"), device = devices.CMSP, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {353}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CMSP-ARW3"]			= {class = {class_type.BTN}, hint = _("Edit Program Value"), device = devices.CMSP, action = {device_commands.Button_3}, stop_action = {device_commands.Button_3}, arg = {354}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CMSP-ARW4"]			= {class = {class_type.BTN}, hint = _("Edit Program Value"), device = devices.CMSP, action = {device_commands.Button_4}, stop_action = {device_commands.Button_4}, arg = {355}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CMSP-BRT-UP"]			= {class = {class_type.BTN}, hint = _("Cycle Program or Value Up"), device = devices.CMSP, action = {device_commands.Button_5}, stop_action = {device_commands.Button_5}, arg = {356}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CMSP-BRT-DN"]			= {class = {class_type.BTN}, hint = _("Cycle Program or Value Down"), device = devices.CMSP, action = {device_commands.Button_6}, stop_action = {device_commands.Button_6}, arg = {356}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {false} }
elements["PNT-BTN-CMSP-RTN"]			= {class = {class_type.BTN}, hint = _("Save and Return Program"), device = devices.CMSP, action = {device_commands.Button_7}, stop_action = {device_commands.Button_7}, arg = {357}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-TMB-CMSP-JTSN"]			= {class = {class_type.TUMB}, hint  = _("Jettison Countermeasures"), device = devices.CMSP, action = {device_commands.Button_8}, arg = {358}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}}
elements["PNT-LEV-CMSP-BRT"]			= default_axis_limited(_("Adjust Display Brightness"), devices.CMSP, device_commands.Button_9, 359, 0.1, false, false, {0.15, 0.85})


elements["PNT-TMB-CMSP-MWS"]  			= {class = {class_type.TUMB, class_type.BTN}, hint = _("Missile Warning System (MWS). Left mouse - ON/OFF, Right mouse - MENU (No Function)"), 											device = devices.CMSP,action = {device_commands.Button_10, device_commands.Button_11},  stop_action = {0, device_commands.Button_11}, arg = {360, 360}, stop_value = {nil,0.1},arg_value = {0.1, 0.2}, arg_lim = {{0, 0.1}, {0.1, 0.2}}, use_release_message = {false, false}}
elements["PNT-TMB-CMSP-JMR"]  			= {class = {class_type.TUMB, class_type.BTN}, hint = _("Electronic Countermeasure Jammer (JMR). Left mouse - ON/OFF, Right mouse - MENU (No Function)"), device = devices.CMSP,action = {device_commands.Button_12, device_commands.Button_13},  stop_action = {0, device_commands.Button_13}, arg = {361, 361}, stop_value = {nil,0.1},arg_value = {0.1, 0.2}, arg_lim = {{0, 0.1}, {0.1, 0.2}}, use_release_message = {false, false}}
elements["PNT-TMB-CMSP-RWR"]  			= {class = {class_type.TUMB, class_type.BTN}, hint = _("Radar Warning Receiver (RWR). Left mouse - ON/OFF, Right mouse - MENU"), device = devices.CMSP,action = {device_commands.Button_14, device_commands.Button_15},  stop_action = {0, device_commands.Button_15}, arg = {362, 362}, stop_value = {nil,0.1},arg_value = {0.1, 0.2}, arg_lim = {{0, 0.1}, {0.1, 0.2}}, use_release_message = {false, false}}
elements["PNT-TMB-CMSP-DISP"]  			= {class = {class_type.TUMB, class_type.BTN}, hint = _("Countermeasure Dispenser (DISP). Left mouse - ON/OFF, Right mouse - MENU"),device = devices.CMSP,action = {device_commands.Button_16, device_commands.Button_17},  stop_action = {0, device_commands.Button_17}, arg = {363, 363}, stop_value = {nil,0.1},arg_value = {0.1, 0.2}, arg_lim = {{0, 0.1}, {0.1, 0.2}}, use_release_message = {false, false}}
elements["PNT-LEV-CMSP-MODE"]			= {class = {class_type.TUMB, class_type.TUMB},hint = _("Master CMS Mode Select"), 														device = devices.CMSP,action = {device_commands.Button_18, device_commands.Button_18},  arg = {364,364}, arg_value = {-0.1,0.1}, arg_lim = {{0.0, 0.4},{0.0, 0.4}}}

---------------------------------------------
-- CMSC
elements["PNT-BTN-RWR-JMR"]			= {class = {class_type.BTN}, hint = _("Select Jammer Program"), device = devices.CMSC, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {365}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-RWR-MWS"]			= {class = {class_type.BTN}, hint = _("Cycle Missile Warning System Programs. No function"), device = devices.CMSC, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {366}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-RWR-PRI"]			= {class = {class_type.BTN}, hint = _("Toggle between 5 and 16 Priority Threats Displayed"), device = devices.CMSC, action = {device_commands.Button_3}, stop_action = {device_commands.Button_3}, arg = {369}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-RWR-SEP"]			= {class = {class_type.BTN}, hint = _("Separate RWR Symbols"), device = devices.CMSC, action = {device_commands.Button_4}, stop_action = {device_commands.Button_4}, arg = {370}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-RWR-UNK"]			= {class = {class_type.BTN}, hint = _("Display Unknown Threats"), device = devices.CMSC, action = {device_commands.Button_5}, stop_action = {device_commands.Button_5}, arg = {371}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-LEV-RWR-BRT"]			= default_axis_limited(_("Adjust Display Brightness"), devices.CMSC, device_commands.Button_6, 367, 0.1, false, false, {0.15, 0.85})
elements["PNT-LEV-RWR-AUD"]			= default_axis_limited(_("Adjust RWR Volume"), devices.CMSC, device_commands.Button_7, 368, 0.1, false, false, {0.0, 1.0})
--elements["EW-LGT-R1"]				= {class = {class_type.BTN}, hint = _("Missile Launch Alert. No function"), device = devices.CMSC, action = {device_commands.Button_8}, stop_action = {device_commands.Button_8}, arg = {0}, arg_value = {0.0}, arg_lim = {{0.0, 0.0}}, use_release_message = {false} }

---------------------------------------------
-- AHCP
elements["PNT-TMB-AHCP-MARM"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Master Arm"), device = devices.AHCP, action = {device_commands.Button_1,device_commands.Button_1}, arg = {375,375}, arg_value = {0.1,-0.1}, arg_lim = {{0.0, 0.2},{0.0, 0.2}}}
elements["PNT-TMB-AHCP-GUNPAC"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Gun Arm Mode"), device = devices.AHCP, action = {device_commands.Button_2,device_commands.Button_2}, arg = {376,376}, arg_value = {0.1,-0.1}, arg_lim = {{0.0, 0.2},{0.0, 0.2}}}
elements["PNT-TMB-AHCP-LARM"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Laser Arm"), device = devices.AHCP, action = {device_commands.Button_3,device_commands.Button_3}, arg = {377,377}, arg_value = {0.1,-0.1}, arg_lim = {{0.0, 0.2},{0.0, 0.2}}}
elements["PNT-TMB-AHCP-TGP"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Targeting Pod Power On/Off"), device = devices.AHCP, action = {device_commands.Button_4,device_commands.Button_4}, arg = {378,378}, arg_value = {1.0,-1.0}, arg_lim = {{0.0, 1.0},{0.0, 1.0}}}
elements["PNT-TMB-AHCP-ALT"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Altimeter Source"), device = devices.AHCP, action = {device_commands.Button_5,device_commands.Button_5}, arg = {379,379}, arg_value = {0.1,-0.1}, arg_lim = {{0.0, 0.2},{0.0, 0.2}}}
elements["PNT-TMB-AHCP-TIME"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Day/Night HUD Mode"), device = devices.AHCP, action = {device_commands.Button_6,device_commands.Button_6}, arg = {380,380}, arg_value = {1.0,-1.0}, arg_lim = {{0.0, 1.0},{0.0, 1.0}}}
elements["PNT-TMB-AHCP-NORM"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("NORM/Standby HUD Mode"), device = devices.AHCP, action = {device_commands.Button_7,device_commands.Button_7}, arg = {381,381}, arg_value = {1.0,-1.0}, arg_lim = {{0.0, 1.0},{0.0, 1.0}}}
elements["PNT-TMB-AHCP-CICU"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Turn On/Off CICU"), device = devices.AHCP, action = {device_commands.Button_8,device_commands.Button_8}, arg = {382,382}, arg_value = {1.0,-1.0}, arg_lim = {{0.0, 1.0},{0.0, 1.0}}}
elements["PNT-TMB-AHCP-JTRS"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("JTRS Datalink On/Off)"), device = devices.AHCP, action = {device_commands.Button_9,device_commands.Button_9}, arg = {383,383}, arg_value = {1.0,-1.0}, arg_lim = {{0.0, 1.0},{0.0, 1.0}}}
elements["PNT-TMB-AHCP-IFFCC"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Turn On/Off/Test IFFCC"), device = devices.AHCP, action = {device_commands.Button_10,device_commands.Button_10}, arg = {384,384}, arg_value = {0.1,-0.1}, arg_lim = {{0.0, 0.2},{0.0, 0.2}}}
---------------------------------------------
-- UFC

DATA_ToolTip = _("1. Change Menu/Display Data 2. Cycle between DTS and Hot Elevation (N/A) 3. Change HACK Time Interval 4. FUNC Mode: Alternate CDU PG rocker")
SEL_ToolTip  = _("1. HUD TEST: Navigate Menus 2. GUNS: Change Gun Reticle 3. CCIP/CCRP: Change Weapon Profile 4. AIR-to-AIR: Change Air Threat 5. FUNC Mode: Alternate CDU + Rocker")

elements["PNT-BTN-UFC-1"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {385}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-2"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {386}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-3"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_3}, stop_action = {device_commands.Button_3}, arg = {387}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-4"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_4}, stop_action = {device_commands.Button_4}, arg = {388}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-5"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_5}, stop_action = {device_commands.Button_5}, arg = {389}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-6"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_6}, stop_action = {device_commands.Button_6}, arg = {390}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-7"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_7}, stop_action = {device_commands.Button_7}, arg = {391}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-8"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_8}, stop_action = {device_commands.Button_8}, arg = {392}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-9"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_9}, stop_action = {device_commands.Button_9}, arg = {393}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-0"]			= {class = {class_type.BTN}, hint = "", device = devices.UFC, action = {device_commands.Button_10}, stop_action = {device_commands.Button_10}, arg = {395}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-SPC"]			= {class = {class_type.BTN}, hint = _("Space"), device = devices.UFC, action = {device_commands.Button_11}, stop_action = {device_commands.Button_11}, arg = {396}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}}
elements["PNT-BTN-UFC-HACK"]		= {class = {class_type.BTN}, hint = _("Display Hack Time"), device = devices.UFC, action = {device_commands.Button_12}, stop_action = {device_commands.Button_12}, arg = {394}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-FUNC"]		= {class = {class_type.BTN}, hint = _("Select Function Mode"), device = devices.UFC, action = {device_commands.Button_13}, stop_action = {device_commands.Button_13}, arg = {397}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-LTR"]			= {class = {class_type.BTN}, hint = _("Select Letter Mode"), device = devices.UFC, action = {device_commands.Button_14}, stop_action = {device_commands.Button_14}, arg = {398}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-CLR"]			= {class = {class_type.BTN}, hint = _("Clear"), device = devices.UFC, action = {device_commands.Button_15}, stop_action = {device_commands.Button_15}, arg = {399}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-ENT"]			= {class = {class_type.BTN}, hint = _("Enter"), device = devices.UFC, action = {device_commands.Button_16}, stop_action = {device_commands.Button_16}, arg = {400}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-MK"]			= {class = {class_type.BTN}, hint = _("Create Overhead Mark Point"), device = devices.UFC, action = {device_commands.Button_17}, stop_action = {device_commands.Button_17}, arg = {401}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-ALT"]			= {class = {class_type.BTN}, hint = _("Display and Adjust Altitude Alert Values"), device = devices.UFC, action = {device_commands.Button_18}, stop_action = {device_commands.Button_18}, arg = {402}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-STEER-UP"]	= {class = {class_type.BTN}, hint = _("Cycle Steerpoint/Waypoint"), device = devices.UFC, action = {device_commands.Button_20}, stop_action = {device_commands.Button_20}, arg = {405}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-STEER-DN"]	= {class = {class_type.BTN}, hint =_( "Cycle Steerpoint/Waypoint"), device = devices.UFC, action = {device_commands.Button_21}, stop_action = {device_commands.Button_21}, arg = {405}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-DATA-UP"]		= {class = {class_type.BTN}, hint = DATA_ToolTip, device = devices.UFC, action = {device_commands.Button_22}, stop_action = {device_commands.Button_22}, arg = {406}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-DATA-DN"]		= {class = {class_type.BTN}, hint = DATA_ToolTip, device = devices.UFC, action = {device_commands.Button_23}, stop_action = {device_commands.Button_23}, arg = {406}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-SEL-UP"]		= {class = {class_type.BTN}, hint = SEL_ToolTip, device = devices.UFC, action = {device_commands.Button_24}, stop_action = {device_commands.Button_24}, arg = {407}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-SEL-DN"]		= {class = {class_type.BTN}, hint = SEL_ToolTip, device = devices.UFC, action = {device_commands.Button_25}, stop_action = {device_commands.Button_25}, arg = {407}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-DEPR-UP"]		= {class = {class_type.BTN}, hint = _("Adjust Depressible Pipper"), device = devices.UFC, action = {device_commands.Button_26}, stop_action = {device_commands.Button_26}, arg = {408}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-DEPR-DN"]		= {class = {class_type.BTN}, hint = _("Adjust Depressible Pipper"), device = devices.UFC, action = {device_commands.Button_27}, stop_action = {device_commands.Button_27}, arg = {408}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-INTEN-RGT"]	= {class = {class_type.BTN}, hint = _("Adjust HUD Brightness (Hold rocker)"), device = devices.UFC, action = {device_commands.Button_28}, stop_action = {device_commands.Button_28}, arg = {409}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-INTEN-LFT"]	= {class = {class_type.BTN}, hint = _("Adjust HUD Brightness (Hold rocker)"), device = devices.UFC, action = {device_commands.Button_29}, stop_action = {device_commands.Button_29}, arg = {409}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {true} }
elements["PNT-BTN-UFC-FWD"]			= {class = {class_type.BTN}, hint = _("No Function"), device = devices.UFC, action = {device_commands.Button_30}, stop_action = {device_commands.Button_30}, arg = {531}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-MID"]			= {class = {class_type.BTN}, hint = _("No Function "), device = devices.UFC, action = {device_commands.Button_31}, stop_action = {device_commands.Button_31}, arg = {532}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-AFT"]			= {class = {class_type.BTN}, hint = _("No Function"), device = devices.UFC, action = {device_commands.Button_32}, stop_action = {device_commands.Button_32}, arg = {533}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-ADD-4"]		= {class = {class_type.BTN}, hint = _("No Function"), device = devices.UFC, action = {device_commands.Button_33}, stop_action = {device_commands.Button_33}, arg = {534}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-ADD-5"]		= {class = {class_type.BTN}, hint = _("No Function"), device = devices.UFC, action = {device_commands.Button_34}, stop_action = {device_commands.Button_34}, arg = {535}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-UFC-ADD-6"]		= {class = {class_type.BTN}, hint = _("No Function"), device = devices.UFC, action = {device_commands.Button_35}, stop_action = {device_commands.Button_35}, arg = {536}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }

---------------------------------------------
-- SYS_CONTROLLER
elements["PNT-BTN-UFC-MASTWARN"]	= {class = {class_type.BTN}, hint = _("Master Caution Light"),				 device = devices.SYS_CONTROLLER, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {403}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PTR-LG-WRN-SILENCE"]		= default_button(_("Landing Gear Horn Silence Button"),devices.SYS_CONTROLLER,device_commands.Button_3,127)
---------------------------------------------
-- CDU
elements["PNT-BTN-CDU-ARW-L1"]		= {class = {class_type.BTN}, hint = _("LSK 3L"), device = devices.CDU, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {410}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-L2"]		= {class = {class_type.BTN}, hint = _("LSK 5L"), device = devices.CDU, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {411}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-L3"]		= {class = {class_type.BTN}, hint = _("LSK 7L"), device = devices.CDU, action = {device_commands.Button_3}, stop_action = {device_commands.Button_3}, arg = {412}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-L4"]		= {class = {class_type.BTN}, hint = _("LSK 9L"), device = devices.CDU, action = {device_commands.Button_4}, stop_action = {device_commands.Button_4}, arg = {413}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-R1"]		= {class = {class_type.BTN}, hint = _("LSK 3R"), device = devices.CDU, action = {device_commands.Button_5}, stop_action = {device_commands.Button_5}, arg = {414}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-R2"]		= {class = {class_type.BTN}, hint = _("LSK 5R"), device = devices.CDU, action = {device_commands.Button_6}, stop_action = {device_commands.Button_6}, arg = {415}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-R3"]		= {class = {class_type.BTN}, hint = _("LSK 7R"), device = devices.CDU, action = {device_commands.Button_7}, stop_action = {device_commands.Button_7}, arg = {416}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-ARW-R4"]		= {class = {class_type.BTN}, hint = _("LSK 9R"), device = devices.CDU, action = {device_commands.Button_8}, stop_action = {device_commands.Button_8}, arg = {417}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-SYS"]			= {class = {class_type.BTN}, hint = _("Display System (SYS) Page"), device = devices.CDU, action = {device_commands.Button_9}, stop_action = {device_commands.Button_9}, arg = {418}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-NAV"]			= {class = {class_type.BTN}, hint = _("Display Navigation (NAV) Page"), device = devices.CDU, action = {device_commands.Button_10}, stop_action = {device_commands.Button_10}, arg = {419}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-WP"]			= {class = {class_type.BTN}, hint = _("Display Waypoint Menu (WP MENU) Page"), device = devices.CDU, action = {device_commands.Button_11}, stop_action = {device_commands.Button_11}, arg = {420}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-OSET"]		= {class = {class_type.BTN}, hint = _("Display Offset (OFFSET) Page"), device = devices.CDU, action = {device_commands.Button_12}, stop_action = {device_commands.Button_12}, arg = {421}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-FPM"]			= {class = {class_type.BTN}, hint = _("Display Flight Plan Menu (FPMENU) Page"), device = devices.CDU, action = {device_commands.Button_13}, stop_action = {device_commands.Button_13}, arg = {422}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-PREV"]		= {class = {class_type.BTN}, hint = _("Go to previous page"), device = devices.CDU, action = {device_commands.Button_14}, stop_action = {device_commands.Button_14}, arg = {423}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-1"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_15}, stop_action = {device_commands.Button_15}, arg = {425}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-2"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_16}, stop_action = {device_commands.Button_16}, arg = {426}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-3"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_17}, stop_action = {device_commands.Button_17}, arg = {427}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-4"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_18}, stop_action = {device_commands.Button_18}, arg = {428}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-5"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_19}, stop_action = {device_commands.Button_19}, arg = {429}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-6"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_20}, stop_action = {device_commands.Button_20}, arg = {430}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-7"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_21}, stop_action = {device_commands.Button_21}, arg = {431}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-8"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_22}, stop_action = {device_commands.Button_22}, arg = {432}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-9"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_23}, stop_action = {device_commands.Button_23}, arg = {433}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-0"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_24}, stop_action = {device_commands.Button_24}, arg = {434}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-PNT"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_25}, stop_action = {device_commands.Button_25}, arg = {435}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-SLASH"]		= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_26}, stop_action = {device_commands.Button_26}, arg = {436}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-A"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_27}, stop_action = {device_commands.Button_27}, arg = {437}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-B"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_28}, stop_action = {device_commands.Button_28}, arg = {438}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-C"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_29}, stop_action = {device_commands.Button_29}, arg = {439}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-D"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_30}, stop_action = {device_commands.Button_30}, arg = {440}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-E"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_31}, stop_action = {device_commands.Button_31}, arg = {441}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-F"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_32}, stop_action = {device_commands.Button_32}, arg = {442}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-G"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_33}, stop_action = {device_commands.Button_33}, arg = {443}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-H"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_34}, stop_action = {device_commands.Button_34}, arg = {444}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-I"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_35}, stop_action = {device_commands.Button_35}, arg = {445}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-J"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_36}, stop_action = {device_commands.Button_36}, arg = {446}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-K"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_37}, stop_action = {device_commands.Button_37}, arg = {447}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-L"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_38}, stop_action = {device_commands.Button_38}, arg = {448}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-M"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_39}, stop_action = {device_commands.Button_39}, arg = {449}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-N"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_40}, stop_action = {device_commands.Button_40}, arg = {450}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-O"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_41}, stop_action = {device_commands.Button_41}, arg = {451}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-P"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_42}, stop_action = {device_commands.Button_42}, arg = {452}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-Q"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_43}, stop_action = {device_commands.Button_43}, arg = {453}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-R"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_44}, stop_action = {device_commands.Button_44}, arg = {454}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-S"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_45}, stop_action = {device_commands.Button_45}, arg = {455}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-T"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_46}, stop_action = {device_commands.Button_46}, arg = {456}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-U"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_47}, stop_action = {device_commands.Button_47}, arg = {457}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-V"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_48}, stop_action = {device_commands.Button_48}, arg = {458}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-W"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_49}, stop_action = {device_commands.Button_49}, arg = {459}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-X"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_50}, stop_action = {device_commands.Button_50}, arg = {460}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-Y"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_51}, stop_action = {device_commands.Button_51}, arg = {461}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-Z"]			= {class = {class_type.BTN}, hint = "", device = devices.CDU, action = {device_commands.Button_52}, stop_action = {device_commands.Button_52}, arg = {462}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-V1"]			= {class = {class_type.BTN}, hint = _("No function"), device = devices.CDU, action = {device_commands.Button_53}, stop_action = {device_commands.Button_53}, arg = {464}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-V2"]			= {class = {class_type.BTN}, hint = _("No function"), device = devices.CDU, action = {device_commands.Button_54}, stop_action = {device_commands.Button_54}, arg = {465}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-MK"]			= {class = {class_type.BTN}, hint = _("Create Overhead Mark Point"), device = devices.CDU, action = {device_commands.Button_55}, stop_action = {device_commands.Button_55}, arg = {466}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-BCK"]			= {class = {class_type.BTN}, hint = _("Erase Single Character. Hold for repeated erase"), device = devices.CDU, action = {device_commands.Button_56}, stop_action = {device_commands.Button_56}, arg = {467}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-SPC"]			= {class = {class_type.BTN}, hint = _("Insert Space Into Scratchpad"), device = devices.CDU, action = {device_commands.Button_57}, stop_action = {device_commands.Button_57}, arg = {468}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {true} }
elements["PNT-BTN-CDU-CLR"]			= {class = {class_type.BTN}, hint = _("Erase Entire Scratchpad"), device = devices.CDU, action = {device_commands.Button_58}, stop_action = {device_commands.Button_58}, arg = {470}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-FA"]			= {class = {class_type.BTN}, hint = _("Fault Acknowledge/Clear Fault Display"), device = devices.CDU, action = {device_commands.Button_59}, stop_action = {device_commands.Button_59}, arg = {471}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-DIMBRT-L"]	= {class = {class_type.BTN}, hint = _("Display Brightness Adjustment (Not Functional)"), device = devices.CDU, action = {device_commands.Button_60}, stop_action = {device_commands.Button_60}, arg = {424}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-DIMBRT-R"]	= {class = {class_type.BTN}, hint = _("Display Brightness Adjustment (Not Functional)"), device = devices.CDU, action = {device_commands.Button_61}, stop_action = {device_commands.Button_61}, arg = {424}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-PG-UP"]		= {class = {class_type.BTN}, hint = _("Page Up To Additional Pages When Available"), device = devices.CDU, action = {device_commands.Button_62}, stop_action = {device_commands.Button_62}, arg = {463}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-PG-DN"]		= {class = {class_type.BTN}, hint = _("Page Down To Additional Pages When Available"), device = devices.CDU, action = {device_commands.Button_63}, stop_action = {device_commands.Button_63}, arg = {463}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-BLANC-L"]		= {class = {class_type.BTN}, hint = _("Scroll Waypoint Names During Search"), device = devices.CDU, action = {device_commands.Button_64}, stop_action = {device_commands.Button_64}, arg = {469}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-BLANC-R"]		= {class = {class_type.BTN}, hint = _("Scroll Waypoint Names During Search"), device = devices.CDU, action = {device_commands.Button_65}, stop_action = {device_commands.Button_65}, arg = {469}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-PLUS"]		= {class = {class_type.BTN}, hint = _("Increment/Decrement Data Indicated With +/- Symbol"), device = devices.CDU, action = {device_commands.Button_66}, stop_action = {device_commands.Button_66}, arg = {472}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-BTN-CDU-MINUS"]		= {class = {class_type.BTN}, hint = _("Increment/Decrement Data Indicated With +/- Symbol"), device = devices.CDU, action = {device_commands.Button_67}, stop_action = {device_commands.Button_67}, arg = {472}, arg_value = {-1.0}, arg_lim = {{-1.0, 0.0}}, use_release_message = {false} }

---------------------------------------------
-- AAP
elements["PNT-LVR-STEER-PT-SEL-SWITCH"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Use Steerpoint From Active Flight Plan"), device = devices.AAP, action = {device_commands.Button_1 ,device_commands.Button_1}, arg = {473,473}, arg_value = {-0.1,0.1}, arg_lim = {{0.0, 0.2},{0.0, 0.2}}}
elements["PNT-TMB-STEER-SPRING-LD-SWITCH"]	= {class = {class_type.BTN,class_type.BTN}	, hint  = _("Toggle Steerpoint"), device = devices.AAP				, action = {device_commands.Button_3 ,device_commands.Button_2}, stop_action = {device_commands.Button_3,device_commands.Button_2}, arg = {474,474}, arg_value = {-1,1}, arg_lim = {{-1, 0},{0, 1}}}
elements["PNT-LEV-PAGE-SEL-SWITCH"]			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("CDU Page Select"), device = devices.AAP						, action = {device_commands.Button_4 ,device_commands.Button_4}, arg = {475,475}, arg_value = {-0.1,0.1}, arg_lim = {{0.0, 0.3},{0.0, 0.3}}}
elements["PTR-TMB-CDU-SWITCH"]				= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("CDU Power On/Off"), device = devices.AAP						, action = {device_commands.Button_5 ,device_commands.Button_5}, arg = {476,476}, arg_value = {1,-1}	 , arg_lim = {{0, 1},{0, 1}}}
elements["PTR-TMB-EGI-SWITCH"]				= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("EGI Power On/Off"), device = devices.AAP						, action = {device_commands.Button_6 ,device_commands.Button_6}, arg = {477,477}, arg_value = {1,-1}	 , arg_lim = {{0, 1},{0, 1}}}

---------------------------------------------
-- Digital Clock
elements["PNT-LVR-WATCH-SET"]		= {class = {class_type.BTN}, hint = _("Toggle Clock and Elapsed Time Modes"), device = devices.DIGITAL_CLOCK, action = {device_commands.Button_1}, stop_action = {device_commands.Button_1}, arg = {68}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }
elements["PNT-LVR-WATCH-CTRL"]		= {class = {class_type.BTN}, hint = _("Start, Stop and Reset Elapsed Timer"), device = devices.DIGITAL_CLOCK, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {69}, arg_value = {1.0}, arg_lim = {{0.0, 1.0}}, use_release_message = {false} }




-- Fuel System Control Panel
elements["PTR-FSCP-EXT-TANKS-WING"] 	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("External Wing Tanks Boost Pumps")			, device = devices.FUEL_SYSTEM, action = {device_commands.Button_1 ,device_commands.Button_1}, arg = {106,106}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-EXT-TANKS-FUS"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("External Fuselage Tank Boost Pump")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_2 ,device_commands.Button_2}, arg = {107,107}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-TK-GATE"]			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Tank Gate")						, device = devices.FUEL_SYSTEM, action = {device_commands.Button_3 ,device_commands.Button_3}, arg = {108,108}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-CROSS-FEED"]			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Cross Feed")					, device = devices.FUEL_SYSTEM, action = {device_commands.Button_4 ,device_commands.Button_4}, arg = {109,109}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-BOOST-PUMPS-WING-L"]	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Boost Pumps Left Wing")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_5 ,device_commands.Button_5}, arg = {110,110}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-BOOST-PUMPS-WING-R"]	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Boost Pumps Right Wing")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_6 ,device_commands.Button_6}, arg = {111,111}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-BOOST-PUMPS-MAIN-L"]	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Boost Pumps Main Fuselage Left")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_7 ,device_commands.Button_7}, arg = {112,112}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-BOOST-PUMPS-MAIN-R"]	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Boost Pumps Main Fuselage Right")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_8 ,device_commands.Button_8}, arg = {113,113}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-SIG-AMPL"]			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Signal Amplifier Norm/Override")	, device = devices.FUEL_SYSTEM, action = {device_commands.Button_9 ,device_commands.Button_9}, arg = {114,114}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FSCP-LINE-CHECK"]			= {class = {class_type.BTN}					, hint  = _("Line Check")					, device = devices.FUEL_SYSTEM, action = {device_commands.Button_10}, stop_action = {device_commands.Button_10},arg = {115}, arg_value = {1}, arg_lim = {{0,1}},use_release_message = {true}}
elements["PTR-FSCP-FILLDISABLE-WING-L"]	= {class = {class_type.TUMB}				, hint  = _("Fill Disable Wing Left")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_12}, arg = {117}, arg_value = {1}, arg_lim = {{0,1}}}
elements["PTR-FSCP-FILLDISABLE-WING-R"]	= {class = {class_type.TUMB}				, hint  = _("Fill Disable Wing Right")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_13}, arg = {118}, arg_value = {1}, arg_lim = {{0,1}}}
elements["PTR-FSCP-FILLDISABLE-MAIN-L"]	= {class = {class_type.TUMB}				, hint  = _("Fill Disable Main Left")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_14}, arg = {119}, arg_value = {1}, arg_lim = {{0,1}}}
elements["PTR-FSCP-FILLDISABLE-MAIN-R"]	= {class = {class_type.TUMB}				, hint  = _("Fill Disable Main Right")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_15}, arg = {120}, arg_value = {1}, arg_lim = {{0,1}}}
elements["PTR-FSCP-RCVR-LEVER"]			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Aerial Refueling Slipway Control Lever")	, device = devices.FUEL_SYSTEM, action = {device_commands.Button_16,device_commands.Button_16},arg = {121,121}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}},updatable = true, gain = {0.1,0.1},animated = {true,true},animation_speed = {5.0,5.0},cycle = true}
--Fuel Quantity Indicator and Selector
elements["PTR-FQIS-SELECT"]			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Fuel display selector")		, device = devices.FUEL_SYSTEM, action = {device_commands.Button_17,device_commands.Button_17}, arg = {645,645}, arg_value = {-0.1,0.1}, arg_lim = {{0,0.4},{0,0.4}}}
elements["PTR-FQIS-TEST"]			= default_button(_("Fuel Gauge Test"),devices.FUEL_SYSTEM,device_commands.Button_18,646)



-- Engine System and Throttle panel
elements["PTR-FUEL-FLOW-L"] 			= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Left Engine Fuel Flow Control")			, device = devices.ENGINE_SYSTEM, action = {device_commands.Button_1 ,device_commands.Button_1}, arg = {122,122}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-FUEL-FLOW-R"]				= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Right Engine Fuel Flow Control")			, device = devices.ENGINE_SYSTEM, action = {device_commands.Button_2 ,device_commands.Button_2}, arg = {123,123}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-ENGINE-OPER-L"]			= {class = {class_type.TUMB,class_type.BTN},  hint  = _("Engine Operate Left")				, device = devices.ENGINE_SYSTEM, action = {device_commands.Button_3 ,device_commands.Button_7}, arg = {124,124},stop_action = {0,device_commands.Button_7},use_release_message = {false,true},arg_value = {-1,1}, arg_lim = {{-1,0},{0,1}}}
elements["PTR-ENGINE-OPER-R"]			= {class = {class_type.TUMB,class_type.BTN},  hint  = _("Engine Operate Right")				, device = devices.ENGINE_SYSTEM, action = {device_commands.Button_4 ,device_commands.Button_8}, arg = {125,125},stop_action = {0,device_commands.Button_8},use_release_message = {false,true},arg_value = {-1,1}, arg_lim = {{-1,0},{0,1}}}
elements["PTR-APU-START"]				= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("APU On/Off")						, device = devices.ENGINE_SYSTEM, action = {device_commands.Button_5 ,device_commands.Button_5}, arg = {126,126}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}}}
elements["PTR-THROTTLE-FRICTION"]		= {class = {class_type.LEV}					, hint  = _("Throttle Friction Control")		, device = devices.ENGINE_SYSTEM, action = {device_commands.Button_6},arg = {128}, arg_value = {1}, arg_lim = {{0,1}},updatable = true, gain = {0.1},cycle = false}

elements["PTR-TEMS-DATA"]				= default_button(_("TEMS DATA"),devices.ENGINE_SYSTEM,device_commands.Button_9,652)

-- LASTE Control Panel 
elements["PTR-LCP-AUTOPILOT-PATH-ALT"]	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Autopilot Mode Select Switch")			, device = devices.AUTOPILOT, action = {device_commands.Button_1 ,device_commands.Button_1}, arg = {132,132}, arg_value = {1,-1}, arg_lim = {{-1,1},{-1,1}},updatable = true,cycle = false}
elements["PTR-LCP-AUTOPILOT-ENGAGE"]	= {class = {class_type.BTN}, hint  = _("Autopilot Engage/Disengage")						, device = devices.AUTOPILOT, action = {device_commands.Button_2}, stop_action = {device_commands.Button_2}, arg = {131}, arg_value = {1}, arg_lim = {{0,1}}}
elements["PTR-LCP-EAC"]					= electrically_held_switch(_("EAC On/Off"), devices.AUTOPILOT, device_commands.Button_26, device_commands.Button_27, 129)
elements["PTR-LCP-RDRALTM"]				= default_2_position_tumb(_("Radar Altimeter Normal/Disabled"),devices.AN_APN_194, device_commands.Button_1,130)

--STABILITY AUGMENTATION SYSTEM PANEL
elements["PTR-SASP-YAW-SASENGAGE-L"]    = electrically_held_switch(_("Yaw SAS Engage left"), devices.AUTOPILOT, device_commands.Button_3, device_commands.Button_4, 185)
elements["PTR-SASP-YAW-SASENGAGE-R"]    = electrically_held_switch(_("Yaw SAS Engage right"), devices.AUTOPILOT, device_commands.Button_5, device_commands.Button_6, 186)
elements["PTR-SASP-PITCH-SASENGAGE-L"]  = electrically_held_switch(_("Pitch SAS Engage left"), devices.AUTOPILOT, device_commands.Button_7, device_commands.Button_8, 187)
elements["PTR-SASP-PITCH-SASENGAGE-R"]  = electrically_held_switch(_("Pitch SAS Engage right"), devices.AUTOPILOT, device_commands.Button_9, device_commands.Button_10, 188)

elements["PTR-SASP-MONITOR-TEST"]		= {class = {class_type.BTN, class_type.BTN},
                                           hint = _("Monitor Test Left/Right"),
										   device = devices.AUTOPILOT,
										   action = {device_commands.Button_11, device_commands.Button_11},
										   stop_action = {device_commands.Button_11, device_commands.Button_11},
										   arg = {189, 189},
										   arg_value = {-1, 1},
										   arg_lim = {{-1, 0}, {0, 1}},
										   updatable = true,
										   use_release_message = {true, true}
										  }

elements["PTR-SASP-TO-TRIM"]			= {class = {class_type.BTN}, hint = _("Set Takeoff Trim"), device = devices.AUTOPILOT, action = {device_commands.Button_12}, stop_action = {device_commands.Button_12}, arg = {190}, arg_value = {1}, arg_lim = {{0, 1}}, use_release_message = {true}}
elements["PTR-SASP-YAW-TRIM"]			= {class = {class_type.BTN, class_type.LEV}, hint = _("Yaw Trim"), device = devices.AUTOPILOT, action = {device_commands.Button_14, device_commands.Button_13}, arg = {192, 192}, arg_value = {0, 0.0}, arg_lim = {{0, 0}, {-1, 1}}, gain = {0, 0.1}, use_release_message = {true, false}, cycle = false}

--Emergency Flight Control Panel						
elements["PTR-EFCP-SPDBK-EMER-RETR"]		 = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("Speed Brake Emergency Retract")	  					, device = devices.AUTOPILOT, action = {device_commands.Button_15, device_commands.Button_15}, 				 arg = {174,174}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}},updatable = true}
elements["PTR-EFCP-PTCHROLL-TRIM"]			 = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("Pitch/Roll Trim Norm/Emergency Override")  			, device = devices.AUTOPILOT, action = {device_commands.Button_16}, arg = {175}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}},updatable = true}

elements["PTR-EFCP-TRIM-NOSEDN"]			 = {class = {class_type.BTN}, hint  = _("Trim Emergency Nose Down") 											, device = devices.AUTOPILOT, action = {device_commands.Button_17},stop_action = {device_commands.Button_25}, arg = {176}, arg_value = {0.1}, arg_lim = {{0,0.1}},use_release_message = {true}}
elements["PTR-EFCP-TRIM-RWINGDN"]			 = {class = {class_type.BTN}, hint  = _("Trim Emergency Right Wing Down")  									, device = devices.AUTOPILOT, action = {device_commands.Button_18},stop_action = {device_commands.Button_25}, arg = {176}, arg_value = {0.2}, arg_lim = {{0,0.2}},use_release_message = {true}}
elements["PTR-EFCP-TRIM-NOSEUP"]			 = {class = {class_type.BTN}, hint  = _("Trim Emergency Nose Up")  											, device = devices.AUTOPILOT, action = {device_commands.Button_19},stop_action = {device_commands.Button_25}, arg = {176}, arg_value = {0.3}, arg_lim = {{0,0.3}},use_release_message = {true}}
elements["PTR-EFCP-TRIM-LWINGDN"]			 = {class = {class_type.BTN}, hint  = _("Trim Emergency Left Wing Down")  										, device = devices.AUTOPILOT, action = {device_commands.Button_20},stop_action = {device_commands.Button_25}, arg = {176}, arg_value = {0.4}, arg_lim = {{0,0.4}},use_release_message = {true}}

elements["PTR-EFCP-AILERON-EMER-DISENGAGE"]  = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("Aileron Emergency Disengage")	  					, device = devices.AUTOPILOT, action = {device_commands.Button_21, device_commands.Button_21}, arg = {177,177}, arg_value = {-1,1}, arg_lim = {{-1,1},{-1,1}},updatable = true,cycle = false}
elements["PTR-EFCP-ELEVATOR-EMER-DISENGAGE"] = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("Elevator Emergency Disengage")	  					, device = devices.AUTOPILOT, action = {device_commands.Button_22, device_commands.Button_22}, arg = {180,180}, arg_value = {-1,1}, arg_lim = {{-1,1},{-1,1}},updatable = true,cycle = false}
elements["PTR-EFCP-FLAP-EMER-RETR"] 		 = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("Flaps Emergency Retract")	  						, device = devices.AUTOPILOT, action = {device_commands.Button_23, device_commands.Button_23}, arg = {183,183}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}},updatable = true}
elements["PTR-EFCP-MRFCS"] 					 = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("Manual Reversion Flight Control System (MRFCS)")	  	, device = devices.AUTOPILOT, action = {device_commands.Button_24, device_commands.Button_24}, arg = {184,184}, arg_value = {1,-1}, arg_lim = {{0,1},{0,1}},updatable = true}

--Electrical Power Panel
elements["PTR-EPP-APU-GEN-PWR"] = {class = {class_type.TUMB, class_type.TUMB}, hint  = _("APU Generator On/Off"), device = devices.ELEC_INTERFACE, action = {device_commands.Button_1 ,device_commands.Button_1}, arg = {241,241}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true}
elements["PTR-EPP-INVERTER"] 	= {class = {class_type.TUMB, class_type.BTN},
                                   hint  = _("Inverter Switch"),
								   device = devices.ELEC_INTERFACE,
								   action = {device_commands.Button_2, device_commands.Button_2},
								   arg = {242, 242},
								   stop_action = {0, device_commands.Button_2},
								   use_release_message = {false, true},
								   arg_value = {1, -1},
								   arg_lim = {{0, 1}, {-1, 0}},
								   updatable = true,
								  }
--elements["PTR-EPP-EMER-FLOOD"] 	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Emergency Flood"), device = devices.ELEC_INTERFACE, action = {device_commands.Button_3, device_commands.Button_3}, arg = {243,243}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true}
elements["PTR-EPP-AC-GEN-PWR-L"]= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Left AC Generator Power"), device = devices.ELEC_INTERFACE, action = {device_commands.Button_4, device_commands.Button_4}, arg = {244,244}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true}
elements["PTR-EPP-AC-GEN-PWR-R"]= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Right AC generator Power"), device = devices.ELEC_INTERFACE, action = {device_commands.Button_5, device_commands.Button_5}, arg = {245,245}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true}
elements["PTR-EPP-BATTERY-PWR"] = {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Battery Power"), device = devices.ELEC_INTERFACE, action = {device_commands.Button_6, device_commands.Button_6}, arg = {246,246}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true}


elements["PTR-EPP-EMER-FLOOD"] 	= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Emergency Flood Light"), device = devices.LIGHT_SYSTEM, action = {device_commands.Button_7, device_commands.Button_7}, arg = {243,243}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true}
-- CPT MECH
elements["PNT-LNDGEAR"]				= {class = {class_type.TUMB,class_type.TUMB}, hint = _("Landing Gear Lever"), device = devices.CPT_MECH, action = {device_commands.Button_1,device_commands.Button_1}, arg = {716,716}, arg_value = {-1,1}, arg_lim = {{0,1},{0,1}},updatable = true, use_OBB = true}
elements["PTR-DOWNLOCK-OVERRIDE"]	= default_button(_("Downlock Override"), devices.CPT_MECH, device_commands.Button_3, 651)
elements["PTR-FLAPS"]				= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Flap Setting"), device = devices.CPT_MECH, action = {device_commands.Button_2 ,device_commands.Button_2}, arg = {773,773}, arg_value = {-0.5,0.5}, arg_lim = {{0,1},{0,1}},updatable = true,cycle = false}

elements["PTR-ANTI-SKID"]           = electrically_held_switch(_("Anti Skid"), devices.AUTOPILOT, device_commands.Button_28, device_commands.Button_29, 654)
										  
-- Navigation Mode Select Panel
elements["PTR-NMSP-HARS"]		=  default_button(_("HARS Backup Navigation Mode")		,devices.NMSP,device_commands.Button_1,605)
elements["PTR-NMSP-EGI"]		=  default_button(_("EGI Navigation Mode")		,devices.NMSP,device_commands.Button_2,607)
elements["PTR-NMSP-TISL"]		=  default_button(_("TISL No Function")		,devices.NMSP,device_commands.Button_3,609)
elements["PTR-NMSP-STARTPT"]	=  default_button(_("STEERPT Mode")  ,devices.NMSP,device_commands.Button_4,611)
elements["PTR-NMSP-ANCHR"]		=  default_button(_("ANCHR Mode")	,devices.NMSP,device_commands.Button_5,613)
elements["PTR-NMSP-TCN"]		=  default_button(_("TCN Mode")		,devices.NMSP,device_commands.Button_6,615)
elements["PTR-NMSP-ILS"]		=  default_button(_("ILS Mode")		,devices.NMSP,device_commands.Button_7,617)
elements["PTR-NMSP-ABLE-STOW"]	=  default_2_position_tumb(_("ABLE-STOW ADI Localizer Bar"),devices.NMSP,device_commands.Button_8,621)

--TISL Control Panel
elements["PTR-TISLCP-MODE"]				=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("TISL Mode")	, device = devices.TISL, action = {device_commands.Button_1 ,device_commands.Button_1}, arg = {622,622}, arg_value = {-0.1,0.1}, arg_lim = {{0,0.4},{0,0.4}},cycle = false , updatable = true}
elements["PTR-TISLCP-SLANT-RNG"]		=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Slant range"), device = devices.TISL, action = {device_commands.Button_2 ,device_commands.Button_2}, arg = {623,623}, arg_value = {-1,1}, arg_lim = {{-1,1},{-1,1}},cycle = false , updatable = true}
elements["PTR-TISLCP-ALT-ABV-TGT-WH1"]	=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Altitude above target tens of thousands of feet"),  device = devices.TISL, action = {device_commands.Button_3 ,device_commands.Button_3}, arg = {624,624}, arg_value = {-0.1,0.1}, arg_lim = {{0,1},{0,1}},cycle = false , updatable = true}
elements["PTR-TISLCP-ALT-ABV-TGT-WH2"]	=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Altitude above target units of thousands of feet"), device = devices.TISL, action = {device_commands.Button_4 ,device_commands.Button_4}, arg = {626,626}, arg_value = {-0.1,0.1}, arg_lim = {{0,1},{0,1}},cycle = false , updatable = true}
elements["PTR-TISLCP-CODE-WH1"]			=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("TISL Code wheel 1"),  device = devices.TISL, action = {device_commands.Button_5 ,device_commands.Button_5}, arg = {636,636}, arg_value = {-0.05,0.05}, arg_lim = {{0,1},{0,1}}}
elements["PTR-TISLCP-CODE-WH2"]			=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("TISL Code wheel 2"),  device = devices.TISL, action = {device_commands.Button_6 ,device_commands.Button_6}, arg = {638,638}, arg_value = {-0.05,0.05}, arg_lim = {{0,1},{0,1}}}
elements["PTR-TISLCP-CODE-WH3"]			=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("TISL Code wheel 3"),  device = devices.TISL, action = {device_commands.Button_7 ,device_commands.Button_7}, arg = {640,640}, arg_value = {-0.05,0.05}, arg_lim = {{0,1},{0,1}}}
elements["PTR-TISLCP-CODE-WH4"]			=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("TISL Code wheel 4"),  device = devices.TISL, action = {device_commands.Button_8 ,device_commands.Button_8}, arg = {642,642}, arg_value = {-0.05,0.05}, arg_lim = {{0,1},{0,1}}}
elements["PTR-TISLCP-TISL-AUX"]			=  {class = {class_type.TUMB,class_type.TUMB}, hint  = _("TISL AUX")		  ,  device = devices.TISL, action = {device_commands.Button_9 ,device_commands.Button_9}, arg = {644,644}, arg_value = {-1,1}, arg_lim = {{-1,1},{-1,1}}}

elements["PTR-TISLCP-ENTER"]			=  default_button(_("ENTER")		,devices.TISL,device_commands.Button_10,628)
elements["PTR-TISLCP-BITE"]				=  default_button(_("BITE")			,devices.TISL,device_commands.Button_11,632)

-- Emergency Jettison Button
elements["PTR-EXT-STORES-JETT"]		= default_button(_("Emergency Jettison External Stores"),devices.IFFCC,device_commands.Button_1,101)

-- ALCP
elements["PTR-ALCP-SIGLIGHTS-LAMP-TEST"] =  default_button(_("Test Cockpit Indication Lights"),devices.SYS_CONTROLLER,device_commands.Button_2,197)

-- Armament Ground Safety Override Switch
elements["PTR-ARMGS-COVER"]	=  default_2_position_tumb(_("Arm Ground Safety Override Cover"),devices.IFFCC,device_commands.Button_2,709)
elements["PTR-ARMGS-OVERRIDE-SWITCH"]	=  default_2_position_tumb(_("Arm Ground Safety Override Switch"),devices.IFFCC,device_commands.Button_3,710)

function default_springloaded_switch(hint_, device_, command1_, command2_, value1_, value2_, value3_, arg_)
	return	{
				class 		= {class_type.TUMB, class_type.BTN},
				hint 		= hint_, 
				device 		= device_,
				action  	= {command1_ ,	command2_}, 
				stop_action = {0 , 	command2_}, 
				arg 		= {arg_,		arg_},
				stop_value 	= {nil,			value2_},
				arg_value 	= {value2_, 	value3_},
				arg_lim 	= {{value1_, value2_}, {value2_, value3_}}, 
				use_release_message = {false, false}
			}
end


function IFF_multiposition_spring_switch(hint_,device_,command1_, arg_)
	return  {	
				class 		= {class_type.BTN,class_type.BTN},
				hint  		= hint_,
				device 		= device_,
				action 		= {command1_ ,	command1_},
				stop_action = {command1_ , nil	},
				stop_value 	= {0.0,		   nil	},				
				arg 	  	= {arg_,arg_},
				arg_value 	= {-1,1}, 
				arg_lim   	= {{-1, 0},
							   {0, 1}},
				updatable 	= true, 
				--use_OBB 	= true,
				use_release_message = {true,true}
			}
end

--IFF
elements["PTR-IFFCP-CODE"]				= IFF_multiposition_spring_switch(_("Code"), devices.IFF, device_commands.Button_7,199)
elements["PTR-IFFCP-MASTER"]			= multiposition_switch(_("Master"), devices.IFF, device_commands.Button_8, 200, 5, 0.1)
elements["PTR-IFFCP-OUT-AUDIO-LIGHT"]	= default_3_position_tumb(_("Audio/light") ,devices.IFF,device_commands.Button_9,201)

elements["PTR-IFFCP-TEST-M-1"]			= default_springloaded_switch(_("Test M-1") ,devices.IFF,device_commands.Button_10,device_commands.Button_10,-1,0,1,202)
elements["PTR-IFFCP-TEST-M-2"]			= default_springloaded_switch(_("Test M-2") ,devices.IFF,device_commands.Button_11,device_commands.Button_11,-1,0,1,203)
elements["PTR-IFFCP-TEST-M-3A"]			= default_springloaded_switch(_("Test M-3A") ,devices.IFF,device_commands.Button_12,device_commands.Button_12,-1,0,1,204)
elements["PTR-IFFCP-TEST-M-C"]			= default_springloaded_switch(_("Test M-C") ,devices.IFF,device_commands.Button_13,device_commands.Button_13,-1,0,1,205)

elements["PTR-IFFCP-RADTEST"]			= default_springloaded_switch(_("RAD Test/Mon") ,devices.IFF,device_commands.Button_14,device_commands.Button_14,-1,0,1,206)
elements["PTR-IFFCP-MIC-IDENT"]			= default_springloaded_switch(_("Ident/Mic") ,devices.IFF,device_commands.Button_15,device_commands.Button_15,-1,0,1,207)

elements["PTR-IFFCP-ON-OUT"]			= default_2_position_tumb(_("IFF On/Out") ,devices.IFF,device_commands.Button_16,208)

elements["PTR-IFFCP-MODE1-WHEEL1"]		= multiposition_switch(_("MODE1-WHEEL1") ,devices.IFF,device_commands.Button_1,209,8,0.1)
elements["PTR-IFFCP-MODE1-WHEEL2"]		= multiposition_switch(_("MODE1-WHEEL2") ,devices.IFF,device_commands.Button_2,210,4,0.1)

elements["PTR-IFFCP-MODE3A-WHEEL1"]		= multiposition_switch(_("MODE3A-WHEEL1"),devices.IFF,device_commands.Button_3,211,8,0.1)
elements["PTR-IFFCP-MODE3A-WHEEL2"]		= multiposition_switch(_("MODE3A-WHEEL2"),devices.IFF,device_commands.Button_4,212,8,0.1)
elements["PTR-IFFCP-MODE3A-WHEEL3"]		= multiposition_switch(_("MODE3A-WHEEL3"),devices.IFF,device_commands.Button_5,213,8,0.1)
elements["PTR-IFFCP-MODE3A-WHEEL4"]		= multiposition_switch(_("MODE3A-WHEEL4"),devices.IFF,device_commands.Button_6,214,8,0.1)

elements["PTR-BTN-PANIFF-REPLY"]		= default_button_axis(_("Reply test"),devices.IFF,device_commands.Button_17,device_commands.Button_20,795,900)
elements["PTR-BTN-PANIFF-TEST"]			= default_button_axis(_("Test test"),devices.IFF,device_commands.Button_18,device_commands.Button_21,796,901)


--Oxygen System Control Panel						
elements["PTR-OXYGENCP-EMERGENCY"]			= default_3_position_tumb(_("Oxygen Flow Emergency/Normal/Test Mask"), devices.OXYGEN_SYSTEM, device_commands.Button_3, 601)
elements["PTR-OXYGENCP-OXYGEN-DILUTER"]		= default_2_position_tumb(_("Oxygen Normal/100%"), devices.OXYGEN_SYSTEM, device_commands.Button_2, 602)
elements["PTR-OXYGENCP-SUPPLY"]				= default_2_position_tumb(_("Oxygen Supply On/Off"), devices.OXYGEN_SYSTEM, device_commands.Button_1, 603)

--Environment Control Panel
elements["PTR-ENVCP-OXY-TEST"]					= default_button(_("Oxygen Indicator Test"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_1,275)
elements["PTR-ENVCP-WINDSHIELD-DEFOG"]			= default_2_position_tumb(_("Windshield Defog/Deice"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_2,276)
elements["PTR-ENVCP-CANOPY-DEFOG"]				= default_axis(_("Canopy Defog"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_3,277,0.0)
elements["PTR-ENVCP-WINDSHIELD-RREMOVE-WASH"]	= default_3_position_tumb(_("Windshield Rain Removal/Wash"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_4,278)
elements["PTR-ENVCP-PITOT-HEAT"]				= default_2_position_tumb(_("Pitot Heater"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_5,279)
elements["PTR-ENVCP-BLEED-AIR"]					= default_2_position_tumb(_("Bleed Air") ,devices.ENVIRONMENT_SYSTEM,device_commands.Button_6,280)
elements["PTR-ENVCP-TEMP-PRESS"]				= default_3_position_tumb(_("Temperature/Pressure Control"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_7,282)
elements["PTR-ENVCP-MAIN-AIR-SUPPLY"]			= default_2_position_tumb(_("Main Air Supply") ,devices.ENVIRONMENT_SYSTEM,device_commands.Button_8,283)
elements["PTR-ENVCP-FLOW-LEVEL"]				= default_axis(_("Flow Level Control"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_9,284,0.0)
elements["PTR-ENVCP-TEM-LEVEL"]					= default_axis(_("Temp Level Control"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_13,286,0.0)

elements["PTR-ENVCP-CABIN-AIR-COND-OPER"]		= {class = {class_type.TUMB,class_type.TUMB}, hint  = _("Air Conditioner MAN/AUTO"), device = devices.ENVIRONMENT_SYSTEM, action = {device_commands.Button_10,device_commands.Button_10}, arg = {285,285}, arg_value = {0.1,-0.1}, arg_lim = {{0.0, 0.1},{0.0, 0.1}}}
elements["PTR-ENVCP-CABIN-AIR-COND-OPER-COLD"]	= default_button(_("Air Conditioner to COLD"),devices.ENVIRONMENT_SYSTEM,device_commands.Button_11,285,0.2,{0,0.2})
elements["PTR-ENVCP-CABIN-AIR-COND-OPER-HOT"]	= default_button(_("Air Conditioner to HOT") ,devices.ENVIRONMENT_SYSTEM,device_commands.Button_12,285,0.3,{0,0.3})


--Circuit Breaker Panel
elements["PTR-CBP-AILERON-DISC-L"]			= default_2_position_tumb(_("AILERON DISC L"), devices.ELEC_INTERFACE, device_commands.Button_7, 666)
elements["PTR-CBP-AILERON-DISC-R"]			= default_2_position_tumb(_("AILERON DISC R"), devices.ELEC_INTERFACE, device_commands.Button_8, 667)
elements["PTR-CBP-SPS-RUDDER-AUTH-LIM"]		= default_2_position_tumb(_("SPS & RUDDER AUTH LIMIT"), devices.ELEC_INTERFACE, device_commands.Button_9, 668)
elements["PTR-CBP-ELEVATION-DISC-L"]		= default_2_position_tumb(_("ELEVATION DISC L"), devices.ELEC_INTERFACE, device_commands.Button_10, 669)
elements["PTR-CBP-ELEVATION-DISC-R"]		= default_2_position_tumb(_("ELEVATION DISC R"), devices.ELEC_INTERFACE, device_commands.Button_11, 670)
elements["PTR-CBP-AILERON-TAB-L"]			= default_2_position_tumb(_("AILERON TAB L"), devices.ELEC_INTERFACE, device_commands.Button_12, 671)
elements["PTR-CBP-AILERON-TAB-R"]			= default_2_position_tumb(_("AILERON TAB R"), devices.ELEC_INTERFACE, device_commands.Button_13, 672)
elements["PTR-CBP-EMER-FLAP"]				= default_2_position_tumb(_("EMER FLAP"), devices.ELEC_INTERFACE, device_commands.Button_14, 673)
elements["PTR-CBP-EMER-TRIM"]				= default_2_position_tumb(_("EMER TRIM"), devices.ELEC_INTERFACE, device_commands.Button_15, 674)
elements["PTR-CBP-LAND-GEAR"]				= default_2_position_tumb(_("LAND GEAR"), devices.ELEC_INTERFACE, device_commands.Button_16, 675)
elements["PTR-CBP-ENGINE-START-L"]			= default_2_position_tumb(_("ENGINE START L"), devices.ELEC_INTERFACE, device_commands.Button_17, 676)
elements["PTR-CBP-ENGINE-START-R"]			= default_2_position_tumb(_("ENGINE START R"), devices.ELEC_INTERFACE, device_commands.Button_18, 677)
elements["PTR-CBP-APU-CONT"]				= default_2_position_tumb(_("APU CONT"), devices.ELEC_INTERFACE, device_commands.Button_19, 678)
elements["PTR-CBP-ANG-IGNITOR-1"]			= default_2_position_tumb(_("ENG IGNITOR L/R-1"), devices.ELEC_INTERFACE, device_commands.Button_20, 679)
elements["PTR-CBP-ANG-IGNITOR-2"]			= default_2_position_tumb(_("ENG IGNITOR L/R-2"), devices.ELEC_INTERFACE, device_commands.Button_21, 680)
elements["PTR-CBP-EMER-FUEL-SHUTOFF-ENG-L"]	= default_2_position_tumb(_("EMER FUEL SHUTOFF ENG L"), devices.ELEC_INTERFACE, device_commands.Button_22, 681)
elements["PTR-CBP-EMER-FUEL-SHUTOFF-ENG-R"]	= default_2_position_tumb(_("EMER FUEL SHUTOFF ENG R"), devices.ELEC_INTERFACE, device_commands.Button_23, 682)
elements["PTR-CBP-DC-FUEL-PUMP"]			= default_2_position_tumb(_("DC FUEL PUMP"), devices.ELEC_INTERFACE, device_commands.Button_24, 683)
elements["PTR-CBP-BLEED-AIR-CONT-L"]		= default_2_position_tumb(_("BLEED AIR CONT L"), devices.ELEC_INTERFACE, device_commands.Button_25, 684)
elements["PTR-CBP-BLEED-AIR-CONT-R"]		= default_2_position_tumb(_("BLEED AIR CONT R"), devices.ELEC_INTERFACE, device_commands.Button_26, 685)
elements["PTR-CBP-EXT-STORES-JETT-1"]		= default_2_position_tumb(_("EXT STORES JETT 1"), devices.ELEC_INTERFACE, device_commands.Button_27, 686)
elements["PTR-CBP-EXT-STORES-JETT-2"]		= default_2_position_tumb(_("EXT STORES JETT 2"), devices.ELEC_INTERFACE, device_commands.Button_28, 687)
elements["PTR-CBP-STBY-ATT-IND"]			= default_2_position_tumb(_("STBY ATT IND"), devices.ELEC_INTERFACE, device_commands.Button_29, 688)
elements["PTR-CBP-MASTER-CAUT"]				= default_2_position_tumb(_("MASTER CAUT"), devices.ELEC_INTERFACE, device_commands.Button_30, 689)
elements["PTR-CBP-PITOT-HEAT-AC"]			= default_2_position_tumb(_("PITOT HEAT AC"), devices.ELEC_INTERFACE, device_commands.Button_31, 690)
elements["PTR-CBP-IFF"]						= default_2_position_tumb(_("IFF"), devices.ELEC_INTERFACE, device_commands.Button_32, 691)
elements["PTR-CBP-UHF-COMM"]				= default_2_position_tumb(_("UHF COMM"), devices.ELEC_INTERFACE, device_commands.Button_33, 692)
elements["PTR-CBP-INTER-COMM"]				= default_2_position_tumb(_("INTER COMM"), devices.ELEC_INTERFACE, device_commands.Button_34, 693)
elements["PTR-CBP-GENERATOR-CONT-L"]		= default_2_position_tumb(_("GENERATOR CONT L"), devices.ELEC_INTERFACE, device_commands.Button_35, 694)
elements["PTR-CBP-GENERATOR-CONT-R"]		= default_2_position_tumb(_("GENERATOR CONT R"), devices.ELEC_INTERFACE, device_commands.Button_36, 695)
elements["PTR-CBP-CONVERTER-L"]				= default_2_position_tumb(_("CONVERTER L"), devices.ELEC_INTERFACE, device_commands.Button_37, 696)
elements["PTR-CBP-AUX-ESS-BUS-0A"]			= default_2_position_tumb(_("AUX ESS BUS 0A"), devices.ELEC_INTERFACE, device_commands.Button_38, 697)
elements["PTR-CBP-AUX-ESS-BUS-0B"]			= default_2_position_tumb(_("AUX ESS BUS 0B"), devices.ELEC_INTERFACE, device_commands.Button_39, 698)
elements["PTR-CBP-AUX-ESS-BUS-0C"]			= default_2_position_tumb(_("AUX ESS BUS 0C"), devices.ELEC_INTERFACE, device_commands.Button_40, 699)
elements["PTR-CBP-BATTERY-BUS-TRANS"]		= default_2_position_tumb(_("BATTERY BUS TRANS"), devices.ELEC_INTERFACE, device_commands.Button_41, 700)
elements["PTR-CBP-INVERTER-PWR"]			= default_2_position_tumb(_("INVERTER PWR"), devices.ELEC_INTERFACE, device_commands.Button_42, 701)
elements["PTR-CBP-INVERTER-CONT"]			= default_2_position_tumb(_("INVERTER CONT"), devices.ELEC_INTERFACE, device_commands.Button_43, 702)
elements["PTR-CBP-AUX-ESS-BUS-TIE"]			= default_2_position_tumb(_("AUX ESS BUS TIE"), devices.ELEC_INTERFACE, device_commands.Button_44, 703)

--AAU-34/A
elements["PNT-ALT-LEVR-L"] = default_axis(_("Set Pressure"),devices.FM_PROXY, device_commands.Button_1, 62, 0.04, 1, false, true)
elements["PNT-ALT-LEVR-R"] =  {	
				class 		= {class_type.BTN,class_type.BTN},
				hint  		= _("ELECT/PNEU"),
				device 		= devices.AAU34,
				action 		= {device_commands.Button_2,device_commands.Button_1},
				arg 	  	= {60,60},
				arg_value 	= {-1,1}, 
				arg_lim   	= {{-1,0},{0,1}},
				updatable 	= true, 
				stop_value 	= {0.0,0.0},	
				stop_action = {device_commands.Button_2,device_commands.Button_1},
				use_release_message = {true,true}
			}						

--Light System Control Panel

elements["PTR-LGHTCP-POSITION"]			= default_3_position_tumb(_("Position Lights, FLASH/OFF/STEADY"), devices.LIGHT_SYSTEM, device_commands.Button_8, 287)
elements["PTR-LGHTCP-FORMATION"]		= default_axis(_("Formation Lights"), devices.LIGHT_SYSTEM, device_commands.Button_9, 288)
elements["PTR-LGHTCP-ANTICOLLISION"]    = electrically_held_switch(_("Anticollision Lights"), devices.LIGHT_SYSTEM, device_commands.Button_10, device_commands.Button_11, 289)
elements["PTR-LGHTCP-ENG-INST"]			= default_axis(_("Engine Instruments Lights"), devices.LIGHT_SYSTEM, device_commands.Button_1, 290)
elements["PTR-LGHTCP-NOSE-ILLUM"]		= default_2_position_tumb(_("Nose Illumination"), devices.LIGHT_SYSTEM, device_commands.Button_12, 291)
elements["PTR-LGHTCP-FLIGHT-INST"]		= default_axis(_("Flight Instruments Lights"), devices.LIGHT_SYSTEM, device_commands.Button_2, 292)
elements["PTR-LGHTCP-AUX-INST"]			= default_axis(_("Auxiliary Instruments Lights"), devices.LIGHT_SYSTEM, device_commands.Button_3, 293)
elements["PTR-LGHTCP-SIGNAL-LTS"]		= default_2_position_tumb(_("Signal Lights"), devices.LIGHT_SYSTEM, device_commands.Button_13, 294)
elements["PTR-LGHTCP-ACCEL-COMP"]		= default_2_position_tumb(_("Accelerometer & Compass Lights"), devices.LIGHT_SYSTEM,device_commands.Button_4, 295)
elements["PTR-LGHTCP-FLOOD"]			= default_axis(_("Flood Light"), devices.LIGHT_SYSTEM, device_commands.Button_5, 296)
elements["PTR-LGHTCP-CONSOLE"]			= default_axis(_("Console Light"), devices.LIGHT_SYSTEM, device_commands.Button_6, 297)

elements["PTR-LIGHTS-LAND"]				= {	
											class 		= {class_type.TUMB,class_type.TUMB},
											hint  		= _("Land Taxi Lights"),
											device 		= devices.LIGHT_SYSTEM,
											action 		= {device_commands.Button_14, device_commands.Button_14},
											arg 	  	= {655,655},
											arg_value 	= {0.1,-0.1}, 
											arg_lim   	= {{0,0.2},{0,0.2}},
											updatable 	= true, 
											use_OBB 	= true,
											cycle       = cycled
										}
elements["PTR-ALCP-RSIL"]				= default_axis(_("Refuel Status Indexer Lights"), devices.LIGHT_SYSTEM, device_commands.Button_15, 193, 0.0)
elements["PTR-ALCP-WPNSTA"]				= default_axis(_("Weapon Station Lights. No function"), devices.LIGHT_SYSTEM, device_commands.Button_16, 195, 0.0) -- No function in A-10C
elements["PTR-ALCP-NVIS-LTS"]			= multiposition_switch(_("Nightvision Lights"), devices.LIGHT_SYSTEM, device_commands.Button_17, 194, 3, 0.1)
elements["PTR-FSCP-RCVR-LT"]			= default_axis(_("Refueling Lighting Dial")	 ,devices.LIGHT_SYSTEM, device_commands.Button_18, 116, 0.0)
elements["PTR-ALCP-HARSSAS"]			= default_2_position_tumb(_("HARS-SAS Override/NORM"), devices.AUTOPILOT,device_commands.Button_31, 196)
elements["PTR-ALCP-FDBAL-TEST"] 		= default_button(_("Fire Detect Bleed Air Test"), devices.SYS_CONTROLLER, device_commands.Button_4, 198,1, {0,1})

--Fire Extinguishers Panel
elements["PTR-FIRE-LENG-PULL"]			= default_2_position_tumb(_("Left Engine Fire T-Handle")			,devices.FIRE_SYSTEM,device_commands.Button_1,102)
elements["PTR-FIRE-APU-PULL"]			= default_2_position_tumb(_("APU Fire T-Handle")		 			,devices.FIRE_SYSTEM,device_commands.Button_2,103)
elements["PTR-FIRE-RENG-PULL"]			= default_2_position_tumb(_("Right Engine Fire T-Handle")			,devices.FIRE_SYSTEM,device_commands.Button_3,104)
elements["PTR-FIRE-EXTING-DISCH"]		= default_3_position_tumb(_("Fire Extinguishing Agent Discharge")	,devices.FIRE_SYSTEM,device_commands.Button_4,105,false,true)
				 
--Horizontal Situation Indicator
elements["PNT-LVR-HSI-HDG"]				= default_axis(_("Heading Set Knob"),devices.HSI, device_commands.Button_1, 45, 1.0, 0.1, false, true)
elements["PNT-LVR-HSI-CRS"]				= default_axis(_("Course Set Knob"), devices.HSI, device_commands.Button_2, 44, 1.0, 0.1, false, true)

--Attitude Direction Indicator
elements["PNT-LVR-ADI-KNOB"]			= default_axis_limited(_("ADI Pitch Trim Knob"), devices.ADI, device_commands.Button_1, 22, 0.1, false, false, {-0.5, 0.5})

--Standby Attitude Indicator
elements["PNT-LVR-SAI-CAGE"] = 				{ 
	class = {class_type.BTN, class_type.LEV}, 
	hint = _("Cage Standby Attitude Indicator. Hold Right Mouse Button and rotate Scroll Wheel to uncage"), 
	device = devices.SAI, 
	action = {device_commands.Button_2, device_commands.Button_3}, 
	stop_action = {device_commands.Button_2, 0}, 
	is_repeatable = {}, 
	arg = {67, 66}, 
	arg_value = {1.0, 0.5 }, 
	arg_lim = {{0, 1}, {0, 1}}, 
	relative = {false,true}, 
	gain = {1.0, 0.5}, 
	use_release_message = {true, false}, 
	use_OBB = true }
	
--TACAN
elements["PTR-TACAN-CHANNEL-SELECTOR-1"] = {
	class  		 	= {class_type.LEV}, 
	hint   		 	= _("Channel Selector (Tens). Rotate mouse wheel to select"),
	device 		 	= devices.TACAN,
	action 		 	= {device_commands.Button_1}, 
	arg 			= {256},
	arg_value 		= {0.1},
	arg_lim   		= {{0.0, 1.0}},
	relative		= {true},
	animated   		= {true},
	animation_speed = {0.7},
	gain 			= {0.1},
	sound = {{SOUND_ROTARY,SOUND_ROTARY}}
}


elements["PTR-TACAN-CHANNEL-SELECTOR-2"] = {
	class  		 	= {class_type.LEV, class_type.TUMB}, 
	hint   		 	= _("Channel Selector (Ones) / X/Y Mode. Right mouse click to select X/Y. Rotate mouse wheel to make channel selection"),
	device 		 	= devices.TACAN,
	action 		 	= {device_commands.Button_3, device_commands.Button_5}, 
	arg 			= {257, 258},
	arg_value 		= {0.1, 0.93},
	arg_lim   		= {{0.0, 1.0}, {0.87, 0.93}},
	relative		= {true, false},
	animated   		= {true, false},
	animation_speed = {0.7, 0.0},
	gain 			= {0.1, 1},
	sound = {{SOUND_ROTARY,SOUND_ROTARY},{}}
}

elements["PTR-TACAN-TEST"]				= default_button(_("Test TACAN Signal on HSI"), devices.TACAN, device_commands.Button_6, 259, 1, {0, 1})
elements["PTR-TACAN-VOL"] 				= default_axis(_("Signal Volume"), devices.TACAN, device_commands.Button_7, 261)
elements["PTR-TACAN-MODE"]				= multiposition_switch(_("Mode Dial"), devices.TACAN, device_commands.Button_8, 262, 5, 0.1)

--STALL 
elements["PTR-STALLWCP-STALL"] 				= default_axis(_("Stall Volume"), devices.STALL, device_commands.Button_1, 704)
elements["PTR-STALLWCP-PEAK"] 				= default_axis(_("Peak Volume"), devices.STALL, device_commands.Button_2, 705)


--ILS
elements["PTR-ILSCP-PWR"] = {
	class = {class_type.TUMB, class_type.TUMB, class_type.LEV},
	hint = _("ILS Frequency MHz / Power. Right mouse click to cycle power. Rotate mouse wheel to change frequency value"),
	device = devices.ILS,
	action = {device_commands.Button_1,
			device_commands.Button_1,
			device_commands.Button_2},
	arg = {247, 247, 248},
	arg_value = {-1, 1, 0.1},
	arg_lim = { {0.0, 1.0},{0.0, 1.0}, {0.0, 0.30}},
	relative = {false, false, false},
	animated   = {false, false, true},
	animation_speed = {0.0,0.0, 0.5},
	gain = {1.0, 1.0, 0.1},
	cycle = false,
	sound = {{},{},{SOUND_ROTARY,SOUND_ROTARY}}
}

elements["PTR-ILSCP-VOL"] = {
	class = {class_type.TUMB, class_type.TUMB, class_type.LEV},
	hint = _("ILS Frequency kHz / Volume. Rotate mouse wheel to change frequency value. Left or Right click and hold while moving mouse to adjust volume "),
	device = devices.ILS,
	action = {device_commands.Button_5, device_commands.Button_4, device_commands.Button_3},
	arg = {250, 250, 249},
	arg_value = {-0.1, 0.1, 0.1},
	arg_lim = {{0.0, 1.0}, {0.0, 1.0}, {0.0, 0.9}},
	relative = {false, false, false},
	animated   = {true, true, true},
	animation_speed = {0.7, 0.7, 0.5},
	gain = {0.05, 0.05, 0.1},
	cycle = false,
	sound = {{},{},{SOUND_ROTARY,SOUND_ROTARY}}
}


--UHF Raido
elements["PTR-ANARC164-CHANNEL-SELECTOR"] 	= multiposition_switch_limited(_("Preset Channel Selector"), devices.UHF_RADIO, device_commands.Button_1, 161,20,0.05)
elements["PTR-ANARC164-100MHZ-SELECTOR"] 	= multiposition_switch_limited(_("100 MHz Selector") , devices.UHF_RADIO, device_commands.Button_2, 162, 3, 0.1)
elements["PTR-ANARC164-10MHZ-SELECTOR"] 	= multiposition_switch_limited(_("10 MHz Selector"), devices.UHF_RADIO, device_commands.Button_3, 163, 10, 0.1)
elements["PTR-ANARC164-1MHZ-SELECTOR"] 		= multiposition_switch_limited(_("1 MHz Selector"), devices.UHF_RADIO, device_commands.Button_4, 164, 10, 0.1)
elements["PTR-ANARC164-0.1MHZ-SELECTOR"] 	= multiposition_switch_limited(_("0.1 MHz Selector"), devices.UHF_RADIO, device_commands.Button_5, 165, 10, 0.1)
elements["PTR-ANARC164-0.025MHZ-SELECTOR"] 	= multiposition_switch_limited(_("0.025 MHz Selector"), devices.UHF_RADIO, device_commands.Button_6, 166, 4, 0.1)

elements["PTR-ANARC164-FREQMODE"] = multiposition_switch(_("Frequency Mode Dial") , devices.UHF_RADIO, device_commands.Button_7, 167, 3, 0.1)
elements["PTR-ANARC164-FUNCTION"] = multiposition_switch(_("Function Dial") , devices.UHF_RADIO, device_commands.Button_8, 168, 4, 0.1)
elements["PTR-ANARC164-T-TONE"]	= {class = {class_type.BTN,class_type.BTN}	, hint  = _("T-Tone"), device = devices.UHF_RADIO, action = {device_commands.Button_9 ,device_commands.Button_9}, stop_action = {device_commands.Button_9,device_commands.Button_9}, arg = {169,169}, arg_value = {-1,1}, arg_lim = {{-1, 0},{0, 1}}}
elements["PTR-ANARC164-SQUELCH"] = default_2_position_tumb(_("Squelch"), devices.UHF_RADIO, device_commands.Button_10, 170)
elements["PTR-ANARC164-VOLUME"] = default_axis(_("Volume"), devices.UHF_RADIO, device_commands.Button_11, 171)
elements["PTR-ANARC164-TEST-DISPLAY"] = default_button(_("Test Display"), devices.UHF_RADIO, device_commands.Button_12, 172, 1, {0, 1})
elements["PTR-ANARC164-STATUS"] = default_button(_("Status"), devices.UHF_RADIO, device_commands.Button_13, 173, 1, {0, 1})
elements["PTR-ANARC164-LOAD"] = default_button(_("Load button"), devices.UHF_RADIO, device_commands.Button_15, 735, 1, {0, 1})
elements["PTR-ANARC164-COVER"]		= 	{class  	= {class_type.TUMB,class_type.TUMB},
										 hint   	= _("Cover"), 
										 device 	= devices.UHF_RADIO,
										 action 	= {device_commands.Button_14,device_commands.Button_14},
										 arg 		= {734,734},
										 arg_value 	= {1,-1},
										 arg_lim 	= {{0,1},{0,1}},
										 updatable  = true, 
										 gain 		= {0.1,0.1},
										 animated 	= {true,true},
										 animation_speed = {5.5,5.5},
										 cycle = true}		

--VHF Radio
elements["PTR-ANARC186-VHFAM-PRESET"] = {
	 class  		 = {class_type.TUMB, class_type.TUMB}, 
	 hint   		 = _("Preset Channel Selector"),
	 device 		 = devices.VHF_AM_RADIO,
	 action 		 = {device_commands.Button_1, device_commands.Button_1}, 
	 arg 			 = {137, 137},
	 arg_value 		 = {0.01, -0.01},
	 arg_lim   		 = {{0, 0.2}, {0, 0.2}},
	 relative		 = {true, true},
	 animated        = {true, true},
	 animation_speed = {0.05, 0.05},
	 cycle 			 = true
}

elements["PTR-ANARC186-VHFAM-MODE"] 			= multiposition_switch(_("Frequency Mode Dial") , devices.VHF_AM_RADIO, device_commands.Button_3, 138, 3, 0.1)
elements["PTR-ANARC186-VHFAM-FREQEMER-CONTROL"] = multiposition_switch(_("Frequency Selection Dial") , devices.VHF_AM_RADIO, device_commands.Button_4, 135, 4, 0.1)
elements["PTR-ANARC186-VHFAM-VOLUME"]			= default_axis(_("Volume"), devices.VHF_AM_RADIO, device_commands.Button_5, 133)
elements["PTR-ANARC186-VHFAM-LOAD"]			 	= default_button(_("Load"), devices.VHF_AM_RADIO, device_commands.Button_6, 136, 1, {0, 1})
elements["PTR-ANARC186-VHFAM-SQUELCH"] = {
	class  		 = {class_type.TUMB, class_type.BTN}, 
	hint   		 = _("Squelch / TONE"),
	device 		 = devices.VHF_AM_RADIO,
	action 		 = {device_commands.Button_7, device_commands.Button_8}, 
	stop_action  = {0, device_commands.Button_8}, 
	arg 		 = {134, 134},
	arg_value 	 = {1, 1},
	arg_lim   	 = {{-1, 0}, {0, 1}},
	use_release_message = {false, true}
}

function radio_wheel(hint_,device_,command1_,command2_,arg_, arg_value_, slave_)

	arg_value_ = arg_value_ or {-0.1, 0.1}
	slave_ = slave_ or {}
	
	return  {
			 class  		 = {class_type.TUMB,class_type.TUMB}, 
			 hint   		 = hint_,
			 device 		 = device_,
			 action 		 = {command1_ ,command2_}, 
			 arg 			 = {arg_,arg_},
			 arg_value 		 = arg_value_,
			 arg_lim   		 = {{0,1},{0,1}},
			 relative		 = {true,true},
			 animated        = {true,true},
			 animation_speed = {0.5, 0.5},
			 slave_animation = {{slave = slave_},{slave = slave_}}
			}
end

elements["PTR-ANARC186-VHFAM-FREQ-1"] = radio_wheel(_("Frequency Selector the 1nd"), devices.VHF_AM_RADIO, device_commands.Button_9, device_commands.Button_10, 139,{-0.1, 0.1}, {143,{0.125,0.775},0.5})
elements["PTR-ANARC186-VHFAM-FREQ-2"] = radio_wheel(_("Frequency Selector the 2nd"), devices.VHF_AM_RADIO, device_commands.Button_11, device_commands.Button_12, 140,{-0.1, 0.1}, {144,{0.0,1.0},1.0})
elements["PTR-ANARC186-VHFAM-FREQ-3"] = radio_wheel(_("Frequency Selector the 3rd"), devices.VHF_AM_RADIO, device_commands.Button_13, device_commands.Button_14, 141,{-0.1, 0.1}, {145,{0.0,1.0},1.0})
elements["PTR-ANARC186-VHFAM-FREQ-4"] = radio_wheel(_("Frequency Selector the 4th"), devices.VHF_AM_RADIO, device_commands.Button_15, device_commands.Button_16, 142,{-0.25, 0.25}, {146,{0.0,1.0},1.0})

-- VHF FM
elements["PTR-ANARC186-VHFFM-PRESET"] = {
	 class  		 = {class_type.TUMB, class_type.TUMB}, 
	 hint   		 = _("Preset Channel Selector"),
	 device 		 = devices.VHF_FM_RADIO,
	 action 		 = {device_commands.Button_1, device_commands.Button_1}, 
	 arg 			 = {151, 151},
	 arg_value 		 = {0.01, -0.01},
	 arg_lim   		 = {{0, 0.2}, {0, 0.2}},
	 relative		 = {true, true},
	 animated        = {true, true},
	 animation_speed = {0.05, 0.05},
	 cycle 			 = true
}
elements["PTR-ANARC186-VHFFM-FREQ-1"] = radio_wheel(_("Frequency Selector the 1nd"), devices.VHF_FM_RADIO, device_commands.Button_9, device_commands.Button_10, 153,{-0.1, 0.1}, {157,{0.125,0.775},0.5})
elements["PTR-ANARC186-VHFFM-FREQ-2"] = radio_wheel(_("Frequency Selector the 2nd"), devices.VHF_FM_RADIO, device_commands.Button_11, device_commands.Button_12, 154,{-0.1, 0.1}, {158,{0.0,1.0},1.0})
elements["PTR-ANARC186-VHFFM-FREQ-3"] = radio_wheel(_("Frequency Selector the 3rd"), devices.VHF_FM_RADIO, device_commands.Button_13, device_commands.Button_14, 155,{-0.1, 0.1}, {159,{0.0,1.0},1.0})
elements["PTR-ANARC186-VHFFM-FREQ-4"] = radio_wheel(_("Frequency Selector the 4th"), devices.VHF_FM_RADIO, device_commands.Button_15, device_commands.Button_16, 156,{-0.25, 0.25}, {160,{0.0,1.0},1.0})

elements["PTR-ANARC186-VHFFM-MODE"] = multiposition_switch(_("Frequency Mode Dial") , devices.VHF_FM_RADIO, device_commands.Button_3, 152, 3, 0.1)
elements["PTR-ANARC186-VHFFM-FREQEMER-CONTROL"] = multiposition_switch(_("Frequency Selection Dial") , devices.VHF_FM_RADIO, device_commands.Button_4, 149, 4, 0.1)
elements["PTR-ANARC186-VHFFM-VOLUME"] = default_axis(_("Volume"), devices.VHF_FM_RADIO, device_commands.Button_5, 147)
elements["PTR-ANARC186-VHFFM-LOAD"] = default_button(_("Load"), devices.VHF_FM_RADIO, device_commands.Button_6, 150, 1, {0, 1})
elements["PTR-ANARC186-VHFFM-SQUELCH"] = {
	class  		 = {class_type.TUMB, class_type.BTN}, 
	hint   		 = _("Squelch / TONE"),
	device 		 = devices.VHF_FM_RADIO,
	action 		 = {device_commands.Button_7, device_commands.Button_8}, 
	stop_action  = {0, device_commands.Button_8}, 
	arg 		 = {148, 148},
	arg_value 	 = {1, 1},
	arg_lim   	 = {{-1, 0}, {0, 1}},
	use_release_message = {false, true}
}

---------------------------------------------------------------------------------------
elements["PTR-SEAT-ADJBUTTON"] 		  = {class  = {class_type.BTN,class_type.BTN},
										 hint   = _("Seat Height Adjustment"), 
										 device = devices.CPT_MECH, 
										 action 	 = {device_commands.Button_4,device_commands.Button_5},
										 stop_action = {device_commands.Button_4,device_commands.Button_5}, 
										 arg 		 = {770,770},
										 arg_value   = {-1.0,1.0},
										 arg_lim 	 =  {{-1.0, 0},{0,1.0}},
										 use_release_message = {true,true}}
										 
elements["PTR-CANOPY-OPEN"] 		  = {class  	 = {class_type.TUMB			,class_type.BTN},
										 hint   	 = _("Canopy Open/Hold/Close") , 
										 device      = devices.CPT_MECH, 
										 arg 		 =  {712					,712},
										 arg_value   =  {1.0					,0},
										 arg_lim 	 = {{0.5, 1.0}				,{0,0.5}},
										 
										 action 	 = {device_commands.Button_6,device_commands.Button_7},
										 stop_action = {0						,device_commands.Button_7}, 
										 stop_value	 = {nil						,0.5},									 
										 use_release_message = {false			,true}}									 
										 
										 

										 
elements["PTR-EMER-BRKARM"]			= 	{class  	= {class_type.TUMB, class_type.TUMB},
										 hint   	= _("Emergency Brake"), 
										 device 	= devices.AUTOPILOT,
										 action 	= {device_commands.Button_30, device_commands.Button_30},
										 arg 		= {772, 772},
										 arg_value 	= {1, 0},
										 arg_lim 	= {{0, 1}, {0, 1}},
										 updatable  = true, 
										 gain 		= {0.1, 0.1},
										 animated 	= {true, true},
										 animation_speed = {12.0, 0},
										 cycle = true}							 
						 
-------------------------------------------------------------------
--Inercom Panel

elements["PTR-INTERCOM-INT"]	= intercom_rotate_tumb(_("INT Switch"),devices.INTERCOM,device_commands.Button_1,device_commands.Button_2, 222, 221)
elements["PTR-INTERCOM-FM"]		= intercom_rotate_tumb(_("FM Switch"),devices.INTERCOM,device_commands.Button_3,device_commands.Button_4, 224, 223)
elements["PTR-INTERCOM-VHF"]	= intercom_rotate_tumb(_("VHF Switch"),devices.INTERCOM,device_commands.Button_5,device_commands.Button_6, 226, 225)
elements["PTR-INTERCOM-UHF"]	= intercom_rotate_tumb(_("UHF Switch"),devices.INTERCOM,device_commands.Button_7,device_commands.Button_8, 228, 227)
elements["PTR-INTERCOM-AIM"]	= intercom_rotate_tumb(_("AIM Switch"),devices.INTERCOM,device_commands.Button_9,device_commands.Button_10, 230, 229)
elements["PTR-INTERCOM-IFF"]	= intercom_rotate_tumb(_("IFF Switch"),devices.INTERCOM,device_commands.Button_11,device_commands.Button_12, 232, 231)
elements["PTR-INTERCOM-ILS"]	= intercom_rotate_tumb(_("ILS Switch"),devices.INTERCOM,device_commands.Button_13,device_commands.Button_14, 234, 233)
elements["PTR-INTERCOM-TCN"]	= intercom_rotate_tumb(_("TCN Switch"),devices.INTERCOM,device_commands.Button_15,device_commands.Button_16, 236, 235)
elements["PTR-INTERCOM-HM"]		= default_2_position_tumb(_("HM Switch"),devices.INTERCOM,device_commands.Button_17,237)
elements["PTR-INTERCOM-VOL"]	= default_axis(_("Intercom volume"),devices.INTERCOM,device_commands.Button_18,238)
elements["PTR-INTERCOM-MODE"] 	= multiposition_switch_intercom(_("Selector switch") , devices.INTERCOM, device_commands.Button_19, 239, 5, 0.1)
elements["PTR-INTERCOM-CALL"] 	= default_button(_("Call button"), devices.INTERCOM, device_commands.Button_20, 240,1, {0,1})

------------------------------------------------------------------	

------------------------------------------------------------------
--HARS
elements["PTR-HARS-FAST-ERECT"]	 		= default_button(_("HARS Fast Erect"), devices.HARS, device_commands.Button_1, 711, 1, {0, 1})		 
elements["PTR-HARS-CP-SLAVE"]	 		= default_2_position_tumb(_("HARS SLAVE-DG mode"),devices.HARS,device_commands.Button_2, 270)
elements["PTR-HARS-CP-N-S"]	 			= default_2_position_tumb(_("HARS N/S toggle switch"),devices.HARS,device_commands.Button_3, 273)
elements["PTR-HARS-CP-MAG-VAR"]			= default_3_position_tumb(_("HARS MAG VAR"), devices.HARS, device_commands.Button_4, 272)
elements["PTR-HARS-CP-LATITUDE"] 		= default_axis(_("HARS Latitude Dial")	 ,devices.HARS,device_commands.Button_5, 271, 0.0)
elements["PTR-HARS-CP-PUSH-TO-SYNC"]	= default_button_axis(_("HARS Push-To-Sync"),devices.HARS, device_commands.Button_6,device_commands.Button_7, 267, 268)
			
------------------------------------------------------------------
-- Secure Voice Comms Panel
elements["PTR-ZEROIZE-COVER"]		= default_2_position_tumb(_("Zeroise Cover"),devices.KY_58,device_commands.Button_1,778)
elements["PTR-ZEROIZE-SWITCH"]		= default_2_position_tumb(_("Zeroise Switch"),devices.KY_58,device_commands.Button_2,779)
elements["PTR-DELAY-SWITCH"]		= default_2_position_tumb(_("Delay Switch"),devices.KY_58,device_commands.Button_3,780)
elements["PTR-LVR-PANKY58-PLAIN"]   = multiposition_switch(_("C/RAD switch") , devices.KY_58, device_commands.Button_4, 781, 3, 0.1)
elements["PTR-LVR-PANKY58-1TO5"]   	= multiposition_switch(_("Full switch") , devices.KY_58, device_commands.Button_5, 782, 6, 0.1)
elements["PTR-LVR-PANKY58-MODE"]   	= multiposition_switch(_("Mode switch") , devices.KY_58, device_commands.Button_6, 783, 3, 0.1)
elements["PTR-TMB-PANKY58-POWER"]   = default_2_position_tumb(_("Power switch") , devices.KY_58, device_commands.Button_7, 784)

------------------------------------------------------------------
-- Auxiliary Landing Gear Handle						
elements["PTR-ARM-DWNC-L"]	= 	{class  	= {class_type.TUMB, class_type.TUMB},
										 hint   	= _("Auxiliary Landing Gear Handle"), 
										 device 	= devices.CPT_MECH,
										 action 	= {device_commands.Button_8, device_commands.Button_8},
										 arg 		= {718, 718},
										 arg_value 	= {1, -1},
										 arg_lim 	= {{0, 1}, {0, 1}},
										 updatable  = true, 
										 gain 		= {0.1, 0.1},
										 animated 	= {true, true},
										 animation_speed = {15.0, 15.0},
										 }
										 
elements["PTR-BTN-ARM-DWNC-L"]  = default_2_position_tumb(_("Auxiliary Landing Gear Handle Lock button") , devices.CPT_MECH, device_commands.Button_9, 722)
------------------------------------------------------------------
-- Arm Seat Handle
elements["PTR-ARM-SEAT-HANDLE"]   = default_2_position_tumb(_("Seat Arm Handle") , devices.CPT_MECH, device_commands.Button_10, 733)
------------------------------------------------------------------
-- Extend boarding ladder button
elements["BOARD-LADDER-COVER-PTR"]   = 	default_2_position_tumb(_("Extend boarding ladder cover") , devices.CPT_MECH, device_commands.Button_11, 787)
elements["BOARD-LADDER-BUTTON-PTR"]	 =  default_button(_("Extend boarding ladder button"), devices.CPT_MECH, device_commands.Button_12, 788)	 
------------------------------------------------------------------
-- Accelerometer
elements["ACCEL_KNOB_PTR"]	 =  default_button(_("Push to set"), devices.ACCELEROMETER, device_commands.Button_1, 904)	 
-----------------------------------------------------------------
-- DVADR Remote Control Panel
elements["DVADR-RC-FUNC-CONTROL-SW-PTR"] = multiposition_switch(_("Function control toggle switch") , devices.DVADR, device_commands.Button_1, 789, 3, 0.1)
elements["DVADR-VIDEO-SW-PTR"]   		 = multiposition_switch(_("Video selector toggle switch (N/A)") , devices.DVADR, device_commands.Button_2, 790, 3, 0.1)
-----------------------------------------------------------------
-- Anti-G suit valve test button
elements["ANTI-G-VALVE-PTR"]	 =  default_button(_("Anti-G suit valve test button"), devices.ENVIRONMENT_SYSTEM, device_commands.Button_14, 776)	
-----------------------------------------------------------------
-- Internal canopy actuator disengage lever
elements["CANOPY-DISENGAGE-LEVER-PTR"]	= 	{class  	= {class_type.TUMB, class_type.TUMB},
										 hint   	= _("Internal canopy actuator disengage lever"), 
										 device 	= devices.CPT_MECH,
										 action 	= {device_commands.Button_13, device_commands.Button_13},
										 arg 		= {777, 777},
										 arg_value 	= {1, -1},
										 arg_lim 	= {{0, 1}, {0, 1}},
										 updatable  = true, 
										 gain 		= {0.1, 0.1},
									     animated 	= {true, true},
										 animation_speed = {6.5, 6.5},
										 cycle = true,
										 }		
-----------------------------------------------------------------
-- Canopy jettison lever						
elements["PTR-CNP-JETTARM"]	= 	{class  	= {class_type.TUMB, class_type.TUMB},
										 hint   	= _("Canopy jettison lever"), 
										 device 	= devices.CPT_MECH,
										 action 	= {device_commands.Button_14, device_commands.Button_14},
										 arg 		= {785, 785},
										 arg_value 	= {1, -1},
										 arg_lim 	= {{0, 1}, {0, 1}},
										 updatable  = true, 
										 gain 		= {0.1, 0.1},
										 animated 	= {true, true},
										 animation_speed = {15.0, 15.0},
										 }										

elements["PTR-CNP-JETT-BTN"]  = default_2_position_tumb(_("Canopy Jettison Lever Unlock Button") , devices.CPT_MECH, device_commands.Button_15, 786)

-----------------------------------------------------------------
-- Antenna Select Panel						
elements["PTR-ANTSP-IFF"] = multiposition_switch(_("IFF antenna switch") , devices.IFF, device_commands.Button_19, 706, 3, 0.5)
elements["PTR-ANTSP-UHF"] = multiposition_switch(_("UHF antenna switch") , devices.UHF_RADIO, device_commands.Button_16, 707, 3, 0.5)
elements["PTR-ANTSP-EGI-HQ-TOD"] = default_2_position_tumb(_("EGI HQ TOD") , devices.UHF_RADIO, device_commands.Button_17, 708)		
									
----------------------------------------
-- RWR
elements["PNT-LVR-RWR"]	= default_axis_limited(_("Adjust Display Brightness"), devices.AN_ALR69V, device_commands.Button_1, 16, 0.1, false, false, {0.15, 0.85})

------------------------------------------------------------------					 
for i,o in pairs(elements) do
	if  o.class[1] == class_type.TUMB or 
	   (o.class[2]  and o.class[2] == class_type.TUMB) or
	   (o.class[3]  and o.class[3] == class_type.TUMB)  then
	   o.updatable = true
	   o.use_OBB   = true
	end
end



--Mirrors
elements["PNT-MIRROR-LEFT"]  = default_2_position_tumb(_("Toggle Mirrors"),0,3001,719)
elements["PNT-MIRROR-FRONT"] = default_2_position_tumb(_("Toggle Mirrors"),0,3001,719)
elements["PNT-MIRROR-RIGHT"] = default_2_position_tumb(_("Toggle Mirrors"),0,3001,719)
