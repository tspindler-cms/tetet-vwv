dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Sumner_weapons = weapons:new()

USS_Sumner_weapons:addTurret(1)
USS_Sumner_weapons:addLauncher(1, 1, ship_FMC5)
USS_Sumner_weapons:addLauncher(1, 2, ship_FMC5)

USS_Sumner_weapons:addTurret(2)
USS_Sumner_weapons:addLauncher(2, 1, ship_FMC5)
USS_Sumner_weapons:addLauncher(2, 2, ship_FMC5)

USS_Sumner_weapons:addTurret(3)
USS_Sumner_weapons:addLauncher(3, 1, ship_FMC5)
USS_Sumner_weapons:addLauncher(3, 2, ship_FMC5)

USS_Sumner_weapons:addTurret(4)
USS_Sumner_weapons:addLauncher(4, 1, automatic_gun_25mm)

USS_Sumner_weapons:addTurret(5)
USS_Sumner_weapons:addLauncher(5, 1, automatic_gun_25mm)