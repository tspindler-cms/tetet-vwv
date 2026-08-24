-- Shared skeleton for the ATC-H "Tango" ship family (ATCH, ATC_Cargo, ATCH_Heavy).
-- All three ride the same "ATC-H_Heavy" shape and share the entire hull / sensor
-- config; they differ only in parking, landing point, armament and naming.
--
-- Usage in a variant file:
--     dofile(current_mod_path.."/Database/Navy/ATC-H_common.lua")
--     vwv_atc_build_base()          -- populates the global GT with the shared skeleton
--     ...add weapons, tweak the few unique fields, set Name/DisplayName...
--
-- These helpers are globals (DB load environment) intentionally; the vwv_atc_
-- prefix keeps them from colliding with other mods' load-time symbols.

function vwv_atc_build_base()
	GT = {}
	GT_t.ws = 0

	set_recursive_metatable(GT, GT_t.generic_ship)

	GT.visual = {}
	GT.visual.shape      = "ATC-H_Heavy"
	GT.visual.shape_dstr = ""

	GT.life             = 50
	GT.mass             = 66500
	GT.max_velocity     = 4.37242
	GT.race_velocity    = 4.11556
	GT.economy_velocity = 2.57201
	GT.economy_distance = 1.59272e+007
	GT.race_distance    = 1.59272e+007
	GT.shipLength       = 17.2
	GT.Width            = 5.3
	GT.Height           = 4.5
	GT.Length           = 17.5
	GT.DeckLevel        = 1.26
	GT.X_nose           = 8.5
	GT.X_tail           = -8.5
	GT.Tail_Width       = 6
	GT.Gamma_max        = 0.35
	GT.Om               = 0.05
	GT.speedup          = 1.1814062
	GT.R_min            = 35.0
	GT.distFindObstacles = 45.0

	GT.numParking      = 1
	GT.Helicopter_Num_ = 1
	GT.Plane_Num_      = 0

	GT.exhaust = {[1] = { size = 0.00, pos = {-8.569, 0.989, 1.126} }}
	GT.airWeaponDist = 3000
	GT.airFindDist   = 5000

	GT.WS = {}
	GT.WS.maxTargetDetectionRange = 5000
	GT.WS.radar_type    = 102
	GT.WS.fire_on_march = true
	GT.animation_arguments.alarm_state = 9
	GT.animation_arguments.luna_lights = -1

	GT.Rate = 100
	GT.Sensors = {
		OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"},
		RADAR = {"Patriot str", "ticonderoga search radar"},
	}
	GT.DetectionRange = GT.airFindDist
	GT.ThreatRange    = GT.airWeaponDist
	GT.Singleton      = "no"
	GT.riverCraft     = true
	GT.mapclasskey    = "P0091000039"
	GT.attribute = {
		wsType_Navy, wsType_Ship, wsType_ArmedShip, TICONDEROGA,
		"Cruisers", "RADAR_BAND1_FOR_ARM", "DetectionByAWACS",
	}
	GT.Categories = {{name = "Armed Ship"}, {name = "HelicopterCarrier"}}
	GT.Countries  = {"USA"}
end

-- One Oerlikon 20 mm turret firing the VWV 20 mm HE-T round.
function vwv_atc_add_oerlikon(t)
	local ws = GT_t.inc_ws()
	GT.WS[ws] = {}
	GT.WS[ws].center            = t.center
	GT.WS[ws].angles            = t.angles
	GT.WS[ws].reference_angle_Y = t.reference_angle_Y
	GT.WS[ws].reference_angle_Z = t.reference_angle_Z
	GT.WS[ws].drawArgument1     = t.drawArgument1
	GT.WS[ws].drawArgument2     = t.drawArgument2

	set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)

	if t.major ~= nil then
		GT.WS[ws].LN[1].major_weapon = t.major
	end
	GT.WS[ws].LN[1].BR[1].connector_name     = t.connector_name
	GT.WS[ws].LN[1].PL[1].shell_name         = {"vwv_20mm_HE_red"}
	GT.WS[ws].LN[1].PL[1].shell_display_name = "20mm HE-T"
	GT.WS[ws].LN[1].fireAnimationArgument    = -1
	return GT.WS[ws]
end

-- The two side light guns (right + left), identical on every variant.
function vwv_atc_add_side_light_guns()
	vwv_atc_add_oerlikon({
		center = "Turret_starboard_empty", connector_name = "Point_starboard",
		angles = {{math.rad(-25), math.rad(-175), math.rad(-5), math.rad(80)}},
		reference_angle_Y = math.rad(-174), reference_angle_Z = math.rad(5),
		drawArgument1 = 17, drawArgument2 = 18,
	})
	vwv_atc_add_oerlikon({
		center = "Turret_port_empty", connector_name = "Point_port",
		angles = {{math.rad(175), math.rad(25), math.rad(-5), math.rad(80)}},
		reference_angle_Y = math.rad(174), reference_angle_Z = math.rad(5),
		drawArgument1 = 15, drawArgument2 = 16,
	})
end

-- Standard armament for the plain ATC(H) and ATC(C): centre Oerlikon + side guns.
function vwv_atc_add_standard_turrets()
	vwv_atc_add_oerlikon({
		center = "Turret_aft_empty", connector_name = "Point_aft", major = true,
		angles = {{math.rad(180), math.rad(-180), math.rad(-1), math.rad(51)}},
		reference_angle_Y = math.rad(180), reference_angle_Z = math.rad(10),
		drawArgument1 = 19, drawArgument2 = 20,
	})
	vwv_atc_add_side_light_guns()
end

-- A single-launcher machine-gun mount (M2 or M240C) built from a template.
function vwv_atc_add_mg(t)
	local ws = GT_t.inc_ws()
	GT.WS[ws] = {}
	GT.WS[ws].center            = t.center
	GT.WS[ws].angles            = t.angles
	GT.WS[ws].reference_angle_Y = t.reference_angle_Y
	GT.WS[ws].reference_angle_Z = t.reference_angle_Z
	GT.WS[ws].drawArgument1     = t.drawArgument1
	GT.WS[ws].drawArgument2     = t.drawArgument2

	local ln = add_launcher(GT.WS[ws], t.template)
	if t.type ~= nil then ln.type = t.type end
	ln.BR[1].connector_name  = t.connector_name
	ln.fireAnimationArgument = -1
	return ws, ln
end
