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

if state = "AoE_phase3"	
	{
	x = obj_player.x
	y = obj_player.y
	state = "AoE_phase4"	
	instance_create_layer(x,y,"Ground",obj_veneraAoEPlayer)
	}

if state = "AoE_phase4"
	{
	if image_index >= 6 and image_index < 7
		{
		with obj_veneraAoEPlayer sprite_index = spr_veneraAoEboom	
		with obj_veneraAoEPlayer image_index = 0;
		with obj_veneraAoEPlayer image_speed = 1;
		state = "AoE_phase5"
		}
	}

if state = "attack1_phase1"	
	{
	if image_index >= 7 and image_index < 8
		{
		image_index = 0;
		sprite_index = spr_veneraStab;
		drawAngle = point_direction(x,y,target.x,target.y)
		walkAngle = point_direction(x,y,target.x,target.y)
		drawWidth = -1;
		state = "attack1_phase2"
		hsp = lengthdir_x(50,walkAngle)
		vsp = lengthdir_y(50,walkAngle)
		inst = instance_create_depth(x,y,depth,obj_playerDamage)
		with inst	
			{
			parent = other
			image_xscale = 1.5;
			image_yscale = 1.5;
			alarm[0] = 20;
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
		sprite_index = spr_veneraStabLand;
		drawAngle = 0;
		image_index = 0;
		}
	}


if state = "attack1_phase3"
	{
	hsp = lerp(hsp,0,0.2)
	vsp = lerp(vsp,0,0.2)
	}
	

// Visuals

depth = -bbox_bottom