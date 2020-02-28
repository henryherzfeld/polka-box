/// @description Insert description here

// Progress Bar
//var curr_prog = flags.progress;

draw_rectangle_color(x1+1, y_offset, x1 + (x2 - ((max_prog - curr_prog) / max_prog)*x2), y_offset + h_pbar, bar_col, bar_col, bar_col, bar_col, false); 
draw_sprite(pbar, 0, x1, y_offset)
// Timer
timer_text = minutes + ":" + seconds;
draw_text(0, 10, timer_text);

alarm[0] = 1;