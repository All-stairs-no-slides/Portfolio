var _x_mov = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
var _y_mov = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 



if(_x_mov != 0 && abs(x_falloff) < 10)
{
	x_falloff += (_x_mov) * 0.1
} else if (abs(x_falloff) > 0)
{
	x_falloff -= (xspeed/abs(xspeed)) * 0.1
}

if(_y_mov != 0 && abs(y_falloff) < 10)
{
	y_falloff += (_y_mov) * 0.1
} else if (abs(y_falloff) > 0)
{
	y_falloff -= (yspeed/abs(yspeed)) * 0.1
}


xspeed = _x_mov + x_falloff
yspeed = _y_mov + y_falloff


move_and_collide(xspeed, yspeed, wall_obj)







