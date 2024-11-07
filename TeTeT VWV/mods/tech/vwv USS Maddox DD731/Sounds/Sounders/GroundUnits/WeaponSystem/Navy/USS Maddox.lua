dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Maddox_weapons = weapons:new()

USS_Maddox_weapons:addTurret(1)
USS_Maddox_weapons:addLauncher(1, 1, ship_FMC5)

USS_Maddox_weapons:addTurret(2)
USS_Maddox_weapons:addLauncher(2, 1, ship_FMC5)

USS_Maddox_weapons:addTurret(3)
USS_Maddox_weapons:addLauncher(3, 1, ship_FMC5)
