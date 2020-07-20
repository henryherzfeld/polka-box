/// @description Room transition
// You can write your code in this editor
draw_set_font(font_comic);

if game_over_bg != noone{
	draw_sprite(game_over_bg, 0, 0, 0);
	draw_text_transformed((gui_width-game_over_text_w*4)/2, (gui_height-game_over_text_h*4)/2, game_over_text, 4, 4, 0);
}


if (do_transition) {
	if (room != spawn_room) {
		black_alpha += 0.1;
		
		if (black_alpha >= 1) {
			room_goto(spawn_room);
		}
	} else {
			//alarm[0] = 2 * room_speed;
			black_alpha -= 0.1;
			if (black_alpha <= 0){
				 do_transition = false;
			}
		}
	
	
	// Draw fade
	draw_set_alpha(black_alpha);
	draw_rectangle_colour(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

}

if(pause){
	draw_sprite_ext(screenshot, 0, 0, 0, 1, 1, 0, c_gray, 1);
}


// draw for map and help
if draw_help {
	draw_rectangle((game.gui_width - spr_help_w)/2-outline, (game.gui_height - spr_help_h)/2-outline, (game.gui_width - spr_help_w)/2 + spr_help_w+outline, (game.gui_height - spr_help_h)/2+spr_help_h+outline, false);
	draw_sprite(spr_help, 0, (game.gui_width - spr_help_w)/2, (game.gui_height - spr_help_h)/2);
} else if draw_map {
	draw_rectangle((game.gui_width - spr_map_w)/2-outline, (game.gui_height - spr_map_h)/2-outline, (game.gui_width - spr_map_w)/2 + spr_map_w+outline, (game.gui_height - spr_map_h)/2+spr_map_h+outline, false);
	draw_sprite(spr_map, 0, (game.gui_width - spr_map_w)/2, (game.gui_height - spr_map_h)/2);
}