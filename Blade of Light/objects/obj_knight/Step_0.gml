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
	if !collision_line(x,y,target.x,target.y,obj_wall,false,true)	
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
	
	if point_distance(x,y,target.x,target.y) < 500 and canAttack = 1
		{
		state = "attack1_phase1"
		hsp = 0;
		vsp = 0;
		sprite_index = spr_knightSlash;
		image_index = 0;
		
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
		repeat(5)
		{
		inst = instance_create_depth(x,y,depth,obj_knightExplodeSpawner1)
		with inst	
			{
			alarm[1] = 50;
			alarm[0] = 3;
			parent = other
			direction = parent.walkAngle + random_range(-90,90)
			speed = 10;
			}
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

	
// Visuals



depth = -bbox_bottom