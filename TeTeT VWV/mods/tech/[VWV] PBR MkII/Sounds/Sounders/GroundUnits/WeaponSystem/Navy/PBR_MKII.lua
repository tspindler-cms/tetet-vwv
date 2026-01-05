dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds1.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

PBR_MKII_weapons = weapons:new()

PBR_MKII_weapons:addTurret(1)
PBR_MKII_weapons:addLauncher(1, 1, automatic_gun_25mm)
PBR_MKII_weapons:addLauncher(1, 2, automatic_gun_25mm)

PBR_MKII_weapons:addTurret(2)
PBR_MKII_weapons:addLauncher(2, 1, machinegun_12_7_M2)
