if (!is_undefined(viewpoint))
{
    with (obj_viewpoint)
    {
        if (name == other.viewpoint)
        {
            other.target_x_center = x;
            other.target_y_center = y;
        }
    }
}
else
{
    if (instance_exists(obj_player))
    {
        target_x_center = (obj_player.bbox_left + obj_player.bbox_right) div 2;
        target_y_center = (obj_player.bbox_top + obj_player.bbox_bottom) div 2;
    
        if (instance_exists(obj_venera))
        {
            var _mid_x_center = (obj_venera.bbox_left + obj_venera.bbox_right) div 2;
            var _mid_y_center = (obj_venera.bbox_top + obj_venera.bbox_bottom) div 2;
            var _dist = point_distance(target_x_center, target_y_center, _mid_x_center, _mid_y_center);
            var _factor = min(0.5, 256/_dist);
        
            target_x_center = round(lerp(target_x_center, _mid_x_center, _factor));
            target_y_center = round(lerp(target_y_center, _mid_y_center, _factor));
        }
    }
}


target_y_center -= 64 * (instance_exists(ctrl_dialogue));

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
