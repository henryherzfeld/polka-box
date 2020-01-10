/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(interact_key)){
	if(page < n - 2 and !exiting){
		++page;
	}
	else{
		if(exiting){
			instance_destroy();
		}
		draw_options = true;
		
	}
}

