------------------------------------------------------------

-- Based on DShK HMG config by Currenthill, adjusted by TeTeT and Marlboros for VWV

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_human);
set_recursive_metatable(GT.chassis, GT_t.CH_t.HUMAN);
set_recursive_metatable(GT.armour_scheme, GT_t.unarmed_armour_scheme);

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
        life		= 5;
    },
    {
        name  = GT.visual.shape_dstr;
        file  = GT.visual.shape_dstr;
    },
}
GT.toggle_alarm_state_interval = 1.0;

GT.mobile = false;

GT.IR_emission_coeff = 0.002

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 2.0;

GT.WS = {};
GT.WS.maxTargetDetectionRange = 5000;
GT.WS.fire_on_march = false;

-- =====================================================================================

ws = GT_t.inc_ws();
GT.WS[ws] = {}

GT.WS[ws].center = 'vwv_dshk_rot_empty'
-- seems we do not find the right spot in the model for POINT_SIGHT_01, so we will use the cockpit instead
GT.WS[ws].cockpit = {"IronSight/IronSight",  {-2.00, 0.234, 0.0501}, open = true};
-- GT.WS[ws].pointer = "POINT_SIGHT_01"
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].omegaY = math.rad(60)
GT.WS[ws].omegaZ = math.rad(60)
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_utes);
__LN.BR[1].connector_name = 'vwv_dshk_muzzle_empty';
__LN.PL[1].shell_name = {"Utes_12_7x108_T"};
__LN.sightMasterMode = 1;
__LN.sightIndicationMode = 1;

-- =====================================================================================

GT.EPLRS = true

GT.Transportable = {
    size = 200,
    valide = true
};

GT.DetectionRange = 5000;
GT.ThreatRange = 1800;
GT.mapclasskey = "P0091000201";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_GenericInfantry,
                                "Infantry",
                                "Mobile AAA",
                                };
GT.category = "Infantry";

add_surface_unit(GT)
