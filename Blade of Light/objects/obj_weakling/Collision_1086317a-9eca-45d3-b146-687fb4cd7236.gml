inst = instance_create_depth(x,y,depth,obj_weaklingCorpse)
with inst
	{
	direction = random(360)
	speed = 6;
	}
	
inst = instance_create_depth(x,y,depth,obj_weaklingSword)
with inst
	{
	direction = 220
	speed = 4;
	}
	
inst = instance_create_depth(x,y,depth,obj_weaklingSplat)
instance_destroy();