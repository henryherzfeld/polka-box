/// @description Insert description here

// Progress Bar
pbar = spr_pbar_big;
bar_col = c_green;
w_pbar = sprite_get_width(pbar) - 2;
h_pbar = sprite_get_height(pbar) - 2;
max_prog = flags.max_progress-1;
curr_prog = 0;

x1 = (game.gui_width - w_pbar)/2;
x2 = w_pbar;
y_offset = 10;

// Timer
minutes = "";
seconds = "";

// Hearts
x_heart = game.gui_width - (50*flags.hearts+1);
margin_heart = 10;
w_heart = sprite_get_width(spr_heart_full);

// Coin Counter
coin_spr = spr_up_arrow;
x_coin = ((game.gui_width - 100)/2) * .75;
w_coin = sprite_get_width(coin_spr);

// Objectives
objective_padding = 100;
objective_col = c_black;
objective_text_col = c_white;

objective_change = true;

// Notifications
draw_sm_noti = false;

noti_sm_count = 0;

noti_sm_timeout = 500;
noti_lg_timeout = 125;

noti_sm_text = "";
noti_sm_bg_col = c_gray;

noti_sm_width = 0;
noti_sm_height = 0;
noti_sm_padding = 100;

draw_lg_noti = false;
noti_lg_count = 0;
noti_lg_text = "";
noti_lg_bg_col = c_blue;
noti_lg_text_col = c_white;

noti_lg_bg_size = 150;
noti_lg_bg_border_size = 20;

nb_spr = spr_notebook_button;
nb_button_pause = false;
nb_button_frame_idx = 0;
nb_button_frame_counter = 0;
nb_button_pressed = false;
new_evidence = noone;
nb_x1 = game.gui_width*.9; 
nb_y1 = game.gui_height*.8;
nb_x2 = game.gui_width*.9+100;
nb_y2 = game.gui_height*.8+100;

scr_event_register_script(event.new_evidence, id, scr_new_evi_noti);