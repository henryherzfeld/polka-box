/// @description Insert description here
if(draw){
	draw_set_alpha(0.8);
	draw_set_font(font_large);
	draw_rectangle(anim_count, anim_count, rect_x, rect_y, false);
	draw_rectangle_color(anim_count, anim_count, rect_x, rect_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, true);
	draw_set_alpha(1);
	draw_set_font(font_large);
	draw_text_ext_color(anim_max, anim_max, text, string_height(text), rect_x, txt_col, txt_col, txt_col, txt_col, true)
	draw_set_font(font_comic);
}