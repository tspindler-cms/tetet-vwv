dofile(LockOn_Options.script_path.."devices.lua")

std_message_timeout = 15

start_sequence_full = {
{time = 3.8,message = _("AUTOSTART SEQUENCE IS RUNNING"),message_timeout = std_message_timeout},

{time = 3.85,device = 38,action = 3030,value = 0.000000}, --EMER BRAKE OFF
--[[
Аккумуляторная батаре
Battery ON
--]]
{time = 3.956000,device = 1,action = 3006,value = 1.000000,message = _("BATTERY - ON"),message_timeout = std_message_timeout},
--[[
Преобразователь переменного тока
(для приборов) - вкл./выкл.
Inverter STBY
--]]
{time = 5.984000,device = 1,action = 3002,value = 1.000000,message = _("INVERTER - STBY"),message_timeout = std_message_timeout},
--[[
Подкачивающий насос
основного левого бака - вкл./выкл.
Boost pump Main Left
--]]
{time = 9.692000,device = 36,action = 3007,value = 1.000000,message = _("LEFT MAIN BOOST PUMP - ON"),message_timeout = std_message_timeout},
--[[
Подкачивающий насос
левого крыльевого бака - вкл./вык
Boost pump Wing Left
--]]
{time = 10.610000,device = 36,action = 3005,value = 1.000000,message = _("LEFT WING BOOST PUMP - ON"),message_timeout = std_message_timeout},
--[[
Подкачивающий насос
основного правого бака - вкл./выкл
Boost pump Main Right
--]]
{time = 11.606000,device = 36,action = 3008,value = 1.000000,message = _("RIGHT MAIN BOOST PUMP - ON"),message_timeout = std_message_timeout},
--[[
Подкачивающий насос
правого крыльевого бака - вкл./выкл.
Boost pump Wing Right
--]]
{time = 12.488000,device = 36,action = 3006,value = 1.000000,message = _("RIGHT WING BOOST PUMP - ON"),message_timeout = std_message_timeout},
--[[
ВСУ - вкл./выкл.
APU ON
--]]
{time = 14.792000,device = 37,action = 3005,value = 1.000000,message = _("APU - ON"),message_timeout = std_message_timeout},
{time = 19.136000,action = 569,message = _("THROTTLE PINKY SWITCH - AFT"),message_timeout = std_message_timeout},
--[[
Режимы БАНО
- проблесковый/выкл./постоянный
POSITION LIGHTS - FLASH
--]]
{time = 22.508000,device = 49,action = 3008,value = 1.000000,message = _("POSITION LIGHTS - FLASH"),message_timeout = std_message_timeout},
--[[
Поворотный переключатель режимов
VHF AM RADIO ON
--]]
{time = 24.926000,device = 55,action = 3003,value = 0.100000,message = _("VHF AM RADIO - TR"),message_timeout = std_message_timeout},
--[[
Функциональный переключатель 
UHF RADIO ON
--]]
{time = 27.488000,device = 54,action = 3008,value = 0.100000,message = _("UHF RADIO - MAIN"),message_timeout = std_message_timeout},
--[[
Поворотный переключатель режимов
VHF FM RADIO ON
--]]
{time = 28.796000,device = 56,action = 3003,value = 0.100000,message = _("VHF FM RADIO - TR"),message_timeout = std_message_timeout},
--[[
Генератор переменного тока - левый
Generator Left
--]]
{time = 35.498000,device = 1,action = 3004,value = 1.000000,message = _("LEFT GENERATOR - ON"),message_timeout = std_message_timeout},
--[[
Генератор переменного тока - правый
Generator Right
--]]
{time = 36.836000,device = 1,action = 3005,value = 1.000000,message = _("RIGHT GENERATOR - ON"),message_timeout = std_message_timeout},
--[[
Генератор ВСУ - вкл./выкл.
APU Generator
--]]
{time = 53.510000,device = 1,action = 3001,value = 1.000000,message = _("APU GENERATOR - ON"),message_timeout = std_message_timeout},
{time = 58.050000,action = 311,message = _("LEFT ENGINE - START"),message_timeout = std_message_timeout},

--[[
Питание спутниковой бесплатформенной
инерциальной навигационной системы EGI - вкл./выкл.
EGI power ON
--]]
{time = 64.622000,device = 22,action = 3006,value = 1.000000,message = _("EGI - ON"),message_timeout = std_message_timeout},
--[[
Питание блока управления
и индикации CDU - вкл./выкл.
CDU power ON
--]]
{time = 65.324000,device = 22,action = 3005,value = 1.000000,message = _("CDU - ON"),message_timeout = std_message_timeout},
--[[
Выключатель МФИ
CICU ON
--]]
{time = 70.298000,device = 7,action = 3008,value = 1.000000,message = _("CICU - ON"),message_timeout = std_message_timeout},
--[[
Выключатель объединенной
тактической системы радиосвязи
JTRS ON
--]]
{time = 71.216000,device = 7,action = 3009,value = 1.000000,message = _("JTRS - ON"),message_timeout = std_message_timeout},
--[[
Выключатель комплексной системы
управления полетом и вооружением
IFFCC
--]]
{time = 72.478000,device = 7,action = 3010,value = 0.100000,message = _("IFFCC - ON"),message_timeout = std_message_timeout},
{time = 72.752000,device = 7,action = 3010,value = 0.200000},
--[[
День/Ночь/Выкл.
Left MFCD Day
--]]
{time = 76.670000,device = 2,action = 3036,value = 0.100000,message = _("LEFT MFCD - DAY"),message_timeout = std_message_timeout},
{time = 77.078000,device = 2,action = 3036,value = 0.200000},
--[[
День/Ночь/Выкл.
Right MFCD Day
--]]
{time = 78.860000,device = 3,action = 3036,value = 0.100000,message = _("RIGHT MFCD - DAY"),message_timeout = std_message_timeout},
{time = 79.200000,device = 3,action = 3036,value = 0.200000},

{time = 94,message = _("ALIGNING INERTIAL NAVIGATION SYSTEM - 4 MINUTES LEFT"),message_timeout = 60.0},
--[[
Главный предупреждающий сигнал
Master Caution
--]]
{time = 97.442000,device = 24,action = 3001,value = 1.000000,message = _("CEASE MASTER CAUTION LIGHT"),message_timeout = std_message_timeout},
{time = 97.528000,device = 24,action = 3001,value = 0.000000},
--[[
Переключатель режимов
системы противодействия (CMS)
CMS
--]]
{time = 100.772000,device = 4,action = 3018,value = 0.100000,message = _("CMSP MODE - STBY"),message_timeout = std_message_timeout},
--[[
Система предупреждения о пуске ракет.
Левая кнопка мыши - вкл./выкл.,
правая - меню (не реализовано)
MWS ON
--]]
{time = 102.760000,device = 4,action = 3010,value = 0.100000,message = _("MWS - ON"),message_timeout = std_message_timeout},
--[[
Система предупреждения о пуске ракет.
Левая кнопка мыши - вкл./выкл.,
правая - меню (не реализовано)
JMR ON
--]]
{time = 103.496000,device = 4,action = 3012,value = 0.100000,message = _("JAMMER - ON"),message_timeout = std_message_timeout},
--[[
Система СПО.
Левая кнопка мыши - вкл./выкл.,
правая - самодиагностика
RWR ON
--]]
{time = 104.310000,device = 4,action = 3014,value = 0.100000,message = _("RWR - ON"),message_timeout = std_message_timeout},
--[[
Система выброса ДО/ЛТЦ.
Левая кнопка мыши - вкл./выкл.,
правая - меню
DISP ON
--]]
{time = 105.260000,device = 4,action = 3016,value = 0.100000,message = _("CHAFF/FLARE DISPENSERS - ON"),message_timeout = std_message_timeout},
{time = 113.498000,action = 312,message = _("RIGHT ENGINE - START"),message_timeout = std_message_timeout},

--[[
OSB - 13 - RIGHT MFCD CDU Page
--]]
{time = 121.184000,device = 3,action = 3013,value = 1.000000,message = _("SELECT CDU PAGE ON RIGHT MFCD"),message_timeout = std_message_timeout},
{time = 121.292000,device = 3,action = 3013,value = 0.000000},

{time = 154,message = _("ALIGNING INERTIAL NAVIGATION SYSTEM - 3 MINUTES LEFT"),message_timeout = 60.0},
--[[
Генератор ВСУ - вкл./выкл.
APU Generator OFF
--]]
{time = 162.740000,device = 1,action = 3001,value = 0.000000,message = _("APU GENERATOR - OFF"),message_timeout = std_message_timeout},
--[[
ВСУ - вкл./выкл.
APU OFF
--]]
{time = 165.608000,device = 37,action = 3005,value = 0.000000,message = _("APU - OFF"),message_timeout = std_message_timeout},

--[[
YAW SAS ENGAGE LEFT ON
Система улучшения устойчивости по направлению,
левый канал - вкл./выкл.
--]]
{time = 170.310000,device = 38,action = 3003,value = 1.000000,message = _("YAW SAS LEFT CHANNEL - ENGAGE"),message_timeout = std_message_timeout},
--[[
Система улучшения устойчивости по направлению,
левый канал - вкл./выкл.
--]]
{time = 170.420000,device = 38,action = 3004,value = 0.000000},
--[[
YAW SAS ENGAGE RIGHT ON
Система улучшения устойчивости по направлению,
правый канал - вкл./выкл.
--]]
{time = 171.758000,device = 38,action = 3005,value = 1.000000,message = _("YAW SAS RIGHT CHANNEL - ENGAGE"),message_timeout = std_message_timeout},
--[[
Система улучшения устойчивости по направлению,
правый канал - вкл./выкл.
--]]
{time = 171.854000,device = 38,action = 3006,value = 0.000000},
--[[
PITCH SAS ENGAGE LEFT ON
Система улучшения устойчивости по тангажу,
левый канал - вкл./выкл.
--]]
{time = 172.898000,device = 38,action = 3007,value = 1.000000,message = _("PITCH SAS LEFT CHANNEL - ENGAGE"),message_timeout = std_message_timeout},
--[[
Система улучшения устойчивости по тангажу,
левый канал - вкл./выкл.
--]]
{time = 173.010000,device = 38,action = 3008,value = 0.000000},
--[[
PITCH SAS ENGAGE RIGHT ON
Система улучшения устойчивости по тангажу,
правый канал  вкл./выкл.
--]]
{time = 174.440000,device = 38,action = 3009,value = 1.000000,message = _("PITCH SAS RIGHT CHANNEL - ENGAGE"),message_timeout = std_message_timeout},
--[[
Система улучшения устойчивости по тангажу,
правый канал  вкл./выкл.
--]]
{time = 174.572000,device = 38,action = 3010,value = 0.000000},
--[[
Установка взлетного
положения триммеров
T/O TRIM
--]]
{time = 177.224000,device = 38,action = 3012,value = 1.000000,message = _("TAKEOFF TRIM - SET"),message_timeout = std_message_timeout},
{time = 178.980000,device = 38,action = 3012,value = 0.000000},

--[[
Проблесковые маяки - вкл./выкл.
ANTI COLLISION ON
--]]
{time = 189.770000,device = 49,action = 3010,value = 1.000000,message = _("ANTICOLLISION LIGHTS - ON"),message_timeout = std_message_timeout},
--[[
Проблесковые маяки - вкл./выкл.
--]]
{time = 189.866000,device = 49,action = 3011,value = 0.000000},
--[[
Выключатель антиюзового автомата
AntiSkid ON
--]]
{time = 194.246000,device = 38,action = 3032,value = 1.000000,message = _("ANTISKID - ON"),message_timeout = std_message_timeout},
--[[
Выключатель антиюзового автомата
--]]
{time = 194.684000,device = 38,action = 3029,value = 0.000000},

{time = 214,message = _("ALIGNING INERTIAL NAVIGATION SYSTEM - 2 MINUTES LEFT"),message_timeout = 60.0},
{time = 274,message = _("ALIGNING INERTIAL NAVIGATION SYSTEM - 1 MINUTE LEFT"),message_timeout = 60.0},

--[[
Left MFCD - Load All (OSB 10)
--]]
{time = 290.184000,device = 2,action = 3010,value = 1.000000,message = _("LEFT MFCD - LOAD ALL"),message_timeout = std_message_timeout},
{time = 290.292000,device = 2,action = 3010,value = 0.000000},
-- Pitot heater
{time = 295.000000,device = 41,action = 3005,value = 1.000000,message = _("PITOT HEAT - ON"),message_timeout = std_message_timeout},
--[[
OSB - 13 - RIGHT MFCD CDU Page
--]]
{time = 311.184000,device = 3,action = 3013,value = 1.000000,message = _("RECALL CDU PAGE ON RIGHT MFCD"),message_timeout = std_message_timeout},
{time = 311.292000,device = 3,action = 3013,value = 0.000000},
--[[
Отключение режима согласования INS
CDU Align
--]]
{time = 334,message = _("INERTIAL NAVIGATION SYSTEM ALIGNMENT COMPLETE"),message_timeout = std_message_timeout},

{time = 337.950000,device = 9,action = 3007,value = 1.000000,message = _("CDU - SWITCH INS TO NAV"),message_timeout = std_message_timeout},
{time = 338.246000,device = 9,action = 3007,value = 0.000000},
--[[
Спутниковая бесплатформенная
инерциальная навигационная система
NMSP EGI
--]]
{time = 344.372000,device = 46,action = 3002,value = 1.000000,message = _("NMSP - SELECT EGI MODE"),message_timeout = std_message_timeout},
{time = 344.474000,device = 46,action = 3002,value = 0.000000},
--[[
Радиовысотомер
- вкл./выкл.
LASTE RADAR ALTIMETER NORM
--]]
{time = 355.886000,device = 67,action = 3001,value = 1.000000,message = _("RADAR ALTIMETER - NORM"),message_timeout = std_message_timeout},
--[[
Система EAC
- вкл./выкл.
--]]
{time = 356.774000,device = 38,action = 3026,value = 1.000000,message = _("EAC - ON"),message_timeout = std_message_timeout},
--[[
Система EAC
- вкл./выкл.
--]]
{time = 356.880000,device = 38,action = 3027,value = 0.000000},
--[[
Кнопка страницы
МЕНЮ ТОЧЕК МАРШРУТА
--]]
{time = 370.410000,device = 9,action = 3011,value = 1.000000,message = _("CDU - SELECT WP MENU PAGE"),message_timeout = std_message_timeout},
{time = 370.514000,device = 9,action = 3011,value = 0.000000},
--[[
Кнопка выбора строки 3L
--]]
{time = 371.894000,device = 9,action = 3001,value = 1.000000,message = _("CDU - SELECT STEERPOINT PAGE"),message_timeout = std_message_timeout},
{time = 372.000000,device = 9,action = 3001,value = 0.000000},
--[[
Поворотный переключатель STEER PT
(ТЕКУЩАЯ ТОЧКА)
STEER PT
--]]
{time = 377.384000,device = 22,action = 3001,value = 0.100000,message = _("AAP STEERPT SWITCH - SET FLT PLAN"),message_timeout = std_message_timeout},
{time = 377.786000,device = 22,action = 3001,value = 0.000000},
--[[
Left MFCD - TAD (OSB 15)
--]]
{time = 380.184000,device = 2,action = 3015,value = 1.000000,message = _("SELECT TAD PAGE ON LEFT MFCD"),message_timeout = std_message_timeout},
{time = 380.292000,device = 2,action = 3015,value = 0.000000},

--Nosewheel steering
{time = 382.000000,device = 17, action = 3001,value  = 1.000000,message = _("NOSEWHEEL STEERING - ON"),message_timeout = std_message_timeout},
--[[
SAI uncage
--]]
{time = 385.358000,device = 48,action = 3003,value = -0.075000,message = _("SAI - UNCAGE"),message_timeout = std_message_timeout},
{time = 385.440000,device = 48,action = 3003,value = -0.075000},
{time = 385.526000,device = 48,action = 3003,value = -0.075000},
{time = 385.638000,device = 48,action = 3003,value = 0.075000},
{time = 386.146000,device = 48,action = 3003,value = -0.075000},
--[[
Seat Arm Handle
Ручка блокиратора
системы катапультирования
--]]
{time = 386.472000,device = 39,action = 3010,value = 0.000000,message = _("SEAT - ARMED"),message_timeout = std_message_timeout},
--[[
Фонарь
- открыть/удержание/закрыть
Canopy close
--]]
{time = 386.874000,device = 39,action = 3007,value = 0.000000,message = _("CANOPY - CLOSE"),message_timeout = std_message_timeout},
{time = 394.258000,device = 39,action = 3007,value = 0.500000},
-- Oxygen
{time = 394.384000,device = 40,action = 3001,value = 1.000000,message = _("OXYGEN SUPPLY - ON"),message_timeout = std_message_timeout},

{time = 395,message = _("AUTOSTART COMPLETE. AIRCRAFT IS READY TO FLY"),message_timeout = std_message_timeout},
}


