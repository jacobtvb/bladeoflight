/// @function bgm_fade()
/// @description Fades out the current soundtrack.

with (ctrl_overmind)
{
    if (!is_undefined(bgm_instance))
    {
        audio_sound_gain(bgm_instance, 0, 1000);
    }
}
