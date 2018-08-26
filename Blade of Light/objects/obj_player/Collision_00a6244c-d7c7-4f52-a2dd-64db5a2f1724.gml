if invul = 0
	{
	hp -= 1;
	hurtAngle = point_direction(other.x,other.y,x,y)
	hsp = lengthdir_x(10,hurtAngle)
	vsp = lengthdir_y(10,hurtAngle)
	invul = 1;
	alarm[1] = 10;
	knockback = 1;
	sfx_play(playerhit)
	}
	
