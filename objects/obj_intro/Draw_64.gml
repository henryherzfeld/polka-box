/// @description Insert description here
// You can write your code in this editor

if draw {
	
	if not initial {
		draw_set_font(font_large);
		draw_set_halign(fa_center);

		draw_text_ext(game.gui_width/2, game.gui_height/4, thanks_str, string_height("M"), 600);
		draw_set_font(font_comic);
		draw_text(game.gui_width/2, game.gui_height - string_height("M"), "Press space to start...")
		draw_set_halign(fa_left);
	} else {
	
	draw_set_halign(fa_center);
	draw_text(game.gui_width/2, game.gui_height - string_height("M"), "Press space to start...")
	draw_rectangle((game.gui_width - spr_help_w)/2-outline, (game.gui_height - spr_help_h)/2-outline, (game.gui_width - spr_help_w)/2 + spr_help_w+outline, (game.gui_height - spr_help_h)/2+spr_help_h+outline, false);
	draw_sprite(spr_help, 0, (game.gui_width - spr_help_w)/2, (game.gui_height - spr_help_h)/2);
	draw_set_halign(fa_left);
	}
}