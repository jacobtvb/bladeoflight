/// @function commands_launch(arrofarr)
/// @description Launches a set of commands.
/// @param {array} arrofarr Array of command delegate arrays.

with (instance_create_depth(0, 0, 0, ctrl_dialogue))
{
    commands = ds_list_create_from_array(argument0);
    event_user(0);
}
