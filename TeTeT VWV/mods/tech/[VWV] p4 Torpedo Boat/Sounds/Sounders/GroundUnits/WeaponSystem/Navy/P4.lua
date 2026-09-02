dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")

P4_weapons = weapons:new()

P4_weapons:addTurret(1)
P4_weapons:addLauncher(1, 1, { cycle_shot = "Weapons/Kord", end_burst = "Weapons/Kord_End"})
P4_weapons:addLauncher(1, 2, { cycle_shot = "Weapons/Kord", end_burst = "Weapons/Kord_End"})
