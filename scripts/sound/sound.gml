/// @description sound(id,priority,loop);
/// @param id
/// @param priority
/// @param loop
function sound(argument0, argument1, argument2) {

	if (os_type == os_ios) {
	    audio_play_sound(argument0,argument1,argument2);
	}
	else{
	    if (audio_system() == audio_old_system || os_browser == browser_not_a_browser ) {
	       if (argument2)
	          sound_loop(argument0);
	       else
	          sound_play(argument0);
	    }
	    else {
	       audio_play_sound(argument0,argument1,argument2);
	    }
	}



}