cockpit_illumination_full = {
{time = 0.801000,device = 49,action = 3006,value = 0.005208},
{time = 0.812000,device = 49,action = 3006,value = 0.010416},
{time = 0.824000,device = 49,action = 3006,value = 0.020832},
{time = 0.836000,device = 49,action = 3006,value = 0.026040},
{time = 0.847000,device = 49,action = 3006,value = 0.031248},
{time = 0.860000,device = 49,action = 3006,value = 0.036456},
{time = 0.872000,device = 49,action = 3006,value = 0.041664},
{time = 0.883000,device = 49,action = 3006,value = 0.046872},
{time = 0.908000,device = 49,action = 3006,value = 0.052080},
{time = 0.932000,device = 49,action = 3006,value = 0.057288},
{time = 0.951000,device = 49,action = 3006,value = 0.062496},
{time = 0.968000,device = 49,action = 3006,value = 0.067704},
{time = 0.986000,device = 49,action = 3006,value = 0.072912},
{time = 1.010000,device = 49,action = 3006,value = 0.078120},
{time = 1.020000,device = 49,action = 3006,value = 0.083328},
{time = 1.033000,device = 49,action = 3006,value = 0.088536},
{time = 1.058000,device = 49,action = 3006,value = 0.093744},
{time = 1.180000,device = 49,action = 3006,value = 0.104160},
{time = 1.192000,device = 49,action = 3006,value = 0.109368},
{time = 1.220000,device = 49,action = 3006,value = 0.113274},
{time = 1.226000,device = 49,action = 3006,value = 0.118482},
{time = 1.238000,device = 49,action = 3006,value = 0.123690},
{time = 1.249000,device = 49,action = 3006,value = 0.128898},
{time = 1.274000,device = 49,action = 3006,value = 0.132804},
{time = 1.274000,device = 49,action = 3006,value = 0.138012},
{time = 1.286000,device = 49,action = 3006,value = 0.143220},
{time = 1.297000,device = 49,action = 3006,value = 0.147126},
{time = 1.297000,device = 49,action = 3006,value = 0.157543},
{time = 1.320000,device = 49,action = 3006,value = 0.161449},
{time = 1.320000,device = 49,action = 3006,value = 0.171866},
{time = 1.333000,device = 49,action = 3006,value = 0.177074},
{time = 1.346000,device = 49,action = 3006,value = 0.180980},
{time = 1.346000,device = 49,action = 3006,value = 0.191397},
{time = 1.358000,device = 49,action = 3006,value = 0.195303},
{time = 1.358000,device = 49,action = 3006,value = 0.200511},
{time = 1.370000,device = 49,action = 3006,value = 0.205719},
{time = 1.380000,device = 49,action = 3006,value = 0.209625},
{time = 1.380000,device = 49,action = 3006,value = 0.220042},
{time = 1.392000,device = 49,action = 3006,value = 0.223948},
{time = 1.392000,device = 49,action = 3006,value = 0.229156},
{time = 1.401000,device = 49,action = 3006,value = 0.233062},
{time = 1.401000,device = 49,action = 3006,value = 0.243479},
{time = 1.430000,device = 49,action = 3006,value = 0.247385},
{time = 1.430000,device = 49,action = 3006,value = 0.252593},
{time = 1.436000,device = 49,action = 3006,value = 0.257801},
{time = 1.448000,device = 49,action = 3006,value = 0.265613},
{time = 1.448000,device = 49,action = 3006,value = 0.276030},
{time = 1.460000,device = 49,action = 3006,value = 0.281238},
{time = 1.472000,device = 49,action = 3006,value = 0.289050},
{time = 1.472000,device = 49,action = 3006,value = 0.294258},
{time = 1.483000,device = 49,action = 3006,value = 0.298164},
{time = 1.483000,device = 49,action = 3006,value = 0.303372},
{time = 1.496000,device = 49,action = 3006,value = 0.311184},
{time = 1.496000,device = 49,action = 3006,value = 0.321601},
{time = 1.508000,device = 49,action = 3006,value = 0.325507},
{time = 1.508000,device = 49,action = 3006,value = 0.330715},
{time = 1.520000,device = 49,action = 3006,value = 0.334621},
{time = 1.520000,device = 49,action = 3006,value = 0.339829},
{time = 1.532000,device = 49,action = 3006,value = 0.343735},
{time = 1.532000,device = 49,action = 3006,value = 0.348943},
{time = 1.556000,device = 49,action = 3006,value = 0.356755},
{time = 1.556000,device = 49,action = 3006,value = 0.361963},
{time = 1.580000,device = 49,action = 3006,value = 0.365869},
{time = 1.580000,device = 49,action = 3006,value = 0.371077},
{time = 1.588000,device = 49,action = 3006,value = 0.374983},
{time = 1.588000,device = 49,action = 3006,value = 0.380191},
{time = 1.600000,device = 49,action = 3006,value = 0.388003},
{time = 1.600000,device = 49,action = 3006,value = 0.393211},
{time = 1.616000,device = 49,action = 3006,value = 0.397117},
{time = 1.616000,device = 49,action = 3006,value = 0.402325},
{time = 1.624000,device = 49,action = 3006,value = 0.410137},
{time = 1.624000,device = 49,action = 3006,value = 0.420554},
{time = 1.638000,device = 49,action = 3006,value = 0.425762},
{time = 1.647000,device = 49,action = 3006,value = 0.429668},
{time = 1.660000,device = 49,action = 3006,value = 0.434876},
{time = 1.674000,device = 49,action = 3006,value = 0.438782},
{time = 1.682000,device = 49,action = 3006,value = 0.442688},
{time = 1.682000,device = 49,action = 3006,value = 0.447896},
{time = 1.718000,device = 49,action = 3006,value = 0.451802},
{time = 1.730000,device = 49,action = 3006,value = 0.455708},
{time = 1.730000,device = 49,action = 3006,value = 0.460916},
{time = 1.740000,device = 49,action = 3006,value = 0.464822},
{time = 1.754000,device = 49,action = 3006,value = 0.476540},
{time = 1.754000,device = 49,action = 3006,value = 0.481749},
{time = 1.765000,device = 49,action = 3006,value = 0.485655},
{time = 1.778000,device = 49,action = 3006,value = 0.493467},
{time = 1.778000,device = 49,action = 3006,value = 0.498675},
{time = 1.788000,device = 49,action = 3006,value = 0.502581},
{time = 1.810000,device = 49,action = 3006,value = 0.514299},
{time = 1.810000,device = 49,action = 3006,value = 0.519508},
{time = 1.824000,device = 49,action = 3006,value = 0.523414},
{time = 1.833000,device = 49,action = 3006,value = 0.535132},
{time = 1.833000,device = 49,action = 3006,value = 0.540341},
{time = 1.847000,device = 49,action = 3006,value = 0.545549},
{time = 1.856000,device = 49,action = 3006,value = 0.557267},
{time = 1.868000,device = 49,action = 3006,value = 0.561173},
{time = 1.868000,device = 49,action = 3006,value = 0.566381},
{time = 1.880000,device = 49,action = 3006,value = 0.574193},
{time = 1.892000,device = 49,action = 3006,value = 0.579401},
{time = 1.904000,device = 49,action = 3006,value = 0.583307},
{time = 1.916000,device = 49,action = 3006,value = 0.587213},
{time = 1.916000,device = 49,action = 3006,value = 0.592421},
{time = 1.928000,device = 49,action = 3006,value = 0.600233},
{time = 1.928000,device = 49,action = 3006,value = 0.605441},
{time = 1.938000,device = 49,action = 3006,value = 0.609347},
{time = 1.974000,device = 49,action = 3006,value = 0.613253},
{time = 2.006000,device = 49,action = 3006,value = 0.617159},
{time = 2.006000,device = 49,action = 3006,value = 0.622367},
{time = 2.018000,device = 49,action = 3006,value = 0.626273},
{time = 2.030000,device = 49,action = 3006,value = 0.630179},
{time = 2.030000,device = 49,action = 3006,value = 0.635387},
{time = 2.042000,device = 49,action = 3006,value = 0.639293},
{time = 2.054000,device = 49,action = 3006,value = 0.643199},
{time = 2.054000,device = 49,action = 3006,value = 0.648407},
{time = 2.066000,device = 49,action = 3006,value = 0.656219},
{time = 2.066000,device = 49,action = 3006,value = 0.661427},
{time = 2.078000,device = 49,action = 3006,value = 0.665333},
{time = 2.088000,device = 49,action = 3006,value = 0.673145},
{time = 2.088000,device = 49,action = 3006,value = 0.683562},
{time = 2.100000,device = 49,action = 3006,value = 0.687468},
{time = 2.114000,device = 49,action = 3006,value = 0.691374},
{time = 2.114000,device = 49,action = 3006,value = 0.701791},
{time = 2.138000,device = 49,action = 3006,value = 0.705697},
{time = 2.138000,device = 49,action = 3006,value = 0.710905},
{time = 2.147000,device = 49,action = 3006,value = 0.714811},
{time = 2.174000,device = 49,action = 3006,value = 0.718717},
{time = 2.183000,device = 49,action = 3006,value = 0.723925},
{time = 2.204000,device = 49,action = 3006,value = 0.727831},
{time = 2.240000,device = 49,action = 3006,value = 0.731737},
{time = 2.250000,device = 49,action = 3006,value = 0.735643},
{time = 2.250000,device = 49,action = 3006,value = 0.746059},
{time = 2.264000,device = 49,action = 3006,value = 0.749965},
{time = 2.274000,device = 49,action = 3006,value = 0.753871},
{time = 2.274000,device = 49,action = 3006,value = 0.759079},
{time = 2.288000,device = 49,action = 3006,value = 0.762985},
{time = 2.297000,device = 49,action = 3006,value = 0.770797},
{time = 2.297000,device = 49,action = 3006,value = 0.781214},
{time = 2.310000,device = 49,action = 3006,value = 0.785120},
{time = 2.333000,device = 49,action = 3006,value = 0.789026},
{time = 2.333000,device = 49,action = 3006,value = 0.794234},
{time = 2.342000,device = 49,action = 3006,value = 0.798140},
{time = 2.354000,device = 49,action = 3006,value = 0.802046},
{time = 2.354000,device = 49,action = 3006,value = 0.807254},
{time = 2.366000,device = 49,action = 3006,value = 0.811160},
{time = 2.378000,device = 49,action = 3006,value = 0.818972},
{time = 2.378000,device = 49,action = 3006,value = 0.824180},
{time = 2.400000,device = 49,action = 3006,value = 0.831992},
{time = 2.400000,device = 49,action = 3006,value = 0.837200},
{time = 2.414000,device = 49,action = 3006,value = 0.842408},
{time = 2.424000,device = 49,action = 3006,value = 0.854126},
{time = 2.424000,device = 49,action = 3006,value = 0.859335},
{time = 2.438000,device = 49,action = 3006,value = 0.863241},
{time = 2.447000,device = 49,action = 3006,value = 0.867147},
{time = 2.447000,device = 49,action = 3006,value = 0.877564},
{time = 2.460000,device = 49,action = 3006,value = 0.881470},
{time = 2.460000,device = 49,action = 3006,value = 0.886678},
{time = 2.474000,device = 49,action = 3006,value = 0.890584},
{time = 3.583000,device = 49,action = 3002,value = 0.015625},
{time = 3.610000,device = 49,action = 3002,value = 0.011718},
{time = 3.610000,device = 49,action = 3002,value = 0.027343},
{time = 3.620000,device = 49,action = 3002,value = 0.019530},
{time = 3.620000,device = 49,action = 3002,value = 0.035155},
{time = 3.633000,device = 49,action = 3002,value = 0.045571},
{time = 3.642000,device = 49,action = 3002,value = 0.037758},
{time = 3.642000,device = 49,action = 3002,value = 0.053383},
{time = 3.658000,device = 49,action = 3002,value = 0.058591},
{time = 3.670000,device = 49,action = 3002,value = 0.050778},
{time = 3.670000,device = 49,action = 3002,value = 0.071611},
{time = 3.680000,device = 49,action = 3002,value = 0.082027},
{time = 3.688000,device = 49,action = 3002,value = 0.074214},
{time = 3.688000,device = 49,action = 3002,value = 0.089839},
{time = 3.700000,device = 49,action = 3002,value = 0.095047},
{time = 3.712000,device = 49,action = 3002,value = 0.091140},
{time = 3.712000,device = 49,action = 3002,value = 0.111974},
{time = 3.724000,device = 49,action = 3002,value = 0.108067},
{time = 3.724000,device = 49,action = 3002,value = 0.113276},
{time = 3.736000,device = 49,action = 3002,value = 0.134109},
{time = 3.747000,device = 49,action = 3002,value = 0.139317},
{time = 3.760000,device = 49,action = 3002,value = 0.135410},
{time = 3.760000,device = 49,action = 3002,value = 0.140619},
{time = 3.772000,device = 49,action = 3002,value = 0.136712},
{time = 3.772000,device = 49,action = 3002,value = 0.157546},
{time = 3.783000,device = 49,action = 3002,value = 0.162754},
{time = 3.796000,device = 49,action = 3002,value = 0.158847},
{time = 3.796000,device = 49,action = 3002,value = 0.174472},
{time = 3.808000,device = 49,action = 3002,value = 0.179680},
{time = 3.820000,device = 49,action = 3002,value = 0.195305},
{time = 3.832000,device = 49,action = 3002,value = 0.205721},
{time = 3.842000,device = 49,action = 3002,value = 0.221346},
{time = 3.856000,device = 49,action = 3002,value = 0.217439},
{time = 3.856000,device = 49,action = 3002,value = 0.227856},
{time = 3.868000,device = 49,action = 3002,value = 0.238272},
{time = 3.880000,device = 49,action = 3002,value = 0.248688},
{time = 3.888000,device = 49,action = 3002,value = 0.259104},
{time = 3.899000,device = 49,action = 3002,value = 0.264312},
{time = 3.916000,device = 49,action = 3002,value = 0.279937},
{time = 3.924000,device = 49,action = 3002,value = 0.285145},
{time = 3.934000,device = 49,action = 3002,value = 0.289051},
{time = 3.934000,device = 49,action = 3002,value = 0.294259},
{time = 3.946000,device = 49,action = 3002,value = 0.299467},
{time = 3.958000,device = 49,action = 3002,value = 0.303373},
{time = 3.958000,device = 49,action = 3002,value = 0.308581},
{time = 3.970000,device = 49,action = 3002,value = 0.318997},
{time = 3.982000,device = 49,action = 3002,value = 0.322903},
{time = 3.982000,device = 49,action = 3002,value = 0.333319},
{time = 3.994000,device = 49,action = 3002,value = 0.343735},
{time = 4.006000,device = 49,action = 3002,value = 0.347641},
{time = 4.006000,device = 49,action = 3002,value = 0.352849},
{time = 4.018000,device = 49,action = 3002,value = 0.363265},
{time = 4.028000,device = 49,action = 3002,value = 0.367171},
{time = 4.028000,device = 49,action = 3002,value = 0.372379},
{time = 4.040000,device = 49,action = 3002,value = 0.382795},
{time = 4.051000,device = 49,action = 3002,value = 0.386701},
{time = 4.051000,device = 49,action = 3002,value = 0.391909},
{time = 4.066000,device = 49,action = 3002,value = 0.395815},
{time = 4.066000,device = 49,action = 3002,value = 0.411440},
{time = 4.078000,device = 49,action = 3002,value = 0.416648},
{time = 4.088000,device = 49,action = 3002,value = 0.424460},
{time = 4.088000,device = 49,action = 3002,value = 0.434877},
{time = 4.098000,device = 49,action = 3002,value = 0.438783},
{time = 4.098000,device = 49,action = 3002,value = 0.449200},
{time = 4.110000,device = 49,action = 3002,value = 0.453106},
{time = 4.110000,device = 49,action = 3002,value = 0.463523},
{time = 4.124000,device = 49,action = 3002,value = 0.471335},
{time = 4.124000,device = 49,action = 3002,value = 0.486960},
{time = 4.138000,device = 49,action = 3002,value = 0.490866},
{time = 4.138000,device = 49,action = 3002,value = 0.501282},
{time = 4.147000,device = 49,action = 3002,value = 0.509094},
{time = 4.147000,device = 49,action = 3002,value = 0.524719},
{time = 4.160000,device = 49,action = 3002,value = 0.528625},
{time = 4.160000,device = 49,action = 3002,value = 0.539042},
{time = 4.174000,device = 49,action = 3002,value = 0.546854},
{time = 4.174000,device = 49,action = 3002,value = 0.562479},
{time = 4.183000,device = 49,action = 3002,value = 0.566385},
{time = 4.183000,device = 49,action = 3002,value = 0.571593},
{time = 4.192000,device = 49,action = 3002,value = 0.579405},
{time = 4.192000,device = 49,action = 3002,value = 0.589822},
{time = 4.204000,device = 49,action = 3002,value = 0.593728},
{time = 4.204000,device = 49,action = 3002,value = 0.598936},
{time = 4.216000,device = 49,action = 3002,value = 0.602842},
{time = 4.216000,device = 49,action = 3002,value = 0.613259},
{time = 4.240000,device = 49,action = 3002,value = 0.617165},
{time = 4.240000,device = 49,action = 3002,value = 0.622373},
{time = 4.251000,device = 49,action = 3002,value = 0.627581},
{time = 4.264000,device = 49,action = 3002,value = 0.631487},
{time = 4.264000,device = 49,action = 3002,value = 0.636695},
{time = 4.378000,device = 49,action = 3002,value = 0.640601},
{time = 4.378000,device = 49,action = 3002,value = 0.645809},
{time = 4.400000,device = 49,action = 3002,value = 0.653621},
{time = 4.400000,device = 49,action = 3002,value = 0.669246},
{time = 4.414000,device = 49,action = 3002,value = 0.673152},
{time = 4.424000,device = 49,action = 3002,value = 0.680964},
{time = 4.424000,device = 49,action = 3002,value = 0.686173},
{time = 4.438000,device = 49,action = 3002,value = 0.691381},
{time = 4.447000,device = 49,action = 3002,value = 0.695287},
{time = 4.474000,device = 49,action = 3002,value = 0.699193},
{time = 4.483000,device = 49,action = 3002,value = 0.704401},
{time = 4.516000,device = 49,action = 3002,value = 0.708307},
{time = 4.540000,device = 49,action = 3002,value = 0.712213},
{time = 4.540000,device = 49,action = 3002,value = 0.717421},
{time = 4.550000,device = 49,action = 3002,value = 0.721327},
{time = 4.574000,device = 49,action = 3002,value = 0.726535},
{time = 4.588000,device = 49,action = 3002,value = 0.734347},
{time = 4.597000,device = 49,action = 3002,value = 0.742159},
{time = 4.597000,device = 49,action = 3002,value = 0.747367},
{time = 4.610000,device = 49,action = 3002,value = 0.751273},
{time = 4.610000,device = 49,action = 3002,value = 0.756481},
{time = 4.620000,device = 49,action = 3002,value = 0.760387},
{time = 4.633000,device = 49,action = 3002,value = 0.765595},
{time = 4.647000,device = 49,action = 3002,value = 0.769501},
{time = 4.660000,device = 49,action = 3002,value = 0.773407},
{time = 4.672000,device = 49,action = 3002,value = 0.777313},
{time = 4.680000,device = 49,action = 3002,value = 0.782521},
{time = 4.690000,device = 49,action = 3002,value = 0.790333},
{time = 4.702000,device = 49,action = 3002,value = 0.795541},
{time = 4.714000,device = 49,action = 3002,value = 0.799447},
{time = 5.580000,device = 49,action = 3003,value = 0.010416},
{time = 5.588000,device = 49,action = 3003,value = 0.015624},
{time = 5.600000,device = 49,action = 3003,value = 0.026040},
{time = 5.616000,device = 49,action = 3003,value = 0.031248},
{time = 5.624000,device = 49,action = 3003,value = 0.041664},
{time = 5.634000,device = 49,action = 3003,value = 0.046872},
{time = 5.646000,device = 49,action = 3003,value = 0.052080},
{time = 5.658000,device = 49,action = 3003,value = 0.067705},
{time = 5.670000,device = 49,action = 3003,value = 0.072913},
{time = 5.682000,device = 49,action = 3003,value = 0.088538},
{time = 5.706000,device = 49,action = 3003,value = 0.098954},
{time = 5.717000,device = 49,action = 3003,value = 0.104162},
{time = 5.730000,device = 49,action = 3003,value = 0.119787},
{time = 5.740000,device = 49,action = 3003,value = 0.130203},
{time = 5.750000,device = 49,action = 3003,value = 0.140619},
{time = 5.766000,device = 49,action = 3003,value = 0.151035},
{time = 5.774000,device = 49,action = 3003,value = 0.161451},
{time = 5.788000,device = 49,action = 3003,value = 0.157544},
{time = 5.788000,device = 49,action = 3003,value = 0.183586},
{time = 5.797000,device = 49,action = 3003,value = 0.179679},
{time = 5.797000,device = 49,action = 3003,value = 0.184888},
{time = 5.808000,device = 49,action = 3003,value = 0.210929},
{time = 5.820000,device = 49,action = 3003,value = 0.221345},
{time = 5.832000,device = 49,action = 3003,value = 0.217438},
{time = 5.832000,device = 49,action = 3003,value = 0.238272},
{time = 5.844000,device = 49,action = 3003,value = 0.248688},
{time = 5.856000,device = 49,action = 3003,value = 0.264313},
{time = 5.868000,device = 49,action = 3003,value = 0.269521},
{time = 5.880000,device = 49,action = 3003,value = 0.279937},
{time = 5.892000,device = 49,action = 3003,value = 0.295562},
{time = 5.901000,device = 49,action = 3003,value = 0.305978},
{time = 5.916000,device = 49,action = 3003,value = 0.321603},
{time = 5.924000,device = 49,action = 3003,value = 0.326811},
{time = 5.938000,device = 49,action = 3003,value = 0.342436},
{time = 5.958000,device = 49,action = 3003,value = 0.347644},
{time = 5.970000,device = 49,action = 3003,value = 0.358060},
{time = 5.982000,device = 49,action = 3003,value = 0.363268},
{time = 5.994000,device = 49,action = 3003,value = 0.368476},
{time = 6.006000,device = 49,action = 3003,value = 0.373684},
{time = 6.018000,device = 49,action = 3003,value = 0.384100},
{time = 6.038000,device = 49,action = 3003,value = 0.394516},
{time = 6.050000,device = 49,action = 3003,value = 0.398422},
{time = 6.050000,device = 49,action = 3003,value = 0.403630},
{time = 6.074000,device = 49,action = 3003,value = 0.419255},
{time = 6.084000,device = 49,action = 3003,value = 0.423161},
{time = 6.084000,device = 49,action = 3003,value = 0.428369},
{time = 6.096000,device = 49,action = 3003,value = 0.436181},
{time = 6.096000,device = 49,action = 3003,value = 0.457015},
{time = 6.108000,device = 49,action = 3003,value = 0.462223},
{time = 6.120000,device = 49,action = 3003,value = 0.470035},
{time = 6.120000,device = 49,action = 3003,value = 0.485660},
{time = 6.132000,device = 49,action = 3003,value = 0.490868},
{time = 6.142000,device = 49,action = 3003,value = 0.494774},
{time = 6.142000,device = 49,action = 3003,value = 0.499982},
{time = 6.156000,device = 49,action = 3003,value = 0.503888},
{time = 6.156000,device = 49,action = 3003,value = 0.519513},
{time = 6.168000,device = 49,action = 3003,value = 0.523419},
{time = 6.168000,device = 49,action = 3003,value = 0.528627},
{time = 6.180000,device = 49,action = 3003,value = 0.532533},
{time = 6.180000,device = 49,action = 3003,value = 0.542950},
{time = 6.201000,device = 49,action = 3003,value = 0.548158},
{time = 6.282000,device = 49,action = 3003,value = 0.552064},
{time = 6.282000,device = 49,action = 3003,value = 0.562481},
{time = 6.306000,device = 49,action = 3003,value = 0.567689},
{time = 6.318000,device = 49,action = 3003,value = 0.571595},
{time = 6.330000,device = 49,action = 3003,value = 0.576803},
{time = 6.340000,device = 49,action = 3003,value = 0.580709},
{time = 6.340000,device = 49,action = 3003,value = 0.591126},
{time = 6.351000,device = 49,action = 3003,value = 0.598938},
{time = 6.351000,device = 49,action = 3003,value = 0.609355},
{time = 6.366000,device = 49,action = 3003,value = 0.617167},
{time = 6.366000,device = 49,action = 3003,value = 0.622375},
{time = 6.374000,device = 49,action = 3003,value = 0.626281},
{time = 6.374000,device = 49,action = 3003,value = 0.631489},
{time = 6.388000,device = 49,action = 3003,value = 0.636697},
{time = 6.399000,device = 49,action = 3003,value = 0.640603},
{time = 6.399000,device = 49,action = 3003,value = 0.645811},
{time = 6.410000,device = 49,action = 3003,value = 0.651019},
{time = 6.424000,device = 49,action = 3003,value = 0.654925},
{time = 6.424000,device = 49,action = 3003,value = 0.660133},
{time = 6.433000,device = 49,action = 3003,value = 0.667945},
{time = 6.433000,device = 49,action = 3003,value = 0.678362},
{time = 6.456000,device = 49,action = 3003,value = 0.686174},
{time = 6.456000,device = 49,action = 3003,value = 0.691383},
{time = 6.468000,device = 49,action = 3003,value = 0.695289},
{time = 6.468000,device = 49,action = 3003,value = 0.700497},
{time = 6.480000,device = 49,action = 3003,value = 0.705705},
{time = 6.492000,device = 49,action = 3003,value = 0.709611},
{time = 6.654000,device = 49,action = 3003,value = 0.714819},
{time = 6.666000,device = 49,action = 3003,value = 0.718725},
{time = 6.688000,device = 49,action = 3003,value = 0.723933},
{time = 6.724000,device = 49,action = 3003,value = 0.727839},
{time = 7.346000,device = 49,action = 3004,value = 1.000000},
{time = 7.772000,device = 49,action = 3001,value = 0.000000},
{time = 7.796000,device = 49,action = 3001,value = 0.000000},
{time = 7.796000,device = 49,action = 3001,value = 0.005208},
{time = 7.808000,device = 49,action = 3001,value = 0.015624},
{time = 7.820000,device = 49,action = 3001,value = 0.011717},
{time = 7.820000,device = 49,action = 3001,value = 0.027342},
{time = 7.832000,device = 49,action = 3001,value = 0.032550},
{time = 7.840000,device = 49,action = 3001,value = 0.024737},
{time = 7.840000,device = 49,action = 3001,value = 0.045570},
{time = 7.851000,device = 49,action = 3001,value = 0.050778},
{time = 7.868000,device = 49,action = 3001,value = 0.066403},
{time = 7.874000,device = 49,action = 3001,value = 0.076819},
{time = 7.886000,device = 49,action = 3001,value = 0.072912},
{time = 7.886000,device = 49,action = 3001,value = 0.083329},
{time = 7.897000,device = 49,action = 3001,value = 0.093745},
{time = 7.910000,device = 49,action = 3001,value = 0.089838},
{time = 7.910000,device = 49,action = 3001,value = 0.095047},
{time = 7.922000,device = 49,action = 3001,value = 0.105463},
{time = 7.933000,device = 49,action = 3001,value = 0.115879},
{time = 7.958000,device = 49,action = 3001,value = 0.126295},
{time = 7.970000,device = 49,action = 3001,value = 0.136711},
{time = 7.980000,device = 49,action = 3001,value = 0.141919},
{time = 7.992000,device = 49,action = 3001,value = 0.162752},
{time = 8.006000,device = 49,action = 3001,value = 0.166658},
{time = 8.006000,device = 49,action = 3001,value = 0.171866},
{time = 8.018000,device = 49,action = 3001,value = 0.175772},
{time = 8.018000,device = 49,action = 3001,value = 0.191397},
{time = 8.030000,device = 49,action = 3001,value = 0.207022},
{time = 8.049000,device = 49,action = 3001,value = 0.210928},
{time = 8.049000,device = 49,action = 3001,value = 0.226553},
{time = 8.060000,device = 49,action = 3001,value = 0.231761},
{time = 8.072000,device = 49,action = 3001,value = 0.242177},
{time = 8.084000,device = 49,action = 3001,value = 0.246083},
{time = 8.084000,device = 49,action = 3001,value = 0.256499},
{time = 8.096000,device = 49,action = 3001,value = 0.261707},
{time = 8.108000,device = 49,action = 3001,value = 0.265613},
{time = 8.108000,device = 49,action = 3001,value = 0.276029},
{time = 8.120000,device = 49,action = 3001,value = 0.281237},
{time = 8.132000,device = 49,action = 3001,value = 0.285143},
{time = 8.132000,device = 49,action = 3001,value = 0.290351},
{time = 8.142000,device = 49,action = 3001,value = 0.295559},
{time = 8.156000,device = 49,action = 3001,value = 0.300767},
{time = 8.168000,device = 49,action = 3001,value = 0.304673},
{time = 8.180000,device = 49,action = 3001,value = 0.315089},
{time = 8.188000,device = 49,action = 3001,value = 0.318995},
{time = 8.188000,device = 49,action = 3001,value = 0.324203},
{time = 8.200000,device = 49,action = 3001,value = 0.328109},
{time = 8.200000,device = 49,action = 3001,value = 0.338525},
{time = 8.216000,device = 49,action = 3001,value = 0.343733},
{time = 8.224000,device = 49,action = 3001,value = 0.347639},
{time = 8.224000,device = 49,action = 3001,value = 0.358055},
{time = 8.238000,device = 49,action = 3001,value = 0.361961},
{time = 8.238000,device = 49,action = 3001,value = 0.367169},
{time = 8.258000,device = 49,action = 3001,value = 0.372377},
{time = 8.282000,device = 49,action = 3001,value = 0.376283},
{time = 8.282000,device = 49,action = 3001,value = 0.386700},
{time = 8.294000,device = 49,action = 3001,value = 0.390606},
{time = 8.294000,device = 49,action = 3001,value = 0.395814},
{time = 8.306000,device = 49,action = 3001,value = 0.399720},
{time = 8.306000,device = 49,action = 3001,value = 0.410137},
{time = 8.318000,device = 49,action = 3001,value = 0.420553},
{time = 8.330000,device = 49,action = 3001,value = 0.424459},
{time = 8.330000,device = 49,action = 3001,value = 0.429667},
{time = 8.340000,device = 49,action = 3001,value = 0.433573},
{time = 8.340000,device = 49,action = 3001,value = 0.443989},
{time = 8.351000,device = 49,action = 3001,value = 0.447895},
{time = 8.351000,device = 49,action = 3001,value = 0.453103},
{time = 8.366000,device = 49,action = 3001,value = 0.458311},
{time = 8.374000,device = 49,action = 3001,value = 0.462217},
{time = 8.388000,device = 49,action = 3001,value = 0.467425},
{time = 8.399000,device = 49,action = 3001,value = 0.471331},
{time = 8.399000,device = 49,action = 3001,value = 0.476539},
{time = 8.424000,device = 49,action = 3001,value = 0.481747},
{time = 8.492000,device = 49,action = 3001,value = 0.485653},
{time = 8.492000,device = 49,action = 3001,value = 0.490861},
{time = 8.504000,device = 49,action = 3001,value = 0.494767},
{time = 8.516000,device = 49,action = 3001,value = 0.498673},
{time = 8.516000,device = 49,action = 3001,value = 0.503881},
{time = 8.528000,device = 49,action = 3001,value = 0.509089},
{time = 8.538000,device = 49,action = 3001,value = 0.512995},
{time = 8.618000,device = 49,action = 3001,value = 0.516901},
{time = 8.618000,device = 49,action = 3001,value = 0.522109},
{time = 8.630000,device = 49,action = 3001,value = 0.527317},
{time = 8.642000,device = 49,action = 3001,value = 0.531223},
{time = 8.654000,device = 49,action = 3001,value = 0.536431},
{time = 8.666000,device = 49,action = 3001,value = 0.540337},
{time = 8.724000,device = 49,action = 3001,value = 0.548149},
{time = 8.724000,device = 49,action = 3001,value = 0.553357},
{time = 8.756000,device = 49,action = 3001,value = 0.557263},
{time = 8.768000,device = 49,action = 3001,value = 0.562471},
{time = 8.780000,device = 49,action = 3001,value = 0.566377},
{time = 8.792000,device = 49,action = 3001,value = 0.570283},
{time = 8.792000,device = 49,action = 3001,value = 0.575491},
{time = 8.804000,device = 49,action = 3001,value = 0.580699},
{time = 8.816000,device = 49,action = 3001,value = 0.584605},
{time = 8.906000,device = 49,action = 3001,value = 0.588511},
{time = 8.906000,device = 49,action = 3001,value = 0.593719},
{time = 8.930000,device = 49,action = 3001,value = 0.597625},
{time = 8.930000,device = 49,action = 3001,value = 0.602833},
{time = 8.954000,device = 49,action = 3001,value = 0.606739},
{time = 8.978000,device = 49,action = 3001,value = 0.610645},
{time = 8.978000,device = 49,action = 3001,value = 0.615853},
{time = 8.999000,device = 49,action = 3001,value = 0.619759},
{time = 9.010000,device = 49,action = 3001,value = 0.623665},
{time = 9.010000,device = 49,action = 3001,value = 0.628873},
{time = 9.033000,device = 49,action = 3001,value = 0.632779},
{time = 9.044000,device = 49,action = 3001,value = 0.637987},
{time = 9.056000,device = 49,action = 3001,value = 0.641893},
{time = 9.080000,device = 49,action = 3001,value = 0.645799},
{time = 9.080000,device = 49,action = 3001,value = 0.651007},
{time = 9.092000,device = 49,action = 3001,value = 0.654913},
{time = 9.116000,device = 49,action = 3001,value = 0.660121},
{time = 9.128000,device = 49,action = 3001,value = 0.664027},
{time = 9.149000,device = 49,action = 3001,value = 0.667933},
{time = 9.160000,device = 49,action = 3001,value = 0.673141},
{time = 9.174000,device = 49,action = 3001,value = 0.677047},
{time = 9.183000,device = 49,action = 3001,value = 0.680953},
{time = 9.206000,device = 49,action = 3001,value = 0.686161},
{time = 9.218000,device = 49,action = 3001,value = 0.690067},
{time = 9.230000,device = 49,action = 3001,value = 0.693973},
{time = 9.297000,device = 49,action = 3001,value = 0.699181},
{time = 9.308000,device = 49,action = 3001,value = 0.703087},
{time = 9.344000,device = 49,action = 3001,value = 0.706993},
{time = 9.392000,device = 49,action = 3001,value = 0.710899},
{time = 9.401000,device = 49,action = 3001,value = 0.716107},
{time = 9.416000,device = 49,action = 3001,value = 0.720013},
{time = 9.424000,device = 49,action = 3001,value = 0.723919},
{time = 9.438000,device = 49,action = 3001,value = 0.729127},
{time = 9.449000,device = 49,action = 3001,value = 0.733033},
{time = 9.460000,device = 49,action = 3001,value = 0.736939},
{time = 9.474000,device = 49,action = 3001,value = 0.744751},
{time = 9.474000,device = 49,action = 3001,value = 0.749960},
{time = 9.494000,device = 49,action = 3001,value = 0.753866},
{time = 9.506000,device = 49,action = 3001,value = 0.757772},
{time = 9.506000,device = 49,action = 3001,value = 0.762980},
{time = 9.530000,device = 49,action = 3001,value = 0.770792},
{time = 9.554000,device = 49,action = 3001,value = 0.778604},
{time = 9.554000,device = 49,action = 3001,value = 0.783812},
{time = 9.566000,device = 49,action = 3001,value = 0.787718},
{time = 9.578000,device = 49,action = 3001,value = 0.795530},
{time = 9.599000,device = 49,action = 3001,value = 0.803342},
{time = 9.599000,device = 49,action = 3001,value = 0.808551},
{time = 9.614000,device = 49,action = 3001,value = 0.812457},
{time = 9.624000,device = 49,action = 3001,value = 0.816363},
{time = 9.638000,device = 49,action = 3001,value = 0.820269},
{time = 9.638000,device = 49,action = 3001,value = 0.825477},
{time = 9.647000,device = 49,action = 3001,value = 0.829383},
{time = 9.660000,device = 49,action = 3001,value = 0.837195},
{time = 9.683000,device = 49,action = 3001,value = 0.841101},
{time = 9.704000,device = 49,action = 3001,value = 0.845007},
{time = 9.704000,device = 49,action = 3001,value = 0.850215},
{time = 9.716000,device = 49,action = 3001,value = 0.854121},
{time = 9.728000,device = 49,action = 3001,value = 0.858027},
{time = 9.740000,device = 49,action = 3001,value = 0.861933},
{time = 9.751000,device = 49,action = 3001,value = 0.869745},
{time = 9.751000,device = 49,action = 3001,value = 0.874954},
{time = 9.764000,device = 49,action = 3001,value = 0.878860},
{time = 9.810000,device = 49,action = 3001,value = 0.882766},
{time = 10.520000,device = 49,action = 3005,value = 0.005208},
{time = 10.580000,device = 49,action = 3005,value = 0.001301},
{time = 10.588000,device = 49,action = 3005,value = 0.006509},
{time = 10.600000,device = 49,action = 3005,value = 0.002602},
{time = 10.612000,device = 49,action = 3005,value = 0.007810},
{time = 10.624000,device = 49,action = 3005,value = 0.013018},
{time = 10.636000,device = 49,action = 3005,value = 0.018226},
{time = 10.648000,device = 49,action = 3005,value = 0.014319},
{time = 10.648000,device = 49,action = 3005,value = 0.024736},
{time = 10.672000,device = 49,action = 3005,value = 0.020829},
{time = 10.672000,device = 49,action = 3005,value = 0.041663},
{time = 10.684000,device = 49,action = 3005,value = 0.046871},
{time = 10.697000,device = 49,action = 3005,value = 0.042964},
{time = 10.697000,device = 49,action = 3005,value = 0.053381},
{time = 10.710000,device = 49,action = 3005,value = 0.063797},
{time = 10.724000,device = 49,action = 3005,value = 0.074213},
{time = 10.738000,device = 49,action = 3005,value = 0.079421},
{time = 10.747000,device = 49,action = 3005,value = 0.084629},
{time = 10.797000,device = 49,action = 3005,value = 0.089837},
{time = 10.810000,device = 49,action = 3005,value = 0.105462},
{time = 10.820000,device = 49,action = 3005,value = 0.110670},
{time = 10.833000,device = 49,action = 3005,value = 0.115878},
{time = 10.846000,device = 49,action = 3005,value = 0.121086},
{time = 10.858000,device = 49,action = 3005,value = 0.131502},
{time = 10.870000,device = 49,action = 3005,value = 0.136710},
{time = 10.882000,device = 49,action = 3005,value = 0.140616},
{time = 10.882000,device = 49,action = 3005,value = 0.156241},
{time = 10.894000,device = 49,action = 3005,value = 0.160147},
{time = 10.894000,device = 49,action = 3005,value = 0.165355},
{time = 10.906000,device = 49,action = 3005,value = 0.180980},
{time = 10.918000,device = 49,action = 3005,value = 0.184886},
{time = 10.918000,device = 49,action = 3005,value = 0.190094},
{time = 10.930000,device = 49,action = 3005,value = 0.200510},
{time = 10.942000,device = 49,action = 3005,value = 0.208322},
{time = 10.942000,device = 49,action = 3005,value = 0.223947},
{time = 10.960000,device = 49,action = 3005,value = 0.229155},
{time = 10.972000,device = 49,action = 3005,value = 0.233061},
{time = 10.972000,device = 49,action = 3005,value = 0.248686},
{time = 10.980000,device = 49,action = 3005,value = 0.253894},
{time = 10.992000,device = 49,action = 3005,value = 0.257800},
{time = 10.992000,device = 49,action = 3005,value = 0.278633},
{time = 11.008000,device = 49,action = 3005,value = 0.282539},
{time = 11.008000,device = 49,action = 3005,value = 0.292955},
{time = 11.020000,device = 49,action = 3005,value = 0.300767},
{time = 11.020000,device = 49,action = 3005,value = 0.316392},
{time = 11.032000,device = 49,action = 3005,value = 0.326808},
{time = 11.042000,device = 49,action = 3005,value = 0.334620},
{time = 11.042000,device = 49,action = 3005,value = 0.345037},
{time = 11.056000,device = 49,action = 3005,value = 0.355453},
{time = 11.068000,device = 49,action = 3005,value = 0.360661},
{time = 11.080000,device = 49,action = 3005,value = 0.364567},
{time = 11.080000,device = 49,action = 3005,value = 0.374983},
{time = 11.104000,device = 49,action = 3005,value = 0.378889},
{time = 11.104000,device = 49,action = 3005,value = 0.389306},
{time = 11.116000,device = 49,action = 3005,value = 0.393212},
{time = 11.116000,device = 49,action = 3005,value = 0.398420},
{time = 11.128000,device = 49,action = 3005,value = 0.402326},
{time = 11.128000,device = 49,action = 3005,value = 0.407534},
{time = 11.140000,device = 49,action = 3005,value = 0.411440},
{time = 11.140000,device = 49,action = 3005,value = 0.421856},
{time = 11.152000,device = 49,action = 3005,value = 0.425762},
{time = 11.152000,device = 49,action = 3005,value = 0.436179},
{time = 11.170000,device = 49,action = 3005,value = 0.441387},
{time = 11.180000,device = 49,action = 3005,value = 0.445293},
{time = 11.180000,device = 49,action = 3005,value = 0.450501},
{time = 11.192000,device = 49,action = 3005,value = 0.455709},
{time = 11.206000,device = 49,action = 3005,value = 0.459615},
{time = 11.206000,device = 49,action = 3005,value = 0.464823},
{time = 11.218000,device = 49,action = 3005,value = 0.470031},
{time = 11.230000,device = 49,action = 3005,value = 0.475239},
{time = 11.240000,device = 49,action = 3005,value = 0.483051},
{time = 11.240000,device = 49,action = 3005,value = 0.488259},
{time = 11.251000,device = 49,action = 3005,value = 0.492165},
{time = 11.251000,device = 49,action = 3005,value = 0.502582},
{time = 11.266000,device = 49,action = 3005,value = 0.510394},
{time = 11.266000,device = 49,action = 3005,value = 0.520811},
{time = 11.289000,device = 49,action = 3005,value = 0.524717},
{time = 11.289000,device = 49,action = 3005,value = 0.529925},
{time = 11.302000,device = 49,action = 3005,value = 0.533831},
{time = 11.302000,device = 49,action = 3005,value = 0.539039},
{time = 11.320000,device = 49,action = 3005,value = 0.542945},
{time = 11.320000,device = 49,action = 3005,value = 0.548153},
{time = 11.332000,device = 49,action = 3005,value = 0.552059},
{time = 11.332000,device = 49,action = 3005,value = 0.557267},
{time = 11.356000,device = 49,action = 3005,value = 0.561173},
{time = 11.420000,device = 49,action = 3005,value = 0.565079},
{time = 11.420000,device = 49,action = 3005,value = 0.570287},
{time = 11.458000,device = 49,action = 3005,value = 0.574193},
{time = 11.458000,device = 49,action = 3005,value = 0.579401},
{time = 11.482000,device = 49,action = 3005,value = 0.583307},
{time = 11.482000,device = 49,action = 3005,value = 0.588515},
{time = 11.494000,device = 49,action = 3005,value = 0.592421},
{time = 11.520000,device = 49,action = 3005,value = 0.596327},
{time = 11.520000,device = 49,action = 3005,value = 0.601535},
{time = 11.533000,device = 49,action = 3005,value = 0.605441},
{time = 11.560000,device = 49,action = 3005,value = 0.609347},
{time = 11.572000,device = 49,action = 3005,value = 0.614555},
{time = 11.583000,device = 49,action = 3005,value = 0.618461},
{time = 11.610000,device = 49,action = 3005,value = 0.622367},
{time = 11.624000,device = 49,action = 3005,value = 0.626273},
{time = 11.624000,device = 49,action = 3005,value = 0.631481},
{time = 11.638000,device = 49,action = 3005,value = 0.635387},
{time = 11.647000,device = 49,action = 3005,value = 0.639293},
{time = 11.660000,device = 49,action = 3005,value = 0.643199},
{time = 11.674000,device = 49,action = 3005,value = 0.648407},
{time = 11.686000,device = 49,action = 3005,value = 0.652313},
{time = 11.698000,device = 49,action = 3005,value = 0.656219},
{time = 11.738000,device = 49,action = 3005,value = 0.660125},
{time = 11.738000,device = 49,action = 3005,value = 0.665333},
{time = 11.749000,device = 49,action = 3005,value = 0.669239},
{time = 11.801000,device = 49,action = 3005,value = 0.673145},
{time = 11.851000,device = 49,action = 3005,value = 0.677051},
{time = 11.866000,device = 49,action = 3005,value = 0.680957},
{time = 11.866000,device = 49,action = 3005,value = 0.686165},
{time = 11.938000,device = 49,action = 3005,value = 0.690071},
{time = 11.962000,device = 49,action = 3005,value = 0.693977},
{time = 12.040000,device = 49,action = 3005,value = 0.697883},
{time = 12.051000,device = 49,action = 3005,value = 0.703091},
{time = 12.064000,device = 49,action = 3005,value = 0.706997},
{time = 12.106000,device = 49,action = 3005,value = 0.710903},
{time = 12.118000,device = 49,action = 3005,value = 0.714809},
{time = 12.118000,device = 49,action = 3005,value = 0.720017},
{time = 12.130000,device = 49,action = 3005,value = 0.723923},
{time = 12.140000,device = 49,action = 3005,value = 0.727829},
{time = 12.154000,device = 49,action = 3005,value = 0.731735},
{time = 12.166000,device = 49,action = 3005,value = 0.739547},
{time = 12.166000,device = 49,action = 3005,value = 0.744755},
{time = 12.178000,device = 49,action = 3005,value = 0.748661},
{time = 12.192000,device = 49,action = 3005,value = 0.752567},
{time = 12.208000,device = 49,action = 3005,value = 0.756473},
}


