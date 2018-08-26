if state = "attack1_phase2"
	{
	state = choose("pursue","tpOutCombo1")
	canAttack = 0;
	alarm[0] = random_range(10,attackDel)
	}
	
if state = "scytheThrow_phase2"
	{
	state = choose("pursue","tpOut1")
	canAttack = 0;
	alarm[0] = random_range(10,attackDel)
	}
	
if state = "AoE_phase2" 
	{
	state = choose("pursue","tpOutCombo1")
	canAttack = 0;
	alarm[0] = random_range(100,150)
	}
	