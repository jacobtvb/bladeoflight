if (!place_meeting(x, y, obj_player))
    exit;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_info);

var _cx = camera_get_view_x(ctrl_display.camera);
var _cy = camera_get_view_y(ctrl_display.camera);
var _cw = camera_get_view_width(ctrl_display.camera);
var _ch = camera_get_view_height(ctrl_display.camera);

var _x = _cx + _cw div 2;
var _y = _cy + _ch - 48;

draw_set_alpha(1);
draw_set_color(c_black);
for (var i = -3; i <= 3; i++)
for (var j = -3; j <= 3; j++)
    draw_text(_x + i, _y + j, info);

draw_set_color(c_white);
draw_text(_x, _y, info);

// restoring the original settings for other objects

draw_set_alpha(1);
draw_set_color(c_white);
