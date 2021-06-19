/// @description Insert description here
if game.canvas_change {
	draw_x = (game.gui_width - box_width - spr_width)/2;
	draw_y = game.gui_height/2 + spr_height;
}

if(counter > 10){
	if(keyboard_check_released(interact_key)){
		object.draw_examine_box = false;
		polka.move_override = false;
		instance_destroy();
	}
} else {
	counter += 1;
}