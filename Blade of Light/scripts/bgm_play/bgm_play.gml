/// @function bgm_play(bgm)
/// @description Plays a given track.
/// @param {sound} bgm

with (ctrl_overmind)
{
    if (current_bgm == argument0)
    {
        if (is_undefined(argument0) && !is_undefined(bgm_instance))
            audio_stop_sound(bgm_instance);

        next_bgm = argument0;
        exit;
    }
    
    if (!is_undefined(bgm_instance))
        audio_stop_sound(bgm_instance);
    
    current_bgm = argument0;
    next_bgm = argument0;
    if (!is_undefined(current_bgm))
        bgm_instance = audio_play_sound(current_bgm, 100, false);
}
