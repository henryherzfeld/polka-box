/// @description sound_toggle(true/false);
/// @param true/false

if (argument0) {
   audio_master_gain(1);
   sound_global_volume(1);
}
else {
   audio_master_gain(0);
   sound_global_volume(0);
}
