if (!instance_exists(ctrl_arenaTown))
{
    if (name == "")
        show_error("Unnamed enemy of " + faction + " at (" + string(x) + "," + string(y) + ")!", true);

    if (gamestate_fallen_get(faction, name))
        instance_destroy();
}
