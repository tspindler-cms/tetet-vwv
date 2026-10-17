dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds1.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Sample_1969_weapons = weapons:new()

USS_Sample_1969_weapons:addTurret(1)
USS_Sample_1969_weapons:addLauncher(1, 1, ship_USN_125mm)
USS_Sample_1969_weapons:addLauncher(1, 2, ship_USN_125mm)

USS_Sample_1969_weapons:addTurret(2)
USS_Sample_1969_weapons:addLauncher(2, 1, ship_USN_125mm)
USS_Sample_1969_weapons:addLauncher(2, 2, ship_USN_125mm)


USS_Sample_1969_weapons:addTurret(3)
USS_Sample_1969_weapons:addLauncher(3, 1, HARPOON)

-- _9A33, _9M120, _9M311, M26, ship_MK41_SM2, HARPOON, 



