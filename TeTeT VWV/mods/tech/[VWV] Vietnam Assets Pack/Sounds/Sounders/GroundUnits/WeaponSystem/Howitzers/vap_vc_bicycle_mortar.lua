dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

vap_vc_bicycle_mortar_weapons = weapons:new()

vap_vc_bicycle_mortar_weapons:addLauncher(1, 1, automatic_gun_L21A1)