dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")

dofile("GroundUnits/WeaponSystem/Tools/VAP_Weapons_sounders.lua")

vap_vc_bicycle_ak_weapons = weapons:new()

vap_vc_bicycle_ak_weapons:addLauncher(1, 1, VAP_AK47)

