dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

IX514_weapons = weapons:new()

IX514_weapons:addTurret(1)
IX514_weapons:addLauncher(1, 1, automatic_gun_25mm)

IX514_weapons:addTurret(2)
IX514_weapons:addLauncher(2, 1, automatic_gun_25mm)

IX514_weapons:addTurret(3)
IX514_weapons:addLauncher(3, 1, machinegun_12_7_M2)

IX514_weapons:addTurret(4)
IX514_weapons:addLauncher(4, 1, machinegun_12_7_M2)

IX514_weapons:addTurret(5)
IX514_weapons:addLauncher(5, 1, machinegun_M240C)

IX514_weapons:addTurret(6)
IX514_weapons:addLauncher(6, 1, machinegun_M240C)

IX514_weapons:addTurret(7)
IX514_weapons:addLauncher(7, 1, ship_MK75)

IX514_weapons:addTurret(8)
IX514_weapons:addLauncher(8, 1, phalanx)

IX514_weapons:addTurret(9)
IX514_weapons:addLauncher(9, 1, phalanx)
