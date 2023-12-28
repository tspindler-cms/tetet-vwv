dofile(LockOn_Options.script_path.."config.lua")
shape_name   = shape
if not new_shape then
	shift    = {-0.228, 5.0, 0}
	rotation = math.rad(5.17)
end

ambient_light    = {255,255,255}

ambient_color_day_texture    = {72, 100, 160}
ambient_color_night_texture  = {40, 60 ,150}

ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}

dusk_border					 = 0.4

draw_old_cockpit			 = false
draw_pilot					 = false

external_model_canopy_arg	 = 38
external_model_canopy_trucks_arg = 118

-- main panel shaking
shake_filter_Y_Left_ = {IsHPF = false, B = 1/6.0, C = 1.0, Freq0 = 7.7, K = 0.02}
shake_filter_Y_Right_ = {IsHPF = false, B = 1/6.2, C = 1.0, Freq0 = 8.0, K = 0.023}
shake_filter_Z_ = {IsHPF = false, B = 1/4.0, C = 1.0, Freq0 = 7.5, K = 0.02}
		
rot_x_k = 1.0
cross_accel = 0.5

shaking_dt 			= 0.01

--use_external_views = true
cockpit_local_point = {10.5, 1.075, 0.00}	----1.599, 0.675, 0.0

day_texture_set_value   = 0.0
night_texture_set_value = 0.1

---------------------------------------------------------------
-- CONTROLLERS
---------------------------------------------------------------

local controllers = LoRegisterPanelControls()
mirrors_data = 
{
    center_point 	= {0.488,0.139,0}, 
    width 		 	= 0.35, --integrated (keep in mind that mirrors can be none planar )
    aspect 		 	= 3.0,
	rotation 	 	= math.rad(1);
	animation_speed = 2.0;
	near_clip 		= 0.1;
	middle_clip		= 10;
	far_clip		= 60000;
}

mirrors_draw                    = CreateGauge()
mirrors_draw.arg_number    		= 183
mirrors_draw.input   			= {0,1}
mirrors_draw.output   			= {1,0}
mirrors_draw.controller         = controllers.mirrors_draw

draw_arcade					 = LockOn_Options.flight.easy_radar or LockOn_Options.flight.auto_lockon


args_initial_state = {}

if not LockOn_Options.cockpit.mirrors then
   args_initial_state[183] = 1.0
end

Panel_Shake_Z  				= CreateGauge()
Panel_Shake_Z.arg_number	= 181
Panel_Shake_Z.input			= {-1,1}
Panel_Shake_Z.output		= {-0.8,0.8}
Panel_Shake_Z.controller	= controllers.Panel_Shake_Z

Panel_Shake_Y  				= CreateGauge()
Panel_Shake_Y.arg_number	= 180
Panel_Shake_Y.input			= {-1,1}
Panel_Shake_Y.output		= {-0.8,0.8}
Panel_Shake_Y.controller	= controllers.Panel_Shake_Y

Panel_Rot_X  				= CreateGauge()
Panel_Rot_X.arg_number		= 189
Panel_Rot_X.input			= {-1,1}
Panel_Rot_X.output			= {-0.5,0.5}
Panel_Rot_X.controller		= controllers.Panel_Rot_X

Canopy_Trucks  				= CreateGauge()
Canopy_Trucks.arg_number	= 162
Canopy_Trucks.input			= {0,1}
Canopy_Trucks.output		= {0,1}
Canopy_Trucks.controller	= controllers.Canopy_Trucks

Canopy_Visibility  				= CreateGauge()
Canopy_Visibility.arg_number	= 163
Canopy_Visibility.input			= {0,1}
Canopy_Visibility.output		= {0,1}
Canopy_Visibility.controller	= controllers.Canopy_Visibility

Canopy_Crank				= CreateGauge()
Canopy_Crank.arg_number		= 147
Canopy_Crank.input			= {0.0, 1.0}
Canopy_Crank.output			= {0.0, 1.0}
Canopy_Crank.controller		= controllers.Canopy_Crank

