local ch46d_late = dofile(current_mod_path .. "/Database/vwv_ch46d_base.lua")

ch46d_late.Name 		= "vwv_ch46d_late"
ch46d_late.DisplayName 	= _("[VWV] CH-46D Sea Knight (late)")
ch46d_late.date_of_introduction	= 1972.07	-- AN/ALE-29 added July 1972; became prototype for XM-130

ch46d_late.Countermeasures = { DISPENSER = "AN/ALE-47", }

ch46d_late.chaff_flare_dispenser = {
	-- { dir =  {X, Y, Z}, pos =  {X, Y, Z}, }  -- X=back/fwd,Y=down/up(+),Z=left/right
	[1] = {pos = {-2.27, 0.7, -0.5}, dir = {-0.1, -0.7, -0.7}},	-- Fire outboard + downward
	[2] = {pos = {-2.27, 0.7,  0.5}, dir = {-0.1, -0.7,  0.7}},
}

ch46d_late.passivCounterm = {				-- 2x XM-130s (30x M206 flares each)
    CMDS_Edit = true,
    SingleChargeTotal = 60, 				-- total countermeasure charges
    chaff = { default = 0,  increment = 0,  chargeSz = 0 },
    flare = { default = 60, increment = 60, chargeSz = 1 },
}

-- Note: Towards the very end of the war or during post-war upgrades, the CH-46D
-- used the AN/ARC-131 which extended the freq. range slightly to 30.00 – 75.95 MHz.
ch46d_late.HumanRadio.rangeFrequency = {
	{min =  30.0, max =  75.975, modulation = MODULATION_FM},	-- AN/ARC-131
	{min = 225.0, max = 399.975, modulation = MODULATION_AM},	-- AN/ARC-51
}

ch46d_late.M_empty		= 5827 + 15			-- [kg] CM dispensers enabled by default

ch46d_late.AddPropAircraft[#ch46d_late.AddPropAircraft + 1] = {
	-- This adds a checkbox in the mission editor add/remove CM dispensers
	id				= "RemoveCMDS",
	control			= "checkbox",			-- "checkbox", "comboList", "spinner", etc.
	label			= _("Remove CM Dispensers"),
	boolean_inverted = false,				-- If the EDM arg doesn't work the way you want, complement the number passed to the EDM
	defValue		= false,				-- [bool] Default setting in misson editor
	weightWhenOn	= -15,					-- [kg] How much weight is added/removed when this is enabled
	arg				= 1000,					-- [enum] Which EDM argument is toggled
	wCtrl			= 20,					-- [pixels] Sets dropdown menu width
}

return ch46d_late