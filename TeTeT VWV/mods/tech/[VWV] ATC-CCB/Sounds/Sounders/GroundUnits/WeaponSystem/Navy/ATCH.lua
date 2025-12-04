dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

ATCH_weapons = weapons:new()

ATCH_weapons:addTurret(1)
ATCH_weapons:addLauncher(1, 1, machinegun_12_7_M2)
ATCH_weapons:addLauncher(1, 2, automatic_gun_25mm)

ATCH_weapons:addTurret(2)
ATCH_weapons:addLauncher(2, 1, automatic_gun_25mm)

ATCH_weapons:addTurret(3)
ATCH_weapons:addLauncher(3, 1, automatic_gun_25mm)
