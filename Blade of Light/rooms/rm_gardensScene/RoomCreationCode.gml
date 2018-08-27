var _fallenLight = gamestate_fallen_count("light");
var _fallenDark = gamestate_fallen_count("dark");

var _list = ds_list_create();

ds_list_add(_list,
    [cmd_bgm, bgm_venera_talk],
    [cmd_dialogue, 3, "*cough* I never stood a chance, did I? You are the one who killed Sanctum, after all."],
    [cmd_dialogue, 0, "..."],
    );
    
if (_fallenLight >= 10)
{
    ds_list_add(_list,
        [cmd_dialogue, 3, "...why hesitating now? Don't you seek revenge?.\nYou didn't have second thoughts when slaying my warriors, have you?"]
        );
}
else
{
    ds_list_add(_list,
        [cmd_dialogue, 3, "...why hesitating now? Don't you seek revenge?."]
        );
}

ds_list_add(_list,
    [cmd_dialogue, 0, "...first of all, I haven't killed Sanctum. I only found his sword.\nI won't deny, though, I was relieved when I learned about his death.\nI heard even his soldiers couldn't take his insanity anymore."],
    [cmd_bgm, undefined],
    [cmd_dialogue, 4, "He invaded our sanctuary and slaughtered countless brothers and sisters of mine.\nHe got what he deserved.\nAnd now, you shall meet his fate."]
    );

if (_fallenLight + _fallenDark == 0)
{
ds_list_add(_list,
    [cmd_dialogue, 3, "That last part sounded completely insincere."],
    [cmd_dialogue, 0, "I don't even know why I said it..."],
    [cmd_camera, "upper"],
    [cmd_bgm, bgm_voidgod_talk],
    [cmd_dialogue, 0, "...but I have an idea who is responsible for that."],
    [cmd_dialogue, 7, "My, my, I have been found out. What a trouble indeed...\nAnd I made all that effort to blend in..."],
    [cmd_dialogue, 0, "Completely insincere!"],
    );
}
else if (_fallenLight + _fallenDark < 20)
{
ds_list_add(_list,
    [cmd_dialogue, 3, "...was it really you speaking?"],
    [cmd_dialogue, 0, "I don't think it was?"],
    [cmd_camera, "upper"],
    [cmd_bgm, bgm_voidgod_talk],
    [cmd_dialogue, 0, "...just who you are?"],
    [cmd_dialogue, 7, "My, my, I have been found out. What a trouble indeed...\nAnd I made all that effort to blend in..."]
    );
}
else
{
ds_list_add(_list,
    [cmd_dialogue, 3, "...I expected nothing less."],
    [cmd_dialogue, 0, "...wait, what was that just now?"],
    [cmd_camera, "upper"],
    [cmd_bgm, bgm_voidgod_talk],
    [cmd_dialogue, 0, "...just who you are?"],
    [cmd_dialogue, 7, "My, my, I have been found out. What a trouble indeed...\nAnd I made all that effort to blend in..."]
    );
}

ds_list_add(_list,
    [cmd_dialogue, 0, "So you are the one who tainted my... no, our minds with the hatred of light.\nThat's why my kin turned on me when I picked up this blade."],
    [cmd_dialogue, 7, "Indeed it is I, the Void God, but make no mistake.\nThis is nothing but a fraction of my achievements."],
    [cmd_dialogue, 7, "Throughout ages, I spread doubt among your people,\nremoving a foundation to rest their views upon.\nAt first, I fed these thoughts directly, but soon afterwards they carried on without me."],
    [cmd_dialogue, 7, "And now, after all these centuries, I am becoming the foundation they seek.\nNo word will matter but mine."],
    [cmd_dialogue, 0, "...! So that's why the people of light-"],
    [cmd_dialogue, 7, "They are an eyesore, aren't they?\nWith their certainty and self-righteousness they won't listen at all."],
    [cmd_dialogue, 7, "They think they got all the answers, and won't even consider the possibility of mistake.\nSurely, you wouldn't side with arrogants like these?"],
    [cmd_dialogue, 0, "You have no say in that."],
    [cmd_dialogue, 7, "Hmph."],
    [cmd_eventUser, obj_voidGodScene, 0],
    [cmd_dialogue, 0, "..."],
    [cmd_bgm, bgm_venera_talk],
    [cmd_dialogue, 3, "...I was wrong."],
    [cmd_dialogue, 0, "You were."],
    [cmd_dialogue, 3, "Venera: What we saw was an invasion of worthless barbarians.\nWe didn't even consider that a deeper scheme was at play.\nBecause of that, we-"],
    [cmd_dialogue, 0, "The war isn't over yet.\nThe Void God's influence is still present."],
    [cmd_eventUser, obj_veneraScene, 1],
    [cmd_dialogue, 2, "I will notify headquarters about what we have found out.\nHopefully, the command won't insist on continuing assault.\nWith Sanctum gone, it would be a suicide, anyway."],
    [cmd_dialogue, 2, "Furthermore, we need to put an end to the Void God's reign.\nThough with our armies weakened, can we stand a chance against a god...?"],
    [cmd_dialogue, 0, "I will do it myself if I have to.\nIt seems the Void God's influence isn't as strong as he would like to think."],
    [cmd_dialogue, 0, "He already made a mistake by driving us to destroy any form of light.\nMy initial instinct was to grab and break this sword.\nBut as soon as I picked it up, I broke free from the Void God's influence altogether."],
    [cmd_dialogue, 0, "His pride will be his downfall."],
    [cmd_dialogue, 2, "I understand what you are saying, but it's still reckless.\nYour feats are impressive, but even you cannot make it alone."],
    [cmd_dialogue, 2, "Moreover, he still might put you under his control if you are close enough.\nJust now, he made you speak words that weren't your own."],
    [cmd_dialogue, 2, "Still, the time doesn't work in our favor.\nThe longer we drag this on, the more people will die.\nAt this rate, armies of light will soon be overrun."],
    [cmd_dialogue, 2, "Please let me join you.\nTogether, we stand a greater chance that either of us alone."],
    [cmd_dialogue, 0, "Very well. Let's go."],
    [cmd_dialogue, 8, "Now you can charge your attack even further to use Venera's attack!\nShe performs a powerful strike from above and heals 1 point of health.\nYou still won't defeat Void God on the first try..."],
    [cmd_eventUser, obj_playerScene, 1]
    );

commands_launch(array_create_from_ds_list(_list));