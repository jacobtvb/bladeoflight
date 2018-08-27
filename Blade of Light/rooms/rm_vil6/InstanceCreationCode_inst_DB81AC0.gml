if (gamestate_get("arena_win"))
    instance_destroy();

if (gamestate_fallen_count("dark") > 0)
    instance_destroy();
