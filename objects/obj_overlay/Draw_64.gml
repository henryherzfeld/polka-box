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
for(i = 1; i <= 3; ++i){
	var spr = spr_heart_empty;
	if(flags.hearts - i >= 0){ spr = spr_heart_full; }
	draw_sprite(spr, 0, x_heart + i * (w_heart + margin_heart), y_offset);
}

// Coin Counter
draw_sprite(coin_spr, 0, x_coin, y_offset);
draw_text(x_coin + w_coin, y_offset, "x" + string(flags.coins));

//Objectives
draw_set_font(font_comic);

// Draw objective background
draw_rectangle_color(gui_width - string_width(flags.objective_text) - 1*objective_padding, 200, gui_width, string_height(flags.objective_text)*2 + 240, objective_col, objective_col, objective_col, objective_col, false)

// Draw objective phase text
draw_text_color(gui_width - string_width(flags.objective_text) - objective_padding, 200, flags.objective_phase_text, objective_text_col, objective_text_col, objective_text_col, objective_text_col, true);

// Draw objective text
draw_text_color(gui_width - string_width(flags.objective_text) - objective_padding, string_height(flags.objective_text) + 200, flags.objective_text, objective_text_col, objective_text_col, objective_text_col, objective_text_col, true);

if(draw_sm_noti){
	draw_sm_noti = false;
	noti_sm_count = 1;
	noti_sm_width = string_width(sm_noti_text);
	noti_sm_height = string_width(sm_noti_text);
}

if(draw_lg_noti){
	draw_lg_noti = false;
	noti_lg_count = 1;
}

if(noti_sm_count){
	if(noti_sm_count <= noti_sm_timeout){
		draw_rectangle_color(game.gui_width - noti_sm_width - noti_sm_padding, game.gui_height - noti_sm_height - noti_sm_padding, game.gui_width, game.gui_height, noti_sm_bg_col, noti_sm_bg_col, noti_sm_bg_col, noti_sm_bg_col, false);
		draw_text(game.gui_width - noti_sm_width - noti_sm_padding, game.gui_height - noti_sm_height - noti_sm_padding, sm_noti_text);
		
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
		draw_text(game.gui_width/2, game.gui_height/2, lg_noti_text);
		draw_set_halign(fa_left);
		draw_set_font(font_comic);
		
		noti_lg_count += 1;
	}
	else {
		noti_lg_count = 0;
	}
}

