var _list = ds_list_create();
ds_list_add(_list,
    [cmd_camera, "arena_center"],
    [cmd_dialogue, 1, "Your invasion ends here, Venera!\nWe're not letting you disturb our peace any longer!"],
    [cmd_dialogue, 2, "Why, then, you had attacked our lands in the first place?\nYou cannot think your actions wouldn't have consequences."],
    [cmd_dialogue, 1, "Our actions? This town has nothing to do with the war.\nWhat you do goes far beyond a just retribution."],
    [cmd_dialogue, 2, "Hm, how well-spoken.\nUsually your kind would just rush at us in blind rage."],
    [cmd_dialogue, 6, "Don't you dare look down on us."],
    [cmd_camera, "arena_subcenter"],
    [cmd_dialogue, 2, "Wait... who is that?\nThis sword... it can't be.\nYou killed Sanctum!?"],
    [cmd_dialogue, 0, "Actually, I only found-"],
    [cmd_dialogue, 2, "How could you?!\nNothing to do with the war? As if!\nI will erase this entire town from existence!"],
    [cmd_eventUser, obj_veneraScene, 0],
    [cmd_dialogue, 0, "...she ran away?"],
    [cmd_dialogue, 1, "No wonder, their greatest hero has just died.\nWe cannot rest yet, however.\nShe is cautious, but she never gives up."],
    [cmd_freeArena]
    );
if (gamestate_fallen_count("dark") == 0)
{
    ds_list_add(_list,
        [cmd_dialogue, 1, "To think that you would defeat Sanctum?\nHow would you do that?"],
        [cmd_dialogue, 0, "It wasn't me, I just found his sword.\nI didn't even know it was his until now."],
        [cmd_dialogue, 1, "I see, I see."],
        [cmd_dialogue, 6, "This sword must be destroyed at once.\nYou must be destroyed."],
        [cmd_dialogue, 0, "Wait, what?"],
        [cmd_dialogue, 1, "...I don't even know how you can keep it.\nIts very sight sickens me."],
        [cmd_dialogue, 0, "Other townspeople didn't react well to it, either.\nIt's strange... when I drop the sword, I want to break it,\nbut as soon as I take it, I don't see the point."],
        [cmd_dialogue, 1, "What a cursed weapon...\nIt's better if you don't stay here for too long."],
        [cmd_dialogue, 1, "Go ahead, there are enemy forces.\nThis sword will be better used there."],
        [cmd_dialogue, 0, "...enemy forces, huh?"],
        [cmd_dialogue, 1, "Maybe you can catch up with Venera, too.\nWe can't give her time to plan another assault."],
        [cmd_dialogue, 0, "Got it."],
        [cmd_camera, undefined]
        );
}
else if (gamestate_fallen_count("dark") < 10)
{
    ds_list_add(_list,
        [cmd_dialogue, 1, "To think that you would defeat Sanctum?\nHow would you do that?"],
        [cmd_dialogue, 0, "It wasn't me, I just found his sword.\nI didn't even know it was his until now."],
        [cmd_dialogue, 1, "I see, I see...\nwait, is that...?"],
        [cmd_dialogue, 6, "A fresh bloodstain of our kind?\nWhat is the meaning of this?"],
        [cmd_dialogue, 0, "...townspeople attacked me, and I had to protect myself..."],
        [cmd_dialogue, 1, "You don't seem like the type to kill people carelessly..."],
        [cmd_dialogue, 6, "Even so, this is unforgivable.\nWe cannot let you out of here alive."],
        [cmd_camera, undefined],
        [cmd_beginArena]
        );
}
else
{
    ds_list_add(_list,
        [cmd_dialogue, 1, "Wait... this sword..."],
        [cmd_dialogue, 6, "It's soaked with blood of our kind.\nJust how many of your brethren you have killed?"],
        [cmd_dialogue, 0, "...it's because...\n..."],
        [cmd_dialogue, 6, "This sword...\nEven after Sanctum's death, it carries out his deeds.\nIt must be destroyed at all costs!"],
        [cmd_camera, undefined],
        [cmd_beginArena]
        );
}

commands = array_create_from_ds_list(_list);
ds_list_destroy(_list);
