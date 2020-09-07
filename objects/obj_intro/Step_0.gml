/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_space) and not initial){
	initial = true;
	
	/*
	game.do_load = true;
	room_goto(spawn_room);
	instance_destroy();
	*/
} else if keyboard_check_pressed(vk_space) and initial{
	instance_create_layer(0, 0, "Instances", obj_nameprompt);
	draw = false;
}


if(keyboard_check_pressed(vk_anykey) and intro){
	if (page >= array_length_1d(text) - 1){
	room_goto(spawn_room)
	scr_construct_meta();
	}
	
	++page;
}