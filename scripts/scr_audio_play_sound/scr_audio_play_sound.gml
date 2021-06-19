///@description scr_audio_play_sound
///@param audio_index
///@param priority
///@param loop?
function scr_audio_play_sound(argument0, argument1, argument2) {

	var audio_idx = argument0;
	var priority = argument1;
	var loop = argument2;

	if fm_mobile() {
		if loop {
			sound_loop(audio_idx);
		} else {
			sound_play(audio_idx);
		}
	} else {
		audio_play_sound(audio_idx, priority, loop);
	}


}
