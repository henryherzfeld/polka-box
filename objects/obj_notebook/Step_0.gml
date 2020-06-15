/// @description Insert description here
// You can write your code in this editor

event_inherited();

if game.canvas_change {
	slot_start_x = (game.gui_width - slot_total_width)/2;
	slot_start_y = (game.gui_height - slot_total_height)/2;
}

if(keyboard_check_pressed(notebook_key)){
	switch(draw_evidence){
		case true: draw_evidence = false; break;
		case false: draw_evidence = true; break;
	}
}