/// @description Insert description here
// You can write your code in this editor

if disable { exit; }

draw_sprite(window_sprite, 0, x1, y1);

with (par_button){
	draw_sprite(spr, 0, x1, y1);
	
	if text != -1 {
		draw_text(x1, y1, text)
	}
	
	if sprite_draw != noone {
	draw_sprite(sprite_draw, x1, y1, 0);
	}
}

if(text != -1){
	draw_text(x1 + ((window_w - string_width(text))/2), y1 + 20, text);
}