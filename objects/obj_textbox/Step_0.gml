/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(interact_key)){
	if(page < n - 2 and !exiting){
		++page;
	}
	else{
		if(exiting){
			
			if (is_array(scripts)){
			n = array_length_1d(scripts);
	
			for (var i = 0; i < n; ++i){
				args = scripts[i]
				scr_script_execute_array_1d(args)
				}
			}
			
			instance_destroy();
		}
		draw_options = true;
		
	}
}

