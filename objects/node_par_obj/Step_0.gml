// movement and collision logic

// create list for collission objects
var _list = ds_list_create();

// get nearbye collission objecrts and store them in _list
var _forces = collision_circle_list(x, y, 50, collider_parent_obj, false, true, _list, false)

var _player = collision_circle(x, y, 128, player_obj, false, true)

var _sum_force_dir = 0

var _sum_force_spds = 0

var _inc = false


// switch selected node from this one on keypress
if(main.selected_node == id && !firstframe){
	var _key_press = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if(_key_press != 0 && !main.more_details)
	{
		var _min_dist = infinity
		var _current_id = false;
		var _max_dist = -1;
		var _opened_nodes = []
		for (var _i = 0; _i < instance_number(node_par_obj); _i++;)
		{
			// dont check this instance
			if(instance_find(node_par_obj,_i).id == id)
			{
				continue;
			}
			// add all nearby objects to the array
			if(instance_find(node_par_obj,_i).show_description){
				_opened_nodes[array_length(_opened_nodes)] = instance_find(node_par_obj,_i).id
			}
		}
		for(var _i = 0; _i < array_length(_opened_nodes); _i++)
		{
			var _other_dir = point_direction(x, y, _opened_nodes[_i].x, _opened_nodes[_i].y)
			if(_key_press == 1 && (_other_dir < 90 || _other_dir > 270))
			{
				// right keypress
				// regular case where node is to the right of any other node
				_max_dist = false
				if(abs(x - _opened_nodes[_i].x) < _min_dist)
				{
					_min_dist = abs(x - _opened_nodes[_i].x)
					_current_id = _opened_nodes[_i].id
				}
			} else if(_key_press == -1 && (_other_dir > 90 || _other_dir < 270))
			{
				// left keypress
				// regular case where node is to the right of any other node
				_max_dist = false
				if(abs(x - _opened_nodes[_i].x) < _min_dist)
				{
					_min_dist = abs(x - _opened_nodes[_i].x)
					_current_id = _opened_nodes[_i].id
				}
			} else if(_max_dist != false){
				// case where its the furthest node (at this point which direction the node is in doesnt matter
				if(abs(x - _opened_nodes[_i].x) > _max_dist)
				{
					_max_dist = abs(x - _opened_nodes[_i].x)
					_current_id = _opened_nodes[_i].id
				}
			}
		}
		// do the finalising changes only  if an adequate result has been found (otherwise keep the current selected node))
		if(_current_id){
			selected = false
			main.selected_node = _current_id
			_current_id.selected = true
			_current_id.firstframe = true
		}
	}
}
firstframe = false
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
	// this will get in the way of the more detailed view if it is still showing
	if(!main.more_details){
		show_description = true
	}
	
	// first come first serve methodology
	if(main.selected_node == false && show_description){
		main.selected_node = id;
		selected = true
	}
	// activate more details page
	if(main.selected_node == id && keyboard_check_pressed(ord("E")) && main.more_details == false){
		main.more_details = true
	}
	
	if(main.selected_node == id && keyboard_check_pressed(vk_escape) && main.more_details == true){
		main.more_details = false
		
	}
} else if(!main.more_details && selected)
{
	selected = false	
	main.selected_node = false
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

// animate movement for all nodes when more detyails is entered.
if(main.more_details){
	if(!selected && original_pos == false){
		// for nodes that arent the selected one
		direction = point_direction(room_width/2, room_height/2, x, y)
		speed = 15
	} else if(selected)
	{
		// use euclidean dist to snap too side
		if(sqrt(sqr(abs(x - (player_inst.x))) + sqr(abs(y - (player_inst.y)))) < 10)
		{
			x = player_inst.x
			y = player_inst.y
			
			speed = 0
		} else {
			// the selected nodew will go towards and attach to the left side of the screen
			direction = point_direction(x, y, player_inst.x, player_inst.y)
			speed = 5
		}
	}
	if(original_pos == false){
		// set an origin point so that when esc is presseds it can return
		original_pos = [x, y]
	}
}
// return to the original position one the more details windo is closed
if(!main.more_details && original_pos != false)
{
	
	direction = point_direction(x, y, original_pos[0], original_pos[1])
	speed = 5

	// once the original pos is reached stop entering this state
	if(abs(x - original_pos[0]) + abs(y - original_pos[1]) < 8)
	{
		original_pos = false
	}
}