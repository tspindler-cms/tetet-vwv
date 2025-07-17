dofile(LockOn_Options.script_path.."config.lua")
shape_name   = shape
if not new_shape then
	shift    = {-0.228, 0.0, 0}
	rotation = math.rad(5.17)
end

--glass_name       = LockOn_Options.script_path.."../Shape/A10C-GLASS" -- prehistoric junk
ambient_light    = {255,255,255}

ambient_color_day_texture    = {72, 100, 160}
ambient_color_night_texture  = {40, 60 ,150}

ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}

dusk_border					 = 0.4

draw_old_cockpit			 = false
draw_pilot					 = false

external_model_canopy_arg	 = 38

--use_external_views = true
cockpit_local_point = {4.3, 1.282, 0.0}

day_texture_set_value   = 0.0
night_texture_set_value = 0.1

mirrors_data = 
{
    center_point 	  = {0.710,0.03,0}, 
    width 			  = 1.4, --integrated (keep in mind that mirrors can be none planar )
    aspect 			  = 0.8/0.3,
	rotation 	 	  = math.rad(1);
	animation_speed   = 2.0;
	arg_value_when_on = 1.0;
}

draw_arcade					 = LockOn_Options.flight.easy_radar or LockOn_Options.flight.auto_lockon

---------------------------------------------------------------
-- CONTROLLERS
---------------------------------------------------------------

local controllers = LoRegisterPanelControls()

--[[
pilot_draw                      = CreateGauge()
pilot_draw.arg_number    		= 540
pilot_draw.input				= {0.0, 1.0}
pilot_draw.output				= {0.0, 1.0}
pilot_draw.controller			= controllers.pilot_draw
--]]

--=================================================
-- Throttle
LeftEngineThrottle				= CreateGauge()
LeftEngineThrottle.arg_number	= 8
LeftEngineThrottle.input		= {0.0, 1.0}
LeftEngineThrottle.output		= {0.0, 1.0}
LeftEngineThrottle.controller	= controllers.LeftEngineThrottle

RightEngineThrottle				= CreateGauge()
RightEngineThrottle.arg_number	= 9
RightEngineThrottle.input		= {0.0, 1.0}
RightEngineThrottle.output		= {0.0, 1.0}
RightEngineThrottle.controller	= controllers.RightEngineThrottle

--=================================================
-- Stick
StickPitch						= CreateGauge()
StickPitch.arg_number			= 10
StickPitch.input				= {-1, 1}
StickPitch.output				= { 1, -1}
StickPitch.controller			= controllers.StickPitch

StickBank						= CreateGauge()
StickBank.arg_number			= 11
StickBank.input					= {-1, 1}
StickBank.output				= {0.45, -0.45}
StickBank.controller			= controllers.StickBank
--=================================================
-- RudderPedals
RudderPedals					= CreateGauge()
RudderPedals.arg_number			= 93
RudderPedals.input				= {-1, 1}
RudderPedals.output				= {-1, 1}
RudderPedals.controller			= controllers.RudderPosition




gear_handle				= CreateGauge()
gear_handle.arg_number	= 716
gear_handle.input		= {0.0, 1}
gear_handle.output		= {0.0, 1}
gear_handle.controller	= controllers.gear_handle_animation



--=================================================
-- Gauges
-- Standby Attitude Indicator
SAI_Pitch					= CreateGauge()
SAI_Pitch.arg_number		= 63
SAI_Pitch.input				= {-math.pi / 2.0, math.pi / 2.0}
SAI_Pitch.output			= {-1.0, 1.0}
SAI_Pitch.controller		= controllers.SAI_Pitch

SAI_Bank					= CreateGauge()
SAI_Bank.arg_number			= 64
SAI_Bank.input				= {-math.pi, math.pi}
SAI_Bank.output				= {-1.0, 1.0}
SAI_Bank.controller			= controllers.SAI_Bank

SAI_attitude_warning_flag				= CreateGauge()
SAI_attitude_warning_flag.arg_number	= 65
SAI_attitude_warning_flag.input			= {0.0, 1.0}
SAI_attitude_warning_flag.output		= {0.0, 1.0}
SAI_attitude_warning_flag.controller	= controllers.SAI_attitude_warning_flag

SAI_manual_pitch_adjustment				= CreateGauge()
SAI_manual_pitch_adjustment.arg_number	= 715
SAI_manual_pitch_adjustment.input	    = {0.0, 1.0}
SAI_manual_pitch_adjustment.output		= {-1.0, 1.0}
SAI_manual_pitch_adjustment.controller	= controllers.SAI_manual_pitch_adjustment

SAI_knob_arrow				= CreateGauge()
SAI_knob_arrow.arg_number	= 717
SAI_knob_arrow.input	    = {0.0, 1.0}
SAI_knob_arrow.output		= {-1.0, 1.0}
SAI_knob_arrow.controller	= controllers.SAI_knob_arrow

--=================================================
-- Gauges
-- Attitude Direction Indicator
ADI_Pitch					= CreateGauge()
ADI_Pitch.arg_number		= 17
ADI_Pitch.input				= {-math.pi / 2.0, math.pi / 2.0}
ADI_Pitch.output			= {1.0, -1.0}
ADI_Pitch.controller		= controllers.ADI_Pitch

ADI_Bank					= CreateGauge()
ADI_Bank.arg_number			= 18
ADI_Bank.input				= {0.0, math.pi * 2.0}--{-math.pi, math.pi}
ADI_Bank.output				= {-1.0, 1.0}
ADI_Bank.controller			= controllers.ADI_Bank

ADI_Slipball				= CreateGauge()
ADI_Slipball.arg_number		= 24
ADI_Slipball.input			= {-1.0, 1.0}
ADI_Slipball.output			= {-1.0, 1.0}
ADI_Slipball.controller		= controllers.ADI_Slipball

ADI_TurnNeedle				= CreateGauge()
ADI_TurnNeedle.arg_number	= 23
ADI_TurnNeedle.input		= {-math.rad(3.0), math.rad(3.0)}
ADI_TurnNeedle.output		= {-1.0, 1.0}
ADI_TurnNeedle.controller	= controllers.ADI_TurnNeedle


ADI_attitude_warning_flag				= CreateGauge()
ADI_attitude_warning_flag.arg_number	= 25
ADI_attitude_warning_flag.input			= {0.0, 1.0}
ADI_attitude_warning_flag.output		= {0.0, 1.0}
ADI_attitude_warning_flag.controller	= controllers.ADI_attitude_warning_flag

ADI_course_warning_flag				= CreateGauge()
ADI_course_warning_flag.arg_number	= 19
ADI_course_warning_flag.input		= {0.0, 1.0}
ADI_course_warning_flag.output		= {0.0, 1.0}
ADI_course_warning_flag.controller	= controllers.ADI_course_warning_flag

