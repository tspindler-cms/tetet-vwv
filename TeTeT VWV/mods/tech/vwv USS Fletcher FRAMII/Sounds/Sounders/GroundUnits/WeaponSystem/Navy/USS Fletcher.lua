dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Fletcher_weapons = weapons:new()

USS_Fletcher_weapons:addTurret(1)
USS_Fletcher_weapons:addLauncher(1, 1, automatic_gun_25mm)

USS_Fletcher_weapons:addTurret(2)
USS_Fletcher_weapons:addLauncher(2, 1, automatic_gun_25mm)

USS_Fletcher_weapons:addTurret(3)
USS_Fletcher_weapons:addLauncher(3, 1, automatic_gun_25mm)

USS_Fletcher_weapons:addTurret(4)
USS_Fletcher_weapons:addLauncher(4, 1, automatic_gun_25mm)

USS_Fletcher_weapons:addTurret(5)
USS_Fletcher_weapons:addLauncher(5, 1, automatic_gun_25mm)

USS_Fletcher_weapons:addTurret(6)
USS_Fletcher_weapons:addLauncher(6, 1, ship_FMC5)
USS_Fletcher_weapons:addLauncher(6, 2, ship_FMC5)

USS_Fletcher_weapons:addTurret(7)
USS_Fletcher_weapons:addLauncher(7, 1, ship_FMC5)
USS_Fletcher_weapons:addLauncher(7, 2, ship_FMC5)
