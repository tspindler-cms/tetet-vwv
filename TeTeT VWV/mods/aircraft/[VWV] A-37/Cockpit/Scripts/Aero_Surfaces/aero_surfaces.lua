dofile(LockOn_Options.script_path .. "command_defs.lua")

local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step)

local sensor_data = get_base_data()

--listen to inputs

dev:listen_command(68)
dev:listen_command(69)
dev:listen_command(70)
dev:listen_command(72)
dev:listen_command(73)
dev:listen_command(76)
dev:listen_command(145)
dev:listen_command(146)
dev:listen_command(147)
dev:listen_command(148)
dev:listen_command(328)
dev:listen_command(430)
dev:listen_command(431)
dev:listen_command(606)

--input values
--ailerons
local stick_input_roll = 0
local aileron_start_pos = 0
local aileron_actual_pos = 0
local aileron_target_pos = 0
local aileron_corrected_pos = 0
local aileron_speed = 0.75

--elevator
local stick_input_pitch = 0
local elevator_start_pos = 0
local elevator_actual_pos = 0
local elevator_target_pos = 0
local elevator_corrected_pos = 0
local elevator_speed = 0.65

--rudder
local stick_input_yaw = 0
local rudder_start_pos = 0
local rudder_target_pos = 0
local rudder_actual_pos = 0
local rudder_corrected_pos = 0
local rudder_speed = 0.55

local aero_input_airbrake = 0
local airbrake_position = 0
local airbrake_start_pos = 0
local airbrake_target_pos = 0
local airbrake_actual_pos = 0
local airbrake_corrected_pos = 0
local airbrake_speed = 0.025

local aero_input_flaps = 0
local flaps_position = 0
local flaps_start_pos = 0
local flaps_actual_pos = 0
local flaps_target_pos = 0
local flaps_corrected_pos = 0
local flaps_speed = 0.05


local aero_input_parachute = 0

local aero_input_dummy_1 = 0
local aero_input_dummy_2 = 0
local aero_input_dummy_2 = 0

local systems_input_hook = 0
local systems_input_foldWing = 0
local systems_input_headlights = 0
local systems_input_nosewheel = 0

local systems_input_throttle = 0
local systems_input_throttle_left = 0
local systems_input_throttle_right = 0

--position values
--local plane_rudder_position = 0
local plane_aileron_left_position = 0
local plane_aileron_right_position = 0
local plane_airbrake_position = 0
local plane_front_gear_position = 0
local plane_left_gear_position = 0
local plane_right_gear_positon = 0

local plane_gear_position = 0
local plane_gear_target_pos = 0
local plane_gear_actual_pos = 0
local plane_gear_starting_pos = 0
local plane_gear_speed = 0.015
local new_gear_pos = 0
local front_gear_pos = 0

local plane_chute_positon = 0
local plane_hook_positon = 0
local plane_flap_left_positon = 0
local plane_flap_right_position = 0

local nosewheel_position = 0
local nosewheel_actual_positon = 0
local nosewheel_target_position = 0
local nosewheel_corrected_position = 0
local nosewheel_starting_position = 0
local nosewheel_speed = 0.45

--helper variales
local counter_one = 0




--Sammeln der Eingabedaten
function collecting_input_values()

	stick_input_pitch = sensor_data:getStickRollPosition() / 100
	stick_input_roll = sensor_data:getStickPitchPosition() / 100
	stick_input_yaw = sensor_data:getRudderPosition() / 100
	
	systems_input_throttle = sensor_data:getThrottleLeftPosition()
	systems_input_throttle_left = sensor_data:getThrottleLeftPosition()
	systems_input_throttle_right = sensor_data:getThrottleRightPosition()
	
	--plane_gear_position =  sensor_data:getLandingGearHandlePos()
	plane_airbrake_position = sensor_data:getSpeedBrakePos()
	plane_chute_positon = get_aircraft_draw_argument_value(35) --0.0 ret. 0.5 mid 1.0 ext
end

function keys_gear_toggle(value)
	
	--print_message_to_user("Keys Gear Toggle pressed")

	if(plane_gear_position == 0.0)then
		
		plane_gear_position = 1.0
			
	else
		
		plane_gear_position = 0.0
	
	end
	
	--print_message_to_user("Front Gear/Actual Position is: "..tostring(front_gear_pos))
	--print_message_to_user("Gear Target Position is: "..tostring(plane_gear_target_pos))
	--print_message_to_user("plane_gear_position is: "..tostring(plane_gear_position))
	--print_message_to_user("new_gear_position is: "..tostring(new_gear_pos))
end

