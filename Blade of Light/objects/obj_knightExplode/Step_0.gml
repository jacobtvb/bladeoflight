if image_index > 6 and image_index < 7
	{
	inst = instance_create_depth(x,y,depth,obj_damage)
		with inst	
			{
			parent = other
			image_xscale = 1;
			image_yscale = 1;
			alarm[0] = 10;
			ypl = -30
			}	
	}
	
depth = -bbox_bottom