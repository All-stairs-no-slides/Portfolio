vis_pos = false
moving = false
wall_col = false

scale = 206 / sprite_get_width(node.demo)

draw_set_font(title_fnt)
title_height = string_height_ext(node.title, 20, 150)

// set to this font so the yscale is done with the right text height mesurement
draw_set_font(description_fnt)
// is +70 to add some room on the botom of the text box
image_yscale = ((scale * sprite_get_height(node.demo)) + title_height + 85) / 256


alarm[0] = game_get_speed(gamespeed_fps) / 5
demo_index = 0