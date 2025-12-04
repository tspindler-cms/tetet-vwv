dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

ATCH_Heavy_weapons = weapons:new()

ATCH_Heavy_weapons:addTurret(1)
ATCH_Heavy_weapons:addLauncher(1, 1, machinegun_12_7_M2)
ATCH_Heavy_weapons:addLauncher(1, 2, automatic_gun_25mm)

ATCH_Heavy_weapons:addTurret(2)
ATCH_Heavy_weapons:addLauncher(2, 1, automatic_gun_25mm)

ATCH_Heavy_weapons:addTurret(3)
ATCH_Heavy_weapons:addLauncher(3, 1, automatic_gun_25mm)

ATCH_Heavy_weapons:addTurret(4)
ATCH_Heavy_weapons:addLauncher(4, 1, machinegun_12_7_M2)

ATCH_Heavy_weapons:addTurret(5)
ATCH_Heavy_weapons:addLauncher(5, 1, machinegun_12_7_M2)

ATCH_Heavy_weapons:addTurret(6)
ATCH_Heavy_weapons:addLauncher(6, 1, machinegun_M240C)

ATCH_Heavy_weapons:addTurret(7)
ATCH_Heavy_weapons:addLauncher(7, 1, machinegun_M240C)

ATCH_Heavy_weapons:addTurret(8)
ATCH_Heavy_weapons:addLauncher(8, 1, machinegun_M240C)

ATCH_Heavy_weapons:addTurret(9)
ATCH_Heavy_weapons:addLauncher(9, 1, machinegun_M240C)
