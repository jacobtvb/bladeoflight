if state = "attack1_phase2"
	{
	state = "pursue" 
	canAttack = 0;
	alarm[0] = random_range(1,100)
	if irandom(3) = 1 alarm[0] = 1;
	}
	
if state = "attack2_phase2"
	{
	state = "pursue" 
	canAttack = 0;
	alarm[0] = random_range(1,100)
	if irandom(3) = 1 alarm[0] = 1;
	}