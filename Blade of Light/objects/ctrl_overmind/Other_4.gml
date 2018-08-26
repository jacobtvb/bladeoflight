if (ds_list_find_index(ingame_rooms, room) >= 0)
{
    show_debug_message("TEEEEST");
    var _spawn_point = gamestate_get("player_spawn");
    var _xoffset = gamestate_get("player_xoffset");
    var _yoffset = gamestate_get("player_yoffset");
    show_debug_message([_spawn_point, _xoffset, _yoffset]);
    
    var _spawn_id = undefined;
    with (obj_trans)
    {
        if (_spawn_point == edge)
            _spawn_id = id;
    }
    if (!is_undefined(_spawn_id))
    {
        _xoffset += _spawn_id.x;
        _yoffset += _spawn_id.y;
    }
    show_debug_message([_xoffset, _yoffset]);
    instance_create_layer(_xoffset, _yoffset, "Instances", obj_player);
}
