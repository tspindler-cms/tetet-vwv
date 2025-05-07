dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Gray_weapons = weapons:new()

USS_Gray_weapons:addTurret(1)
USS_Gray_weapons:addLauncher(1, 1, ship_FMC5)
USS_Gray_weapons:addLauncher(1, 2, ship_FMC5)




