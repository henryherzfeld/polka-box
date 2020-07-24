/// @description Insert description here

time = -1;
time_start = -1;

start = false;

minutes = -1;
seconds = -1;

fired = false;

timer_text = "";
h_text = string_height(timer_text);

bar = spr_pbar_big;
bar_col = c_green;
w_bar = sprite_get_width(bar) - 2;
h_bar = sprite_get_height(bar) - 2;

xx = (game.gui_width - w_bar) / 2;
yy = game.gui_height / 6;

on_finish = -1;