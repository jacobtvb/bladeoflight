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
	if !collision_line(x,y,target.x,target.y,obj_wall,false,true) and point_distance(x,y,target.x,target.y) < 400
		{
		state = "pursue"
		}
	}

if state = "pursue" 
	{
	if point_distance(x,y,target.x,target.y) > 500 
		{
		walkAngle = point_direction(x,y,target.x,target.y)
		hsp = lengthdir_x(walksp,walkAngle)
		vsp = lengthdir_y(walksp,walkAngle)
		}
	else
		{
		walkAngle = point_direction(target.x,target.y,x,y)
		hsp = lengthdir_x(0.3,walkAngle)
		vsp = lengthdir_y(0.3,walkAngle)
		}
	if point_distance(x,y,target.x,target.y) < 300 and !collision_line(x,y,target.x,target.y,obj_wall,false,true)
		{
		walkAngle = point_direction(target.x,target.y,x,y)
		hsp = lengthdir_x(walksp,walkAngle)
		vsp = lengthdir_y(walksp,walkAngle)
		}
	sprite_index = spr_lightMageIdle;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	
	if point_distance(x,y,target.x,target.y) < 500 and canAttack = 1 and !collision_line(x,y,target.x,target.y,obj_wall,false,true)
		{
		if target.x > x then drawWidth = -1
		if target.x < x then drawWidth = 1
		state = "attack1_phase1"
		hsp = 0;
		vsp = 0;
		sprite_index = spr_lightMageShoot;
		image_index = 0;
		
		}
	}
	
if state = "attack1_phase1"	
	{
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	if image_index >= 5 and image_index < 6
		{
		state = "attack1_phase2"
		walkAngle = point_direction(x,y,target.x,target.y)
		hsp = lengthdir_x(15,walkAngle)
		vsp = lengthdir_y(15,walkAngle)
		repeat(10)
		{
		inst = instance_create_depth(x,y-64,depth,obj_mageFireball)
		with inst	
			{
			parent = other
			direction = point_direction(x,y,parent.target.x,parent.target.y) + random_range(-10,10)
			speed = random_range(15,20);
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



depth = -bbox_bottom