--=================================================
-- Stick
StickPitch						= CreateGauge()
StickPitch.arg_number			= 50
StickPitch.input				= {-1, 1}
StickPitch.output				= { 1, -1}
StickPitch.controller			= controllers.StickPitch

StickBank						= CreateGauge()
StickBank.arg_number			= 51
StickBank.input					= {-1, 1}
StickBank.output				= {1, -1}
StickBank.controller			= controllers.StickBank

--=================================================
-- RudderPedals
RudderPedals					= CreateGauge()
RudderPedals.arg_number			= 54
RudderPedals.input				= {-1, 1}
RudderPedals.output				= {-1, 1}
RudderPedals.controller			= controllers.RudderPosition

Left_Wheel_Brake				= CreateGauge()
Left_Wheel_Brake.arg_number		= 55
Left_Wheel_Brake.input			= {0, 1}
Left_Wheel_Brake.output			= {0, 1}
Left_Wheel_Brake.controller		= controllers.Left_Wheel_Brake

Right_Wheel_Brake				= CreateGauge()
Right_Wheel_Brake.arg_number	= 56
Right_Wheel_Brake.input			= {0, 1}
Right_Wheel_Brake.output		= {0, 1}
Right_Wheel_Brake.controller	= controllers.Right_Wheel_Brake

--[[Throttle
Throttle					= CreateGauge()
Throttle.arg_number			= 43
Throttle.input				= {0, 1}
Throttle.output				= {0, 1}
Throttle.controller			= controllers.ThrottlePosition

--Propeller control
PropellerRPM				= CreateGauge()
PropellerRPM.arg_number		= 46
PropellerRPM.input			= {0, 1}
PropellerRPM.output			= {0, 1}
PropellerRPM.controller		= controllers.PropellerRPMPosition]]

-- Flight Instruments
AirspeedNeedle				= CreateGauge()
AirspeedNeedle.arg_number	= 11
AirspeedNeedle.input		= {0,   50,   100,  150,  200, 250,  300, 350,  400, 450,  500, 550,  600, 650,  700}
AirspeedNeedle.output		= {0.0, 0.05, 0.10, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7}
AirspeedNeedle.controller	= controllers.AirspeedNeedle

Variometer					= CreateGauge()
Variometer.arg_number		= 29
Variometer.input			= {-6000, -4000, -2000, 2000, 4000, 6000}
Variometer.output			= {-0.6, -0.4, -0.2, 0.2, 0.4, 0.6}
Variometer.controller		= controllers.VariometerNeedle

-- Altimeter
Altimeter_10000_footPtr				= CreateGauge()
Altimeter_10000_footPtr.arg_number	= 96
Altimeter_10000_footPtr.input		= {0.0, 100000.0}
Altimeter_10000_footPtr.output		= {0.0, 1.0}
Altimeter_10000_footPtr.controller	= controllers.Altimeter_10000_feet

Altimeter_1000_footPtr				= CreateGauge()
Altimeter_1000_footPtr.arg_number	= 24
Altimeter_1000_footPtr.input		= {0.0, 10000.0}
Altimeter_1000_footPtr.output		= {0.0, 1.0}
Altimeter_1000_footPtr.controller	= controllers.Altimeter_1000_feet

Altimeter_100_footPtr				= CreateGauge()
Altimeter_100_footPtr.arg_number	= 25
Altimeter_100_footPtr.input			= {0.0, 1000.0}
Altimeter_100_footPtr.output		= {0.0, 1.0}
Altimeter_100_footPtr.controller	= controllers.Altimeter_100_feet

Altimeter_Pressure					= CreateGauge()
Altimeter_Pressure.arg_number		= 97
Altimeter_Pressure.input			= {28.1, 31.0}
Altimeter_Pressure.output			= {0.0, 1.0}
Altimeter_Pressure.controller		= controllers.Altimeter_Pressure

