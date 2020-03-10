/// @description Insert description here

if(counter > 10){
	if(keyboard_check_released(interact_key)){
		object.draw_examine_box = false;
		polka.move_override = false;
		instance_destroy();
	}
} else {
	counter += 1;
}