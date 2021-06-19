/// @description Insert description here

//update gui variables on canvas change
if game.canvas_change {
	slot_total_width = (slot_width + slot_buffer) * slot_col_max;
	slot_total_height = (slot_height + slot_buffer) * MAX_INV_ITEMS div slot_col_max;
	slot_start_x = (game.gui_width - slot_total_width)/2;
	slot_start_y = game.gui_height - slot_total_height;
}

input_inventory_open = keyboard_check_pressed(ord("I"))

// setting incrementor or decrementor depedning on inventory state
/*
if (input_inventory_open){
	if(anim_count <= 0){animate = true; inv_move = -inv_move; anim_count++; open = true;}
	else if(anim_count = distance){
		animate = true; 
		inv_move = -inv_move;
		anim_count--;
	}
}
*/

if(anim_count = -1){
	open = false;
}

if (animate){
	if (anim_count < distance and anim_count >= 0){
		if(distance - anim_count > inv_move){
			anim_count += inv_move;
		} else {
			anim_count = distance;
		}
		
	} else {
		animate = false;
	}
}