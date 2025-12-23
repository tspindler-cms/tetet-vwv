dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

CCB_weapons = weapons:new()

CCB_weapons:addTurret(1)

CCB_weapons:addLauncher(1, 1, automatic_gun_25mm)

CCB_weapons:addTurret(2)
CCB_weapons:addLauncher(2, 1, automatic_gun_25mm)

CCB_weapons:addTurret(3)
CCB_weapons:addLauncher(3, 1, automatic_gun_25mm)

CCB_weapons:addTurret(4)
CCB_weapons:addLauncher(4, 1, ship_MK75)