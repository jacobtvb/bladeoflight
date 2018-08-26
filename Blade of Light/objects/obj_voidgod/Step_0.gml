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
	sprite_index = spr_vgIdle;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	
	if point_distance(x,y,target.x,target.y) < 600 and canAttack = 1
		{
		state = "attack1_phase1"
		hsp = 0;
		vsp = 0;
		sprite_index = spr_vgFire;
		image_index = 0;
		
		}
	}

if state = "tpOut"	
	{
	if image_index >= 5 and image_index < 6
		{
		state = "tpIn"
		sprite_index = spr_vgTpIn
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

if hp <= 0 then
	{
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
	//instance_create_depth(x,y,depth,obj_weaklingSplat)
	instance_destroy();	
	}

depth = -bbox_bottom