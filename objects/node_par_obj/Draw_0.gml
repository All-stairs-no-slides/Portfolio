draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, shade, 1)
draw_text(x - (string_width(title)/2), y + 32, title)

if(main.more_details && selected == true){
	
	// if the main line is less than the max length then keep animating it, else draw it at max length and also draw the text
	if(line_lengths[0] + line_speed < y_inters[0] / 2){ 
		show_debug_message("hihi")
		line_lengths[0] += line_speed
		draw_line_width_color(x, y + line_lengths[0], x, y - line_lengths[0], 3, shade, shade)
	} else {
		draw_line_width_color(x, y + y_inters[0] / 2, x, y - y_inters[0] / 2, 3, shade, shade)
		draw_set_font(description_fnt)
		draw_text_ext(x - 105, y - y_inters[0] / 2, more_details[0], 15, 100) 
	}
	
}



