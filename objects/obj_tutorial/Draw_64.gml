/// @description Insert description here
// You can write your code in this editor

if(draw){
	switch (tut_step){
		case 1: draw_sprite(spr_arrow_keys, image_index*.05, 100, 100); draw_text(40, 160, "Use the Arrow Keys to Move"); break;
		
		case 2: draw_sprite(spr_e, image_index*.05, 100, 100); draw_text(40, 160, "Use E to Talk to Someone"); break;
		
		case 3: draw_sprite(spr_arrow_up_down, image_index*.05, 100, 100); draw_sprite(spr_space, image_index*.05, 100, 150);
				draw_text(40, 210, "Use the Up and Down Keys to Navigate. \nPress Spacebar to Make a Selection.");
				break;
				
		case 7: draw_sprite(spr_space, image_index*.05, 100, 100); break;
		
		case 8: draw_sprite(spr_mouse_pressed, image_index*.05, 100, 100); break;
		
		case 9: draw_sprite(spr_mouse_pressed, image_index*.05, 100, 400); break;
		
		case 10: draw_sprite(spr_space, image_index*.05, 100, 400); break;
	}
	
}