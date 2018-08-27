gamestate_set("player_hp", 10 - 5 * gamestate_get("difficulty"));
gamestate_set("shrine_room", "rm_test");
gamestate_set("shrine_spawn", "battle");
gamestate_set("shrine_xoffset", 0);
gamestate_set("shrine_yoffset", 0);

json_save("gamestate.json", ctrl_overmind.gamestate);

gamestate_checkpoint_load();
