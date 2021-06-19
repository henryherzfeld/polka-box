/// @description sound_toggle(true/false);
/// @param true/false
function sound_toggle(argument0) {

	if (argument0) {
	   audio_master_gain(1);
	   sound_global_volume(1);
	}
	else {
	   audio_master_gain(0);
	   sound_global_volume(0);
	}



}
