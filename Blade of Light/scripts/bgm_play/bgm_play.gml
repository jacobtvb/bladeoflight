/// @function bgm_play(bgm)
/// @description Plays a given track.
/// @param {sound} bgm

with (ctrl_overmind)
{
    if (current_bgm == argument0)
    {
        next_bgm = argument0;
        exit;
    }
    
    if (!is_undefined(current_bgm))
        audio_stop_sound(current_bgm);
    
    current_bgm = argument0;
    next_bgm = argument0;
    if (!is_undefined(current_bgm))
        audio_play_sound(current_bgm, 100, false);
}
