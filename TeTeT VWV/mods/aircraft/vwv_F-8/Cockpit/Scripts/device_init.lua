dofile(LockOn_Options.script_path.."config.lua")

-- mount textures collections related to TF-51D cockpit module and avionics 
mount_vfs_texture_archives(LockOn_Options.script_path.."../Textures/TF-51D-CPT-TEXTURES")
mount_vfs_model_path(LockOn_Options.script_path.."../Shape")
mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")

dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."materials.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")

-- modules which implement the cockpit functionality
UseDBGInfo = false

----Geometry Layout------------------------------------------------
layoutGeometry = {}

--	items in <...> are optional
--
-- MainPanel = {"NAME_OF_CLASS",
--				"INIT_SCRIPT_FILE",
--				<{devices.LINKED_DEVICE1, devices.LINKED_DEVICE2, ...},>
--			   }

attributes = {
	"support_for_cws",
}

MainPanel = {"P51D::ccMainPanel51D", 
			LockOn_Options.script_path.."mainpanel_init.lua",
			{{"RightSwitchPanel",devices.RIGHT_SWITCH_PANEL},
			{"AirspeedInd", devices.AIRSPEED_INDICATOR},
			{"Altimeter", devices.ALTIMETER},
			{"N-001", devices.N_001},
			{"Variometer", devices.VARIOMETER},
			{"FM_Proxy",devices.FM_PROXY},
			{"Art_Horizon",devices.ARTIFICIAL_HORIZON},
			{"Directional_Hyro",devices.DIRECTIONAL_GYRO},
			{"Turn_Ind",devices.TURN_INDICATOR},
			{"Clock", devices.CLOCK},
			{"RemoteCompass", devices.REMOTE_COMPASS},
			{"VHF_Radio", devices.VHF_RADIO},
			{"OxygenSystem",devices.OXYGEN_SYSTEM},
			{"FuelSystem",devices.FUEL_SYSTEM},
			{"TailRadar",devices.TAIL_WARNING_RADAR},
			{"VHF_Radio",devices.VHF_RADIO},
			{"HydraulicSystem",devices.HYDRAULIC_SYSTEM},
			{"ControlSystem",devices.CONTROL_SYSTEM},
			{"EngineSystem",devices.ENGINE_SYSTEM},
			{"LightSystem",devices.LIGHT_SYSTEM},
			{"EngineControlPanel",devices.ENGINE_CONTROL_PANEL},
			{"Accelerometer",devices.ACCELEROMETER},
			{"CPT_MECH",devices.CPT_MECH}},
            LockOn_Options.script_path.."main_panel_commands.lua"}
			 
-- Avionics devices initialization example
--	items in <...> are optional
--
-- creators[DEVICE_ID] = {"NAME_OF_CONTROLLER_CLASS",
--						  <"CONTROLLER_SCRIPT_FILE",>
--						  <{devices.LINKED_DEVICE1, devices.LINKED_DEVICE2, ...},>
--						  <"INPUT_COMMANDS_SCRIPT_FILE",>
--						  <{{"NAME_OF_INDICATOR_CLASS", "INDICATOR_SCRIPT_FILE"}, ...}>
--						 }
creators = {}
								
creators[devices.ELEC_INTERFACE] = {
	"P51Common::avElectricInterface_P51",
	LockOn_Options.script_path.."Systems/electric_system.lua",
	{{"RemoteCompass", devices.REMOTE_COMPASS}}
}
									