-- Artificial horizon
AHorizon_Pitch					= CreateGauge()
AHorizon_Pitch.arg_number		= 15
AHorizon_Pitch.input			= {-math.pi / 3.0, math.pi / 3.0}
AHorizon_Pitch.output			= {1.0, -1.0}
AHorizon_Pitch.controller		= controllers.Horizon_Pitch

AHorizon_Bank					= CreateGauge()
AHorizon_Bank.arg_number		= 14
AHorizon_Bank.input				= {-math.pi, math.pi}
AHorizon_Bank.output			= {1.0, -1.0}
AHorizon_Bank.controller		= controllers.Horizon_Bank

AHorizon_PitchShift				= CreateGauge()
AHorizon_PitchShift.arg_number	= 16
AHorizon_PitchShift.input		= {-10.0 * math.pi/180.0, 10.0 * math.pi/180.0}
AHorizon_PitchShift.output		= {-1.0, 1.0}
AHorizon_PitchShift.controller	= controllers.Horizon_Pitch_Shift

AHorizon_Caged					= CreateGauge()
AHorizon_Caged.arg_number		= 20
AHorizon_Caged.input			= {0.0, 1.0}
AHorizon_Caged.output			= {0.0, 1.0}
AHorizon_Caged.controller		= controllers.Horizon_Caged

--directional gyro
GyroHeading					= CreateGauge()
GyroHeading.arg_number		= 12
GyroHeading.input			= {0.0, 2.0 * math.pi}
GyroHeading.output			= {0.0, 1.0}
GyroHeading.controller		= controllers.GyroHeading

valMaxTurn = math.rad(3)
--turn indicator
TurnNeedle				= CreateGauge()
TurnNeedle.arg_number	= 27
TurnNeedle.input		= {-valMaxTurn, valMaxTurn}
TurnNeedle.output		= {-1.0, 1.0}
TurnNeedle.controller	= controllers.TurnNeedle

Slipball				= CreateGauge()
Slipball.arg_number		= 28
Slipball.input			= {-1.0, 1.0}
Slipball.output			= {-1.0, 1.0}
Slipball.controller		= controllers.Slipball

--oxygen pressure indicator
Oxygen_Pressure					= CreateGauge()
Oxygen_Pressure.arg_number		= 34
Oxygen_Pressure.input			= {0.0, 500.0}
Oxygen_Pressure.output			= {0.0, 1.0}
Oxygen_Pressure.controller		= controllers.Oxygen_Pressure

Oxygen_Flow_Blinker				= CreateGauge()
Oxygen_Flow_Blinker.arg_number	= 33
Oxygen_Flow_Blinker.input		= {0.0, 1.0}
Oxygen_Flow_Blinker.output		= {0.0, 1.0}
Oxygen_Flow_Blinker.controller	= controllers.Oxygen_Flow_Blinker

--fuel system
Fuel_Tank_Left				= CreateGauge() 
Fuel_Tank_Left.arg_number	= 155
Fuel_Tank_Left.input		= {0.0, 5.0, 15.0, 30.0, 45.0, 60.0, 75.0, 92.0} -- US GAL
Fuel_Tank_Left.output		= {0.0, 0.2, 0.36, 0.52, 0.65, 0.77, 0.92, 1.0}
Fuel_Tank_Left.controller	= controllers.Fuel_Tank_Left

Fuel_Tank_Right				= CreateGauge()
Fuel_Tank_Right.arg_number	= 156
Fuel_Tank_Right.input		= {0.0, 5.0, 15.0, 30.0, 45.0, 60.0, 75.0, 92.0} -- US GAL
Fuel_Tank_Right.output		= {0.0, 0.2, 0.36, 0.52, 0.65, 0.77, 0.92, 1.0}
Fuel_Tank_Right.controller	= controllers.Fuel_Tank_Right

Fuel_Pressure				= CreateGauge()
Fuel_Pressure.arg_number	= 32
Fuel_Pressure.input			= {0.0, 25.0} -- PSI
Fuel_Pressure.output		= {0.0, 1.0}
Fuel_Pressure.controller	= controllers.Fuel_Pressure
---------------------------------------------------
-- A-11 clock

