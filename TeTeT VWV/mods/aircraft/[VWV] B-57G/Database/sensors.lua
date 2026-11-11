-- Chin turret for the B-57G: LLLTV and FLIR, with the laser boresighted to both.
-- Category and optic-type numbers match the values used by the stock sensor scripts.
local SENSOR_OPTICAL = 0
local OPTIC_SENSOR_LLTV = 1
local OPTIC_SENSOR_IR = 2
local SENSOR_RADAR = 1
local RADAR_SS = 1

local function turret_volume()
	return {
		-- Wide enough for the AI to keep the spot on the target until the bomb hits.
		azimuth = {-150.0, 150.0},
		elevation = {-150.0, 30.0},
	}
end

declare_sensor({
	category = SENSOR_OPTICAL,
	Name = "B-57G LLLTV",
	type = OPTIC_SENSOR_LLTV,
	scan_volume = turret_volume(),
	view_volume_max = {
		azimuth_sector = 18.4,
		elevation_sector = 24.1,
	},
	magnifications = {1, 6},
	resolution = 0.07,
	laserRanger = true,
	laserDesignator = true,
})

declare_sensor({
	category = SENSOR_OPTICAL,
	Name = "B-57G FLIR",
	type = OPTIC_SENSOR_IR,
	scan_volume = turret_volume(),
	view_volume_max = {
		azimuth_sector = 12.0,
		elevation_sector = 12.0,
	},
	magnifications = {1, 4},
	resolution = 0.07,
	laserRanger = true,
	laserDesignator = true,
})

declare_sensor({
	category = SENSOR_RADAR,
	Name = "B-57G APQ-139",
	type = RADAR_SS, -- surface search only; no air-to-air search
	scan_volume = {
		azimuth = {-55.0, 55.0},   -- forward nose sector, same pattern as the A-6
		elevation = {-60.0, 30.0},
	},
	max_measuring_distance = 33300.0, -- 18 NM instrumented range
	scan_period = 1.1,
	vehicles_detection = true, -- moving-target detection
	RCS = 100,
	RBM_detection_distance = 33300.0,
	GMTI_detection_distance = 33300.0,
	HRM_detection_distance = 15742.0,
})