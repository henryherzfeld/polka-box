/// @description Insert description here
// You can write your code in this editor
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