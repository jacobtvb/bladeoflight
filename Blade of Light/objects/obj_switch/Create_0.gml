instance_create_layer(x, y, "Walls", obj_wall);

if (gamestate_fallen_get("switch", name))
{
    image_single = 1;
}
else
{
    image_single = 0;
    with (instance_create_layer(x - 64, y - 64, "Ground", obj_switchInfo))
    {
        image_xscale = 3;
        image_yscale = 3;
    }
}

depth = -bbox_bottom;
