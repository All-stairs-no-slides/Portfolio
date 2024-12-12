draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, shade, 1)
draw_text(x - (string_width(title)/2), y + 32, title)

if(main.more_details && selected == true){
	// if the main line is less than the max length then keep animating it, else draw it at max length and also draw the text
	if(line_lengths[0] + line_speed < y_inters[0]){ 
		line_lengths[0] += line_speed
		draw_line_width_color(x, y + line_lengths[0], x, y - line_lengths[0], 3, shade, shade)
	} else {
		draw_line_width_color(x, y + y_inters[0], x, y - y_inters[0], 3, shade, shade)
		draw_set_font(description_fnt)
		draw_text_ext(x - 105, y - y_inters[0], more_details[0], 15, 100) 
	}
	// set font before the loop
	draw_set_font(description_fnt)
	// seperate seperating lines
	for(var _i = 1; _i < array_length(y_inters); _i++){
		
		if(line_lengths[_i] - line_speed > -100){ 
			line_lengths[_i] -= line_speed
			draw_line_width_color(x + line_lengths[_i], (y - y_inters[0]) + y_inters[_i], x, (y - y_inters[0]) + y_inters[_i], 3, shade, shade)
		} else {
			show_debug_message(y_inters[_i])
			draw_line_width_color(x - 100, (y - y_inters[0]) + y_inters[_i], x, (y - y_inters[0]) + y_inters[_i], 3, shade, shade)
			if(_i == array_length(y_inters) - 1)
			{
				break;
			}
			
			draw_text_ext(x - 105, (y - y_inters[0]) + y_inters[_i], more_details[_i], 15, 100) 
		}
		
	}
	
}



