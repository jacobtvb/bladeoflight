if state = "phase1"
	{
        show_debug_message(instance_number(obj_weakling));
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
		cmd_freeArena();
		}		
	}