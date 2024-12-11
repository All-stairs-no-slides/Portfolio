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
for(var _i = 0; _i < array_length(more_details); _i++)
{
	draw_set_font(description_fnt)
	y_inters[_i] = string_height_ext(more_details[_i], 15, 100)
	y_inters[0] += y_inters[_i]
}