ADI_glide_slope_flag				= CreateGauge()
ADI_glide_slope_flag.arg_number	    = 26
ADI_glide_slope_flag.input		    = {0.0, 1.0}
ADI_glide_slope_flag.output		    = {0.0, 1.0}
ADI_glide_slope_flag.controller	    = controllers.ADI_glide_slope_flag

ADI_bank_steering_bar				= CreateGauge()
ADI_bank_steering_bar.arg_number	= 20
ADI_bank_steering_bar.input		    = {-1.0, 1.0}
ADI_bank_steering_bar.output		= {-1.0, 1.0}
ADI_bank_steering_bar.controller	= controllers.ADI_bank_steering_bar

ADI_pitch_steering_bar				= CreateGauge()
ADI_pitch_steering_bar.arg_number	= 21
ADI_pitch_steering_bar.input	    = {-1.0, 1.0}
ADI_pitch_steering_bar.output		= {-1.0, 1.0}
ADI_pitch_steering_bar.controller	= controllers.ADI_pitch_steering_bar

ADI_glide_slope_indicator				= CreateGauge()
ADI_glide_slope_indicator.arg_number	= 27
ADI_glide_slope_indicator.input	        = {-1.0, 1.0}
ADI_glide_slope_indicator.output		= {-1.0, 1.0}
ADI_glide_slope_indicator.controller	= controllers.ADI_glide_slope_indicator

--=================================================

-- Horizontal Situation Indicator
HSI_poweroff_flag            = CreateGauge()
HSI_poweroff_flag.arg_number = 40
HSI_poweroff_flag.input		 = {0.0, 1.0}
HSI_poweroff_flag.output	 = {0.0, 1.0}
HSI_poweroff_flag.controller = controllers.HSI_poweroff_flag

HSI_range_flag            = CreateGauge()
HSI_range_flag.arg_number = 32
HSI_range_flag.input	  = {0.0, 1.0}
HSI_range_flag.output	  = {0.0, 1.0}
HSI_range_flag.controller = controllers.HSI_range_flag

HSI_bearing_flag            = CreateGauge()
HSI_bearing_flag.arg_number = 46
HSI_bearing_flag.input	    = {0.0, 1.0}
HSI_bearing_flag.output	    = {0.0, 1.0}
HSI_bearing_flag.controller = controllers.HSI_bearing_flag

HSI_heading					= CreateGauge()
HSI_heading.arg_number		= 34
HSI_heading.input			= {0.0, math.pi * 2.0}
HSI_heading.output			= {0.0, 1.0}
HSI_heading.controller		= controllers.HSI_heading

HSI_bearing_no1					= CreateGauge()
HSI_bearing_no1.arg_number		= 33
HSI_bearing_no1.input			= {0.0, math.pi * 2.0}
HSI_bearing_no1.output			= {0.0, 1.0}
HSI_bearing_no1.controller		= controllers.HSI_bearing_no1

HSI_bearing_no2					= CreateGauge()
HSI_bearing_no2.arg_number		= 35
HSI_bearing_no2.input			= {0.0, math.pi * 2.0}
HSI_bearing_no2.output			= {0.0, 1.0}
HSI_bearing_no2.controller		= controllers.HSI_bearing_no2

HSI_heading_marker				= CreateGauge()
HSI_heading_marker.arg_number	= 36
HSI_heading_marker.input		= {0.0, math.pi * 2.0}
HSI_heading_marker.output		= {0.0, 1.0}
HSI_heading_marker.controller	= controllers.HSI_heading_marker

HSI_course_arrow				= CreateGauge()
HSI_course_arrow.arg_number  	= 47
HSI_course_arrow.input		    = {0.0, math.pi * 2.0}
HSI_course_arrow.output		    = {0.0, 1.0}
HSI_course_arrow.controller	    = controllers.HSI_course_arrow

HSI_course_counter_100_10			  = CreateGauge()
HSI_course_counter_100_10.arg_number  = 37
HSI_course_counter_100_10.input	      = {0.0, 36.0}
HSI_course_counter_100_10.output	  = {0.0, 1.0}
HSI_course_counter_100_10.controller  = controllers.HSI_course_counter_100_10

HSI_course_counter_1			= CreateGauge()
HSI_course_counter_1.arg_number	= 39
HSI_course_counter_1.input		= {0.0, 9.9}
HSI_course_counter_1.output		= {0.0, 1.0}
HSI_course_counter_1.controller	= controllers.HSI_course_counter_1

HSI_range_counter_1000						= CreateGauge()
HSI_range_counter_1000.arg_number			= 28
HSI_range_counter_1000.input		    	= {0.0, 1.0}
HSI_range_counter_1000.output				= {0.0, 1.0}
HSI_range_counter_1000.controller			= controllers.HSI_range_1000_controller

HSI_range_counter_100						= CreateGauge()
HSI_range_counter_100.arg_number			= 29
HSI_range_counter_100.input		    		= {0.0, 10.0}
HSI_range_counter_100.output				= {0.0, 1.0}
HSI_range_counter_100.params				= {2}
HSI_range_counter_100.controller			= controllers.HSI_range_drum_controller

HSI_range_counter_10						= CreateGauge()
HSI_range_counter_10.arg_number				= 30
HSI_range_counter_10.input					= {0.0, 10.0}
HSI_range_counter_10.output					= {0.0, 1.0}
HSI_range_counter_10.params				    = {1}
HSI_range_counter_10.controller				= controllers.HSI_range_drum_controller

HSI_range_counter_1						    = CreateGauge()
HSI_range_counter_1.arg_number			    = 31
HSI_range_counter_1.input				    = {0.0, 10.0}
HSI_range_counter_1.output				    = {0.0, 1.0}
HSI_range_counter_1.params				    = {0}
HSI_range_counter_1.controller			    = controllers.HSI_range_drum_controller

HSI_deviation						        = CreateGauge()
HSI_deviation.arg_number			        = 41
HSI_deviation.input				            = {-1.0, 1.0}
HSI_deviation.output				        = {-1.0, 1.0}
HSI_deviation.controller			        = controllers.HSI_deviation_controller

HSI_to_from_1						        = CreateGauge()
HSI_to_from_1.arg_number			        = 42
HSI_to_from_1.input				            = {0.0, 1.0}
HSI_to_from_1.output				        = {0.0, 1.0}
HSI_to_from_1.params				        = {1}
HSI_to_from_1.controller			        = controllers.HSI_to_from_controller

HSI_to_from_2						        = CreateGauge()
HSI_to_from_2.arg_number			        = 43
HSI_to_from_2.input				            = {0.0, 1.0}
HSI_to_from_2.output				        = {0.0, 1.0}
HSI_to_from_2.params				        = {2}
HSI_to_from_2.controller			        = controllers.HSI_to_from_controller

