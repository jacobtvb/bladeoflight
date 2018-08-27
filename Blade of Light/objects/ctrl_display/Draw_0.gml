with (obj_info)
{
    event_user(15);
}

if (instance_exists(obj_player) && obj_player.hp >= 0)
{
    var _cx = camera_get_view_x(camera);
    var _cy = camera_get_view_y(camera);
    for (var i = 0; i < obj_player.hpMax; i++)
    {
        draw_sprite(spr_health, 0 + (i < obj_player.hp), 8 + _cx + 12 * i, 8 + _cy);
    }
    draw_sprite(spr_health, 6, 8 + _cx + 12 * obj_player.hpMax, 8 + _cy);
}

if (instance_exists(obj_venera) && obj_venera.hp >= 0)
{
    var _cx = camera_get_view_x(camera);
    var _cy = camera_get_view_y(camera);
    var _cw = camera_get_view_width(camera);
    var _ch = camera_get_view_height(camera);
    for (var i = 0; i < obj_venera.hpMax; i++)
    {
        draw_sprite(spr_health, 2 + (i < obj_venera.hp), _cx + _cw - 12 * (i + 1) - 8, 8 + _cy);
    }
}
