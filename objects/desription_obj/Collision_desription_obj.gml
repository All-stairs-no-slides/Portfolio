/// @description Insert description here
// You can write your code in this editor
show_debug_message("hoi" + string(y))
if(visible && !other.moving){
	moving = true
	show_debug_message("in")
	y =  other.y + ((string_width(node.description)/50) * 15) + 15
}