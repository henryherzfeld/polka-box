/// @description Insert description here


text = "";
h_text = string_height(text);

prog = 0;
max_prog = 1;

bar = spr_pbar_big;
bar_col = c_green;
w_bar = sprite_get_width(bar) - 2;
h_bar = sprite_get_height(bar) - 2;

xx = (game.gui_width - w_bar) / 2;
yy = game.gui_height - 50;