HSI_headingKnob								    = CreateGauge()
HSI_headingKnob.arg_number					    = 45
HSI_headingKnob.input						    = {0.0, math.pi * 2.0}
HSI_headingKnob.output						    = {0.0, 1.0}
HSI_headingKnob.controller					    = controllers.HSI_headingKnob

HSI_courseKnob								    = CreateGauge()
HSI_courseKnob.arg_number					    = 44
HSI_courseKnob.input						    = {0.0, math.pi * 2.0}
HSI_courseKnob.output						    = {0.0, 1.0}
HSI_courseKnob.controller					    = controllers.HSI_courseKnob

--=================================================
HARS_sync						            = CreateGauge()
HARS_sync.arg_number			            = 269
HARS_sync.input				                = {-1.0, 1.0}
HARS_sync.output				            = {-1.0, 1.0}
HARS_sync.params				            = {0}
HARS_sync.controller			            = controllers.HARS_sync_controller

--=================================================

Variometer					= CreateGauge()
Variometer.arg_number		= 12
Variometer.input			= {-6000, -2000, -1000, 1000, 2000, 6000}
Variometer.output			= {-1.0, -0.5, -0.29, 0.29, 0.5, 1.0}
Variometer.controller		= controllers.Variometer

Accelerometer_main				= CreateGauge()
Accelerometer_main.arg_number	= 15
Accelerometer_main.input		= {-5.0, 10.0}
Accelerometer_main.output		= {0.0, 1.0}
Accelerometer_main.controller	= controllers.Accelerometer_main

Accelerometer_min				= CreateGauge()
Accelerometer_min.arg_number	= 902
Accelerometer_min.input			= {-5.0, 10.0}
Accelerometer_min.output		= {0.0, 1.0}
Accelerometer_min.controller	= controllers.Accelerometer_min

Accelerometer_max				= CreateGauge()
Accelerometer_max.arg_number	= 903
Accelerometer_max.input			= {-5.0, 10.0}
Accelerometer_max.output		= {0.0, 1.0}
Accelerometer_max.controller	= controllers.Accelerometer_max

-- Angle of attack indicator
AOA_poweroff_flag            = CreateGauge()
AOA_poweroff_flag.arg_number = 55
AOA_poweroff_flag.input		 = {0.0, 1.0}
AOA_poweroff_flag.output	 = {0.0, 1.0}
AOA_poweroff_flag.controller = controllers.AOA_poweroff_flag

AOA_Units					= CreateGauge()
AOA_Units.arg_number		= 4
AOA_Units.input				= {0.0, 30.0}
AOA_Units.output			= {0.0, 1.0}
AOA_Units.controller		= controllers.AOA_Units

AirspeedNeedle				= CreateGauge()
AirspeedNeedle.arg_number	= 48
AirspeedNeedle.input		= {  0,    50,   100,   150,   200,   250,   300,   350,   400,   450,   500, 550}
AirspeedNeedle.output		= {0.0, 0.053, 0.146, 0.234, 0.322, 0.412, 0.517, 0.620, 0.719, 0.811, 0.906, 1.0}
AirspeedNeedle.controller	= controllers.AirspeedNeedle

AirspeedDial				= CreateGauge()
AirspeedDial.arg_number		= 49
AirspeedDial.input			= {0.0, 100.0}
AirspeedDial.output			= {0.0, 1.0}
AirspeedDial.controller		= controllers.AirspeedDial

--=================================================
-- Altimeter
Altimeter_100_footPtr				= CreateGauge()
Altimeter_100_footPtr.arg_number	= 51
Altimeter_100_footPtr.input			= {0.0, 1000.0}
Altimeter_100_footPtr.output		= {0.0, 1.0}
Altimeter_100_footPtr.controller	= controllers.Altimeter_100_footPtr

Altimeter_10000_footCount				= CreateGauge()
Altimeter_10000_footCount.arg_number	= 52
Altimeter_10000_footCount.input			= {0.0, 10.0}
Altimeter_10000_footCount.output		= {0.0, 1.0}
Altimeter_10000_footCount.params		= {2}
Altimeter_10000_footCount.controller	= controllers.Altimeter_Drum_Counter

Altimeter_1000_footCount				= CreateGauge()
Altimeter_1000_footCount.arg_number		= 53
Altimeter_1000_footCount.input			= {0.0, 10.0}
Altimeter_1000_footCount.output			= {0.0, 1.0}
Altimeter_1000_footCount.params			= {1}
Altimeter_1000_footCount.controller		= controllers.Altimeter_Drum_Counter

Altimeter_100_footCount					= CreateGauge()
Altimeter_100_footCount.arg_number		= 54
Altimeter_100_footCount.input			= {0.0, 10.0}
Altimeter_100_footCount.output			= {0.0, 1.0}
Altimeter_100_footCount.params			= {0}
Altimeter_100_footCount.controller		= controllers.Altimeter_Drum_Counter



pressure_setting_0 = CreateGauge()
pressure_setting_0.arg_number		= 59
pressure_setting_0.input			= {0.0, 10.0}
pressure_setting_0.output			= {0.0, 1.0}
pressure_setting_0.params			= {0}
pressure_setting_0.controller		= controllers.Altimeter_Pressure_Drum_Counter

pressure_setting_1 = CreateGauge()
pressure_setting_1.arg_number		= 58
pressure_setting_1.input			= {0.0, 10.0}
pressure_setting_1.output			= {0.0, 1.0}
pressure_setting_1.params			= {1}
pressure_setting_1.controller		= controllers.Altimeter_Pressure_Drum_Counter

pressure_setting_2 = CreateGauge()
pressure_setting_2.arg_number		= 57
pressure_setting_2.input			= {0.0, 10.0}
pressure_setting_2.output			= {0.0, 1.0}
pressure_setting_2.params			= {2}
pressure_setting_2.controller		= controllers.Altimeter_Pressure_Drum_Counter


pressure_setting_3 = CreateGauge()
pressure_setting_3.arg_number		= 56
pressure_setting_3.input			= {0.0, 10.0}
pressure_setting_3.output			= {0.0, 1.0}
pressure_setting_3.params			= {3}
pressure_setting_3.controller		= controllers.Altimeter_Pressure_Drum_Counter



--=================================================
-- CMSC
CMSC_MissileLaunchIndicator					= CreateGauge()
CMSC_MissileLaunchIndicator.arg_number		= 372
CMSC_MissileLaunchIndicator.input			= {0.0, 1.0}
CMSC_MissileLaunchIndicator.output			= {0.0, 1.0}
CMSC_MissileLaunchIndicator.controller		= controllers.CMSC_MissileLaunchIndicator

CMSC_PriorityStatusIndicator				= CreateGauge()
CMSC_PriorityStatusIndicator.arg_number		= 373
CMSC_PriorityStatusIndicator.input			= {0.0, 1.0}
CMSC_PriorityStatusIndicator.output			= {0.0, 1.0}
CMSC_PriorityStatusIndicator.controller		= controllers.CMSC_PriorityStatusIndicator

