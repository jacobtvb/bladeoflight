if invul = 0
	{
	hp -= 2;
	invul = 1;
	alarm[2] = 30;
	inst = instance_create_depth(x,y-40,depth,obj_partAnim)
			with inst	
				{
				sprite_index = spr_slashHit
				image_angle = random(360)
				}
	}



/*