// Horizontal Collisions

if (place_meeting(x+hsp,y,obj_wall))
	{
	while (!place_meeting(x+sign(hsp),y,obj_wall))	
		{
		x = x + sign(hsp);
		}
	hsp = 0;	
	}

x = x + hsp;

// Vertical Collisions

if (place_meeting(x,y+vsp,obj_wall))
	{
	while (!place_meeting(x,y+sign(vsp),obj_wall))	
		{
		y = y + sign(vsp);
		}
	vsp = 0;	
	}

y = y + vsp;

if state = "idle"
	{
	if !collision_line(x,y,target.x,target.y,obj_wall,false,true) and point_distance(x,y,target.x,target.y) < 500
		{
		state = "pursue"
		}
	}

if state = "pursue" 
	{
	walkAngle = point_direction(x,y,target.x,target.y)
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	hsp = lengthdir_x(walksp,walkAngle)
	vsp = lengthdir_y(walksp,walkAngle)
	sprite_index = spr_vgIdle;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	
	if point_distance(x,y,target.x,target.y) < 600 and canAttack = 1
		{
		if irandom(3) = 1
			{
			state = "attack1_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_vgFire;
			image_index = 0;
			sfx_play(vgcast)
			}
		else if irandom(1) = 1
			{
			state = "scytheSummon_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_vgSummon;
			image_index = 0;
			sfx_play(vgcast)
			}
		else if irandom(2) = 1 and phase = 2
			{
			state = "tpOut1Whirl"
			hsp = 0;
			vsp = 0;
			sfx_play(vgteleport)
			}
		else if irandom(2) = 1  and phase = 2
			{
			state = "tpOut1AoE"
			hsp = 0;
			vsp = 0;
			sfx_play(vgteleport)
			}
		}
	}

if state = "attack2_phase1"	
	{
	sprite_index = spr_vgSpin
	state = "attack2_phase2"
	thsp = hsp;
	tvsp = vsp;
	alarm[2] = 170;
	}
	

if state = "attack2_phase2"
	{
	sfx_play(whirl)
	if hsp > 0 then drawWidth = -1;
	if hsp < 0 then drawWidth = 1;
	walkAngle = point_direction(x,y,target.x,target.y)
	thsp += 4*cos(pi/180*walkAngle);
	tvsp -= 4*sin(pi/180*walkAngle);
	dir = point_direction(x,y,x+thsp,y+tvsp)
	hsp = lengthdir_x(15,dir)
	vsp = lengthdir_y(15,dir)
	inst = instance_create_depth(x,y,depth,obj_damage)
	with inst	
			{
			parent = other
			image_xscale = 3.3;
			image_yscale = 3.3;
			alarm[0] = 1;
			ypl = -40
			}
	}
	
if state = "attack2_phase3"
	{
	if image_index >= 3 and image_index < 4
		{
		state = "pursue" 
		}
	}



if state = "tpOut1AoE"	
	{
	sprite_index = spr_vgTpOut
	image_index = 0;
	state = "tpOutAoE"	
	}

if state = "tpOutAoE"	
	{
	if image_index >= 5 and image_index < 6
		{
		state = "tpInAoE"
		sprite_index = spr_vgTpIn
		image_index = 0;
		x = obj_player.x
		y = obj_player.y	
		}
	}
if state = "tpInAoE"	
	{
	if image_index >= 5 and image_index < 6
			{
			state = "AoE_phase1" 
			sprite_index = spr_vgCharge;
			image_index = 0;
			dir2 = 0;
			}		
	}

if state = "AoE_phase1" 
	{
	if image_index >= 3 and image_index < 4
		{
		state = "AoE_phase2" 
		sprite_index = spr_vgbeam;
		image_index = 0;
		sfx_play(explosion)
		repeat(24)
			{
			inst = instance_create_depth(x,y,depth,obj_knightExplodeSpawner2)
			with inst	
			{
			alarm[1] = 9;
			alarm[0] = 1;
			parent = other
			direction = parent.dir2
			speed = 50;
			}
			dir2 += 15;
			}
		}
	}



if state = "tpOut1"	
	{
	sfx_play(vgteleport)
	sprite_index = spr_vgTpOut
	image_index = 0;
	state = "tpOut"	
	}

