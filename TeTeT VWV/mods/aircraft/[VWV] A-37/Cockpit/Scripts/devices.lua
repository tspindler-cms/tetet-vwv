local count = 0
local function counter()
	count = count + 1
	return count
end
-------DEVICE ID-------
devices = {}
devices["KNEEBOARD"]		        = counter()
devices["SYSTEM"]		            = counter()
devices["AERO_SURFACES"]			= counter()
