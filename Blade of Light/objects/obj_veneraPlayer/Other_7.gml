
if state = "leave"
	{
	instance_destroy();	
	}

if state = "attack1_phase3"
	{
	state = "leave" 
	hsp = 0;
	vsp = 0;
	sprite_index = spr_veneraAoE;
	image_index = 0;
	}

if state = "AoE_phase5"
	{
	
		state = "leave" 
		hsp = 0;
		vsp = 0;
		sprite_index = spr_veneraAoE;
		image_index = 0;
		
	}
