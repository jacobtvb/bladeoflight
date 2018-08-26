if instance_exists(obj_player) and state = "wait"
	{
	if point_distance(x,y,obj_player.x,obj_player.y) < 400	
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
	}
	
if state = "phase1"
	{
	if !instance_exists(obj_weakling)
		{
		state = "phase2"
		repeat(3) instance_create_depth(x+random_range(-300,300),y+random_range(-300,300),depth,obj_charger)	
		}
	}
	

	
if state = "phase2"
	{
	if !instance_exists(obj_charger)
		{
		state = "phase3"
		repeat(3) instance_create_depth(x+random_range(-300,300),y+random_range(-300,300),depth,obj_mage)		
		}
	}
	
if state = "phase3"
	{
	if !instance_exists(obj_mage)
		{
		state = "phase4"
		instance_create_depth(x,y,depth,obj_knight)	
			
		}
	}

if state = "phase4"
	{
if !instance_exists(obj_knight)
		{
		state = "won"
		with obj_arenaWall instance_destroy();
		}		
	}