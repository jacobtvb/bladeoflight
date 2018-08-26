with (obj_info)
{
    event_user(15);
}

if (instance_exists(obj_player) && obj_player.hp >= 0)
{
    draw_set_alpha(1);
    draw_set_color(c_red);

    var _cx = camera_get_view_x(camera);
    var _cy = camera_get_view_y(camera);
    for (var i = 0; i < obj_player.hp; i++)
    {
        draw_rectangle(_cx+1 + 32*i, _cy+1, _cx + 30 + 32*i, _cy + 30, false);
    }
}

if (instance_exists(obj_venera) && obj_venera.hp >= 0)
{
    draw_set_alpha(1);
    draw_set_color(c_blue);

    var _cx = camera_get_view_x(camera);
    var _cy = camera_get_view_y(camera);
    var _cw = camera_get_view_width(camera);
    var _ch = camera_get_view_height(camera);
    for (var i = 0; i < obj_venera.hp; i++)
    {
        draw_rectangle(_cx + _cw - 30 - 32*i, _cy + _ch - 30, _cx + _cw - 1 - 32*i, _cy + _ch - 1, false);
    }
}
