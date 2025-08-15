dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds1.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Knox_weapons = weapons:new()

USS_Knox_weapons:addTurret(1)
USS_Knox_weapons:addLauncher(1, 1, ship_USN_125mm)
USS_Knox_weapons:addLauncher(1, 2, ship_USN_125mm)

USS_Knox_weapons:addTurret(2)
USS_Knox_weapons:addLauncher(2, 1, _9M120)




