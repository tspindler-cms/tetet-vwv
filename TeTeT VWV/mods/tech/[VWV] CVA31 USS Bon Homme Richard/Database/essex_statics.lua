local function add_structure(f)
        GT ={}
        set_recursive_metatable(GT, GT_t.generic_stationary)
        set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
        if(f) then
                GT.chassis.life = f.Life


                GT.visual.shape = f.ShapeName
                GT.visual.shape_dstr = f.ShapeNameDestr
                GT.CustomAimPoint = {1,1,0}
                GT.visual.fire_size = f.fire_size or 0
                GT.visual.fire_pos = {-2,0,0};
                GT.visual.fire_time = 30
                GT.time_agony = 0;

                GT.Name = f.Name
                GT.DisplayName = f.DisplayName
                GT.Rate = 1
                GT.shape_table_data =
                {
                        {
                                file        = GT.visual.shape;
                                username    = GT.Name;
                                desrt       = GT.visual.shape_dstr;
                                classname   = "lLandVehicle";
                                positioning = "ONLYHEIGTH";
                                life            = f.Life or 5;
                        },
                        {
                                name  = GT.visual.shape_dstr;
                                file  = GT.visual.shape_dstr;
                        },
                }

                GT.DetectionRange  = 0;
                GT.ThreatRange = 0;
                GT.mapclasskey = "P0091000076";
                GT.attribute = {wsType_Static, wsType_Standing}
                GT.category = f.category;
                GT.positioning = "ONLYHEIGTH"

                add_surface_unit(GT)
        else
                error("Can't add structure")
        end;
end

add_structure({
    Name             =  "vwv_towbar",
    DisplayName  = _("[VWV] Towbar"),
    ShapeName        =   "vwv_towbar",
    ShapeNameDestr = "vwv_towbar",
    Life             =  1,
    Rate             =  1,
    category     =  "ADEquipment",
    fire_size = 0.2,
})

add_structure({
    Name             =  "vwv_bridle_set",
    DisplayName  = _("[VWV] Bridle Set"),
    ShapeName        =   "vwv_bridle_set",
    ShapeNameDestr = "vwv_bridle_set",
    Life             =  1,
    Rate             =  1,
    category     =  "ADEquipment",
    fire_size = 0.2,
})
