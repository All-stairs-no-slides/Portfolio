// image yscale is set in create event
draw_sprite_ext(sprite_index, 0, x, y, 1, image_yscale, 0, c_white, 1);
//show_debug_message( y + (((y + ((sprite_height * image_yscale)/2)) < node.y) * (sprite_height * image_yscale)))
draw_line_width_color((x + 50) + ((((x + ((sprite_width * image_xscale)/2)) < node.x) * ((sprite_width * image_xscale) - 100))), y + (((y + ((256 * image_yscale)/2)) < node.y) * (256 * image_yscale)), node.x, node.y, 3, node.shade, node.shade)

draw_set_font(title_fnt)
draw_text_ext(x + 50, y + 15, node.title, 15, 150)
draw_set_font(description_fnt)

draw_sprite_ext(node.demo, demo_index, x + 25, y + title_height + 20, scale, scale, 0, c_white, 1)

if(node.selected){

	draw_sprite(Press_E_spr, 0, x + 50, y + (sprite_height - 65))
}