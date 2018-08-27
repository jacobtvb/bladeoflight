gamestate_set("arena_win", true);
with (obj_arenaWall)
{
    instance_destroy();
}
with (ctrl_dialogue)
    event_user(0);
