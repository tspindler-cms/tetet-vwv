local ch46d_late = dofile(current_mod_path.."/Database/vwv_ch46d_base.lua")

ch46d_late.Name = 'vwv_ch46d_late'
ch46d_late.DisplayName = _('[VWV] CH-46D Sea Knight (late)')
-- TODO: Add Chaff and Flares
ch46d_late.chaff_flare_dispenser =
    {
        [1] =
        {
            dir = 	{-0.98,	-0.174,	-0.087},
            pos = 	{-2.7,	0.7,	-0.5},
        },
        [2] =
        {
            dir = 	{-0.98,	-0.174,	0.087},
            pos = 	{-2.7,	-07,	0.5},
        },
    }
ch46d_late.passivCounterm = {
    CMDS_Edit = true,
    SingleChargeTotal = 60, -- total countermeasures
    chaff = { default = 30, increment = 30, chargeSz = 1 },
    flare = { default = 30, increment = 30, chargeSz = 1 },
}

return ch46d_late