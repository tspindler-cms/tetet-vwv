mass				= 20000
deltaCntrB			= 0.0
wingMzDampK			= 0.3
fuselageMyDampK		= 0.3
fuselageMzDampK		= 0.2

mainGearAreaAD		= 0.4  -- площадь шасси для аэродинамики
noseGearAreaAD		= 0.2;

-- СДУ-10:
-- stickPitch = __max(-1, __min(k_sh*pilotStickPitch + kwz*wz + kny*(ny - 1), 1));
-- kny = __max(cs_Kny_min, __min(cs_Kny_max + kny_q = (cs_Kny_min - cs_Kny_max)/(cs_q_ny_max - cs_q_ny_min)*(q - cs_Kny_min), cs_Kny_max));
-- kwz = __max(cs_Kwz_min, __min(cs_Kwz_max + kwz_q = (cs_Kwz_min - cs_Kwz_max)/(cs_q_wz_max - cs_q_wz_min)*(q - cs_Kwz_min), cs_Kwz_max));


--    K
--               q_ny_max
--    Kny_max  _____ 
--                  \
--    Kny_min        \______     q
--				 q_ny_min 

cs_Kwz_g = 3.8*0.7   		-- к-т демпфера при выпущ.шасси (Kny = 0)
cs_q_ny_max = 17000		-- 4 точки для ломаной кривой к-та перегрузки по скоростному напору
cs_q_ny_min = 1600		 
cs_Kny_max = 0.15
cs_Kny_min = 0.031		
cs_q_wz_max = 26000		-- 4 точки для ломаной кривой к-та демпфера по скоростному напору
cs_q_wz_min = 2000		
cs_Kwz_max = 0.72
cs_Kwz_min = 0.4		

cs_q_nz_max = 17000		-- все то же самое для путевого канала
cs_q_nz_min = 2000		 
cs_Knz_max = 0.3*1
cs_Knz_min = 0.1	*1	
cs_q_wy_max = 26000	
cs_q_wy_min = 2000		
cs_Kwy_max = 1.9
cs_Kwy_min = 0.5	

-- к-ты ОПР (ФФБ джойстик)
cs_shakeAoA0 = 23	-- УА начала тряски [град]
cs_shakeAoA1 = 27	-- УА максимальной тряски
cs_shakeNy0 = 7.5	-- перегрузка начала тряски
cs_shakeNy1 = 8.5	-- перегрузка максимальной тряски
cs_shakeKdAoA = 10*0	-- к-т упреждения (уменьшения УА тряски на KdAoA*wz)
cs_shakeKdNy = 3*0	-- упреждение по перегрузке
cs_shakeAmpl = 0.4
cs_shakeFreq = 10

	--	0		1		2		3	4	5		6		7		8		9		10		11		12		13
dg	= {-180,	-120,	-90,	0,	9,	17,		20,		27,		45,		50,		90,		110,		120,		180};
s	= {1,	1,		0.2,		1,	1,	1,		1,	    1,		0.947,	0.904,	0.45,	0.2,		0.3,		1};
ns	= {1,	1,		0.2,		1,	1,	0.882,	0.876,	0.854,	0.796,	0.768,	0.45,	0.2,		0.3,		1};
