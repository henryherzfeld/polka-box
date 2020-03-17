/// @description Insert description here
pbar = spr_pbar_big;
bar_col = c_green;
w_pbar = sprite_get_width(pbar) - 2;
h_pbar = sprite_get_height(pbar) - 2;
max_prog = flags.max_progress;
curr_prog = 0;

gui_height = game.gui_height;
gui_width = game.gui_width;

x1 = (gui_width - w_pbar)/2;
x2 = w_pbar;
y_offset = 10;

time = 1200;

x_heart = 1350;
margin_heart = 10;
w_heart = sprite_get_width(spr_heart_full);

objective_padding = 100;
objective_col = c_black;
objective_phase_text = "Miscellaneous";
objective_text_col = c_white;

alarm[0] = room_speed;
