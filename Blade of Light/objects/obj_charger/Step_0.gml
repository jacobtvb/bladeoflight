// Horizontal Collisions

if (place_meeting(x+hsp,y,obj_wall))
	{
	while (!place_meeting(x+sign(hsp),y,obj_wall))	
		{
		x = x + sign(hsp);
		}
	hsp = 0;
	if state = "attack1_phase2"
		{
		alarm[0] = 1;
		}
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
	if state = "attack1_phase2"
		{
		alarm[0] = 1;
		}
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
	sprite_index = spr_chargerWalk;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	
	if point_distance(x,y,target.x,target.y) < 300 and canAttack = 1 and !collision_line(x,y,target.x,target.y,obj_wall,false,true)
		{
		state = "attack1_phase1"
		hsp = 0;
		vsp = 0;
		sprite_index = spr_chargerRunIn;
		image_index = 0;
		
		}
	}
	
if state = "attack1_phase1"	
	{
	if image_index >= 6 and image_index < 7
		{
		sprite_index = spr_chargerRun
		state = "attack1_phase2"
		thsp = hsp;
		tvsp = vsp;
	
		alarm[0] = 70;
		}
	}

if state = "attack1_phase2"
	{
	if hsp > 0 then drawWidth = -1;
	if hsp < 0 then drawWidth = 1;
	walkAngle = point_direction(x,y,target.x,target.y)
	thsp += cos(pi/180*walkAngle);
	tvsp -= sin(pi/180*walkAngle);
	dir = point_direction(x,y,x+thsp,y+tvsp)
	hsp = lengthdir_x(10,dir)
	vsp = lengthdir_y(10,dir)
	inst = instance_create_depth(x,y,depth,obj_damage)
	with inst	
			{
			parent = other
			image_xscale = 1.3;
			image_yscale = 1.3;
			alarm[0] = 1;
			ypl = -40
			}
	}
	
if state = "attack1_phase3"
	{
	if image_index >= 3 and image_index < 4
		{
		state = "pursue" 
		}
	}
	
// Visuals



depth = -bbox_bottom