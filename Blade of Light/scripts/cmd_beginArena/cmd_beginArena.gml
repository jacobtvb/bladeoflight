with (obj_knightScene)
    instance_destroy();

with (ctrl_arenaTown)
{
 	state = "phase1"
	instance_create_depth(960,1472,depth,obj_wall)
	instance_create_depth(960+64,1472,depth,obj_wall)
	instance_create_depth(960+128,1472,depth,obj_wall)
	repeat(15)	
		{
		instance_create_depth(x+random_range(-300,300),y+random_range(-300,300),depth,obj_weakling)	
		}
}

with (ctrl_dialogue)
    event_user(0);
