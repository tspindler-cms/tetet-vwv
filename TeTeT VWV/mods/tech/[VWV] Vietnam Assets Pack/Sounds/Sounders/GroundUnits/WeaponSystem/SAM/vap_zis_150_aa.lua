dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")



vap_zis_150_aa_weapons = weapons:new()
vap_zis_150_aa_weapons:addTurret(1, "GndTech/TurretRotation_Manual")
vap_zis_150_aa_weapons:addLauncher(1, 1, automatic_gun_25mm)