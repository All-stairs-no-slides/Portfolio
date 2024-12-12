show_description = false
original_pos = false

instance_create_depth(x, y, depth, desription_obj, 
{
	node: self.id
})

direction = random(360)
speed = 6

// variable setup for the more details state
// the speedof the lines that come out from the more detailse
line_speed = 3

// lengths of every drawn line for the more details
line_lengths = array_create(1 + array_length(more_details), 0)

// intersections along the main line for where a horisontal lines y position is
y_inters = []
for(var _i = 1; _i < array_length(more_details) + 1; _i++)
{
	draw_set_font(description_fnt)
	y_inters[_i] = string_height_ext(more_details[_i - 1], 15, 100) + 5
	y_inters[0] += y_inters[_i] / 2
	show_debug_message(string(y_inters[0]))
}
// go through the array from the second (the 1th) element till the last element and replace each one with a sum of itself and its prior elements
var _increment = 0
for(var _i = 1; _i < array_length(y_inters); _i++)
{
	_increment += y_inters[_i]
	y_inters[_i] = _increment
}