CLOCK_currtime_hours				= CreateGauge()
CLOCK_currtime_hours.arg_number		= 4
CLOCK_currtime_hours.input			= {0.0, 12.0}
CLOCK_currtime_hours.output			= {0.0, 1.0}
CLOCK_currtime_hours.controller		= controllers.CurrtimeHours

CLOCK_currtime_minutes				= CreateGauge()
CLOCK_currtime_minutes.arg_number	= 5
CLOCK_currtime_minutes.input		= {0.0, 60.0}
CLOCK_currtime_minutes.output		= {0.0, 1.0}
CLOCK_currtime_minutes.controller	= controllers.CurrtimeMinutes

CLOCK_currtime_seconds				= CreateGauge()
CLOCK_currtime_seconds.arg_number	= 6
CLOCK_currtime_seconds.input		= {0.0, 60.0}
CLOCK_currtime_seconds.output		= {0.0, 1.0}
CLOCK_currtime_seconds.controller	= controllers.CurrtimeSeconds

---------------------------------------------------
-- AN5730 remote compass
CompassHeading					= CreateGauge()
CompassHeading.arg_number		= 1
CompassHeading.input			= {0.0, math.pi * 2.0}
CompassHeading.output			= {0.0, 1.0}
CompassHeading.controller		= controllers.CompassHeading

CommandedCourse					= CreateGauge()
CommandedCourse.arg_number		= 2
CommandedCourse.input			= {0.0, math.pi * 2.0}
CommandedCourse.output			= {0.0, 1.0}
CommandedCourse.controller		= controllers.CommandedCourse

CommandedCourseKnob					= CreateGauge()
CommandedCourseKnob.arg_number		= 3
CommandedCourseKnob.input			= {0.0, math.pi * 2.0}
CommandedCourseKnob.output			= {0.0, 1.0}
CommandedCourseKnob.controller		= controllers.CommandedCourseKnob

-------------------------------------------------------
TailRadarWarning			= CreateGauge()
TailRadarWarning.arg_number	= 161
TailRadarWarning.input		= {0.0, 1.0}
TailRadarWarning.output		= {0.0, 1.0}
TailRadarWarning.controller	= controllers.TailRadarWarning

-------------------------------------------------------
--SCR-522A Control panel
A_channel_light					= CreateGauge()
A_channel_light.arg_number		= 122
A_channel_light.input			= {0.0, 1.0}
A_channel_light.output			= {0.0, 1.0}
A_channel_light.controller		= controllers.A_channel_light

B_channel_light					= CreateGauge()
B_channel_light.arg_number		= 123
B_channel_light.input			= {0.0, 1.0}
B_channel_light.output			= {0.0, 1.0}
B_channel_light.controller		= controllers.B_channel_light

C_channel_light					= CreateGauge()
C_channel_light.arg_number		= 124
C_channel_light.input			= {0.0, 1.0}
C_channel_light.output			= {0.0, 1.0}
C_channel_light.controller		= controllers.C_channel_light

D_channel_light					= CreateGauge()
D_channel_light.arg_number		= 125
D_channel_light.input			= {0.0, 1.0}
D_channel_light.output			= {0.0, 1.0}
D_channel_light.controller		= controllers.D_channel_light

Transmit_light					= CreateGauge()
Transmit_light.arg_number		= 126
Transmit_light.input			= {0.0, 1.0}
Transmit_light.output			= {0.0, 1.0}
Transmit_light.controller		= controllers.Transmit_light

-------------------------------------------------------
-- hydraulic pressure
Hydraulic_Pressure				= CreateGauge()
Hydraulic_Pressure.arg_number	= 78
Hydraulic_Pressure.input		= {0.0, 2000.0} -- PSI
Hydraulic_Pressure.output		= {0.0, 1.0}
Hydraulic_Pressure.controller	= controllers.Hydraulic_Pressure

