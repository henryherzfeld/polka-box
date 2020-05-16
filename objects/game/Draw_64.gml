/// @description Room transition
// You can write your code in this editor
draw_set_font(font_comic);


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
