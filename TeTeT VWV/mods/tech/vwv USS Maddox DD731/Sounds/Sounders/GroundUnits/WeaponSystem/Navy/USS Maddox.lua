dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Maddox_weapons = weapons:new()

USS_Maddox_weapons:addTurret(1)
USS_Maddox_weapons:addLauncher(1, 1, ship_FMC5)
USS_Maddox_weapons:addLauncher(1, 2, ship_FMC5)

USS_Maddox_weapons:addTurret(2)
USS_Maddox_weapons:addLauncher(2, 1, ship_FMC5)
USS_Maddox_weapons:addLauncher(2, 2, ship_FMC5)

USS_Maddox_weapons:addTurret(3)
USS_Maddox_weapons:addLauncher(3, 1, ship_FMC5)
USS_Maddox_weapons:addLauncher(3, 2, ship_FMC5)

USS_Maddox_weapons:addTurret(4)
USS_Maddox_weapons:addLauncher(4, 1, automatic_gun_25mm)

USS_Maddox_weapons:addTurret(5)
USS_Maddox_weapons:addLauncher(5, 1, automatic_gun_25mm)

USS_Maddox_weapons:addTurret(6)
USS_Maddox_weapons:addLauncher(6, 1, automatic_gun_25mm)

USS_Maddox_weapons:addTurret(7)
USS_Maddox_weapons:addLauncher(7, 1, ship_FMC5)

USS_Maddox_weapons:addTurret(8)
USS_Maddox_weapons:addLauncher(8, 1, ship_FMC5)

USS_Maddox_weapons:addTurret(9)
USS_Maddox_weapons:addLauncher(9, 1, ship_FMC5)
USS_Maddox_weapons:addLauncher(9, 2, ship_FMC5)

USS_Maddox_weapons:addTurret(10)
USS_Maddox_weapons:addLauncher(10, 1, ship_FMC5)
USS_Maddox_weapons:addLauncher(10, 2, ship_FMC5)
