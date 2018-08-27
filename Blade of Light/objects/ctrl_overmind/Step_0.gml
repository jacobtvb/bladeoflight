if (!is_undefined(bgm_instance) && audio_is_playing(bgm_instance))
{
    if (audio_sound_get_gain(bgm_instance) == 0)
        audio_stop_sound(bgm_instance);
}

if (!is_undefined(next_bgm))
{
    if (!audio_is_playing(current_bgm))
    {
        current_bgm = next_bgm;
        if (current_bgm == bgm_venera_outro || current_bgm == bgm_voidgod_outro)
            _next_bgm = undefined;
        
        bgm_instance = audio_play_sound(current_bgm, 100, false);
    }
}

if (keyboard_check(vk_alt) && keyboard_check(vk_control) && keyboard_check_pressed(ord("R")))
{
    file_delete("gamestate.json");
    game_restart();
}
