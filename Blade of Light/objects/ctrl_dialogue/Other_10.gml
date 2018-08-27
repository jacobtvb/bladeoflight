if (ds_list_empty(commands))
{
    ds_list_destroy(commands);
    mode = "finishing";
}
else
{
    var _command = commands[| 0];
    ds_list_delete(commands, 0);
    script_execute(_command[0], _command);
}
