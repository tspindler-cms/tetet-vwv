

-- rockets and rocket pods 

-- tinytim
local tinytim = {
	category			= CAT_ROCKETS,
	CLSID				= "{tinytim}",
	name				= "Tiny Tim",
	user_name			= _("tinytim"),
	wsTypeOfWeapon		= {wsType_Weapon,wsType_NURS,wsType_Rocket, 1350},
	scheme 				= "nurs-standard",
	model 				= "tinytim",
		-- coped from 70mm rockets
        fm = 
        {
            mass        = 45,   -- start weight, kg
            caliber     = 0.135, -- Caliber, meters 
            cx_coeff    = {1,0.889005,0.67,0.3173064,2.08},  -- Cx
            L           = 2.105, --Length, meters
            I           = 39.00209, -- moment of inertia
            Ix          = 6, -- not used???
            Ma          = 0.50851, -- dependence moment coefficient of  by  AoA
            Mw          = 3.28844, --  dependence moment coefficient by angular speed
            shapeName   = "",

            wind_time   = 1.5, -- dispersion coefficient
            wind_sigma  = 4, -- dispersion coefficient
        },

        engine =
        {
            fuel_mass   = 16.5, -- Fuel mass, kg
            impulse     = 250, -- Specific impulse, sec
            boost_time  = 0, -- Time of booster action
            work_time   = 3.2, -- Time of mid-flight engine action
            boost_factor= 1, -- Booster to cruise trust ratio
            nozzle_position =  {{-0.858, 0, 0}}, -- meters
            tail_width  = 0.180, -- contrail thickness 
            boost_tail  = 1.5,
            work_tail   = 1.5,
			-- black smoke
            smoke_color = {0.15, 0.15, 0.15},
			smoke_transparency = 0.6,--0.8,
        },

	warhead	=
	{
		mass				= 9.2,
		-- 3.7kg TNT
		expl_mass 			= 4.7,
		other_factors 		= { 2.0, 2.5, 2.5},--{ 1.0, 0.5, 0.5},
		concrete_factors 	= { 0.8, 0.8, 0.8},--{ 1.0, 0.5, 0.1},
		concrete_obj_factor = 0.8,
		obj_factors 		= { 1.5, 1.5},--{ 1.0, 1.0},
		cumulative_factor	= 2.0,
		cumulative_thickness = 0.6,
		piercing_mass		= 20.0,
	},

	shape_table_data =
	{
		{
			file		= "tinytim",
			life		= 3,
			fire		= {0, 1},
			username 	= "tinytim",
			index 		= WSTYPE_PLACEHOLDER,
			position	= {0, 0, 0},
		},
	},

	properties =
	{
		dist_min = 500,
		dist_max = 7000,
	}
}

declare_weapon(tinytim)

-- tinytim
local tinytim = {
	category			= CAT_ROCKETS,
	CLSID				= "{tinytim}",
	name				= "Tiny Tim",
	user_name			= _("tinytim"),
	wsTypeOfWeapon		= {wsType_Weapon,wsType_NURS,wsType_Rocket, 1450},
	scheme 				= "nurs-standard",
	model 				= "tinytim",
		-- coped from 70mm rockets
        fm = 
        {
            mass        = 85,   -- start weight, kg
            caliber     = 0.635, -- Caliber, meters 
            cx_coeff    = {1,0.889005,0.67,0.3173064,2.08},  -- Cx
            L           = 2.105, --Length, meters
            I           = 39.00209, -- moment of inertia
            Ix          = 6, -- not used???
            Ma          = 0.50851, -- dependence moment coefficient of  by  AoA
            Mw          = 3.28844, --  dependence moment coefficient by angular speed
            shapeName   = "",

            wind_time   = 1.5, -- dispersion coefficient
            wind_sigma  = 4, -- dispersion coefficient
        },

        engine =
        {
            fuel_mass   = 17.5, -- Fuel mass, kg
            impulse     = 220, -- Specific impulse, sec
            boost_time  = 0, -- Time of booster action
            work_time   = 3.2, -- Time of mid-flight engine action
            boost_factor= 1, -- Booster to cruise trust ratio
            nozzle_position =  {{-0.875, 0, 0}}, -- meters
            tail_width  = 0.150, -- contrail thickness 
            boost_tail  = 1.5,
            work_tail   = 1.5,

            smoke_color = {0.1, 0.1, 0.1},
			smoke_transparency = 0.8,--0.8,
        },

	warhead	=
	{
		mass				= 4.2,
		-- 3.7kg TNT
		expl_mass 			= 3.7,
		other_factors 		= { 2.0, 2.5, 2.5},--{ 1.0, 0.5, 0.5},
		concrete_factors 	= { 0.8, 0.8, 0.8},--{ 1.0, 0.5, 0.1},
		concrete_obj_factor = 0.8,
		obj_factors 		= { 1.5, 1.5},--{ 1.0, 1.0},
		cumulative_factor	= 2.0,
		cumulative_thickness = 0.6,
		piercing_mass		= 20.0,
	},

	shape_table_data =
	{
		{
			file		= "tinytim",
			life		= 1,
			fire		= {0, 1},
			username 	= "tinytim",
			index 		= WSTYPE_PLACEHOLDER,
			position	= {0, 0, 0},
		},
	},

	properties =
	{
		dist_min = 500,
		dist_max = 7000,
	}
}

declare_weapon(tinytim)

--loadout declear function
function declear_rocket_pods(_uuid, _display_name, _display_icon, _rocket_num, _rocket_id, _rocket_shape, _distance, _diameter, _forwarding)
	local data = {
		category 		= CAT_ROCKETS,
		CLSID 			= _uuid,
		attribute 		= {wsType_Weapon,wsType_NURS,wsType_Container, 145},
		--attribute 	= {wsType_Weapon,wsType_NURS,wsType_Container,WSTYPE_PLACEHOLDER},
		wsTypeOfWeapon	= {wsType_Weapon,wsType_NURS,wsType_Rocket, _rocket_id},	
		Picture 		= _display_icon,
		displayName		= _(_display_name),
		Weight 			= 45 * _rocket_num + 5, -- weight * num + pylon
		Count			= _rocket_num,
		Cx_pil			= 0.0001,
		kind_of_shipping = 1,

		Elements = {},
	}

	if _rocket_num < 1 then
		data.Elements = {
			{
				ShapeName = "", -- pod name
				IsAdapter = true,
			},

			{
				Position	= {_forwarding + 0.01, - 0.065 - _diameter/2 * 3 - _distance, 0}, --2 0.25
				ShapeName	= _rocket_shape,
				Rotation 	= {0,0,-1.5},
			},
		}
	else
		data.Elements = {
			{
				ShapeName = "tinytim", -- pod name
				position = {0, 0, 0},
				IsAdapter = true,
			},


		}
	end
	return data
end

declare_loadout(declear_rocket_pods("{tinytim}", "Tiny Tim", "tinytim.png", 1, 1350, "tinytim", 0.025, 0.135, 0.38))


