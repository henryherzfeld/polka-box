/// @description Insert description here
// You can write your code in this editor


if(keyboard_check_pressed(vk_anykey)){
	if (page >= array_length_1d(text) - 1){
	room_goto(dont_touch_me_211)
	}
	
	++page;
}