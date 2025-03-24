-- To be found under Static -> Cargos, not Helicopters
-- cannot change category and attributes it seems
local sh2f_static = {
	Name = 'vwv_sh2f_static',
	DisplayName = _('[VWV] SH-2F Seasprite (Folded) Static'),
	DisplayNameShort = _('[VWV] SH-2F (Folded)'),

	Picture =  current_mod_path..'/Textures/sh_2c_static.png',
	ShapeName = "sh_2c_static",

	shape_table_data =
	{
		 {
			file = "sh_2c_static",
			life = 5,
			username = "sh_2c_static",
			desrt = "sh_2c_f_collision",
		},
		{
			name  = "sh_2c_f_collision",
			file  = "sh_2c_f_collision",
			fire  = { 240, 2},
		}
	},

	mapclasskey = "P0091000021",
	attribute = { "Cargos" },
	category = "Cargo",
	Life = -1,
	Rate = 100,
	canExplode = false,
};

add_surface_unit(sh2f_static);