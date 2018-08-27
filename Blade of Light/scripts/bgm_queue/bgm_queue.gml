/// @function bgm_play(bgm)
/// @description Queues a given track to be played right after the current one.
/// @param {sound} bgm

with (ctrl_overmind)
{
    if (is_undefined(current_bgm))
    {
        bgm_play(argument0);
    }
    else
    {
        next_bgm = argument0;
    }
}