CMSC_UnknownStatusIndicator					= CreateGauge()
CMSC_UnknownStatusIndicator.arg_number		= 374
CMSC_UnknownStatusIndicator.input			= {0.0, 1.0}
CMSC_UnknownStatusIndicator.output			= {0.0, 1.0}
CMSC_UnknownStatusIndicator.controller		= controllers.CMSC_UnknownStatusIndicator

--=================================================
-- Caution Light Panel
local count = 0
local function counter()
	count = count + 1
	return count
end

SystemsSignals = 
{
	flag_VOID = 0,
	flag_MASTER_WARNING_STUB = counter(),				-- UFC LAMP
	flag_ENG_START_CYCLE = counter(),					-- CAUTION LIGHT PANEL
	flag_L_HYD_PRESS = counter(),						-- CAUTION LIGHT PANEL
	flag_R_HYD_PRESS = counter(),						-- CAUTION LIGHT PANEL
	flag_GUN_UNSAFE = counter(),						-- CAUTION LIGHT PANEL
	flag_ANTISKID = counter(),							-- CAUTION LIGHT PANEL
	flag_L_HYD_RES = counter(),							-- CAUTION LIGHT PANEL
	flag_R_HYD_RES = counter(),							-- CAUTION LIGHT PANEL
	flag_OXY_LOW = counter(),							-- CAUTION LIGHT PANEL
	flag_ELEV_DISENG = counter(),						-- CAUTION LIGHT PANEL
	flag_VOID1 = counter(),								-- CAUTION LIGHT PANEL
	flag_SEAT_NOT_ARMED = counter(),					-- CAUTION LIGHT PANEL
	flag_BLEED_AIR_LEAK = counter(),					-- CAUTION LIGHT PANEL
	flag_AIL_DISENG = counter(),						-- CAUTION LIGHT PANEL
	flag_L_AIL_TAB = counter(),							-- CAUTION LIGHT PANEL
	flag_R_AIL_TAB = counter(),							-- CAUTION LIGHT PANEL
	flag_SERVICE_AIR_HOT = counter(),					-- CAUTION LIGHT PANEL
	flag_PITCH_SAS = counter(),							-- CAUTION LIGHT PANEL
	flag_L_ENG_HOT = counter(),							-- CAUTION LIGHT PANEL
	flag_R_ENG_HOT = counter(),							-- CAUTION LIGHT PANEL
	flag_WINDSHIELD_HOT = counter(),					-- CAUTION LIGHT PANEL
	flag_YAW_SAS = counter(),							-- CAUTION LIGHT PANEL
	flag_L_ENG_OIL_PRESS = counter(),					-- CAUTION LIGHT PANEL
	flag_R_ENG_OIL_PRESS = counter(),					-- CAUTION LIGHT PANEL
	flag_CICU = counter(),								-- CAUTION LIGHT PANEL
	flag_GCAS = counter(),								-- CAUTION LIGHT PANEL
	flag_L_MAIN_PUMP = counter(),						-- CAUTION LIGHT PANEL
	flag_R_MAIN_PUMP = counter(),						-- CAUTION LIGHT PANEL
	flag_VOID2 = counter(),								-- CAUTION LIGHT PANEL
	flag_LASTE = counter(),								-- CAUTION LIGHT PANEL
	flag_L_WING_PUMP = counter(),						-- CAUTION LIGHT PANEL
	flag_R_WING_PUMP = counter(),						-- CAUTION LIGHT PANEL
	flag_HARS = counter(),								-- CAUTION LIGHT PANEL
	flag_IFF_MODE_4 = counter(),						-- CAUTION LIGHT PANEL
	flag_L_MAIN_FUEL_LOW = counter(),					-- CAUTION LIGHT PANEL
	flag_R_MAIN_FUEL_LOW = counter(),					-- CAUTION LIGHT PANEL
	flag_L_R_TKS_UNEQUAL = counter(),					-- CAUTION LIGHT PANEL
	flag_EAC = counter(),								-- CAUTION LIGHT PANEL
	flag_L_FUEL_PRESS = counter(),						-- CAUTION LIGHT PANEL
	flag_R_FUEL_PRESS = counter(),						-- CAUTION LIGHT PANEL
	flag_NAV = counter(),								-- CAUTION LIGHT PANEL
	flag_STALL_SYS = counter(),							-- CAUTION LIGHT PANEL
	flag_L_CONV = counter(),							-- CAUTION LIGHT PANEL
	flag_R_CONV = counter(),							-- CAUTION LIGHT PANEL
	flag_CADC = counter(),								-- CAUTION LIGHT PANEL
	flag_APU_GEN = counter(),							-- CAUTION LIGHT PANEL
	flag_L_GEN = counter(),								-- CAUTION LIGHT PANEL
	flag_R_GEN = counter(),								-- CAUTION LIGHT PANEL
	flag_INST_INV = counter(),							-- CAUTION LIGHT PANEL
	
	flag_ALERT = counter(),								-- VMU
	flag_ALTITUDE_AGL = counter(),						-- VMU
	flag_ALTITUDE_MSL = counter(),						-- VMU
	flag_WARNING_AUTOPILOT = counter(),					-- VMU
	flag_CEILING = counter(),							-- VMU
	flag_IFF_MODE1 = counter(),							-- VMU
	flag_IFF_MODE4 = counter(),							-- VMU
	flag_OBSTACLE = counter(),							-- VMU
	flag_PULL_UP_GCAS = counter(),						-- VMU
	flag_PULL_UP_90_FT = counter(),						-- VMU
	flag_PULL_UP_DTSAS_PGCAS = counter(),				-- VMU
	flag_SPEEDBRAKE = counter(),						-- VMU
	
	flag_AUTOPILOT_ENGAGE = counter(),					-- TONE ALERT
	flag_GEAR_WARNING = counter(),						-- TONE ALERT
	flag_STALL_WARNING_STEADY = counter(),				-- TONE ALERT
	flag_STALL_WARNING_CHOPPED = counter(),				-- TONE ALERT
	
	flag_AOA_INDEXER_HIGH = counter(),					-- AOA indexer lamp
	flag_AOA_INDEXER_NORM = counter(),					-- AOA indexer lamp
	flag_AOA_INDEXER_LOW = counter(),					-- AOA indexer lamp
	
	
    flag_TAKE_OFF_TRIM			= counter(),	
    flag_LANDING_GEAR_N_SAFE	= counter(),	
    flag_LANDING_GEAR_L_SAFE	= counter(),	
    flag_LANDING_GEAR_R_SAFE	= counter(),	
	flag_HANDLE_GEAR_WARNING	= counter(),			-- CAUTION LIGHT PANEL
	flag_NOSEWHEEL_STEERING		= counter(),	

	flag_L_ENG_FIRE	= counter(),	
    flag_APU_FIRE	= counter(),	
    flag_R_ENG_FIRE	= counter(),	
	
	flag_MARKER_BEACON = counter(),
	
    flag_AIR_REFUEL_READY = counter(),
    flag_AIR_REFUEL_LATCHED = counter(),
    flag_AIR_REFUEL_DISCONNECT = counter(),
	
	
	flag_L_AILERON_EMER_DISENGAGE = counter(),
    flag_R_AILERON_EMER_DISENGAGE = counter(),
    flag_L_ELEVATOR_EMER_DISENGAGE = counter(),
    flag_R_ELEVATOR_EMER_DISENGAGE = counter(),
	
	
    flag_GUN_READY = counter(),
    flag_CANOPY_UNLOCKED = counter(),
	
	SystemsSignalsNumber = counter()
};


