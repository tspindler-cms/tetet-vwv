local a1_skyraiderBridle = dofile(current_mod_path.."/Database/a-1_skyraider_base.lua");

local launch_bar_connected_arg_value_ = 1.0;

a1_skyraiderBridle.mechanimations = {
    -- from FA-18C
    LaunchBar = {
        {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 1.0, "in", 4.5}}}}},
        {Transition = {"Extend", "Retract"}, Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 4.5}}}}},
        {Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 2}, {"Arg", 85, "to", 0.745, "in", 4.0}}}}},
        {Transition = {"Any", "Retract"},    Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 1.0}}}}},--4.5 LaunchBar Hoch from VSN F-4B
        {Transition = {"Stage", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.0, "in", 0.5}}}}}, -- in was 4.0
        {Transition = {"Extend", "Stage"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 1.0, "to", 0.745, "in", 1.0}}}}},
        {Transition = {"Stage", "Pull"},     Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 0.743, "in", 1.0}}}}},
        {Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "Mechanical"}, {"Arg", 85, "from", 0.745, "to", 1.0, "in", 0.2}}}}},
    },
    Door0 = {
        {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.8, "in", 9.0},},},}, Flags = {"Reversible"},},
        {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
        {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
    },
    FoldableWings = {
        {Transition 		= {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 10.0}}}}, Flags = {"Reversible"}},
        {Transition 		= {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 10.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
    },
};

a1_skyraiderBridle.launch_bar_connected_arg_value = launch_bar_connected_arg_value_;

return a1_skyraiderBridle;