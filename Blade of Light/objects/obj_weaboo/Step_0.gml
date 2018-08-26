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
	sprite_index = spr_weabooRun;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	
	if point_distance(x,y,target.x,target.y) < 400 and canAttack = 1
		{
		state = "attack1_phase1"
		hsp = 0;
		vsp = 0;
		sprite_index = spr_weabooJump;
		image_index = 0;
		}
	}
	
if state = "attack1_phase1"	
	{
	if image_index >= 10 and image_index < 11
		{
		image_index = 0;
		sprite_index = spr_weabooDash;
		drawAngle = point_direction(x,y,target.x,target.y)
		walkAngle = point_direction(x,y,target.x,target.y)
		drawWidth = -1;
		state = "attack1_phase2"
		hsp = lengthdir_x(20,walkAngle)
		vsp = lengthdir_y(20,walkAngle)
		inst = instance_create_depth(x,y,depth,obj_damage)
		with inst	
			{
			parent = other
			image_xscale = 1.5;
			image_yscale = 1.5;
			alarm[0] = 30;
			xpl = 20*-parent.image_xscale
			ypl = -20
			}
		}
	}

if state = "attack1_phase2"
	{
	if image_index >= 7 and image_index < 8
		{
		state = "attack1_phase3"
		sprite_index = spr_weabooLand;
		drawAngle = 0;
		image_index = 0;
		}
	}


if state = "attack1_phase3"
	{
	hsp = lerp(hsp,0,0.2)
	vsp = lerp(vsp,0,0.2)
	}
	
// Die

if hp <= 0 then
	{
	inst = instance_create_depth(x,y,depth,obj_weabooCorpse)
	with inst
		{
		direction = random(360)
		speed = 6;
		}
	instance_destroy();	
	}
	
	
	
// Visuals



depth = -bbox_bottom