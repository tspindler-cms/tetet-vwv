dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Bigelow_weapons = weapons:new()

USS_Bigelow_weapons:addTurret(1)
USS_Bigelow_weapons:addLauncher(1, 1, ship_FMC5)
USS_Bigelow_weapons:addLauncher(1, 2, ship_FMC5)

USS_Bigelow_weapons:addTurret(2)
USS_Bigelow_weapons:addLauncher(2, 1, ship_FMC5)
USS_Bigelow_weapons:addLauncher(2, 2, ship_FMC5)

USS_Bigelow_weapons:addTurret(3)
USS_Bigelow_weapons:addLauncher(3, 1, ship_FMC5)
USS_Bigelow_weapons:addLauncher(3, 2, ship_FMC5)

USS_Bigelow_weapons:addTurret(4)
USS_Bigelow_weapons:addLauncher(4, 1, ship_MK75)
USS_Bigelow_weapons:addLauncher(4, 2, ship_MK75)

USS_Bigelow_weapons:addTurret(5)
USS_Bigelow_weapons:addLauncher(5, 1, ship_MK75)
USS_Bigelow_weapons:addLauncher(5, 2, ship_MK75)
