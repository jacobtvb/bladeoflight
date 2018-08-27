if (sprite_index == spr_veneraAoE)
{
    with (ctrl_dialogue)
        event_user(0);
        
    instance_destroy();
}
if (sprite_index == spr_veneraStandProud)
{
    with (ctrl_dialogue)
        event_user(0);
        
    sprite_index = spr_veneraIdle;
}
