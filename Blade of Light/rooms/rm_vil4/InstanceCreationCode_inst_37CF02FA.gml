var _list = ds_list_create();
ds_list_add(_list,
    [cmd_dialogue, 1, "Why there are so many soldiers around?\nIs the town under attack?"],
    [cmd_dialogue, 0, "...they are going to attack me because of the sword, won't they?"],
    [cmd_dialogue, 0, "I didn't think I'd ever say that,\nbut I'd rather be among the people of light now."],
    [cmd_dialogue, 0, "If I want to get out of here, I must open the town gates.\nIt requires activating switches in the eastern and western areas."]
    );
if (gamestate_fallen_count("dark") == 0)
{
    ds_list_add(_list,
        [cmd_dialogue, 0, "Phew... made it through.\nSometimes it really is alright to run away."]
        );
}
else
{
    ds_list_add(_list,
        [cmd_dialogue, 0, "...\n...I didn't want to."]
        );
}
ds_list_add(_list,
    [cmd_dialogue, 0, "Why there are so many soldiers around?\nIs the town under attack?"],
    [cmd_dialogue, 0, "...they are going to attack me because of the sword, won't they?"],
    [cmd_dialogue, 0, "I didn't think I'd ever say that,\nbut I'd rather be among the people of light now."],
    [cmd_dialogue, 0, "If I want to get out of here, I must open the town gates.\nIt requires activating switches in the eastern and western areas."]
    );
commands = array_create_from_ds_list(_list);
ds_list_destroy(_list);
