
dofile(LockOn_Options.script_path .. "command_defs.lua")
local dev = GetSelf()
local update_time_step = 0.02
make_default_activity(update_time_step)
local sensor_data = get_base_data()
update = function()
-- upvalues: sensor_data
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
local stall = 0

if aoa > 0.45 then
  set_aircraft_draw_argument_value(19, aoa / 0.35 - 1)
end
if aoa > 0.45 then
  set_aircraft_draw_argument_value(20, aoa / 0.35 - 1)
end
if aoa < 0.45 then
  set_aircraft_draw_argument_value(19, aoa / 0.35 - 0.0)
end
if aoa < 0.45 then
  set_aircraft_draw_argument_value(20, aoa / 0.35 - 0.0)
end


if aoa > 0.45 then
  set_aircraft_draw_argument_value(13, aoa / 0.35 - 1)
end
if aoa > 0.45 then
  set_aircraft_draw_argument_value(14, aoa / 0.35 - 1)
end
if aoa < 0.45 then
  set_aircraft_draw_argument_value(13, 0)
end
if aoa < 0.45 then
  set_aircraft_draw_argument_value(14,0)
end


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

if gforce > 4.5 then
  set_aircraft_draw_argument_value(7, gforce * 1 - 4.5)
end
if mach > 0.9999 then
  set_aircraft_draw_argument_value(8, mach / 0.99 * 1)
end
if mach > 1.022 then
  set_aircraft_draw_argument_value(8, mach * 0)
end
if mach < 0.99 then
  set_aircraft_draw_argument_value(8, mach * 0)
end
end

need_to_be_closed = false