function caution_lamp(arg,flag)
	local caution_lamp_  		= CreateGauge()
	caution_lamp_.arg_number	= arg
	caution_lamp_.input			= {0, 1}
	caution_lamp_.output		= {0, 1}
	caution_lamp_.params 		= {flag}
	caution_lamp_.controller	= controllers.lamp_SystemsSignal
end

caution_lamp(404,SystemsSignals.flag_MASTER_WARNING_STUB)	-- MASTER WARNING
caution_lamp(480,SystemsSignals.flag_ENG_START_CYCLE)	-- CAUTION LIGHT PANEL
caution_lamp(481,SystemsSignals.flag_L_HYD_PRESS)		-- CAUTION LIGHT PANEL
caution_lamp(482,SystemsSignals.flag_R_HYD_PRESS)		-- CAUTION LIGHT PANEL
caution_lamp(483,SystemsSignals.flag_GUN_UNSAFE)		-- CAUTION LIGHT PANEL
caution_lamp(484,SystemsSignals.flag_ANTISKID)			-- CAUTION LIGHT PANEL
caution_lamp(485,SystemsSignals.flag_L_HYD_RES)			-- CAUTION LIGHT PANEL
caution_lamp(486,SystemsSignals.flag_R_HYD_RES)			-- CAUTION LIGHT PANEL
caution_lamp(487,SystemsSignals.flag_OXY_LOW)			-- CAUTION LIGHT PANEL
caution_lamp(488,SystemsSignals.flag_ELEV_DISENG)		-- CAUTION LIGHT PANEL
caution_lamp(489,SystemsSignals.flag_VOID1)				-- CAUTION LIGHT PANEL
caution_lamp(490,SystemsSignals.flag_SEAT_NOT_ARMED)	-- CAUTION LIGHT PANEL
caution_lamp(491,SystemsSignals.flag_BLEED_AIR_LEAK)	-- CAUTION LIGHT PANEL
caution_lamp(492,SystemsSignals.flag_AIL_DISENG)		-- CAUTION LIGHT PANEL
caution_lamp(493,SystemsSignals.flag_L_AIL_TAB)			-- CAUTION LIGHT PANEL
caution_lamp(494,SystemsSignals.flag_R_AIL_TAB)			-- CAUTION LIGHT PANEL
caution_lamp(495,SystemsSignals.flag_SERVICE_AIR_HOT)	-- CAUTION LIGHT PANEL
caution_lamp(496,SystemsSignals.flag_PITCH_SAS)			-- CAUTION LIGHT PANEL
caution_lamp(497,SystemsSignals.flag_L_ENG_HOT)			-- CAUTION LIGHT PANEL
caution_lamp(498,SystemsSignals.flag_R_ENG_HOT)			-- CAUTION LIGHT PANEL
caution_lamp(499,SystemsSignals.flag_WINDSHIELD_HOT)	-- CAUTION LIGHT PANEL
caution_lamp(500,SystemsSignals.flag_YAW_SAS)			-- CAUTION LIGHT PANEL
caution_lamp(501,SystemsSignals.flag_L_ENG_OIL_PRESS)	-- CAUTION LIGHT PANEL
caution_lamp(502,SystemsSignals.flag_R_ENG_OIL_PRESS)	-- CAUTION LIGHT PANEL
caution_lamp(503,SystemsSignals.flag_CICU)				-- CAUTION LIGHT PANEL
caution_lamp(504,SystemsSignals.flag_GCAS)				-- CAUTION LIGHT PANEL
caution_lamp(505,SystemsSignals.flag_L_MAIN_PUMP)		-- CAUTION LIGHT PANEL
caution_lamp(506,SystemsSignals.flag_R_MAIN_PUMP)		-- CAUTION LIGHT PANEL
caution_lamp(507,SystemsSignals.flag_VOID2)				-- CAUTION LIGHT PANEL
caution_lamp(508,SystemsSignals.flag_LASTE)				-- CAUTION LIGHT PANEL
caution_lamp(509,SystemsSignals.flag_L_WING_PUMP)		-- CAUTION LIGHT PANEL
caution_lamp(510,SystemsSignals.flag_R_WING_PUMP)		-- CAUTION LIGHT PANEL
caution_lamp(511,SystemsSignals.flag_HARS)				-- CAUTION LIGHT PANEL
caution_lamp(512,SystemsSignals.flag_IFF_MODE_4)		-- CAUTION LIGHT PANEL
caution_lamp(513,SystemsSignals.flag_L_MAIN_FUEL_LOW)	-- CAUTION LIGHT PANEL
caution_lamp(514,SystemsSignals.flag_R_MAIN_FUEL_LOW)	-- CAUTION LIGHT PANEL
caution_lamp(515,SystemsSignals.flag_L_R_TKS_UNEQUAL)	-- CAUTION LIGHT PANEL
caution_lamp(516,SystemsSignals.flag_EAC)				-- CAUTION LIGHT PANEL
caution_lamp(517,SystemsSignals.flag_L_FUEL_PRESS)		-- CAUTION LIGHT PANEL
caution_lamp(518,SystemsSignals.flag_R_FUEL_PRESS)		-- CAUTION LIGHT PANEL
caution_lamp(519,SystemsSignals.flag_NAV)				-- CAUTION LIGHT PANEL
caution_lamp(520,SystemsSignals.flag_STALL_SYS)			-- CAUTION LIGHT PANEL
caution_lamp(521,SystemsSignals.flag_L_CONV)			-- CAUTION LIGHT PANEL
caution_lamp(522,SystemsSignals.flag_R_CONV)			-- CAUTION LIGHT PANEL
caution_lamp(523,SystemsSignals.flag_CADC)				-- CAUTION LIGHT PANEL
caution_lamp(524,SystemsSignals.flag_APU_GEN)			-- CAUTION LIGHT PANEL
caution_lamp(525,SystemsSignals.flag_L_GEN)				-- CAUTION LIGHT PANEL
caution_lamp(526,SystemsSignals.flag_R_GEN)				-- CAUTION LIGHT PANEL
caution_lamp(527,SystemsSignals.flag_INST_INV)			-- CAUTION LIGHT PANEL
caution_lamp(540,SystemsSignals.flag_AOA_INDEXER_HIGH)-- AOA indexer lamp
caution_lamp(541,SystemsSignals.flag_AOA_INDEXER_NORM)-- AOA indexer lamp
caution_lamp(542,SystemsSignals.flag_AOA_INDEXER_LOW) -- AOA indexer lamp


