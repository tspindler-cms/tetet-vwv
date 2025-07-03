dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds1.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")

USS_TheSullivans_weapons = weapons:new()

USS_TheSullivans_weapons:addTurret(1)
USS_TheSullivans_weapons:addLauncher(1, 1, ship_USN_125mm)
USS_TheSullivans_weapons:addLauncher(1, 2, ship_USN_125mm)

USS_TheSullivans_weapons:addTurret(2)
USS_TheSullivans_weapons:addLauncher(2, 1, ship_USN_125mm)
USS_TheSullivans_weapons:addLauncher(2, 2, ship_USN_125mm)

USS_TheSullivans_weapons:addTurret(3)
USS_TheSullivans_weapons:addLauncher(3, 1, ship_USN_125mm)
USS_TheSullivans_weapons:addLauncher(3, 2, ship_USN_125mm)

USS_TheSullivans_weapons:addTurret(4)
USS_TheSullivans_weapons:addLauncher(4, 1, ship_USN_125mm)
USS_TheSullivans_weapons:addLauncher(4, 2, ship_USN_125mm)

USS_TheSullivans_weapons:addTurret(5)
USS_TheSullivans_weapons:addLauncher(5, 1, ship_MK75)

USS_TheSullivans_weapons:addTurret(6)
USS_TheSullivans_weapons:addLauncher(6, 1, ship_MK75)

USS_TheSullivans_weapons:addTurret(7)
USS_TheSullivans_weapons:addLauncher(7, 1, ship_MK75)
USS_TheSullivans_weapons:addLauncher(7, 2, ship_MK75)

USS_TheSullivans_weapons:addTurret(8)
USS_TheSullivans_weapons:addLauncher(8, 1, ship_MK75)
USS_TheSullivans_weapons:addLauncher(8, 2, ship_MK75)

USS_TheSullivans_weapons:addTurret(9)
USS_TheSullivans_weapons:addLauncher(9, 1, automatic_gun_25mm)

USS_TheSullivans_weapons:addTurret(10)
USS_TheSullivans_weapons:addLauncher(10, 1, automatic_gun_25mm)


USS_TheSullivans_weapons:addTurret(11)
USS_TheSullivans_weapons:addLauncher(11, 1, automatic_gun_25mm)

USS_TheSullivans_weapons:addTurret(12)
USS_TheSullivans_weapons:addLauncher(12, 1, automatic_gun_25mm)

USS_TheSullivans_weapons:addTurret(13)
USS_TheSullivans_weapons:addLauncher(13, 1, automatic_gun_25mm)
