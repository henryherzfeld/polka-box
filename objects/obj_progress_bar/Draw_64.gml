/// @description Insert description here

if prog_change {
	var anim_xx = xx+anim_count*anim_interval;
	var anim_col;
	var anim_pad;
	
	if prog == max_prog-1 {
		anim_col = c_yellow;
		anim_pad = 6;
	} else {
		anim_col = c_white;
		anim_pad = 6;
	}
	
	// perform highlight draw
	draw_rectangle_color(anim_xx-(sign(anim_count)*anim_pad), yy-(anim_pad/2), anim_xx+(sign(anim_length-anim_count)*anim_pad), yy+h_bar+(anim_pad/2),
	c_yellow, c_yellow, c_yellow, c_yellow, false);
	
	draw_rectangle_color(anim_xx-(sign(anim_count)*anim_pad), yy-(anim_pad/3), anim_xx+(sign(anim_length-anim_count)*anim_pad), yy+h_bar+(anim_pad/3), 
	anim_col, anim_col, anim_col, anim_col, false);
}

draw_sprite(bar, 0, xx, yy);
if prog > -1 draw_rectangle_color(xx+3, yy+3, xx + (w_bar - ((max_prog - prog - 1) / max_prog)*w_bar), yy-2 + h_bar, bar_col, bar_col, bar_col, bar_col, false); 
draw_set_halign(fa_center);
draw_set_font(font_comic);
draw_text(xx + w_bar/2, yy + h_bar/2 - h_text/2, text);
draw_set_halign(fa_left);