creators[devices.HYDRAULIC_SYSTEM]	= {
	"P51Common::avHydraulicSystemInterface_P51",
	LockOn_Options.script_path.."Systems/hydraulic_system.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}
									
creators[devices.ENGINE_SYSTEM]	= {
	"P51D::avEngineSystemInterface_P51D",
	LockOn_Options.script_path.."Systems/engine_system.lua",
	{{"FM_Proxy",devices.FM_PROXY},
	{"Art_Horizon",devices.ARTIFICIAL_HORIZON},
	{"Directional_Hyro",devices.DIRECTIONAL_GYRO},
	{"Turn_Ind",devices.TURN_INDICATOR},
	{"ElecInterface",devices.ELEC_INTERFACE},
	{"RightPanel",devices.RIGHT_SWITCH_PANEL}
	}
}	
						
creators[devices.CPT_MECH] = {
	"P51D::avCockpitMechanics_P51D",
	LockOn_Options.script_path.."Systems/mechanics.lua",
	{{"VHF_Radio", devices.VHF_RADIO},
	{"FM_proxy",devices.FM_PROXY}}
}	

creators[devices.OXYGEN_SYSTEM]	= {
	"P51Common::avOxygenControlSystem_P51",
	LockOn_Options.script_path.."Systems/oxygen_system.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}		

creators[devices.FM_PROXY] = {"P51Common::avFMProxy_P51","",{}}

creators[devices.FUEL_SYSTEM] = {
	"P51Common::avFuelSystemInterface_P51",
	LockOn_Options.script_path.."Systems/fuel_system.lua ",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	 {"FM_Proxy",devices.FM_PROXY},
	}
}	
									
creators[devices.LIGHT_SYSTEM] = {
	"P51D::avLightSystem_P51D",
	LockOn_Options.script_path.."Systems/light_system.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}}
}		

creators[devices.ENVIRONMENT_SYSTEM] = {
	"P51Common::avEnvironmentControlSystem_P51",
	"",
	{}
}				
									
creators[devices.CONTROL_SYSTEM] = {
	"P51D::avControlSystemInterface_P51D",
	LockOn_Options.script_path.."Systems/control_system.lua",
	{{"FM_proxy",devices.FM_PROXY},
	{"ElecInterface",devices.ELEC_INTERFACE},
	{"FrontBox",devices.FRONT_SWITCH_BOX}},
	LockOn_Options.script_path.."Systems/control_system_commands.lua"
}	

creators[devices.FRONT_SWITCH_BOX]	= {
	"P51D::avFrontSwitchBox_51D","",
	{{"LightSystem",devices.LIGHT_SYSTEM},
	{"RightPanel",devices.RIGHT_SWITCH_PANEL},
	{"ElecInterface",devices.ELEC_INTERFACE},
	{"EngineSystem",devices.ENGINE_SYSTEM}}
}
									
creators[devices.RIGHT_SWITCH_PANEL] = {
	"P51D::avRightSwitchPanel_51D",
	LockOn_Options.script_path.."RightSwitchPanel/RightSwitchPanel.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	{"LightSystem",devices.LIGHT_SYSTEM},
	{"OxygenSystem",devices.OXYGEN_SYSTEM}}
}			

creators[devices.ENGINE_CONTROL_PANEL] = {
	"P51D::avEngineControlPanel_P51D",
	LockOn_Options.script_path.."Systems/engine_control_panel.lua",
	{{"RightPanel",devices.RIGHT_SWITCH_PANEL},	
	{"ElecInterface",devices.ELEC_INTERFACE},
	{"FuelInterface",devices.FUEL_SYSTEM}}
}	

creators[devices.AIRSPEED_INDICATOR] = {
	"avSimpleAirspeedIndicator",
	LockOn_Options.script_path.."AirspeedIndicator_F2/AirspeedIndicator.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.ALTIMETER]	= {
	"avSimpleAltimeter",
	LockOn_Options.script_path.."Altimeter_AN5760/Altimeter.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.VARIOMETER] = {
	"avSimpleVariometer",
	LockOn_Options.script_path.."Variometer_AN5825/Variometer.lua",
	{{"FM_Proxy",devices.FM_PROXY}
	},
}		

