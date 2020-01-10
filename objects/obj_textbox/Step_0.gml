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
				script_execute(args[0], args[1], args[2], args[3])
				}
			}
			
			instance_destroy();
		}
		draw_options = true;
		
	}
}

