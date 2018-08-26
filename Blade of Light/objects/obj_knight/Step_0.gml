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
	hsp = lengthdir_x(walksp,walkAngle)
	vsp = lengthdir_y(walksp,walkAngle)
	sprite_index = spr_knightWalk;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	
	if point_distance(x,y,target.x,target.y) < 600 and canAttack = 1
		{
		if irandom(1) = 1 {		
			state = "attack2_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_knightJump;
			image_index = 0;
			}
		else
			{
			state = "attack1_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_knightSlash;
			image_index = 0;
			dir3 = -100
			}
		}
	}
	
if state = "attack1_phase1"	
	{
	walkAngle = point_direction(x,y,target.x,target.y)
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	if image_index >= 9 and image_index < 10
		{
		state = "attack1_phase2"
		hsp = lengthdir_x(15,walkAngle)
		vsp = lengthdir_y(15,walkAngle)
		sfx_play(explosion)
		repeat(5)
		{
		inst = instance_create_depth(x,y,depth,obj_knightExplodeSpawner1)
		with inst	
			{
			alarm[1] = 30;
			alarm[0] = 3;
			parent = other
			direction = parent.walkAngle + parent.dir3
			speed = 20;
			}
		dir3 += 40
		}
		inst = instance_create_depth(x,y,depth,obj_damage)
		with inst	
			{
			parent = other
			image_xscale = 1.5;
			image_yscale = 1.5;
			alarm[0] = 10;
			xpl = 20*-parent.image_xscale
			ypl = -20
			}
		
		}
	}

if state = "attack1_phase2"
	{
	hsp = lerp(hsp,0,0.2)
	vsp = lerp(vsp,0,0.2)
	}
	
if state = "attack2_phase1"	
	{
	if image_index >= 3 and image_index < 4
		{
		sfx_play(enemydash)
		walkAngle = point_direction(x,y,target.x,target.y)
		if target.x > x then drawWidth = -1
		if target.x < x then drawWidth = 1
		state = "attack2_phase2"
		hsp = lengthdir_x(15,walkAngle)
		vsp = lengthdir_y(15,walkAngle)
		dir2 = 0;
		}
	}

if state = "attack2_phase2"	
	{
	if image_index >= 6 and image_index < 7
		{
		hsp = 0;
		vsp = 0;
		state = "attack2_phase3"
		sfx_play(explosion)
		repeat(12)
			{
			inst = instance_create_depth(x,y,depth,obj_knightExplodeSpawner2)
			with inst	
			{
			alarm[1] = 7;
			alarm[0] = 1;
			parent = other
			direction = parent.dir2
			speed = 50;
			}
			dir2 += 30;
			}
		}
	}
	
if hp <= 0 then
	{
	sfx_play(enemydie)
	inst = instance_create_depth(x,y,depth,obj_knightCorpse)
	with inst
		{
		direction = random(360)
		speed = 20;
		}
	instance_destroy();	
	}	
	
// Visuals



depth = -bbox_bottom