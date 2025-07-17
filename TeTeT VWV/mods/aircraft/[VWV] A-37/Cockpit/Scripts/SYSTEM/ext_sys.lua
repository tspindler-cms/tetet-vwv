dofile(LockOn_Options.script_path .. "command_defs.lua")
local ext_sys = GetSelf()
local update_time_step = 0.02
make_default_activity(update_time_step)
local sensor_data = get_base_data()
function update()
  local aoa = sensor_data:getAngleOfAttack()
  local speed = sensor_data:getSelfVelocity()
  local sas = sensor_data:getSelfAirspeed()
  local tas = sensor_data:getTrueAirSpeed()
  local ias = sensor_data:getIndicatedAirSpeed()
  local mach = sensor_data:getMachNumber()
  local vv = sensor_data:getVerticalVelocity()
  local gforce = sensor_data:getVerticalAcceleration()
  local balt = sensor_data:getBarometricAltitude()
  local ralt = sensor_data:getRadarAltitude()
  local pitch = sensor_data:getStickRollPosition() / 100
  local roll = sensor_data:getStickPitchPosition() / 100
  local rudder = sensor_data:getRudderPosition() / 100
  local throttle = sensor_data:getThrottleLeftPosition()
  local gear = sensor_data:getLandingGearHandlePos()
  local speedbrake = sensor_data:getSpeedBrakePos()
  local rpm = sensor_data:getEngineLeftRPM()
  local flaps = sensor_data:getFlapsPos()
  local cpy_state = sensor_data:getCanopyState()
  local cpy_pos = sensor_data:getCanopyPos()
  local wown = sensor_data:getWOW_NoseLandingGear()
  local wowl = sensor_data:getWOW_LeftMainLandingGear()
  local wowr = sensor_data:getWOW_RightMainLandingGear()
  local gun_fire = get_aircraft_draw_argument_value(350)
  local wing_fold = get_aircraft_draw_argument_value(8)
  local nlg_dump = get_aircraft_draw_argument_value(1)
  local boom = get_aircraft_draw_argument_value(22)
  local lbar = get_aircraft_draw_argument_value(85)
  local stall = 0
  if aoa > 0.25 and ias < 400 then
    stall = 1
  end
  if stall == 1 and flaps == 0 then
    dispatch_action(nil, 72)
  end
  if flaps > 0 then
    set_aircraft_draw_argument_value(13, flaps * 2)
    set_aircraft_draw_argument_value(14, flaps * 2)
  end
  if roll < 0 then
    set_aircraft_draw_argument_value(123, roll * -0.693)
  elseif roll > 0 then
    set_aircraft_draw_argument_value(120, roll * 0.693)
  else
    set_aircraft_draw_argument_value(123, 0)
    set_aircraft_draw_argument_value(120, 0)
  end
  if gear > 0 then
    dispatch_action(nil, 148)
  end
  if gun_fire > 0 then
    set_aircraft_draw_argument_value(351, gun_fire)
  end
  if throttle < 0.02 and cpy_state == 1 then
    dispatch_action(nil, 74)
  end
  if throttle > 0.92 and wown == 0 then
    dispatch_action(nil, 1033)
  elseif throttle > 0.92 and ralt > 2.5 then
    dispatch_action(nil, 1033)
  elseif throttle > 0.92 and flaps ~= 0.5 then
    dispatch_action(nil, 1033)
  end
  if throttle > 0.95 and wown == 1 then
    set_aircraft_draw_argument_value(85, nlg_dump * 1.5)
  else
    set_aircraft_draw_argument_value(85, 0)
  end
  if aoa < 0.15 then
    set_aircraft_draw_argument_value(84, 0.15)
  elseif aoa > 0.15 and aoa < 0.19 then
    set_aircraft_draw_argument_value(84, 0.3)
  elseif aoa > 0.19 then
    set_aircraft_draw_argument_value(84, 0.5)
  end
  if wing_fold == 1 then
    set_aircraft_draw_argument_value(323, cpy_pos * 1.5)
  else
    set_aircraft_draw_argument_value(323, 0)
  end
  if ralt < 300 then
    dispatch_action(nil, 252)
  end
end
need_to_be_closed = false
