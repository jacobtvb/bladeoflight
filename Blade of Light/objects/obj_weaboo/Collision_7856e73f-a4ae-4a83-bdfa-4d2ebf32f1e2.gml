if invul = 0 and other.sprite_index = spr_veneraAoEboom
	{
	hp -= 4;
	invul = 1;
	alarm[1] = 20;
	inst = instance_create_depth(x,y-40,depth,obj_partAnim)
			with inst	
				{
				sprite_index = spr_slashHit
				image_angle = random(360)
				}
	}



/*