creators[devices.ARTIFICIAL_HORIZON] = {
	"P51Common::avArtificialHorizont_AN5736_P51",
	LockOn_Options.script_path.."ArtificialHorizont_AN5736/horizon_param.lua",
	{}
}		

creators[devices.DIRECTIONAL_GYRO] = {
	"P51Common::avDirectionalGyro_AN5735_P51",
	LockOn_Options.script_path.."DirectionalGyro_AN5735/directional_gyro_param.lua",
	{}
}	

creators[devices.TURN_INDICATOR] = {
	"avAirDrivenTurnIndicator",
	LockOn_Options.script_path.."TurnIndicator_AN5820/turn_indicator_param.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}		

creators[devices.CLOCK]	= {
	"avA11Clock",
	"",
	{}
}	

creators[devices.REMOTE_COMPASS] = {
	"avRemoteCompass_AN5730",
	LockOn_Options.script_path.."RemoteCompass_AN5730/compass_param.lua",
	{}
}				

creators[devices.VHF_RADIO] = 
	{"P51Common::avVHF_SCR_522A_P51",
	LockOn_Options.script_path.."VHF_Radio_SCR522A/Radio.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	{"Intercom",devices.INTERCOM}},
	LockOn_Options.script_path.."VHF_Radio_SCR522A/Radio_commands.lua"
}			

creators[devices.INTERCOM] = {
	"avIntercomWWII", 
	LockOn_Options.script_path.."Intercom.lua",
	{{"VHF_Radio",		devices.VHF_RADIO}}
}

creators[devices.TAIL_WARNING_RADAR] = {
	"P51D::avTailWarningRadar_AN_APS13",
	LockOn_Options.script_path.."TailWarningRadar_AN_APS13/TailRadar.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}}
}										  
								  
creators[devices.DETROLA] = {
	"P51D::avDetrolaReceiver", 
	LockOn_Options.script_path.."DetrolaReceiver/DetrolaReceiver.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	{"VHF_Radio", devices.VHF_RADIO}}
}				  
creators[devices.IFF] = {"P51D::avIFF_SCR_695",
	LockOn_Options.script_path.."IFF_SCR_695/SCR_695_params.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}} }
	
creators[devices.HOMING_ADAPTER] = {"P51D::avHomingAdapter_AN_ARA8",
	LockOn_Options.script_path.."HomingAdapter_AN_ARA8/AN_ARA8_params.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE}} }

creators[devices.ACCELEROMETER] = {
	"P51D::avAccelerometer",
	LockOn_Options.script_path .. "Accelerometer/Accelerometer.lua",
	{{"FM_PROXY",devices.FM_PROXY}}
}


creators = {
{"A10A::avAutoPilotInterface_A10A"},{"avNightVisionGoggles"}
}


creators[devices.PADLOCK]       = {"avPadlock",
                                   LockOn_Options.common_script_path .. "PADLOCK/PADLOCK_device.lua"}
								   
								   
creators[devices.MACROS]    =  {"avAutostartDevice",
                                LockOn_Options.common_script_path.."Macro_handler.lua",
                                {},
                                "",
                                }
							
if LockOn_Options.flight.easy_radar then                                            						   
creators[devices.ARCADE] =          {"avArcadeRadar",
									LockOn_Options.script_path.."ARCADE/arcade.lua",
									{},
									}							   
end							
-- Indicators
indicators = {}
	

indicators[#indicators + 1] = {
	"P51Common::ccControlsIndicator_P51",
	LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua",
	devices.CONTROL_SYSTEM
}

indicators[#indicators + 1] = {"ccPadlock", LockOn_Options.common_script_path.."PADLOCK/PADLOCK_indicator.lua",devices.PADLOCK}

if LockOn_Options.flight.easy_radar then                                            
	indicators[#indicators + 1] = {"P51Common::ccArcadeRadar_P51"   ,LockOn_Options.script_path.."ARCADE/arcade_indicator.lua",devices.ARCADE}
end


---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
				

