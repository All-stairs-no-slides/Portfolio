// movement and collision logic

// create list for collission objects
var _list = ds_list_create();

// get nearbye collission objecrts and store them in _list
var _forces = collision_circle_list(x, y, 50, collider_parent_obj, false, true, _list, false)

var _player = collision_circle(x, y, 128, player_obj, false, true)

var _sum_force_dir = 0

var _sum_force_spds = 0

var _inc = false


// calculation of all forces from neaby insances
if(_forces > 0)
{
	
	for(var _i = 0; _i < (_forces); _i++)
	{
		if(_player != noone && _list[| _i].id == _player.id)
		{
			continue;
		}
		_inc = true
		//show_debug_message( (1 - sqrt(sqr(x - _list[| _i].x) + sqr(y - _list[| _i].y)) / 100))
		//show_debug_message(point_direction(_list[| _i].x, _list[| _i].y, x, y))
		//show_debug_message("final: " + string(point_direction(_list[| _i].x, _list[| _i].y, x, y) * (1 - sqrt(sqr(x - _list[| _i].x) + sqr(y - _list[| _i].y)) / 100)))
		_sum_force_dir += (point_direction(_list[| _i].x, _list[| _i].y, x, y) * ((1 - sqrt(sqr(x - _list[| _i].x) + sqr(y - _list[| _i].y))) / 100)) * 3
	}
	
}

show_description = false
if(_player != noone)
{
	if(sqrt(((x - _player.x) * (x - _player.x)) + ((y - _player.y) * (y - _player.y))) > 90)
	{
		_inc = true
		_sum_force_dir +=  point_direction(x, y, _player.x, _player.y) 
	}
	// this will get in the wway of the more detailed view if it is still showing
	if(!main.more_details){
		show_description = true
	}
	// first come first serve methodology
	if(main.selected_node == false){
		main.selected_node = id;
		selected = true
	}
	// activate more details page
	if(main.selected_node == id && keyboard_check_pressed(ord("E")) && main.more_details == false){
		main.more_details = true
		line_speed = 3
	}
}
// falloff & buildup
if((speed < 2) && _inc)
{
	direction = (_sum_force_dir)/((_forces * 3) + (_player != noone))
	speed += 0.25 * ((_forces * 3) +  (_player != noone))
} 
if (speed > 0)
{
	speed -= min(0.08, speed)
}


ds_list_destroy(_list)

// wall collission
if(x >= room_width)
{
	x = room_width - 1
}

if(x <= 0)
{
	x =  1
}

if(y >= room_height)
{
	y = room_height - 1
}

if(y <= 0)
{
	y =  1
}

// entering more details mode when the details arent aboout this node
if(main.more_details && !selected && original_pos == false){
	direction = point_direction(room_width/2, room_height/2, x, y)
	speed = 15
	// where the node was before it was flung to the edges so that it can return oce more details mode is exited
	original_pos = [x, y]
}