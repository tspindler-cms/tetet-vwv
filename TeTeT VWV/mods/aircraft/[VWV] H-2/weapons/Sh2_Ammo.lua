-- ************************* fuel_tank_R **********************************

local function sh2_fuel_tank_120r(clsid)
	local data =
	{
		category	= CAT_FUEL_TANKS,
		CLSID		= clsid,
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("SH2 Fuel Tank 120 gallons R"),
		Weight_Empty	= 66,--132,
		Weight			= 66 + 179.428515, --132 + 358.85703, --132 + 598.09478, -- 120USG = 454.24941 liters * 0.79 kl/l --200USG = 757.082 liter * 0.79kg/l fuel weight 
		Cx_pil		= 0.000956902,
		shape_table_data = 
		{
			{
				name	= "SH2_FUEL_TANK_120R";
				file	= "vwv_sh2_tank_r";
				life	= 1;
				fire	= { 0, 1};
				username	= "SH2_FUEL_TANK_120R";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "vwv_sh2_tank_r",
			}, 
		}, 
	}
	declare_loadout(data)
end

sh2_fuel_tank_120r("{SH2_FUEL_TANK_120R}")


-- ************************* fuel_tank_L **********************************

local function sh2_fuel_tank_120l(clsid)
	local data =
	{
		category	= CAT_FUEL_TANKS,
		CLSID		= clsid,
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("SH2 Fuel Tank 120 gallons L"),
		Weight_Empty	= 66,--132,
		Weight			= 66 + 179.428515, --132 + 358.85703, --132 + 598.09478, -- 120USG = 454.24941 liters * 0.79 kl/l --200USG = 757.082 liter * 0.79kg/l fuel weight 
		Cx_pil		= 0.000956902,
		shape_table_data = 
		{
			{
				name	= "SH2_FUEL_TANK_120L";
				file	= "vwv_sh2_tank_l";
				life	= 1;
				fire	= { 0, 1};
				username	= "SH2_FUEL_TANK_120L";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "vwv_sh2_tank_l",
			}, 
		}, 
	}
	declare_loadout(data)
end

sh2_fuel_tank_120l("{SH2_FUEL_TANK_120L}")

-- ****************************** MAD ******************************************
local function sh2_mad(clsid)
	local data =
	{
		category	= CAT_PODS,
		CLSID		= clsid,
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "SH2_MAD.png",
		displayName	= _("SH2_MAD"),
		Weight_Empty	= 0,
		Weight			= 0,
		Cx_pil		= 0.000956902,
		shape_table_data = {
			{
				name 	= "vwv_sh2_mad";
				file	= "vwv_sh2_mad";
				life	= 1;
				username	= "vwv_sh2_mad";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements = {
			{
			  Position = {0.0, 0.0, 0.0},
			  ShapeName = "vwv_sh2_mad",
			},
		}, 
	}
	declare_loadout(data)
end

sh2_mad("{SH2_MAD}")
