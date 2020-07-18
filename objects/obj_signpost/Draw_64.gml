/// @description Insert description here
if(draw){
	draw_set_alpha(0.8);
	draw_set_font(font_large);
	draw_rectangle(anim_count, anim_count, rect_x, rect_y, false);
	draw_rectangle_color(anim_count, anim_count, rect_x, rect_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, true);
	draw_set_alpha(1);
	draw_set_font(font_large);
	
	if directions {
		var i = 0; repeat(array_length_1d(text)) {
			direction_ = text[i];
			var height = string_height(direction_[1]);
			
			var arrow_spr;
			switch direction_[0] {
				case "UP": arrow_spr = spr_arrow_dark_up; break;
				case "DOWN": arrow_spr = spr_arrow_dark_down; break;
				case "LEFT": arrow_spr = spr_arrow_dark_left; break;
				case "RIGHT": arrow_spr = spr_arrow_dark_right; break;
			}
			
			draw_sprite(arrow_spr, 0, anim_max+64, anim_max+i*(height+5));
			draw_text_ext_color(anim_max+128, anim_max+i*(height+5), direction_[1], height, rect_x, txt_col, txt_col, txt_col, txt_col, true);
			i++;
		}
	} else {
		draw_text_ext_color(anim_max, anim_max, text, string_height(text), rect_x, txt_col, txt_col, txt_col, txt_col, true);
	}
	
	draw_set_font(font_comic);
}