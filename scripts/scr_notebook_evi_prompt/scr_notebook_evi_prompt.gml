///@description scr_notebook_evi_prompt

with(InventoryManager){
	animate = true; 
	inv_move = -inv_move; 
	anim_count++; open = true;
	alarm[0] = .5 * room_speed;
}

global.show_inventory = true;