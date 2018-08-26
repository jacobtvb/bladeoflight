switch (side)
{
    case "right":
        navigation_set(target_room, edge, 128, obj_player.y - y);
        break;
    case "up":
        navigation_set(target_room, edge, obj_player.x - x, -128);
        break;
    case "left":
        navigation_set(target_room, edge, -128, obj_player.y - y);
        break;
    case "down":
        navigation_set(target_room, edge, obj_player.x - x, 128);
        break;
}
navigation_do();

/*
with other	
	{
	x = other.nextX;
	y = other.nextY;
	}
room_goto(nextRm)
*/
