/// @description Insert description here

if disable { exit; }

draw_sprite(window_sprite, 0, x1, y1);

with (par_button){
	draw_sprite(spr, 0, x1, y1);
	
	if text != -1 {
		draw_text(x1, y1, text)
	}
	
	if sprite_draw != noone {
		draw_sprite(sprite_draw, 0, x1, y1);
	}
}

if sprite_draw != noone {
	var scale = 4;
	var xx = x1 + (window_w - sprite_w*scale)/2;
	var yy = y1 + (window_h - sprite_h*scale)/2;
	draw_sprite_stretched(sprite_draw, 0, xx, yy, sprite_w*scale, sprite_h*scale);
}

if(text != -1){
	draw_text(x1 + ((window_w - string_width(text))/2), y1 + 20, text);
}