caution_lamp(191,SystemsSignals.flag_TAKE_OFF_TRIM)
caution_lamp(659,SystemsSignals.flag_LANDING_GEAR_N_SAFE)
caution_lamp(660,SystemsSignals.flag_LANDING_GEAR_L_SAFE)
caution_lamp(661,SystemsSignals.flag_LANDING_GEAR_R_SAFE)

caution_lamp(737,SystemsSignals.flag_HANDLE_GEAR_WARNING)


caution_lamp(663,SystemsSignals.flag_NOSEWHEEL_STEERING)

caution_lamp(215,SystemsSignals.flag_L_ENG_FIRE)
caution_lamp(216,SystemsSignals.flag_APU_FIRE)
caution_lamp(217,SystemsSignals.flag_R_ENG_FIRE)

caution_lamp(664,SystemsSignals.flag_MARKER_BEACON)

caution_lamp(730,SystemsSignals.flag_AIR_REFUEL_READY)
caution_lamp(731,SystemsSignals.flag_AIR_REFUEL_LATCHED)
caution_lamp(732,SystemsSignals.flag_AIR_REFUEL_DISCONNECT)


caution_lamp(178,SystemsSignals.flag_L_AILERON_EMER_DISENGAGE)
caution_lamp(179,SystemsSignals.flag_R_AILERON_EMER_DISENGAGE)
caution_lamp(181,SystemsSignals.flag_L_ELEVATOR_EMER_DISENGAGE)
caution_lamp(182,SystemsSignals.flag_R_ELEVATOR_EMER_DISENGAGE)


caution_lamp(662,SystemsSignals.flag_GUN_READY)
caution_lamp(665,SystemsSignals.flag_CANOPY_UNLOCKED)


FlapPositionIndicator				= CreateGauge()
FlapPositionIndicator.arg_number	= 653
FlapPositionIndicator.input			= {0,20}
FlapPositionIndicator.output		= {0,2/3}
FlapPositionIndicator.controller	= controllers.FlapPositionIndicator

EngineLeftFanSpeed					= CreateGauge()
EngineLeftFanSpeed.arg_number		= 76
EngineLeftFanSpeed.input			= {0	,25		,50	,75		,80		,85		,90		,95		,100}
EngineLeftFanSpeed.output			= {0.0	,1/8	,2/8,3/8	,4/8	,5/8	,6/8	,7/8	,1}
EngineLeftFanSpeed.controller		= controllers.EngineLeftFanSpeed

EngineRightFanSpeed					= CreateGauge()
EngineRightFanSpeed.arg_number		= 77
EngineRightFanSpeed.input			= {0	,25		,50	,75		,80		,85		,90		,95		,100}
EngineRightFanSpeed.output			= {0.0	,1/8	,2/8,3/8	,4/8	,5/8	,6/8	,7/8	,1}
EngineRightFanSpeed.controller		= controllers.EngineRightFanSpeed

EngineLeftCoreSpeedTenth				= CreateGauge()
EngineLeftCoreSpeedTenth.arg_number		= 78
EngineLeftCoreSpeedTenth.input			= {0.0, 100.0}
EngineLeftCoreSpeedTenth.output			= {0.0, 1.0}
EngineLeftCoreSpeedTenth.controller		= controllers.EngineLeftCoreSpeedTenth

EngineLeftCoreSpeedUnits				= CreateGauge()
EngineLeftCoreSpeedUnits.arg_number		= 79
EngineLeftCoreSpeedUnits.input			= {0.0, 10.0}
EngineLeftCoreSpeedUnits.output			= {0.0, 1.0}
EngineLeftCoreSpeedUnits.controller		= controllers.EngineLeftCoreSpeedUnits

EngineRightCoreSpeedTenth				= CreateGauge()
EngineRightCoreSpeedTenth.arg_number	= 80
EngineRightCoreSpeedTenth.input			= {0.0, 100.0}
EngineRightCoreSpeedTenth.output		= {0.0, 1.0}
EngineRightCoreSpeedTenth.controller	= controllers.EngineRightCoreSpeedTenth

EngineRightCoreSpeedUnits				= CreateGauge()
EngineRightCoreSpeedUnits.arg_number	= 81
EngineRightCoreSpeedUnits.input			= {0.0, 10.0}
EngineRightCoreSpeedUnits.output		= {0.0, 1.0}
EngineRightCoreSpeedUnits.controller	= controllers.EngineRightCoreSpeedUnits

EngineLeftFuelFlow					= CreateGauge()
EngineLeftFuelFlow.arg_number		= 84
EngineLeftFuelFlow.input			= {0.0, 5000.0}
EngineLeftFuelFlow.output			= {0.0, 1.0}
EngineLeftFuelFlow.controller		= controllers.EngineLeftFuelFlow

EngineRightFuelFlow					= CreateGauge()
EngineRightFuelFlow.arg_number		= 85
EngineRightFuelFlow.input			= {0.0, 5000.0}
EngineRightFuelFlow.output			= {0.0, 1.0}
EngineRightFuelFlow.controller		= controllers.EngineRightFuelFlow

engineTemperatureTenthInterpolationIn	= {  100,   200,   300,   400,   500,   600,   700,   800,   900,  1000,  1100}
engineTemperatureTenthInterpolationOut	= {0.005, 0.095, 0.183, 0.275, 0.365, 0.463, 0.560, 0.657, 0.759, 0.855, 0.995}

EngineLeftTemperatureTenth				= CreateGauge()
EngineLeftTemperatureTenth.arg_number	= 70
EngineLeftTemperatureTenth.input		= engineTemperatureTenthInterpolationIn
EngineLeftTemperatureTenth.output		= engineTemperatureTenthInterpolationOut
EngineLeftTemperatureTenth.controller	= controllers.EngineLeftTemperatureTenth

EngineLeftTemperatureUnits				= CreateGauge()
EngineLeftTemperatureUnits.arg_number	= 71
EngineLeftTemperatureUnits.input		= {0.0, 100.0}
EngineLeftTemperatureUnits.output		= {0.0, 1.0}
EngineLeftTemperatureUnits.controller	= controllers.EngineLeftTemperatureUnits

EngineRightTemperatureTenth				= CreateGauge()
EngineRightTemperatureTenth.arg_number	= 73
EngineRightTemperatureTenth.input		= engineTemperatureTenthInterpolationIn
EngineRightTemperatureTenth.output		= engineTemperatureTenthInterpolationOut
EngineRightTemperatureTenth.controller	= controllers.EngineRightTemperatureTenth

