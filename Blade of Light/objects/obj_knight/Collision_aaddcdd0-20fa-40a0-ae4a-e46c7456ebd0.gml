inst = instance_create_depth(x,y,depth,obj_knightCorpse)
with inst
	{
	direction = random(360)
	speed = 6;
	}
	

inst = instance_create_depth(x,y,depth,obj_weaklingSplat)
instance_destroy();