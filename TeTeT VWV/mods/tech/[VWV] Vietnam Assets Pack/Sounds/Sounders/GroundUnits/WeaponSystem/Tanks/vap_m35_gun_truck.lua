dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

dofile("GroundUnits/WeaponSystem/Tools/VAP_Weapons_sounders.lua")


vap_m35_gun_truck_weapons = weapons:new()

vap_m35_gun_truck_weapons:addTurret(1, "GndTech/TurretRotation_Electric")
vap_m35_gun_truck_weapons:addLauncher(1, 1, VAP_QuadM2BMG)