EngineRightTemperatureUnits				= CreateGauge()
EngineRightTemperatureUnits.arg_number	= 74
EngineRightTemperatureUnits.input		= {0.0, 100.0}
EngineRightTemperatureUnits.output		= {0.0, 1.0}
EngineRightTemperatureUnits.controller	= controllers.EngineRightTemperatureUnits

EngineLeftTemperatureOff				= CreateGauge()
EngineLeftTemperatureOff.arg_number		= 72
EngineLeftTemperatureOff.input			= {0.0, 1.0}
EngineLeftTemperatureOff.output			= {0.0, 1.0}
EngineLeftTemperatureOff.controller		= controllers.EngineLeftTemperatureOff

EngineRightTemperatureOff				= CreateGauge()
EngineRightTemperatureOff.arg_number	= 75
EngineRightTemperatureOff.input			= {0.0, 1.0}
EngineRightTemperatureOff.output		= {0.0, 1.0}
EngineRightTemperatureOff.controller	= controllers.EngineRightTemperatureOff

APU_RPM				= CreateGauge()
APU_RPM.arg_number	= 13
APU_RPM.input		= {0.0, 120.0}
APU_RPM.output		= {0.0, 1.0}
APU_RPM.controller	= controllers.APU_RPM


APUTemperature				= CreateGauge()
APUTemperature.arg_number	= 14
APUTemperature.input		= {0.0, 1000.0}
APUTemperature.output		= {0.0, 1.0}
APUTemperature.controller	= controllers.APU_Temperature


HydraulicPressureLeft				= CreateGauge()
HydraulicPressureLeft.arg_number	= 647
HydraulicPressureLeft.input			= {0.0, 4000.0}
HydraulicPressureLeft.output		= {0.0, 1.0}
HydraulicPressureLeft.controller	= controllers.HydraulicPressureLeft

HydraulicPressureRight				= CreateGauge()
HydraulicPressureRight.arg_number	= 648
HydraulicPressureRight.input		= {0.0, 4000.0}
HydraulicPressureRight.output		= {0.0, 1.0}
HydraulicPressureRight.controller	= controllers.HydraulicPressureRight

EngineLeftOilPressure				= CreateGauge()
EngineLeftOilPressure.arg_number	= 82
EngineLeftOilPressure.input			= {0.0, 100.0}
EngineLeftOilPressure.output		= {0.0, 1.0}
EngineLeftOilPressure.controller	= controllers.EngineLeftOilPressure

EngineRightOilPressure				= CreateGauge()
EngineRightOilPressure.arg_number	= 83
EngineRightOilPressure.input		= {0.0, 100.0}
EngineRightOilPressure.output		= {0.0, 1.0}
EngineRightOilPressure.controller	= controllers.EngineRightOilPressure

FuelQuantityLeft				= CreateGauge()
FuelQuantityLeft.arg_number		= 88
FuelQuantityLeft.input			= {0.0, 6000.0}
FuelQuantityLeft.output			= {0.0, 1.0}
FuelQuantityLeft.controller		= controllers.FuelQuantityLeft

FuelQuantityRight				= CreateGauge()
FuelQuantityRight.arg_number	= 89
FuelQuantityRight.input			= {0.0, 6000.0}
FuelQuantityRight.output		= {0.0, 1.0}
FuelQuantityRight.controller	= controllers.FuelQuantityRight

FuelQuantityCounterTenthOfThous				= CreateGauge()
FuelQuantityCounterTenthOfThous.arg_number	= 90
FuelQuantityCounterTenthOfThous.input		= {0.0, 10.0}
FuelQuantityCounterTenthOfThous.output		= {0.0, 1.0}
FuelQuantityCounterTenthOfThous.params		= {2}
FuelQuantityCounterTenthOfThous.controller	= controllers.FuelQuantityCounterDrum

FuelQuantityCounterThousands				= CreateGauge()
FuelQuantityCounterThousands.arg_number		= 91
FuelQuantityCounterThousands.input			= {0.0, 10.0}
FuelQuantityCounterThousands.output			= {0.0, 1.0}
FuelQuantityCounterThousands.params			= {1}
FuelQuantityCounterThousands.controller		= controllers.FuelQuantityCounterDrum

FuelQuantityCounterHundreds					= CreateGauge()
FuelQuantityCounterHundreds.arg_number		= 92
FuelQuantityCounterHundreds.input			= {0.0, 10.0}
FuelQuantityCounterHundreds.output			= {0.0, 1.0}
FuelQuantityCounterHundreds.params			= {0}
FuelQuantityCounterHundreds.controller		= controllers.FuelQuantityCounterDrum

mirrors_draw                    = CreateGauge()
mirrors_draw.arg_number    		= 719
mirrors_draw.input				= {0.0, 1.0}
mirrors_draw.output				= {0.0, 1.0}
mirrors_draw.controller         = controllers.mirrors_draw

args_initial_state = {
	[3]	= 1,
    [5] = 1,
	[800] = 0,
	[797] = -0.5,--lower HUD gun camera position
 }

------------------------------------------------------------------------------------------------------- 
-- Navigation Mode Select panel
count = 0
NMSP_buttons = 
{
	flag_HARS = 0,
	flag_EGI = counter(),	
	flag_TISL = counter(),	
	flag_STRPT = counter(),	
	flag_ANCHR = counter(),	
	flag_TCN = counter(),	
	flag_ILS = counter(),
	flag_UHF = counter(),	
	flag_FM = counter()	
}
 
 function NMSP_button_light(arg,flag)
	local light_  		= CreateGauge()
	light_.arg_number	= arg
	light_.input		= {0.0, 1.0}
	light_.output		= {0.0, 1.0}
	light_.params 		= {flag}
	light_.controller	= controllers.NMSP_button_light_controller
end

NMSP_button_light(606, NMSP_buttons.flag_HARS)	-- HARS
NMSP_button_light(608, NMSP_buttons.flag_EGI)	-- EGI
NMSP_button_light(610, NMSP_buttons.flag_TISL)	-- TISL
NMSP_button_light(612, NMSP_buttons.flag_STRPT)	-- STRPT
NMSP_button_light(614, NMSP_buttons.flag_ANCHR)	-- ANCHR
NMSP_button_light(616, NMSP_buttons.flag_TCN)	-- TCN
NMSP_button_light(618, NMSP_buttons.flag_ILS)	-- ILS
NMSP_button_light(619, NMSP_buttons.flag_UHF)	-- UHF
NMSP_button_light(620, NMSP_buttons.flag_FM)	-- FM


