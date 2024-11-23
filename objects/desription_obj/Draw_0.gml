draw_sprite_ext(sprite_index, 0, x, y, 1, 155/((string_width(node.description)/50) * 15), 0, c_white, 1);

draw_line_width_color((x + 50) + ((((x + ((sprite_width * image_xscale)/2)) < node.x) * ((sprite_width * image_xscale) - 100))), y + (((y + ((sprite_height * image_yscale)/2)) < node.y) * (sprite_height * image_yscale)), node.x, node.y, 3, node.shade, node.shade)

draw_set_font(title_fnt)
draw_text(x + 50, y + 15, node.title)
draw_set_font(description_fnt)
draw_text_ext(x + 25, y + 50, node.description, 15, 50)

