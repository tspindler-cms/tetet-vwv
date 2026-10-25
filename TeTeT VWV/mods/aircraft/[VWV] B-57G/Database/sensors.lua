-- Chin turret for the B-57G: LLLTV and FLIR, with the laser boresighted to both.
-- Category and optic-type numbers match the values used by the stock sensor scripts.
local SENSOR_OPTICAL = 0
local OPTIC_SENSOR_LLTV = 1
local OPTIC_SENSOR_IR = 2

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