------------------------------------------------------------------------------------------------------- 
-- TISL Control Panel
count = 0
TISL_buttons = 
{
	flag_ENTER = 0,	
	flag_OVER_TEMP = counter(),	
	flag_BITE = counter(),	
	flag_TRACK = counter(),	
}
 
 function TISL_button_light(arg,flag)
	local light_  		= CreateGauge()
	light_.arg_number	= arg
	light_.input		= {0.0, 1.0}
	light_.output		= {0.0, 1.0}
	light_.params 		= {flag}
	light_.controller	= controllers.TISL_button_light_controller
end

TISL_button_light(629, TISL_buttons.flag_ENTER)	
TISL_button_light(631, TISL_buttons.flag_OVER_TEMP)	
TISL_button_light(633, TISL_buttons.flag_BITE)	
TISL_button_light(635, TISL_buttons.flag_TRACK)	

------------------------------------------------------------------------------------------------------- 
-- TACAN
function TACAN_window_wheel(arg, digitPos)
	local wheel  		= CreateGauge()
	wheel.arg_number	= arg
	wheel.input			= {0.0, 10.0}
	wheel.output		= {0.0, 1.0}
	wheel.params 		= {digitPos}
	wheel.controller	= controllers.TACAN_window_wheel_controller
end

TACAN_digit_pos = {
	ones = 0,
	tens = 1,
	hundreds = 2
}

TACAN_window_wheel(263, TACAN_digit_pos.hundreds)
TACAN_window_wheel(264, TACAN_digit_pos.tens)
TACAN_window_wheel(265, TACAN_digit_pos.ones)

XYwheel  			= CreateGauge()
XYwheel.arg_number	= 266
XYwheel.input		= {0.0, 1.0}
XYwheel.output		= {0.0, 1.0}
XYwheel.controller	= controllers.TACAN_XY_window_wheel_controller


TACAN_test_light = CreateGauge()
TACAN_test_light.arg_number	= 260
TACAN_test_light.input		= {0.0, 1.0}
TACAN_test_light.output		= {0.0, 1.0}
TACAN_test_light.controller	= controllers.TACAN_test_light_controller

------------------------------------------------------------------------------------------------------- 
-- ILS
ILS_digit_pos = {
	MHz = 0,
	KHz = 1,
}

ILS_window_wheel_MHz 			= CreateGauge()
ILS_window_wheel_MHz.arg_number	= 251
ILS_window_wheel_MHz.input		= {8.0, 11.0}
ILS_window_wheel_MHz.output		= {0.0, 0.3}
ILS_window_wheel_MHz.params 	= {ILS_digit_pos.MHz}
ILS_window_wheel_MHz.controller	= controllers.ILS_window_wheel_controller

ILS_window_wheel_KHz 			= CreateGauge()
ILS_window_wheel_KHz.arg_number	= 252
ILS_window_wheel_KHz.input		= {10.0, 15.0, 30.0, 35.0, 50.0, 55.0, 70.0, 75.0, 90.0, 95.0}
ILS_window_wheel_KHz.output		= {0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9}
ILS_window_wheel_KHz.params 	= {ILS_digit_pos.KHz}
ILS_window_wheel_KHz.controller	= controllers.ILS_window_wheel_controller

seat_adjustment  			= CreateGauge()
seat_adjustment.arg_number	= 771
seat_adjustment.input		= {-2.5 * 0.0254, 2.5 * 0.0254}
seat_adjustment.output		= {1,-1}
seat_adjustment.controller	= controllers.SeatAdjustment


canopy  			= CreateGauge()
canopy.arg_number	= 7
canopy.input		= {0,1}
canopy.output		= {0,1}
canopy.controller	= controllers.CanopyValue

AAU34_PNEU_flag = CreateGauge()
AAU34_PNEU_flag.arg_number	= 61
AAU34_PNEU_flag.input		= {0.0, 0.4}
AAU34_PNEU_flag.output		= {0.0, 1.0}
AAU34_PNEU_flag.controller	= controllers.AAU34_PNEU_flag_controller


CabinPressAlt				= CreateGauge()
CabinPressAlt.arg_number	= 281
CabinPressAlt.input			= {0.0, 50000.0}
CabinPressAlt.output		= {0.0, 1.0}
CabinPressAlt.controller	= controllers.CabinPressAlt

OxygenVolume				= CreateGauge()
OxygenVolume.arg_number		= 274
OxygenVolume.input			= {0.0, 10.0}
OxygenVolume.output			= {0.0, 1.0}
OxygenVolume.controller		= controllers.OxygenVolume

OxygenPress					= CreateGauge()
OxygenPress.arg_number		= 604
OxygenPress.input			= {0.0, 100.0, 500.0}
OxygenPress.output			= {0.0, 0.5, 1.0}
OxygenPress.controller		= controllers.OxygenPress

BreathFlow					= CreateGauge()
BreathFlow.arg_number		= 600
BreathFlow.input			= {0.0, 1.0}
BreathFlow.output			= {0.0, 1.0}
BreathFlow.controller		= controllers.BreathFlow

--IFF Panel lamps
IFF_reply_lamp_  			= CreateGauge()
IFF_reply_lamp_.arg_number	= 798
IFF_reply_lamp_.input		= {0, 1}
IFF_reply_lamp_.output		= {0, 1}
IFF_reply_lamp_.controller	= controllers.IFF_reply_lamp

IFF_test_lamp_  			= CreateGauge()
IFF_test_lamp_.arg_number	= 799
IFF_test_lamp_.input		= {0, 1}
IFF_test_lamp_.output		= {0, 1}
IFF_test_lamp_.controller	= controllers.IFF_test_lamp

-- DVADR Remote Control Panel						
DVADR_end_of_tape  			= CreateGauge()
DVADR_end_of_tape.arg_number= 791
DVADR_end_of_tape.input		= {0, 1}
DVADR_end_of_tape.output	= {0, 1}
DVADR_end_of_tape.controller= controllers.DVADR_end_of_tape

DVADR_record	  			= CreateGauge()
DVADR_record.arg_number		= 792
DVADR_record.input			= {0, 1}
DVADR_record.output			= {0, 1}
DVADR_record.controller		= controllers.DVADR_record

--DVADR Remote Control Panel						
DVADR_cp_end_of_tape  		= CreateGauge()
DVADR_cp_end_of_tape.arg_number	= 793
DVADR_cp_end_of_tape.input		= {0, 1}
DVADR_cp_end_of_tape.output		= {0, 1}
DVADR_cp_end_of_tape.controller= controllers.DVADR_end_of_tape

DVADR_cp_record	  			= CreateGauge()
DVADR_cp_record.arg_number	= 794
DVADR_cp_record.input		= {0, 1}
DVADR_cp_record.output		= {0, 1}
DVADR_cp_record.controller	= controllers.DVADR_record

need_to_be_closed = true -- close lua state after initialization 


Z_test =
{
	near = 0.05,
	far  = 4.0,
} 

dofile(LockOn_Options.common_script_path.."tools.lua")
livery = find_custom_livery("A-10C","default")
