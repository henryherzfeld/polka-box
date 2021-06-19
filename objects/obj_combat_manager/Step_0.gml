/// @description Insert description here

if fade {
	if not polled_question {
		curr_question = questions[irandom_range(0, array_length_1d(questions)-1)];
		polled_question = true;
	}
	
	// dec/inc room_speed for slo-mo effect
	if attack {
		// move question text down screen
		yy += 5;
		
		// shorten max length input
		if (string_length(keyboard_string) >= max_char){
			keyboard_string = string_copy(keyboard_string, 1, max_char);
		}
		curr_num = string_digits(keyboard_string); // strip characters
		keyboard_string = curr_num;
		
		if room_speed > 10 {
		room_speed -= 1.5;
		}
	} else {
		if room_speed < 60 {
			room_speed += 1.5;
		} else {
			// re-enabling all disabled enemies
			instance_activate_object(par_enemy);
			
			// Setting bg layer shader
			var lay_id = layer_get_id("Background");
			layer_shader(lay_id, shader1);
			
		}
	}
	
	if keyboard_check_pressed(vk_enter) {
		if curr_num == curr_question[1] {
			scr_audio_play_sound(snd_question_correct, 1, false);
			attack = false;
			yy = 0;
			instance_destroy(enemy);
			curr_num = "";
			keyboard_string = "";
			polled_question = false;
		} else {
			scr_audio_play_sound(snd_question_wrong, 1, false);
		}
	}
}

if knock_count >= 0 {
	knock_count -= 1;
	enemy.x -= lengthdir_x(spd*5, knock_angle);
	enemy.y -= lengthdir_y(spd*5, knock_angle);
	
	polka.x += lengthdir_x(spd, knock_angle);
	polka.y += lengthdir_y(spd, knock_angle);
} else {
	knock_count = -1;
	knock_angle = 0;
}
