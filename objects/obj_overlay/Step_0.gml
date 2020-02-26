/// @description Insert description here
// You can write your code in this editor

minutes = string(time div 60);
seconds = string(time mod 60);


if(string_length(seconds) = 1){
	seconds = string_insert("0", seconds, 0);
}