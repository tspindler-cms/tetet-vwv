self_ID = "tetet_mig17f"
declare_plugin(self_ID, {
    -- image = "mig17f.bmp",
    installed = true, -- if false that will be place holder , or advertising
    dirName = current_mod_path,
    displayName = _("vwv_mig17f"),
    fileMenuName = _("vwv_mig17f"),
    developerName = _("TeTeT"),
    update_id = "mig17f",
    version = "0.7.0",
    state = "installed",
    info = _("Wikipedia: The Mikoyan-Gurevich MiG-17 (Russian: Микоян и Гуревич МиГ-17; NATO reporting name: Fresco) is a high-subsonic fighter aircraft produced in the Soviet Union from 1952 and was operated by air forces internationally."),

    Skins = {{name = _("MiG-17F"), dir = "Skins/1"}},
    Missions = {{name = _("mig17f"), dir = "Missions"}},
    LogBook = {
        {name = _("mig17f"), type = "mig17f"}
        -- {
        -- name		= _("mig17pm"),
        -- type		= "mig17pm",
        -- },
    },
    Options = {{name = _("mig17f"), nameId = "mig17f", dir = "Options"}},
    InputProfiles = {
        ["mig17f"] = current_mod_path .. '/Input/mig17f'
        -- ["mig17pm"] = current_mod_path .. '/Input/mig17pm',
    }

})

----------------------------------------------------------------------------------------
mount_vfs_model_path(current_mod_path .. "/Shapes")
mount_vfs_texture_path(current_mod_path .. "/Textures/Avionics")
mount_vfs_texture_path(current_mod_path .. "/Textures/mig17f")
-- mount_vfs_texture_path(current_mod_path .. "/Textures/mig17pm")
-- mount_vfs_model_path(current_mod_path .. "/Cockpit/Shape")
mount_vfs_liveries_path(current_mod_path .. "/Liveries")
-- mount_vfs_sound_path(current_mod_path .. "/Sounds")
-------------------------------------------------------------------------------------
--[[ TeTeT - unclear if this is needed
local cfg_path = current_mod_path .. "/FM/F15/config.lua"
dofile(cfg_path)
F15FM[1] = self_ID
F15FM[2] = 'F15'
F15FM.config_path = cfg_path
F15FM.old = 54
]]

-- dofile(current_mod_path .. '/weapons/guns.lua')
dofile(current_mod_path .. '/mig_boarding_ladder.lua')
dofile(current_mod_path .. '/mig17f.lua')
-- dofile(current_mod_path .. '/mig17pm.lua')

dofile(current_mod_path .. "/Views17e.lua")
make_view_settings('vwv_mig17f', ViewSettings, SnapViews)
make_flyable('vwv_mig17f', current_mod_path .. '/Cockpit/Scripts/', {nil, old = 16},
             current_mod_path .. '/comm.lua')
-- dofile(current_mod_path.."/Views17PM.lua")
-- make_view_settings('mig17pm' , ViewSettings, SnapViews)
-- make_flyable('mig17pm', current_mod_path..'/Cockpit/Scripts/', {nil,old = 3}, current_mod_path..'/Comm.lua')
-------------------------------------------------------------------------------------
plugin_done()
