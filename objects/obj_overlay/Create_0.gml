/// @description Insert description here

bar_col = c_green;
bar_len = 500;

max_prog = flags.max_progress;

gui_height = game.gui_height;
gui_width = game.gui_width;

x1 = (gui_width - bar_len)/2;
x2 = bar_len;

show_debug_message(x2 - x1);

time = 1000;