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
	sprite_index = spr_veneraIdle;
	if target.x > x then drawWidth = -1
	if target.x < x then drawWidth = 1
	if point_distance(x,y,target.x,target.y) < 200 and canAttack != 1
		{	
			sfx_play(enemydash)
			state = "dodge_phase1"	
			sprite_index = spr_veneraDodge;
			image_index = 0;	
		}
	if point_distance(x,y,target.x,target.y) < 400 and canAttack = 1
		{
		if irandom(2) = 1 then
			{
			state = "attack2_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_veneraSlash;
			image_index = 0;
			
			}
		else if irandom(1) = 1 then
			{
			state = "attack1_phase1"
			hsp = 0;
			vsp = 0;
			sprite_index = spr_veneraStabIn;
			image_index = 0;
			}
		else if phase = 2
			{
			state = "AoE_phase1"	
			sprite_index = spr_veneraAoE;
			image_index = 0;
			hsp = 0;
			vsp = 0;
			}
		}
	}

if state = "AoE_phase3"	
	{
	x = obj_player.x
	y = obj_player.y
	state = "AoE_phase4"	
	instance_create_layer(x,y,"Ground",obj_veneraAoE)
	}

if state = "AoE_phase4"
	{
	if image_index >= 8 and image_index < 9
		{
		sfx_play(explosion)
		with obj_veneraAoE sprite_index = spr_veneraAoEboom	
		with obj_veneraAoE image_index = 0;
		with obj_veneraAoE image_speed = 1;
		state = "AoE_phase5"
		}
	}

if state = "dodge_phase1"
	{
	walkAngle = point_direction(target.x,target.y,x,y) + choose(-90,0,90)
	hsp = lengthdir_x(15,walkAngle)
	vsp = lengthdir_y(15,walkAngle)
	state = "dodge_phase2"
	}

if state = "dodge_phase2"
	{
	if image_index >= 3 and image_index < 4
		{
		sprite_index = spr_veneraDodgeLand	
		image_index = 0;
		state = "dodge_phase3"
		}
	}

if state = "dodge_phase3"
	{
	hsp = lerp(hsp,0,0.1)
	vsp = lerp(vsp,0,0.1)
	}
	
if state = "dodgeTran_phase1"
	{
	walkAngle = point_direction(target.x,target.y,x,y) + choose(-90,0,90)
	hsp = lengthdir_x(25,walkAngle)
	vsp = lengthdir_y(25,walkAngle)
	state = "dodgeTran_phase2"
	}

if state = "dodgeTran_phase2"
	{
	if image_index >= 3 and image_index < 4
		{
		sprite_index = spr_veneraDodgeLand	
		image_index = 0;
		state = "dodgeTran_phase3"
		}
	}

if state = "dodgeTran_phase3"
	{
	hsp = lerp(hsp,0,0.1)
	vsp = lerp(vsp,0,0.1)
	}

if state = "attack2_phase1"	
	{
	if image_index >= 5 and image_index < 6
		{
		sfx_play(swing)
		state = "attack2_phase2"
		hsp = lengthdir_x(55,walkAngle)
		vsp = lengthdir_y(55,walkAngle)
		inst = instance_create_depth(x,y,depth,obj_damage)
		with inst	
			{
			parent = other
			image_xscale = 2.5;
			image_yscale = 2.5;
			alarm[0] = 10;
			xpl = 50*-parent.image_xscale
			ypl = -50
			}
		}
	}

if state = "attack2_phase2"
	{
	hsp = lerp(hsp,0,0.1)
	vsp = lerp(vsp,0,0.1)
	if image_index >= 8 and image_index < 9
		{
		walkAngle = point_direction(x,y,target.x,target.y)
		if target.x > x then drawWidth = -1
		if target.x < x then drawWidth = 1
		hsp = 0;
		vsp = 0;
		state = "attack2_phase3"
		}
	}
	
if state = "attack2_phase3"
	{
	if image_index >= 13 and image_index < 14
		{
		sfx_play(swing)
		state = "attack2_phase4"
		hsp = lengthdir_x(55,walkAngle)
		vsp = lengthdir_y(55,walkAngle)
		inst = instance_create_depth(x,y,depth,obj_damage)
		with inst	
			{
			parent = other
			image_xscale = 2.5;
			image_yscale = 2.5;
			alarm[0] = 10;
			xpl = 50*-parent.image_xscale
			ypl = -50
			}
		}
	}
	
if state = "attack2_phase4"
	{
	hsp = lerp(hsp,0,0.1)
	vsp = lerp(vsp,0,0.1)
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
		hsp = lengthdir_x(30,walkAngle)
		vsp = lengthdir_y(30,walkAngle)
		sfx_play(enemydash)
		inst = instance_create_depth(x,y,depth,obj_damage)
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
	
// Phase Tran

if hp <= 15 and phase = 1 then
	{
	sfx_play(enemydash)
	state = "dodgeTran_phase1"	
	sprite_index = spr_veneraDodge;
	image_index = 0;
	attackDel = 0;
	walksp = 7;
	image_speed = 1;
	phase = 2;
	}
	
	
	
// Visuals

if hp <= 0 then
	{
	inst = instance_create_depth(x,y,depth,obj_veneraDefeat)
	with inst
		{
		direction = random(360)
		speed = 10;
		}
	with obj_veneraAoE instance_destroy();
	instance_destroy();	
	sfx_play(explosion)
	}	

depth = -bbox_bottom