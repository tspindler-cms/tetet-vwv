dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

VWV_DSHK_HMG_weapons = weapons:new()

VWV_DSHK_HMG_weapons:addLauncher(1, 1, {
    cycle_shot = "Weapons/Kord",
    end_burst = "Weapons/Kord_End",
})