function keys_gear_up(value)

	--print_message_to_user("Keys Gear UP pressed")
	
	if(plane_gear_position == 1.0)then
		plane_gear_position = 0.0
		
	end
		
end

function keys_gear_down(value)

	--print_message_to_user("Keys Gear DOWN pressed")
	
	if(plane_gear_position == 0.0)then
		plane_gear_position = 1.0
		
	end
	
end

function keys_hook_toggle(value)
end

function keys_airbrake_extend(value)

	if(airbrake_position ~= 1.0)then
		airbrake_position = 1.0
	end
	
end

function keys_airbrake_rertract(value)

	if(airbrake_position ~= 0.0)then
		airbrake_position = 0.0
	end
end

function keys_airbrak_toggle(value)

	if(airbrake_position == 0.0)then
		airbrake_position = 1.0
	else
		airbrake_position = 0.0
	end
	
end

function keys_flaps_toggle_down_down_up(value)
--print_message_to_user("Flaps toggle activated")

	if(flaps_position == 0.0)then
		flaps_position = 0.5
	elseif(flaps_position == 0.5)then
		flaps_position = 1.0
	else
		flaps_position = 0.0
	end
	

end

function keys_flaps_full_down(value)
--print_message_to_user("Flaps full down!")

	if(flaps_position ~= 1.0)then
		flaps_position = 1.0
	end
	
end

function keys_flaps_retract(value)

	if(flaps_position ~= 0.0) then
		flaps_position = 0.0
	end
	
end

function keys_fold_wing_toggle(value)
end

function keys_parachute_toggle(value)
end

function keys_nosewheel_steering(value)

	if(nosewheel_position == 0.0)then
		nosewheel_position = 1.0
	else
		nosewheel_position = 0.0
	end
	
end


command_table = {

	--[Keys.iCommandPlaneGear]	= keys_gear_toggle,
	[68]	= keys_gear_toggle,
	[430]	= keys_gear_up,
	[431]	= keys_gear_down,
	
	[69]	= keys_hook_toggle,
	[70]	= keys_fold_wing_toggle,
	[72]	= keys_flaps_toggle_down_down_up,
	[73]	= keys_airbrak_toggle,
	[76]	= keys_parachute_toggle,
	[145]	= keys_flaps_full_down,
	[146]	= keys_flaps_retract,
	[147]	= keys_airbrake_extend,
	[148]	= keys_airbrake_rertract,
	[328]	= keys_headlights_toggle,
	[606]	= keys_nosewheel_steering,
		    
}

function SetCommand(command, value)

	if command_table[command] then
        command_table[command](value)
    end
	
	--if command == 68 then
	--	keys_gear_toggle(value)
	--	print_message_to_user("Gear is traveling.")
	--end

end

function post_initialize()
	
	
	local birth = LockOn_Options.init_conditions.birth_place
    if (birth == "GROUND_COLD") or (birth == "GROUND_HOT") then
		
		--print_message_to_user("Ground Hot/Cold Start.")
		
		plane_gear_position = 1
		plane_gear_target_pos = 1
		plane_gear_actual_pos = 1
		plane_gear_starting_pos = 1
		
		
		set_aircraft_draw_argument_value(0, 1)
		set_aircraft_draw_argument_value(3, 1)
		set_aircraft_draw_argument_value(5, 1)
		
		
		----print_message_to_user("Electricity OFF and initialized.")
    else
        
		plane_gear_position = 0
		plane_gear_target_pos = 0
		plane_gear_actual_pos = 0
		plane_gear_starting_pos = 0
		
		
		set_aircraft_draw_argument_value(0, 0)
		set_aircraft_draw_argument_value(3, 0)
		set_aircraft_draw_argument_value(5, 0)
		
		--print_message_to_user("Electricity ON and initialized.")
    end

end

function updating_external_draw_arguments()



end

function servo_action(start_pos, end_pos, speed)

local x_start_pos = start_pos -- 0,15
local x_end_pos = end_pos -- 1.0
local x_speed = speed -- 0.15
local delta_pos = math.abs(x_start_pos - x_end_pos) -- 0,85
local step = 0

	--if(x_start_pos ~= x_pos)then
	if(x_start_pos ~= x_end_pos)then
		--step = delta_pos / x_speed -- 0.33/1.5 = 0.22
		step = x_speed * delta_pos
	else
		-- chill since end_position is starting_position
	end

	if(x_start_pos > x_end_pos)then
		return x_start_pos - step
	elseif(x_start_pos < x_end_pos)then
		return x_start_pos + step
	else
		--chill since both are equal
		return x_start_pos
	end
	

end

function counter()

	if(counter_one < 25)then
		counter_one = counter_one + 1.0
	else
		counter_one = 0
	end
	