if state = "tpOut"	
	{
	if image_index >= 5 and image_index < 6
		{
		state = "tpIn"
		sprite_index = spr_vgTpIn
		image_index = 0;
		x = godTpCenter.x + random_range(300,-300)
		y = godTpCenter.y + random_range(300,-300)		
		}
	}
if state = "tpIn"	
	{
	if image_index >= 5 and image_index < 6
			{
			state = "pursue" 
			canAttack = 0;
			alarm[0] = random_range(10,50)
			}	
		
	}
	
if state = "tpOut1Whirl"	
	{
	sprite_index = spr_vgTpOut
	image_index = 0;
	state = "tpOutWhirl"	
	}

if state = "tpOutWhirl"	
	{
	if image_index >= 5 and image_index < 6
		{
		state = "tpInWhirl"
		sprite_index = spr_vgTpIn
		image_index = 0;
		x = godTpCenter.x
		y = godTpCenter.y	
		}
	}
if state = "tpInWhirl"	
	{
	if image_index >= 5 and image_index < 6
			{
			state = "Whirlpool_phase1" 
			hsp = 0;
			vsp = 0;
			sprite_index = spr_vgSummon;
			image_index = 0;
			}	
		
	}

if state = "Whirlpool_phase1"
	{
	if image_index >= 6 and image_index < 7
		{
		sprite_index = spr_vgSpin
		state = "Whirlpool_phase2"
		alarm[3] = 300;
		}
	}
	
if state = "Whirlpool_phase2"
	{
	if irandom(3) = 1 then {
	inst = instance_create_depth(x,y,depth,obj_knightExplodeSpawner1)
		with inst	
			{
			alarm[1] = 60;
			alarm[0] = 3;
			parent = other
			direction = random(360)
			speed = 20;
			}
		}
	}
	
	
// Summon Scythe


if state = "scytheSummon_phase1"
	{
	if image_index >= 6 and image_index < 7
		{
		state = choose("scytheThrow_phase1","attack2_phase1")
		}
	}

if state = "scytheThrow_phase1"
	{
	sprite_index = spr_vgthrow
	image_index = 0;
	instance_create_depth(x,y,depth,obj_scytheThrown)
	state = "scytheThrow_phase2"
	}


// Attack Combo

if state = "tpOutCombo1"	
	{
	sfx_play(vgteleport)
	sprite_index = spr_vgTpOut
	image_index = 0;
	state = "tpOutCombo"	
	}

if state = "tpOutCombo"	
	{
	if image_index >= 5 and image_index < 6
		{
		state = "tpInCombo"
		sprite_index = spr_vgTpIn
		image_index = 0;
		x = godTpCenter.x + random_range(300,-300)
		y = godTpCenter.y + random_range(300,-300)	
		walkAngle = point_direction(x,y,target.x,target.y)
		if target.x > x then drawWidth = -1
		if target.x < x then drawWidth = 1
		}
	}
if state = "tpInCombo"	
	{
	if image_index >= 5 and image_index < 6
			{
			state = "attack1_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_vgFire;
			image_index = 0;
			}	
		
	}

if state = "attack1_phase1"	
	{
	if image_index >= 3 and image_index < 4
		{
		state = "attack1_phase2"
		hsp = lengthdir_x(45,walkAngle)
		vsp = lengthdir_y(45,walkAngle)
		sfx_play(enemyshoot)
		repeat(10) {
		inst = instance_create_depth(x,y-64,depth,obj_mageFireball)
		with inst	
			{
			parent = other
			direction = point_direction(x,y,parent.target.x,parent.target.y) + random_range(-10,10)
			speed = random_range(40,50);
			}
		}
		}
	}

if state = "attack1_phase2"
	{
	hsp = lerp(hsp,0,0.2)
	vsp = lerp(vsp,0,0.2)
	}

	
// Visuals

// Die

if hp <= 25 and phase = 1 then
	{
	attackDel = 50;
	walksp = 6;
	image_speed = 1;
	phase = 2;
    bgm_queue(bgm_voidgod_second);
	}

if hp <= 0 then
	{
    obj_info.info = "The evil has been defeated!";
    bgm_queue(bgm_voidgod_outro);
    instance_destroy();
	}

depth = -bbox_bottom