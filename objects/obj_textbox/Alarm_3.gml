/// @description Insert description here
// You can write your code in this editor

if not text_drawn {
	audio_sound_pitch(char_audio, random_range(1-pitch_margin, 1+pitch_margin));
	scr_audio_play_sound(char_audio, 0, false);
}