end

function aileron_movement()
	
	aileron_start_pos = get_aircraft_draw_argument_value(11)
	aileron_target_pos = stick_input_roll
	
	if(aileron_target_pos ~= aileron_actual_pos) then
		aileron_corrected_pos = servo_action(aileron_start_pos, aileron_target_pos, aileron_speed)
	end
	
	set_aircraft_draw_argument_value(11, aileron_corrected_pos)
	set_aircraft_draw_argument_value(12, -aileron_corrected_pos)


end

function rudder_movement()
	
	rudder_start_pos = get_aircraft_draw_argument_value(17,2)
	rudder_target_pos = stick_input_yaw
	
	if(rudder_target_pos ~= rudder_actual_pos)then
		rudder_corrected_pos = servo_action(-rudder_start_pos, rudder_target_pos, rudder_speed)
	end
	
	set_aircraft_draw_argument_value(17, -1.0 * rudder_corrected_pos)
	set_aircraft_draw_argument_value( 2, -1.0 * rudder_corrected_pos)	
	
	--if(counter_one == 0) or (counter_one == 1) or (counter_one == 2)then
	--print_message_to_user("##########################")
	--print_message_to_user("Rudder Start Position is: "..tostring(rudder_start_pos))
	--print_message_to_user("Rudder End Position is: "..tostring(rudder_target_pos))
	--print_message_to_user("Rudder Speed is: "..tostring(rudder_speed))
	--print_message_to_user("##########################")
	--end
	
end

function elevator_movement()

	elevator_start_pos = get_aircraft_draw_argument_value(15)
	elevator_target_pos = stick_input_pitch
	
	if(elevator_target_pos ~= elevator_actual_pos)then
		elevator_corrected_pos = servo_action(elevator_start_pos, elevator_target_pos, elevator_speed)
	end
	
	set_aircraft_draw_argument_value(15, elevator_corrected_pos)
	set_aircraft_draw_argument_value(16, elevator_corrected_pos)

end

function gear_movement()
	
	
	plane_gear_starting_pos = get_aircraft_draw_argument_value(0)
	plane_gear_target_pos = plane_gear_position
	
	if(plane_gear_target_pos ~= plane_gear_actual_pos)then
		new_gear_pos = servo_action(plane_gear_starting_pos, plane_gear_target_pos, plane_gear_speed)
	
	end
	
	if(new_gear_pos >= 0.0) and (new_gear_pos <= 1.0) then
		set_aircraft_draw_argument_value(0, new_gear_pos)
		set_aircraft_draw_argument_value(3, new_gear_pos)
		set_aircraft_draw_argument_value(5, new_gear_pos)
	elseif(plane_gear_target_pos == 1.0)then
		set_aircraft_draw_argument_value(0, plane_gear_target_pos)
		set_aircraft_draw_argument_value(3, plane_gear_target_pos)
		set_aircraft_draw_argument_value(5, plane_gear_target_pos)
	elseif(plane_gear_target_pos == 0.0)then
		set_aircraft_draw_argument_value(0, plane_gear_target_pos)
		set_aircraft_draw_argument_value(3, plane_gear_target_pos)
		set_aircraft_draw_argument_value(5, plane_gear_target_pos)
	end
	
end

function flaps_movement()
	flaps_start_pos = get_aircraft_draw_argument_value(9)
	flaps_target_pos = flaps_position
	
	if(flaps_target_pos ~= flaps_actual_pos)then
		flaps_corrected_pos = servo_action(flaps_start_pos, flaps_target_pos, flaps_speed)
	end
	
	set_aircraft_draw_argument_value(9, flaps_corrected_pos)
	set_aircraft_draw_argument_value(10, flaps_corrected_pos)


end

function airbrake_movement()

	airbrake_target_pos = airbrake_position
	airbrake_start_pos = get_aircraft_draw_argument_value(120)
	
	if(airbrake_target_pos ~= airbrake_actual_pos)then
		airbrake_corrected_pos = servo_action(airbrake_start_pos, airbrake_target_pos, airbrake_speed)
	end
	
	set_aircraft_draw_argument_value(120, airbrake_corrected_pos)
	set_aircraft_draw_argument_value(123, airbrake_corrected_pos)	
	
end

function nosewheel_movement()
	nosewheel_target_position = rudder_corrected_pos
	nosewheel_starting_position = get_aircraft_draw_argument_value(2)
	
	if(nosewheel_target_position ~= nosewheel_actual_positon)then
		nosewheel_corrected_position = servo_action(-nosewheel_starting_position, nosewheel_target_position, nosewheel_speed)
	end
	
	set_aircraft_draw_argument_value(2, -nosewheel_corrected_position)

