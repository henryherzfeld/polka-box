/// @description Insert description here
if(draw){
	draw_set_alpha(.7);
	draw_set_font(font_large);
	draw_rectangle(anim_count, anim_count, rect_x, rect_y, false);
	draw_rectangle_color(anim_count, anim_count, rect_x, rect_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, true);
	draw_set_alpha(1);
	draw_set_font(font_large);
	draw_text_ext(anim_max, anim_max, text, string_height(text), rect_x)
	draw_set_font(font_comic);
}