--------------------------------------------------------
-- Landing gears handle
Landing_Gear_Handle				= CreateGauge()
Landing_Gear_Handle.arg_number	= 150
Landing_Gear_Handle.input		= {0.0, 1.0} 
Landing_Gear_Handle.output		= {0.0, 1.0}
Landing_Gear_Handle.controller	= controllers.Landing_Gear_Handle

Landing_Gear_Handle_Indoor				= CreateGauge()
Landing_Gear_Handle_Indoor.arg_number	= 151
Landing_Gear_Handle_Indoor.input		= {0.0, 1.0} 
Landing_Gear_Handle_Indoor.output		= {0.0, 1.0}
Landing_Gear_Handle_Indoor.controller	= controllers.Landing_Gear_Handle_Indoor

LandingGearGreenLight				= CreateGauge()
LandingGearGreenLight.arg_number	= 80
LandingGearGreenLight.input			= {0.0, 1.0} 
LandingGearGreenLight.output		= {0.0, 1.0}
LandingGearGreenLight.controller	= controllers.LandingGearGreenLight

LandingGearRedLight					= CreateGauge()
LandingGearRedLight.arg_number		= 82
LandingGearRedLight.input			= {0.0, 1.0} 
LandingGearRedLight.output			= {0.0, 1.0}
LandingGearRedLight.controller		= controllers.LandingGearRedLight

Manifold_Pressure					= CreateGauge()
Manifold_Pressure.arg_number		= 10
Manifold_Pressure.input				= {10.0, 75.0} 
Manifold_Pressure.output			= {0.0, 1.0}
Manifold_Pressure.controller		= controllers.Manifold_Pressure

Engine_RPM							= CreateGauge()
Engine_RPM.arg_number				= 23
Engine_RPM.input					= {0.0, 4500.0} 
Engine_RPM.output					= {0.0, 1.0}
Engine_RPM.controller				= controllers.Engine_RPM

Vacuum_Suction						= CreateGauge()
Vacuum_Suction.arg_number			= 9
Vacuum_Suction.input				= {0.0, 10.0} 
Vacuum_Suction.output				= {0.0, 1.0}
Vacuum_Suction.controller			= controllers.Vacuum_Suction

Carb_Temperature					= CreateGauge()
Carb_Temperature.arg_number			= 21
Carb_Temperature.input				= {-80, 150} 
Carb_Temperature.output				= {-0, 1}
Carb_Temperature.controller			= controllers.Carb_Temperature

Coolant_Temperature					= CreateGauge()
Coolant_Temperature.arg_number		= 22
Coolant_Temperature.input			= {-80, 150} 
Coolant_Temperature.output			= {0, 1}
Coolant_Temperature.controller		= controllers.Coolant_Temperature

Oil_Temperature						= CreateGauge()
Oil_Temperature.arg_number			= 30
Oil_Temperature.input				= {0.0, 100.0} 
Oil_Temperature.output				= {0, 1.0}
Oil_Temperature.controller			= controllers.Oil_Temperature

Oil_Pressure						= CreateGauge()
Oil_Pressure.arg_number				= 31
Oil_Pressure.input					= {0.0, 200.0} 
Oil_Pressure.output					= {0, 1.0}
Oil_Pressure.controller				= controllers.Oil_Pressure

Left_Fluor_Light					= CreateGauge()
Left_Fluor_Light.arg_number			= 164
Left_Fluor_Light.input				= {0.0, 1.0} 
Left_Fluor_Light.output				= {0.0, 1.0}
Left_Fluor_Light.controller			= controllers.Left_Fluor_Light

Right_Fluor_Light					= CreateGauge()
Right_Fluor_Light.arg_number		= 165
Right_Fluor_Light.input				= {0.0, 1.0} 
Right_Fluor_Light.output			= {0.0, 1.0}
Right_Fluor_Light.controller		= controllers.Right_Fluor_Light

