dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds1.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_Enterprise_1969_weapons = weapons:new()

USS_Enterprise_1969_weapons:addTurret(1)
USS_Enterprise_1969_weapons:addLauncher(1, 1, _9M120)

USS_Enterprise_1969_weapons:addTurret(2)
USS_Enterprise_1969_weapons:addLauncher(2, 1, _9M120)





