/// @description Insert description here
draw_set_font(font_comic);

draw_rectangle_color(gui_width - string_width(objective) - 1*objective_padding, 0, gui_width, string_height(objective) + 40, c_black, c_black, c_black, c_black, false)
draw_text(gui_width - string_width(objective) - objective_padding, string_height(objective), objective);