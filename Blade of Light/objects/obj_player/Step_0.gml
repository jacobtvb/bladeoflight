/// Controls

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_dash = keyboard_check_pressed(ord("X"));

var moveHor = key_right - key_left;
if restrict = 0 and knockback = 0 then hsp = moveHor * walksp;

var moveVert = key_down - key_up;
if restrict = 0 and knockback = 0 then vsp = moveVert * walksp;

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

// Charging

if keyboard_check(ord("Z")) and canCharge = 1
	{
	charging = 1;
	walksp = walkspMax/3
	image_speed = 0.7
	
	if chargeLevel < chargeLevelMax
		{
		if chargeLevel < 1 then chargePer += 3;
		if chargeLevel < 2 then chargePer += 1;
		instance_create_depth(x+random_range(100,-100),y+random_range(100,-100),depth,part_charge_placeholder)
		
		if chargePer = 100
			{
			chargeLevel += 1;
			chargePer = 0;
			repeat(100) instance_create_depth(x,y,depth,part_burst_placeholder1)
			}
		
		if chargeLevel = 1
			{
			instance_create_depth(x,y,depth,part_burst_placeholder1)
			}
		
		}
	}

if keyboard_check_released(ord("Z"))
	{
	if chargeLevel = 1
		{
		if facing = 0 then { sprite_index = front_charge_slash; vsp = 50 }
		if facing = 1 then { sprite_index = side_charge_slash; hsp = -drawWidth }
		if facing = 2 then { sprite_index = back_charge_slash; vsp = -50 }
		attacking = 1;
		image_index = 0;
		image_speed = 2;
		knockback = 1;
		}
	if chargeLevel = 2
		{
		if hsp != 0 or vsp != 0 
			{
			if facing = 0 then { sprite_index = front_charge_whirlwind; hsp = moveHor * 30; vsp = moveVert * 30 }
			if facing = 1 then { sprite_index = side_charge_whirlwind; hsp = moveHor * 30; vsp = moveVert * 30 }
			if facing = 2 then { sprite_index = back_charge_whirlwind; hsp = moveHor * 30; vsp = moveVert * 30 }
			}
			else
			{
			if facing = 0 then { sprite_index = front_charge_whirlwind; vsp = 60 }
			if facing = 1 then { sprite_index = side_charge_whirlwind; hsp = 60 * -drawWidth }
			if facing = 2 then { sprite_index = back_charge_whirlwind; vsp = -60 }
			}
		attacking = 2;
		image_index = 0;
		image_speed = 1.5;
		knockback = 1;
		}
	}
	
if attacking = 1
	{
	vsp = lerp(vsp,0,0.5)	
	hsp = lerp(hsp,0,0.5)	
	}
	
if attacking = 2
	{
	vsp = lerp(vsp,0,0.15)	
	hsp = lerp(hsp,0,0.15)	
	}

// Player Animations

if facing = 1 then {
	if hsp > 0 then drawWidth = -1
	if hsp < 0 then drawWidth = 1
	}

if vsp > 0 then facing = 0
else if hsp > 0 or hsp < 0 then facing = 1
else if vsp < 0 then facing = 2;

if charging = 0
	{
	if hsp != 0 or vsp != 0 
			{
			if facing = 0 then sprite_index = spr_player_front_walk;
			if facing = 1 then sprite_index = spr_player_side_walk;
			if facing = 2 then sprite_index = spr_player_back_walk;	
			}
		else
			{
			if facing = 0 then sprite_index = spr_player_front_idle;
			if facing = 1 then sprite_index = spr_player_side_idle;
			if facing = 2 then sprite_index = spr_player_back_idle;	
			}
	}
	
if charging = 1 and attacking = 0
	{
	if hsp != 0 or vsp != 0 
			{
			if facing = 0 then sprite_index = front_charge_walk;
			if facing = 1 then sprite_index = side_charge_walk;
			if facing = 2 then sprite_index = back_charge_walk;	
			}
		else
			{
			if facing = 0 then sprite_index = front_charge;
			if facing = 1 then sprite_index = side_charge;
			if facing = 2 then sprite_index = back_charge;	
			}
	}
	

depth = -bbox_bottom