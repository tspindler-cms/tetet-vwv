dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

dofile("GroundUnits/WeaponSystem/Tools/VAP_Weapons_sounders.lua")

vap_type63_mlrs_weapons = weapons:new()

vap_type63_mlrs_weapons:addTurret(1, "GndTech/TurretRotation_Manual")	
vap_type63_mlrs_weapons:addLauncher(1, 1, _9M120)
vap_type63_mlrs_weapons:addLauncher(2, 1, VAP_AK47)