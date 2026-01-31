dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

vap_mutt_gun_weapons = weapons:new()

vap_mutt_gun_weapons:addTurret(1, "GndTech/TurretRotation_Manual")	
vap_mutt_gun_weapons:addLauncher(1, 1, howitzer_2A64)
vap_mutt_gun_weapons:addLauncher(1, 2, howitzer_2A64)
vap_mutt_gun_weapons:addLauncher(1, 3, howitzer_2A64)