end


function update()

	collecting_input_values()
	aileron_movement()
	rudder_movement()
	elevator_movement()
	
	if(plane_gear_position ~= plane_gear_actual_pos)then
	
		gear_movement()
	end
	
	if(airbrake_position ~= airbrake_actual_pos)then
		airbrake_movement()
	end
	
	if(flaps_position ~= flaps_actual_pos)then
	
		flaps_movement()
	end
	
	counter()
	
	if(nosewheel_position == 1.0)then
		nosewheel_movement()
	end
	
	--different travel values
	--Gears
	plane_gear_actual_pos = get_aircraft_draw_argument_value(0)
	
	--plane_gear_actual_pos = (front_gear_pos + right_gear_pos + left_gear_pos) / 3.0


	------------------------------------------------------------
	--Ailerons
	aileron_actual_pos = get_aircraft_draw_argument_value(11)
	
	--Rudder
	rudder_actual_pos = get_aircraft_draw_argument_value(17)
	
	--elevator
	elevator_actual_pos = get_aircraft_draw_argument_value(15)
	
	--Flaps
	flaps_actual_pos = get_aircraft_draw_argument_value(9)
	
	--airbrake
	airbrake_actual_pos = get_aircraft_draw_argument_value(120)
	
	--nosewheel
	nosewheel_actual_positon = get_aircraft_draw_argument_value(2)
	
	--if(counter_one == 0) or (counter_one == 1) or (counter_one == 2)then
		--print_message_to_user("Actual input of roll is: "..tostring(stick_input_roll))
		--print_message_to_user("##########################")
		--print_message_to_user("Actual input of rudder is: "..tostring(stick_input_yaw))
		--print_message_to_user("Rudder Target position is: "..tostring(rudder_target_pos))
		--print_message_to_user("Rudder actual position is :"..tostring(rudder_actual_pos))
		--print_message_to_user("Corrected Rudder Position is: "..tostring(rudder_corrected_pos))
		--print_message_to_user("##########################")
		--print_message_to_user("Front Gear/Actual Position is: "..tostring(front_gear_pos))
		--print_message_to_user("Gear Target Position is: "..tostring(plane_gear_target_pos))
		--print_message_to_user("new_gear_position is: "..tostring(new_gear_pos))
		
	--end
	

end

need_to_be_closed = false


--[[
Command-Nr. from iCommands
PlaneGear								= 68,
PlaneGearUp								= 430,
PlaneGearDown							= 431,
PlaneHook = 69,						-- Гак
PlanePackWing = 70,				-- Складывание крыльев
PlaneFlaps = 72,						-- Закрылки
PlaneAirBrake = 73,					-- Воздушный тормоз
PlaneParachute = 76,					-- Парашют
PlaneFlapsOn = 145,
PlaneFlapsOff = 146,
PlaneAirBrakeOn = 147,
PlaneAirBrakeOff = 148,
PlaneHeadLightOnOff = 328,		-- Вкл/выкл фары на передней стойке шасси
]]


--possible sensor_data 
--called through e.g.: sensor_data.getEngineRPM()
--and cast to a variable like this: GET_ENGINE_RPM = sensor_data.getEngineRPM()
--[[
getAngleOfAttack()
getAngleOfSlide()
getBarometricAltitude()
getCanopyPos()
getCanopyState()
getEngineLeftFuelConsumption()
getEngineLeftRPM()
getEngineLeftTemperatureBeforeTurbine()
getEngineRightFuelConsumption()
getEngineRightRPM()
getEngineRightTemperatureBeforeTurbine()
getFlapsPos()
getFlapsRetracted()
getHeading()
getHorizontalAcceleration()
getIndicatedAirSpeed()
getLandingGearHandlePos()
getLateralAcceleration()
getLeftMainLandingGearDown()
getLeftMainLandingGearUp()
getMachNumber()
getMagneticHeading()
getNoseLandingGearDown()
getNoseLandingGearUp()
getPitch()
getRadarAltitude()
getRateOfPitch()
getRateOfRoll()
getRateOfYaw()
getRightMainLandingGearDown()
getRightMainLandingGearUp()
getRoll()
getRudderPosition()
getSpeedBrakePos()
getSelfAirspeed()
getSelfCoordinates()
getSelfVelocity()
getStickPitchPosition()
getStickRollPosition()
getThrottleLeftPosition()
getThrottleRightPosition()
getTotalFuelWeight()
getTrueAirSpeed()
getVerticalAcceleration()
getVerticalVelocity()
getWOW_LeftMainLandingGear()
getWOW_NoseLandingGear()
getWOW_RightMainLandingGear()
--]]