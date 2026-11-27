------------------------------------------------------------

-- Based on DShK HMG config by Currenthill, adjusted by TeTeT and Marlboros for VWV

GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary);
GT_t.ws = 0;
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 1.2;
GT.armour_scheme = {};
set_recursive_metatable(GT.armour_scheme, GT_t.unarmed_armour_scheme);
-- The EDM is a Mixamo soldier on the gun, not the DCS infantry skeleton.
-- generic_human still builds the human aim behavior from the Mixamo bone
-- chain, and that walk recurses until the thread stack overflows.
-- Aim point for aircraft gunners; the Mixamo bones are not a target graph.
GT.CustomAimPoint = {0, 1.8, 0}

GT.Name = "VWV_DSHK_HMG";
GT.DisplayName = _("[VWV] DShK HMG");
GT.DisplayNameShort = _("DShK");
GT.Rate = 5;

GT.visual.shape = "vwv_dshk";
GT.visual.shape_dstr = "vwv_dshk_dstr";
GT.shape_table_data =
{
    {
        file  	    = GT.visual.shape;
        username    = GT.Name;
        desrt       = GT.visual.shape_dstr;
        classname 	= "lLandVehicle";
        positioning = "ONLYHEIGTH";
        life		= 2;
    },
    {
        name  = GT.visual.shape_dstr;
        file  = GT.visual.shape_dstr;
    },
}
GT.toggle_alarm_state_interval = 1.0;
GT.animation_arguments.alarm_state = -1;
GT.visual.min_time_agony = 0;
GT.visual.max_time_agony = 1;
GT.visual.agony_explosion_size = 0.1;

GT.mobile = false;

GT.IR_emission_coeff = 0.002;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 2.0;
GT.Sensors = { OPTIC = {"long-range air defence optics"} };

GT.WS = {};
GT.WS.maxTargetDetectionRange = 5000;
GT.WS.fire_on_march = false;

-- =====================================================================================

local ws = GT_t.inc_ws();
GT.WS[ws] = {};

-- Fixed pivot. vwv_dshk_rot_empty is parented under the argument node this
-- station drives; resolving it while a gunner queries the aim point re-enters
-- the station update and overflows the stack. Arguments 0/1 still rotate the mesh.
GT.WS[ws].pos = {0, 1.8, 0};
GT.WS[ws].cockpit = {"IronSight/IronSight", open = true};
GT.WS[ws].pointer = "POINT_SIGHT_01";
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = math.rad(60);
GT.WS[ws].omegaZ = math.rad(60);
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].pidY = GT_t.AAA_PIDY;
GT.WS[ws].pidZ = GT_t.AAA_PIDZ;
GT.WS[ws].angles = {
    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
};

local __LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_utes);
-- The Utes template is a tank secondary gun: no type, empty sensor, and
-- primaryWeapon false, so a stationary mount never acquires or fires.
__LN.type = 3;
__LN.distanceMin = 0;
__LN.distanceMax = 1800;
__LN.max_trg_alt = 1800;
__LN.reactionTime = 0.5;
__LN.reflection_limit = 0.02;
__LN.connectorFire = true;
__LN.primaryWeapon = true;
__LN.PL[1].switch_on_delay = 1;
__LN.BR[1].connector_name = 'vwv_dshk_muzzle_empty';
__LN.PL[1].shell_name = {"Utes_12_7x108_T"};
set_recursive_metatable(__LN.sensor, GT_t.WSN_t[3]);
__LN.sightMasterMode = 1;
__LN.sightIndicationMode = 1;

-- =====================================================================================

GT.EPLRS = true;

GT.Transportable = {
    size = 200,
    valide = true,
};

GT.DetectionRange = 5000;
GT.ThreatRange = 1800;
GT.mapclasskey = "P0091000015";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Gun,WSTYPE_PLACEHOLDER,
                                "AA_flak",
                                "Static AAA",
                                "NonAndLightArmoredUnits",
                                "NonArmoredUnits",
                                "Armed Air Defence",
                                "AAA",
                                };
GT.category = "Air Defence";

add_surface_unit(GT)
