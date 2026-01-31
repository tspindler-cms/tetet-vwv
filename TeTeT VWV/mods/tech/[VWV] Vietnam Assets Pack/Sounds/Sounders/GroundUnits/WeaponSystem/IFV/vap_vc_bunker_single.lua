dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")

dofile("GroundUnits/WeaponSystem/Tools/VAP_Weapons_sounders.lua")

vap_vc_bunker_single_weapons = weapons:new()

vap_vc_bunker_single_weapons:addLauncher(1, 1, VAP_AK47)
vap_vc_bunker_single_weapons:addLauncher(2, 1, VAP_AK47)
vap_vc_bunker_single_weapons:addLauncher(3, 1, VAP_AK47)