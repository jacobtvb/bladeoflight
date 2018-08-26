if (!is_undefined(next_bgm))
{
    if (!audio_is_playing(current_bgm))
    {
        current_bgm = next_bgm;
        audio_play_sound(current_bgm, 100, false);
    }
}