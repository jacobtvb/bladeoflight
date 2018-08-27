if (keyboard_check_pressed(ord("N")) && keyboard_check(vk_control))
{
    file_delete("gamestate.json");
    ctrl_overmind.gamestate = json_load("gamestate.json");
    gamestate_set("difficulty", 0);
    json_save("gamestate.json", ctrl_overmind.gamestate);
    gamestate_checkpoint_load();
}
if (keyboard_check_pressed(ord("H")) && keyboard_check(vk_control))
{
    file_delete("gamestate.json");
    ctrl_overmind.gamestate = json_load("gamestate.json");
    gamestate_set("difficulty", 1);
    json_save("gamestate.json", ctrl_overmind.gamestate);
    gamestate_checkpoint_load();
}

if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X")))
{
    gamestate_checkpoint_load();
}
