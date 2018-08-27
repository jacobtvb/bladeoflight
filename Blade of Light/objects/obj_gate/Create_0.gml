image_single = gamestate_fallen_count("switch");
if (image_single < 2)
{
    for (var i = 0; i < 5; i++)
    {
        instance_create_layer(x + 64 * i, y, "Walls", obj_wall);
    }
}
depth = -bbox_bottom;
