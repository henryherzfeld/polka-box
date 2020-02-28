/// @description Insert description here
pbar = spr_pbar_long_empty;
bar_col = c_green;
w_pbar = sprite_get_width(pbar) - 2;
h_pbar = sprite_get_height(pbar) - 2;
max_prog = flags.max_progress;



gui_height = game.gui_height;
gui_width = game.gui_width;

x1 = (gui_width - w_pbar)/2;
x2 = w_pbar;
y_offset = 10;

time = 1000;

curr_prog = 0;