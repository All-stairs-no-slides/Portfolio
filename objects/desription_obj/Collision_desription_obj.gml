/// @description Insert description here
// You can write your code in this editor
if(visible && other.visible && !other.moving && !wall_col){
	moving = true
	//show_debug_message(node.titdle)
	var _xdist = abs(x - other.x)
	var _ydist = abs(y - other.y)
	if(_ydist < _xdist)
	{
		// for if we change the position on the y axis
		if(y > other.y){
			y = other.y + string_height_ext(other.node.description, 15, 150) + 125
			//show_debug_message("decrement");
		} else {
			y = other.y - (string_height_ext(node.description, 15, 150) + 125)
			//show_debug_message("increment")
		}
	} else {
		// for changing the position on the x scale
		if(x > other.x){
			x = other.x + 300
			//show_debug_message("decrement");
		} else {
			x = other.x - 300
			//show_debug_message("increment")
		}
	}
	wall_col = false
}