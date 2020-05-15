/// @description Insert description here


draw_rectangle_color(xx+3, yy, xx + (w_bar - ((time_start - time) / time_start)*w_bar), yy + h_bar, bar_col, bar_col, bar_col, bar_col, false); 
draw_set_halign(fa_center);
draw_set_font(font_comic);
draw_text(xx + w_bar/2, yy + h_bar/2 - h_text/2, timer_text);
draw_set_halign(fa_left);
draw_sprite(bar, 0, xx, yy)