Hight_Blower_Lamp				= CreateGauge()
Hight_Blower_Lamp.arg_number	= 59
Hight_Blower_Lamp.input			= {0.0, 1.0}
Hight_Blower_Lamp.output		= {0.0, 1.0}
Hight_Blower_Lamp.controller	= controllers.Hight_Blower_Lamp

Aileron_Trimmer				= CreateGauge()
Aileron_Trimmer.arg_number	= 170
Aileron_Trimmer.input		= {-1.0, 1.0}
Aileron_Trimmer.output		= {-1.0, 1.0}
Aileron_Trimmer.controller	= controllers.Aileron_Trimmer

Rudder_Trimmer				= CreateGauge()
Rudder_Trimmer.arg_number	= 172
Rudder_Trimmer.input		= {-1.0, 1.0}
Rudder_Trimmer.output		= {-1.0, 1.0}
Rudder_Trimmer.controller	= controllers.Rudder_Trimmer

Elevator_Trimmer			= CreateGauge()
Elevator_Trimmer.arg_number	= 171
Elevator_Trimmer.input		= {-1.0, 1.0}
Elevator_Trimmer.output		= {-1.0, 1.0}
Elevator_Trimmer.controller	= controllers.Elevator_Trimmer

Control_Lock_Bracket			= CreateGauge()
Control_Lock_Bracket.arg_number	= 174
Control_Lock_Bracket.input		= {0.0, 1.0}
Control_Lock_Bracket.output		= {0.0, 1.0}
Control_Lock_Bracket.controller	= controllers.Control_Lock_Bracket

Accelerometer_main				= CreateGauge()
Accelerometer_main.arg_number	= 175
Accelerometer_main.input		= {-5.0, 12.0}
Accelerometer_main.output		= {0.0, 1.0}
Accelerometer_main.controller	= controllers.Accelerometer_main

Accelerometer_min				= CreateGauge()
Accelerometer_min.arg_number	= 177
Accelerometer_min.input			= {-5.0, 12.0}
Accelerometer_min.output		= {0.0, 1.0}
Accelerometer_min.controller	= controllers.Accelerometer_min

Accelerometer_max				= CreateGauge()
Accelerometer_max.arg_number	= 178
Accelerometer_max.input			= {-5.0, 12.0}
Accelerometer_max.output		= {0.0, 1.0}
Accelerometer_max.controller	= controllers.Accelerometer_max

Ammeter							= CreateGauge()
Ammeter.arg_number				= 101
Ammeter.input					= {0.0, 150.0}
Ammeter.output					= {0.0, 1.0}
Ammeter.controller				= controllers.AmmeterIndicator

Left_cockpit_light              = CreateGauge()
Left_cockpit_light.arg_number   = 185
Left_cockpit_light.input		= {0.0, 1.0}
Left_cockpit_light.output		= {0.0, 1.0}
Left_cockpit_light.controller	= controllers.Left_cockpit_light

Right_cockpit_light             = CreateGauge()
Right_cockpit_light.arg_number  = 186
Right_cockpit_light.input		= {0.0, 1.0}
Right_cockpit_light.output		= {0.0, 1.0}
Right_cockpit_light.controller	= controllers.Right_cockpit_light

warEmergencyPowerLimWire            = CreateGauge()
warEmergencyPowerLimWire.arg_number = 190
warEmergencyPowerLimWire.input		= {0.0, 1.0}
warEmergencyPowerLimWire.output		= {0.0, 1.0}
warEmergencyPowerLimWire.controller = controllers.warEmergencyPowerLimWire

pilot_draw                      = CreateGauge()
pilot_draw.arg_number    		= 540
pilot_draw.input				= {0.0, 1.0}
pilot_draw.output				= {0.0, 1.0}
pilot_draw.controller			= controllers.pilot_draw

Z_test =
{
	near = 0.05,
	far  = 4.0,
}

need_to_be_closed = true -- close lua state after initialization 

dofile(LockOn_Options.common_script_path.."tools.lua")
livery = find_custom_livery("TF-51D","default")