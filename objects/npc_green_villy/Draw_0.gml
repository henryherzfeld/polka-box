/// @description Insert description here
// You can write your code in this editor

draw_self();

if(draw and counter < blink_freq){
	draw_sprite(spr_arrow, 0, x-20, y-50);
}

if(counter < blink_freq*1.5){
	counter += 1;
} else {
	counter = 0;
}