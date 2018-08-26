if state = "attack1_phase3"
	{
	if combo < 2 and phase = 2
		{
		state = "attack1_phase1" 
		canAttack = 1;
		combo += 1;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_veneraStabIn;
		image_index = 3;
		}
	else
		{
		combo = 0;	
		state = "pursue" 
		canAttack = 0;
		alarm[0] = random_range(10,50 + attackDel)
		}
	
	}
	
if state = "attack2_phase4"
	{
	state = "pursue" 
	canAttack = 0;
	alarm[0] = random_range(10,25 + attackDel) 
	}
	
if state = "dodge_phase3"
	{
	state = "pursue" 
	canAttack = 0;
	alarm[0] = 1
	}
	
if state = "dodgeTran_phase3"
	{
	state = "AoE_phase1"	
	sprite_index = spr_veneraAoE;
	image_index = 0;
	hsp = 0;
	vsp = 0;
	}
	
if state = "AoE_phase1"
	{
	image_index = 8
	alarm[2] = 20;
	image_speed = 0;
	state = "AoE_phase2"
	}

if state = "AoE_phase5"
	{
	state = "pursue" 
	canAttack = 0;
	alarm[0] = random_range(10,75)
	}