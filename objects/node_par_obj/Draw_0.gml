draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, shade, 1)
draw_set_font(description_fnt)
draw_text_ext(x - (string_width_ext(title, 15, 25)/2), y + 32, title, 15, 25)

if(main.more_details && selected == true){
	// if the main line is less than the max length then keep animating it, else draw it at max length and also draw the text
	if(line_lengths[0] + line_speed < y_inters[0]){ 
		line_lengths[0] += line_speed
		draw_line_width_color(x, y + line_lengths[0], x, y - line_lengths[0], 3, shade, shade)
	} else {
		draw_line_width_color(x, y + y_inters[0], x, y - y_inters[0], 3, shade, shade)
		draw_set_font(description_fnt)
		draw_text_ext(x - 200, y - y_inters[0] + 3, more_details[0], 15, 150) 
		draw_set_font(More_details_title_fnt)
		draw_text_ext(x - (230 + string_width(details_titles[0])), y - y_inters[0] + 3, details_titles[0], 15, 150) 
		
	}
	// seperate seperating lines
	for(var _i = 1; _i < array_length(y_inters); _i++){
		
		if(line_lengths[_i] - line_speed > -100){
			line_lengths[_i] -= line_speed
			draw_line_width_color(x + line_lengths[_i], (y - y_inters[0]) + y_inters[_i], x, (y - y_inters[0]) + y_inters[_i], 3, shade, shade)
		} else {
			draw_line_width_color(x - 200, (y - y_inters[0]) + y_inters[_i], x, (y - y_inters[0]) + y_inters[_i], 3, shade, shade)
			if(_i == array_length(y_inters) - 1)
			{
				break;
			}
			draw_set_font(description_fnt)
			draw_text_ext(x - 200, (y - y_inters[0]) + y_inters[_i] + 3, more_details[_i], 15, 150) 
			draw_set_font(More_details_title_fnt)
			draw_text_ext(x - (230 + string_width(details_titles[_i])), (y - y_inters[0]) + y_inters[_i] + 3, details_titles[_i], 15, 150) 
		}
		
	}
	
} else if (line_lengths[0] > 0)
{
	// the above if statement m is due to the fact that the main line should always be the longest
	for(var _i = 0; _i < array_length(line_lengths); _i++)
	{
		// exit case for each line
		if(line_lengths[_i] - line_speed > 0){
			line_lengths[_i] -= line_speed
			// early exit iter case due to the first line having a different x pos
			if(_i == 0){
				draw_line_width_color(x, y + line_lengths[0], x, y - line_lengths[0], 3, shade, shade)		
				continue;
			}
			
			draw_line_width_color(x + line_lengths[_i], (y - y_inters[0]) + y_inters[_i], x, (y - y_inters[0]) + y_inters[_i], 3, shade, shade)
		} else {
			line_lengths[_i] = 0
		}
	}
}



