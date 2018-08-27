camera_width = 1024;
camera_height = 768;
camera_rate = 0.1;

target_x_center = camera_width div 2;
target_y_center = camera_height div 2;

if (instance_exists(obj_player))
{
    target_x_center = (obj_player.bbox_left + obj_player.bbox_right) div 2;
    target_y_center = (obj_player.bbox_top + obj_player.bbox_bottom) div 2;
}

viewpoint = undefined;
if (room == rm_gardensScene)
{
    viewpoint = "center";
    with (obj_viewpoint)
    {
        if (name == other.viewpoint)
        {
            other.target_x_center = x;
            other.target_y_center = y;
        }
    }
}

camera_x_center = target_x_center;
camera_y_center = target_y_center;

camera_max_x = room_width - camera_width;
camera_max_y = room_height - camera_height;

camera = camera_create_view(
    clamp(0, camera_x_center - camera_width div 2, camera_max_x),
    clamp(0, camera_y_center - camera_height div 2, camera_max_y),
    camera_width,
    camera_height
    );

view_camera[0] = camera;

/*
commands_launch([
    [cmd_dialogue, 0, "I like apples"],
    [cmd_dialogue, 1, "Me too"],
    [cmd_dialogue, 2, "Me three"],
    [cmd_dialogue, 5, "Me SHINE!"]
    ]);
*/
