if (ds_list_find_index(ingame_rooms, room) >= 0)
{
    bgm_play(bgm_set[? room]);

    show_debug_message("Spawning player");
    var _spawn_point = gamestate_get("player_spawn");
    var _xoffset = gamestate_get("player_xoffset");
    var _yoffset = gamestate_get("player_yoffset");
    show_debug_message([_spawn_point, _xoffset, _yoffset]);
    
    var _spawn_id = undefined;
    if (_spawn_point == "!shrine")
    {
        _spawn_id = obj_shrineInfo.id;
    }
    else
    {
        with (obj_trans)
        {
            if (_spawn_point == edge)
                _spawn_id = id;
        }
        with (obj_spawnPoint)
        {
            if (_spawn_point == name)
                _spawn_id = id;
        }
    }
    if (!is_undefined(_spawn_id))
    {
        _xoffset += _spawn_id.x;
        _yoffset += _spawn_id.y;
    }
    show_debug_message([_xoffset, _yoffset]);
    with (instance_create_layer(_xoffset, _yoffset, "Instances", obj_player))
    {
        if (!is_undefined(gamestate_get("player_hp")))
            hp = gamestate_get("player_hp");
            
        if (room == rm_test)
            obj_player.chargeLevelMax = 3;
    }
}
else
{
    instance_create_depth(0, 0, -15000, ctrl_display);
}

if (room == rm_gardens6)
{
    bgm_play(bgm_venera_first);
}
if (room = rm_test)
{
    bgm_play(bgm_voidgod_first);
}
