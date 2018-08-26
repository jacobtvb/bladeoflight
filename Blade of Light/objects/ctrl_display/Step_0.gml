if (instance_exists(obj_player))
{
    target_x_center = (obj_player.bbox_left + obj_player.bbox_right) div 2;
    target_y_center = (obj_player.bbox_top + obj_player.bbox_bottom) div 2;
}

if (camera_x_center != target_x_center)
{
    camera_x_center = max(1, floor(lerp(camera_x_center, target_x_center, camera_rate)));
}
if (camera_y_center != target_y_center)
{
    camera_y_center = max(1, floor(lerp(camera_y_center, target_y_center, camera_rate)));
}

camera_set_view_pos(
    camera,
    clamp(0, camera_x_center - camera_width div 2, camera_max_x),
    clamp(0, camera_y_center - camera_height div 2, camera_max_y)
    );
