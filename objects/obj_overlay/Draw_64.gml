/// @description Insert description here

// Progress Bar
//var curr_prog = flags.progress;
draw_rectangle_color(x1+3, y_offset, x1 + (x2 - ((max_prog - curr_prog) / max_prog)*x2), y_offset + h_pbar, bar_col, bar_col, bar_col, bar_col, false); 
draw_sprite(pbar, 0, x1, y_offset)
 
// Timer
timer_text = minutes + ":" + seconds;
draw_text(20, y_offset, timer_text);

// Hearts
for(i = 1; i <= 3; ++i){
	var spr = spr_heart_empty;
	if(polka.hearts - i >= 0){ spr = spr_heart_full; }
	draw_sprite(spr, 0, x_heart + i * (w_heart + margin_heart), y_offset);
}

//Objectives
draw_set_font(font_comic);

// Draw objective background
draw_rectangle_color(gui_width - string_width(flags.objective_text) - 1*objective_padding, 200, gui_width, string_height(flags.objective_text)*2 + 240, objective_col, objective_col, objective_col, objective_col, false)

// Draw objective phase text
draw_text_color(gui_width - string_width(flags.objective_text) - objective_padding, 200, objective_phase_text, objective_text_col, objective_text_col, objective_text_col, objective_text_col, true);

// Draw objective text
draw_text_color(gui_width - string_width(flags.objective_text) - objective_padding, string_height(flags.objective_text) + 200, flags.objective_text, objective_text_col, objective_text_col, objective_text_col, objective_text_col, true);