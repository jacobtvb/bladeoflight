with (obj_info)
{
    event_user(15);
}

var _cx = camera_get_view_x(camera);
var _cy = camera_get_view_y(camera);
var _cw = camera_get_view_width(camera);
var _ch = camera_get_view_height(camera);

if (instance_exists(obj_player))
{
    for (var i = 0; i < obj_player.hpMax; i++)
    {
        draw_sprite(spr_health, 0 + (i < obj_player.hp), 8 + _cx + 12 * i, 8 + _cy);
    }
    draw_sprite(spr_health, 6, 8 + _cx + 12 * obj_player.hpMax, 8 + _cy);
}

if (instance_exists(obj_venera))
{
    for (var i = 0; i < obj_venera.hpMax; i++)
    {
        draw_sprite(spr_health, 2 + (i < obj_venera.hp), _cx + _cw - 12 * (i + 1) - 8, 8 + _cy);
    }
}

if (instance_exists(obj_voidgod))
{
    for (var i = 0; i < obj_voidgod.hpMax; i++)
    {
        draw_sprite(spr_health, 4 + (i < obj_voidgod.hp), _cx + _cw - 12 * (i + 1) - 8, 8 + _cy);
    }
}

if (instance_exists(obj_knight) && room == rm_vil6)
{
    for (var i = 0; i < obj_knight.hpMax; i++)
    {
        draw_sprite(spr_health, 0 + (i < obj_knight.hp), _cx + _cw - 12 * (i + 1) - 8, 8 + _cy);
    }
}

if (instance_exists(ctrl_dialogue) && ctrl_dialogue.mode == "dialogue")
{
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_sprite(spr_dialogueBox, ctrl_dialogue.speaker, _cx, _cy + _ch - 128);
    draw_sprite(spr_dialoguePortrait, ctrl_dialogue.speaker, _cx + 32, _cy + _ch - 112);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_dialogue);
    draw_text(_cx + 160, _cy + _ch - 64, ctrl_dialogue.text);
}
