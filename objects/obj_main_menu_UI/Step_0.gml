/// @description Insert description here
// You can write your code in this editor


if(keyboard_check_pressed(vk_anykey)){
	if (page >= array_length_1d(text) - 1){
	room_goto(spawn_room)
	}
	
	++page;
}