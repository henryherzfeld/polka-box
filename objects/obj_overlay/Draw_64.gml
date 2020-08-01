/// @description Insert description here

// Progress Bar
//var curr_prog = flags.progress;
draw_rectangle_color(x1+3, y_offset, x1 + (x2 - ((max_prog - curr_prog) / max_prog)*x2), y_offset + h_pbar, bar_col, bar_col, bar_col, bar_col, false); 
draw_set_halign(fa_center);
draw_set_font(font_comic);
draw_text(game.gui_width/2, h_pbar/2, string(curr_prog) + " / " + string(max_prog));
draw_set_halign(fa_left);
draw_sprite(pbar, 0, x1, y_offset)
 
// Timer
timer_text = minutes + ":" + seconds;
draw_text(20, y_offset, timer_text);

// Hearts
for(i = 1; i <= flags.hearts; ++i){
	var spr = spr_heart_empty;
	if(flags.hearts - i >= 0){ spr = spr_heart_full; }
	draw_sprite(spr, 0, x_heart + i * (w_heart + margin_heart), y_offset);
}

// Coin Counter
draw_sprite_stretched(coin_spr, 0, x_coin, y_offset-2, 24, 24);
draw_text(x_coin + 24, y_offset, "x" + string(flags.coins));

//Objectives
draw_set_font(font_comic);

// Draw objective background
draw_rectangle_color(game.gui_width - string_width(flags.objective_text) - 1*objective_padding, 200, game.gui_width, string_height(flags.objective_text)*2 + 240, objective_col, objective_col, objective_col, objective_col, false)

// Draw objective phase text
draw_text_color(game.gui_width - string_width(flags.objective_text) - objective_padding, 200, flags.objective_phase_text, objective_text_col, objective_text_col, objective_text_col, objective_text_col, true);

// Draw objective text
draw_text_color(game.gui_width - string_width(flags.objective_text) - objective_padding, string_height(flags.objective_text) + 200, flags.objective_text, objective_text_col, objective_text_col, objective_text_col, objective_text_col, true);

if(draw_sm_noti){
	draw_sm_noti = false;
	noti_sm_count = 1;
	noti_sm_width = string_width(sm_noti_text);
	noti_sm_height = string_height(sm_noti_text);
}


if(draw_lg_noti){
	draw_lg_noti = false;
	noti_lg_count = 1;
}


if(noti_sm_count){
	if(noti_sm_count <= noti_sm_timeout){
		var pad = 3;
		draw_rectangle_color(0, game.gui_height-noti_sm_height-noti_sm_padding-pad, noti_sm_width+noti_sm_padding+pad, game.gui_height, noti_sm_text_col, noti_sm_text_col, noti_sm_text_col, noti_sm_text_col, false);
		draw_rectangle_color(pad, game.gui_height-noti_sm_height-noti_sm_padding, noti_sm_width+noti_sm_padding, game.gui_height-pad, noti_sm_bg_col, noti_sm_bg_col, noti_sm_bg_col, noti_sm_bg_col, false);
		draw_text_color(pad, game.gui_height-noti_sm_height-noti_sm_padding, sm_noti_text, noti_sm_text_col, noti_sm_text_col, noti_sm_text_col, noti_sm_text_col, true);
		
		noti_sm_count += 1;
	} else {
		noti_sm_count = 0;
	}
}

if(noti_lg_count){
	if(noti_lg_count <= noti_lg_timeout){
		draw_rectangle(0, game.gui_height/2 - noti_lg_bg_size - noti_lg_bg_border_size, game.gui_width, game.gui_height/2 + noti_lg_bg_size + noti_lg_bg_border_size, false);
		draw_rectangle_color(0, game.gui_height/2 - noti_lg_bg_size, game.gui_width, game.gui_height/2 + noti_lg_bg_size, noti_lg_bg_col, noti_lg_bg_col, noti_lg_bg_col, noti_lg_bg_col, false);
		draw_set_halign(fa_center);
		draw_set_font(font_large);
		draw_text_color(game.gui_width/2, game.gui_height/2, lg_noti_text, noti_lg_text_col,noti_lg_text_col,noti_lg_text_col,noti_lg_text_col,true);
		draw_set_halign(fa_left);
		draw_set_font(font_comic);
		
		noti_lg_count += 1;
	}
	else {
		noti_lg_count = 0;
	}
}

//notebook button
if obj_notebook.draw_evidence or obj_quiz_manager.pending_choice { exit; }

if game.canvas_change {
	nb_x1 = game.gui_width*.9; nb_y1 = game.gui_height*.8;
	nb_x2 = game.gui_width*.9+100; nb_y2 = game.gui_height*.8+100;
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if !nb_button_pause {
	nb_button_frame_idx = 0;
	nb_button_frame_counter = 0;
	nb_spr = spr_notebook_button;
	if point_in_rectangle(mx, my, nb_x1, nb_y1, nb_x2, nb_y2){
		nb_spr = spr_notebook_button_hover;
		if mouse_check_button_pressed(mb_left) or nb_button_pressed {
			nb_spr = spr_notebook_button_flash;
			nb_button_pressed = true;
		}
	} else {
		nb_button_pressed = false;
	}
	if nb_button_pressed {
		if mouse_check_button_released(mb_left) {
			with obj_notebook { 
				draw_evidence = !draw_evidence;
				draw_change = true;	
			}
		}
	}
} else {
	nb_button_frame_counter += 1;
	if not (nb_button_frame_counter % 17) {
		nb_button_frame_idx = (nb_button_frame_idx+1) % 2
	}
}

draw_sprite_stretched(nb_spr, nb_button_frame_idx, nb_x1, nb_y1, nb_x2-nb_x1, nb_y2-nb_y1);

exit; // old evidence draw code for evi on center of screen
if new_evidence != noone {
	var h = sprite_get_height(new_evidence);
	var w = sprite_get_width(new_evidence);
	
	var xx = (game.gui_width - w) / 2;
	var yy = (game.gui_height - h - InventoryManager.slot_total_height);
	draw_rectangle_color(xx-10, yy-10, xx+(w)+10, yy+(h)+10, c_gray, c_gray, c_gray, c_gray, false);
	draw_sprite_stretched(new_evidence, 0, xx, yy, w, h)
}