stop_sequence_full =  {
{time = 3.8,message = _("AUTOSTOP SEQUENCE IS RUNNING"),message_timeout = std_message_timeout},
{time = 5.778000,device = devices.ENVIRONMENT_SYSTEM,	action = 3005,value = 0.0,message = _("PITOT HEATING OFF"),message_timeout = std_message_timeout},
{time = 7.246000,device = devices.AUTOPILOT,		action = 3028,value = 1.0,message = _("ANTISKID OFF"),message_timeout = std_message_timeout},
{time = 9.016000,device = devices.LIGHT_SYSTEM,		action = 3008,value = 1.0,message = _("POSITION LIGHTS FLASH"),message_timeout = std_message_timeout},
{time = 10.240000,device = devices.LIGHT_SYSTEM,	action = 3013,value = 1.0,message = _("SIGNAL LIGHTS BRIGHT"),message_timeout = std_message_timeout},
{time = 12.431000,device = devices.AUTOPILOT,		action = 3030,value = 1.0,message = _("EMERGENCY BRAKE ON"),message_timeout = std_message_timeout},
{time = 14.714000,action = 71,	value  = 0.0,								  message = _("CANOPY - OPEN"),message_timeout = std_message_timeout},
{time = 16.410000,device = devices.AHCP,		action = 3010,value = 0.0,	  message = _("IFFCC OFF"),message_timeout = std_message_timeout},
{time = 18.546000,device = devices.AHCP,		action = 3008,value = 0.0,	  message = _("CICU OFF"),message_timeout = std_message_timeout},

{time = 20.444000,device = devices.MFCD_LEFT,	action = 3036,	value = 0.1,	message = _("LEFT MFCD OFF"),message_timeout = std_message_timeout},
{time = 22.870000,device = devices.MFCD_LEFT,	action = 3036,	value = 0.0},

{time = 24.740000,device = devices.MFCD_RIGHT,	action = 3036,	value = 0.1,	message = _("RIGHT MFCD OFF"),message_timeout = std_message_timeout},
{time = 26.124000,device = devices.MFCD_RIGHT,	action = 3036,	value = 0.0},

{time = 28.296000,device = devices.LIGHT_SYSTEM,action = 3014,value = 0.1,	message = _("LAND TAXI LIGHTS OFF"),message_timeout = std_message_timeout},

{time = 30.096000,action = 146,value  = 0.0,message = _("FLAPS DOWN"),message_timeout = std_message_timeout},

{time = 33.014000,device = devices.AAP,	action = 3006,value = 0.0,		message = _("EGI POWER OFF"),	message_timeout = std_message_timeout},
{time = 36.864000,device = devices.AAP,	action = 3005,value = 0.0,		message = _("CDU POWER OFF OFF"),message_timeout = std_message_timeout},

{time = 40.560000,action = 313,value  = 0.0,	message = _("LEFT ENGINE STOP"),	message_timeout = std_message_timeout},
{time = 42.314000,action = 314,value  = 0.0,	message = _("RIGHT ENGINE STOP"),	message_timeout = std_message_timeout},

{time = 44.110000,device = devices.ELEC_INTERFACE,	action = 3004,value = 0.0,message = _("LEFT GENERATOR OFF"),message_timeout = std_message_timeout},
{time = 46.816000,device = devices.ELEC_INTERFACE,	action = 3005,value = 0.0,message = _("RIGHT GENERATOR OFF"),message_timeout = std_message_timeout},
{time = 48.788000,device = devices.ELEC_INTERFACE,	action = 3002,value = 0.0,message = _("INVERTER OFF"),message_timeout = std_message_timeout},
{time = 50.578000,device = devices.ELEC_INTERFACE,	action = 3006,value = 0.0,message = _("BATTERY OFF"),message_timeout = std_message_timeout},

{time = 52.918000,device = devices.VHF_AM_RADIO,	action = 3003,value = 0.0,message = _("VHF AM RADIO OFF"),message_timeout = std_message_timeout},
{time = 54.955000,device = devices.UHF_RADIO,		action = 3013,value = 0.000000,message = _("UHF RADIO OFF"),message_timeout = std_message_timeout},
{time = 56.058000,device = devices.VHF_FM_RADIO,	action = 3003,value = 0.000000,message = _("VHF FM RADIO OFF"),message_timeout = std_message_timeout},
{time = 58.8,message = _("AUTOSTOP COMPLETE"),message_timeout = std_message_timeout},
}