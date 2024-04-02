declare_loadout(
	{
		category		= 	CAT_BOMBS,
		CLSID			=	"{SB_F8_BRU_41A_M82_4 Rt}",
		Picture			=	"mk82.png",
	--	wsTypeOfWeapon	=	{4,	15,	47,	34},--
		wsTypeOfWeapon	=	{wsType_Weapon,	wsType_Bomb, wsType_Bomb_A,	31},-- Mk_117/34 31 mk82 79 mk82se
		displayName		=	_("BRU-41A with 4 x Mk-82 - 500lb GP Bomb HD Right"),
		attribute		=	{4,	5,	32,	14},
		Cx_pil			=	0.00544,
		Count			=	4,
		Weight			=	2100,
				
				Elements	=	
		{
				{ShapeName	=	"BRU_41A", IsAdapter=true},
							
				{ShapeName	=	"{Mk82}",Position	=	{1.261035,	-0.193789,	0.000397}},--FB point 1
				{ShapeName	=	"{Mk82}",Position	=	{-1.095152,	-0.193789,	0.000397}},--BB point 2
				
				{ShapeName	=	"{Mk82}",Position	=	{-1.095152,	0.075838,	0.144016},Rotation = {-45,0,0}},--BR point 3
				{ShapeName	=	"{Mk82}",Position	=	{1.261035,	0.075838,	0.144016},Rotation = {-45,0,0}},--FR POINT 4
				
		}, -- end of Elements
	}
)

declare_loadout(
	{
		category		= 	CAT_BOMBS,
		CLSID			=	"{SB_F8_BRU_41A_M82_4 Lt}",
		Picture			=	"mk82.png",
	--	wsTypeOfWeapon	=	{4,	15,	47,	34},--
		wsTypeOfWeapon	=	{wsType_Weapon,	wsType_Bomb, wsType_Bomb_A,	31},-- Mk_117/34 31 mk82 79 mk82se
		displayName		=	_("BRU-41A with 4 x Mk-82 - 500lb GP Bomb HD Left"),
		attribute		=	{4,	5,	32,	14},
		Cx_pil			=	0.00544,
		Count			=	4,
		Weight			=	2100,
						
				Elements	=	
		{
				{ShapeName	=	"BRU_41A", IsAdapter=true},
							
				{ShapeName	=	"{Mk82}",Position	=	{1.261035,	-0.193789,	0.000397}},--FB point 1
				{ShapeName	=	"{Mk82}",Position	=	{-1.095152,	-0.193789,	0.000397}},--BB point 2
				
				{ShapeName	=	"{Mk82}",Position	=	{-1.095152,	0.075838,	-0.144016},Rotation = {45,0,0}},--BL point 5
				{ShapeName	=	"{Mk82}",Position	=	{1.261035,	0.075838,	-0.144016},Rotation = {45,0,0}},--FL POINT 6
				
		}, -- end of Elements
	}
)


declare_loadout(
	{
		category		= 	CAT_BOMBS,
		CLSID			=	"{SB_F8_BRU_41A_M82SE_4 Rt}",
		Picture			=	"mk82.png",
	--	wsTypeOfWeapon	=	{4,	15,	47,	34},--
		wsTypeOfWeapon	=	{wsType_Weapon,	wsType_Bomb, wsType_Bomb_A,	79},-- Mk_117/34 31 mk82 79 mk82se
		displayName		=	_("BRU-41A with 4 x Mk-82 Snakeye - 500lb GP Bomb HD Right"),
		attribute		=	{4,	5,	32,	14},
		Cx_pil			=	0.00544,
		Count			=	4,
		Weight			=	2100,
				
				Elements	=	
		{
				{ShapeName	=	"BRU_41A", IsAdapter=true},
							
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{1.261035,	-0.193789,	0.000397}},--FB point 1
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{-1.095152,	-0.193789,	0.000397}},--BB point 2
				
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{-1.095152,	0.075838,	0.144016},Rotation = {-45,0,0}},--BR point 3
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{1.261035,	0.075838,	0.144016},Rotation = {-45,0,0}},--FR POINT 4
				
		}, -- end of Elements
	}
)

declare_loadout(
	{
		category		= 	CAT_BOMBS,
		CLSID			=	"{SB_F8_BRU_41A_M82SE_4 Lt}",
		Picture			=	"mk82.png",
	--	wsTypeOfWeapon	=	{4,	15,	47,	34},--
		wsTypeOfWeapon	=	{wsType_Weapon,	wsType_Bomb, wsType_Bomb_A,	79},-- Mk_117/34 31 mk82 79 mk82se
		displayName		=	_("BRU-41A with 4 x Mk-82 Snakeye - 500lb GP Bomb HD Left"),
		attribute		=	{4,	5,	32,	14},
		Cx_pil			=	0.00544,
		Count			=	4,
		Weight			=	2100,
						
				Elements	=	
		{
				{ShapeName	=	"BRU_41A", IsAdapter=true},
							
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{1.261035,	-0.193789,	0.000397}},--FB point 1
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{-1.095152,	-0.193789,	0.000397}},--BB point 2
				
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{-1.095152,	0.075838,	-0.144016},Rotation = {45,0,0}},--BL point 5
				{ShapeName	=	"{mk-82SNAKEYE}",Position	=	{1.261035,	0.075838,	-0.144016},Rotation = {45,0,0}},--FL POINT 6
				
		}, -- end of Elements
	}
)