/// @description Insert description here
gui_height = game.gui_height;
gui_width = game.gui_width;

// Progress Bar
pbar = spr_pbar_big;
bar_col = c_green;
w_pbar = sprite_get_width(pbar) - 2;
h_pbar = sprite_get_height(pbar) - 2;
max_prog = flags.max_progress;
curr_prog = 0;

x1 = (gui_width - w_pbar)/2;
x2 = w_pbar;
y_offset = 10;

// Timer
minutes = "";
seconds = "";


// Hearts
x_heart = 1350;
margin_heart = 10;
w_heart = sprite_get_width(spr_heart_full);

// Coin Counter
coin_spr = spr_up_arrow;
x_coin = 1100;
w_coin = sprite_get_width(coin_spr);

// Objectives
objective_padding = 100;
objective_col = c_black;
objective_text_col = c_white;

// Notifications
draw_sm_noti = false;

noti_sm_count = 0;

noti_sm_timeout = 500;
noti_lg_timeout = 300;

noti_sm_text = "";
noti_sm_bg_col = c_gray;

noti_sm_width = 0;
noti_sm_height = 0;
noti_sm_padding = 100;

draw_lg_noti = false;
noti_lg_count = 0;
noti_lg_text = "";
noti_lg_bg_col = c_blue;

noti_lg_bg_size = 150;
noti_lg_bg_border_size = 20;