vis_pos = false
moving = false
wall_col = false

draw_set_font(title_fnt)
title_height = string_height_ext(node.title, 20, 150)

// set to this font so the yscale is done with the right text height mesurement
draw_set_font(description_fnt)
// is +70 to add some room on the botom of the text box
image_yscale = (string_height_ext(node.description, 15, 150) + title_height + 85) / 256


