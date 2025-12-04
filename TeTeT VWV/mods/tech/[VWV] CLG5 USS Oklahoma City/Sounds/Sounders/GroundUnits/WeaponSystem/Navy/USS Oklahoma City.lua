dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds1.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Oklahoma_City_weapons = weapons:new()

USS_Oklahoma_City_weapons:addTurret(1)
USS_Oklahoma_City_weapons:addLauncher(1, 1, ship_USN_152mm)

USS_Oklahoma_City_weapons:addTurret(2)
USS_Oklahoma_City_weapons:addLauncher(2, 1, ship_USN_125mm)
USS_Oklahoma_City_weapons:addLauncher(2, 2, ship_USN_125mm)

USS_Oklahoma_City_weapons:addTurret(3)
USS_Oklahoma_City_weapons:addLauncher(3, 1, ship_USN_125mm)
USS_Oklahoma_City_weapons:addLauncher(3, 2, ship_USN_125mm)

USS_Oklahoma_City_weapons:addTurret(4)
USS_Oklahoma_City_weapons:addLauncher(4, 1, HARPOON)


