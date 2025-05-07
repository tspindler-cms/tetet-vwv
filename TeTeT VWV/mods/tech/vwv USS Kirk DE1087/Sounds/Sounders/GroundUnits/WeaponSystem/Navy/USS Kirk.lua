dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Kirk_weapons = weapons:new()

USS_Kirk_weapons:addTurret(1)
USS_Kirk_weapons:addLauncher(1, 1, ship_FMC5)
USS_Kirk_weapons:addLauncher(1, 2, ship_FMC5)




