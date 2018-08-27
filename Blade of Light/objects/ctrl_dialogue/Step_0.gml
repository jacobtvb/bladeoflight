switch (mode)
{
    case "dialogue":
        if (keyboard_check_pressed(ord("Z")) || keyboard_check(ord("X")))
        {
            event_user(0);
        }
        break;
    case "finishing":
        instance_destroy();
        break;
}