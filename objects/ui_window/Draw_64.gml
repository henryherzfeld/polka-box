/// @description Insert description here

if disable { exit; }

if draw draw_sprite(window_sprite, 0, x1, y1);

if sprite_draw != noone {
	var scale = 1;
	var xx = x1 + (window_w - sprite_w*scale)/2;
	var yy = y1 + (window_h - sprite_h*scale)/2;
	draw_sprite_stretched(sprite_draw, 0, xx, yy, sprite_w*scale, sprite_h*scale);
}

for(var i = 0; i < n_but; i++) {
	var but = button_context[i];
	with but {
		draw_sprite(spr, 0, x1, y1);
		
		if sprite_draw != noone {
			draw_sprite_stretched(sprite_draw, 0, x1, y1, x2-x1, y2-y1);
		}
	
		if text != -1 {
			draw_text(x1, y1, text)
		}
	

	}
}

if(text != -1){
	var in_text = scr_wrap_text(text, window_w-48);
	draw_text(x1 + ((window_w - string_width(in_text))/2), y1 + 20, in_text);
}