local res = external_profile("Config/Input/Aircrafts/base_keyboard_binding.lua")
join(res.keyCommands,{

-- Autopilot
{combos = {{key = 'A'}}, down = iCommandPlaneAutopilot, name = _('Autopilot'), category = _('Autopilot')},
{combos = {{key = 'H'}}, down = iCommandPlaneSAUHBarometric, name = _('Autopilot - Barometric Altitude Hold \'H\''), category = _('Autopilot')},
{combos = {{key = '1', reformers = {'LAlt'}}}, down = iCommandPlaneStabHbarBank, name = _('Autopilot - Damper'), category = _('Autopilot')},
{combos = {{key = '2', reformers = {'LAlt'}}}, down = iCommandPlaneSAUHRadio, name = _('Autopilot - Ground Collision Avoidance'), category = _('Autopilot')},
{combos = {{key = '3', reformers = {'LAlt'}}}, down = iCommandPlaneStabHbar, name = _('Autopilot - Barometric Altitude Hold'), category = _('Autopilot')},
{combos = {{key = '4', reformers = {'LAlt'}}}, down = iCommandPlaneStabTangBank, name = _('Autopilot - Attitude Hold'), category = _('Autopilot')},
{combos = {{key = '5', reformers = {'LAlt'}}}, down = iCommandPlaneRouteAutopilot, name = _('Autopilot - \'Path Control\''), category = _('Autopilot')},
{combos = {{key = '6', reformers = {'LAlt'}}}, down = iCommandPlaneStabHrad, name = _('Autopilot - Reapproach'), category = _('Autopilot')},
{combos = {{key = '7', reformers = {'LAlt'}}}, down = iCommandPlaneStabHorizon, name = _('Autopilot - Transition To Level Flight Control'), category = _('Autopilot')},
{combos = {{key = '9', reformers = {'LAlt'}}}, down = iCommandPlane_SPU9_SPU_9_on_off, up = iCommandPlane_SPU9_SPU_9_on_off, value_down = 1.0, value_up = 0.0, name = _('Autopilot Reset (Stick Button)'), category = _('Autopilot')},
{combos = {{key = ',', reformers = {'LCtrl'}}}, down = iCommandPlaneAUTIncrease, up = iCommandPlaneAUTIncrease, value_down = 1.0, value_up = 0.0, name = _('Min Altitude Increase'), category = _('Autopilot')},
{combos = {{key = '.', reformers = {'LCtrl'}}}, down = iCommandPlaneAUTIncrease, up = iCommandPlaneAUTIncrease, value_down = -1.0, value_up = 0.0, name = _('Min Altitude Decrease'), category = _('Autopilot')},
{combos = {{key = 'A', reformers = {'LShift'}}}, down = iCommandPlaneAutopilotOverrideOn, up = iCommandPlaneAutopilotOverrideOff, name = _('Autopilot override'), category = _('Autopilot')},

-- Systems
{combos = {{key = 'Q', reformers = {'LAlt'}}}, down = iCommandPlane_HOTAS_NoseWheelSteeringButton, up = iCommandPlane_HOTAS_NoseWheelSteeringButton, value_down = 1.0, value_up = 0.0, name = _('Nose Wheel Steering'), category = _('Systems')},
--{combos = {{key = 'R', reformers = {'LCtrl'}}}, down = iCommandPlaneAirRefuel, name = _('Refueling Boom'), category = _('Systems')},
{combos = {{key = 'R', reformers = {'LAlt'}}}, down = iCommandPlaneJettisonFuelTanks, name = _('Jettison Fuel Tanks'), category = _('Systems')},
{combos = {{key = 'W', reformers = {'LShift'}}}, down = iCommandPlaneWheelParkingBrake, up = iCommandPlaneWheelParkingBrake, name = _('Wheel Brake Start'), category = _('Systems')},

-- Modes
{combos = {{key = '3'}}, down = iCommandPlaneModeVS, name = _('(3) Close Air Combat Vertical Scan Mode'), category = _('Modes')},
{combos = {{key = '4'}}, down = iCommandPlaneModeBore, name = _('(4) Close Air Combat Bore Mode'), category = _('Modes')},
{combos = {{key = '5'}}, down = iCommandPlaneModeHelmet, name = _('(5) Close Air Combat HMD Helmet Mode'), category = _('Modes')},
{combos = {{key = '6'}}, down = iCommandPlaneModeFI0, name = _('(6) Longitudinal Missile Aiming Mode'), category = _('Modes')},
{combos = {{key = '8'}}, down = iCommandPlaneModeGrid, name = _('(8) Gunsight Reticle Switch'), category = _('Modes')},

-- Flight Control
{combos = {{key = 'T', reformers = {'LCtrl'}}}, down = iCommandPlaneTrimCancel, name = _('Trim Reset'), category = _('Flight Control')},
{combos = {{key = 'Y'}}, down = iCommandPlane_HOTAS_LeftThrottleButton, up = iCommandPlane_HOTAS_LeftThrottleButton_Off, name = _('Stick Deflection Limiter Override'), category = _('Flight Control')},


-- Sensors
{combos = defaultDeviceAssignmentFor("lock_aircraft"), down = iCommandPlaneChangeLock, up = iCommandPlaneChangeLockUp, name = _('Target Lock'), category = _('Sensors')},
{combos = defaultDeviceAssignmentFor("unlock_target"), down = iCommandSensorReset, name = _('Return To Search'), category = _('Sensors')},
{combos = {{key = 'I'}}, down = iCommandPlaneRadarOnOff, name = _('Radar On/Off'), category = _('Sensors')},
{combos = {{key = 'I', reformers = {'RAlt'}}}, down = iCommandPlaneRadarChangeMode, name = _('Radar RWS/TWS Mode Select'), category = _('Sensors')},
{combos = {{key = 'I', reformers = {'RCtrl'}}}, down = iCommandPlaneRadarCenter, name = _('Target Designator To Center'), category = _('Sensors')},
{combos = {{key = 'I', reformers = {'RShift'}}}, down = iCommandPlaneChangeRadarPRF, name = _('Radar Pulse Repeat Frequency Select'), category = _('Sensors')},
{combos = {{key = 'O'}}, down = iCommandPlaneEOSOnOff, name = _('Electro-Optical System On/Off'), category = _('Sensors')},
{combos = {{key = ';'}}, pressed = iCommandPlaneRadarUp, up = iCommandPlaneRadarStop, name = _('Target Designator Up'), category = _('Sensors')},
{combos = {{key = '.'}}, pressed = iCommandPlaneRadarDown, up = iCommandPlaneRadarStop, name = _('Target Designator Down'), category = _('Sensors')},
{combos = {{key = ','}}, pressed = iCommandPlaneRadarLeft, up = iCommandPlaneRadarStop, name = _('Target Designator Left'), category = _('Sensors')},
{combos = {{key = '/'}}, pressed = iCommandPlaneRadarRight, up = iCommandPlaneRadarStop, name = _('Target Designator Right'), category = _('Sensors')},
{combos = {{key = ';', reformers = {'RShift'}}}, pressed = iCommandSelecterUp, up = iCommandSelecterStop, name = _('Scan Zone Up'), category = _('Sensors')},
{combos = {{key = '.', reformers = {'RShift'}}}, pressed = iCommandSelecterDown, up = iCommandSelecterStop, name = _('Scan Zone Down'), category = _('Sensors')},
{combos = {{key = ',', reformers = {'RShift'}}}, pressed = iCommandSelecterLeft, up = iCommandSelecterStop, name = _('Scan Zone Left'), category = _('Sensors')},
{combos = {{key = '/', reformers = {'RShift'}}}, pressed = iCommandSelecterRight, up = iCommandSelecterStop, name = _('Scan Zone Right'), category = _('Sensors')},
{combos = {{key = '='}}, down = iCommandPlaneZoomIn, name = _('Display Zoom In'), category = _('Sensors')},
{combos = {{key = '-'}}, down = iCommandPlaneZoomOut, name = _('Display Zoom Out'), category = _('Sensors')},
{combos = {{key = '-', reformers = {'RCtrl'}}}, down = iCommandDecreaseRadarScanArea, name = _('Radar Scan Zone Decrease'), category = _('Sensors')},
{combos = {{key = '=', reformers = {'RCtrl'}}}, down = iCommandIncreaseRadarScanArea, name = _('Radar Scan Zone Increase'), category = _('Sensors')},
{combos = {{key = '=', reformers = {'RAlt'}}}, pressed = iCommandPlaneIncreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = _('Target Specified Size Increase'), category = _('Sensors')},
{combos = {{key = '-', reformers = {'RAlt'}}}, pressed = iCommandPlaneDecreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = _('Target Specified Size Decrease'), category = _('Sensors')},
{combos = {{key = 'R', reformers = {'RShift'}}}, down = iCommandChangeRWRMode, name = _('RWR/SPO Mode Select'), category = _('Sensors')},
{combos = {{key = ',', reformers = {'RAlt'}}}, down = iCommandPlaneThreatWarnSoundVolumeDown, name = _('RWR/SPO Sound Signals Volume Down'), category = _('Sensors')},
{combos = {{key = '.', reformers = {'RAlt'}}}, down = iCommandPlaneThreatWarnSoundVolumeUp, name = _('RWR/SPO Sound Signals Volume Up'), category = _('Sensors')},

-- Weapons                                                                        
{combos = {{key = 'V', reformers = {'LCtrl'}}}, down = iCommandPlaneSalvoOnOff, name = _('Salvo Mode'), category = _('Weapons')},
{combos = {{key = 'C', reformers = {'LShift'}}}, down = iCommandChangeGunRateOfFire, name = _('Cut Of Burst select'), category = _('Weapons')},
{combos = {{key = 'H', reformers = {'RShift'}}}, down = iCommandPlaneHUDFilterOnOff, name = _('HUD Filter On Off'), category = _('Weapons')},

-- RADIO 1
{down = iCommandDynamicRadioPushToTalkEnableVoice, up = iCommandDynamicRadioPushToTalkDisableVoice, value_down = 0.1, value_up = 0.0, name = _('r.1 VoIP PTT'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioModulationNext, value_down = 0.1, value_up = 0.0, name = _('r.1 Modulation change'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioFreqChangeSelectorNext, value_down = 0.1, value_up = 0.0, name = _('r.1 Frequency change selector'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioFrequencyUp, value_down = 0.1, value_up = 0.0, name = _('r.1 Frequency up'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioFrequencyDown, value_down = 0.1, value_up = 0.0, name = _('r.1 Frequency down'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioChannelIncrease, value_down = 0.1, value_up = 0.0, name = _('r.1 Channel increase'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioChannelDecrease, value_down = 0.1, value_up = 0.0, name = _('r.1 Channel decrease'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioGuardChangeNext, value_down = 0.1, value_up = 0.0, name = _('r.1 Guard change'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioEncryptionOnOff, value_down = 0.1, value_up = 0.0, name = _('r.1 Encryption On/Off'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioPowerChangeNext, value_down = 0.1, value_up = 0.0, name = _('r.1 Power change'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioSquelchOnOff, value_down = 0.1, value_up = 0.0, name = _('r.1 Squelch On/Off'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioVolumeUp, value_down = 0.1, value_up = 0.0, name = _('r.1 Volume up'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioVolumeDown, value_down = 0.1, value_up = 0.0, name = _('r.1 Volume down'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioBalanceLeft, value_down = 0.1, value_up = 0.0, name = _('r.1 Balance left'), category = {_('Radio'), _('Radio 1')} },
{down = iCommandDynamicRadioBalanceRight, value_down = 0.1, value_up = 0.0, name = _('r.1 Balance right'), category = {_('Radio'), _('Radio 1')} },

})
return res
