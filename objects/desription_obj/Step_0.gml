if(node.show_description)
{
	visible = true
	if(!vis_pos)
	{
		//show_debug_message("hoi hoi hoi")
		var _xdisplacement = 0
		var _ydisplacement = 0
		if(node.x > room_width/2){
			_xdisplacement = -132
		} else {
			_xdisplacement = 132
		}
		
		if(node.y > room_height/2){
			_ydisplacement = -132
		} else {
			_ydisplacement = 132
		}
		vis_pos = true
		x = node.x + _xdisplacement
		y = node.y + _ydisplacement
	}
} else {
	vis_pos = false
	visible = false
}

