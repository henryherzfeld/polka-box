/// @description Insert description here

if disable { exit; }

var win_scale = min((game.gui_width/1500), game.gui_height/840);

if draw draw_sprite_stretched(window_sprite, 0, x1, y1, window_w, window_h);

if sprite_draw != noone {
	var scale = 1;
	var xx = x1 + (window_w - sprite_w*scale)/2;
	var yy = y1 + (window_h - sprite_h*scale)/2;
	draw_sprite_stretched(sprite_draw, 0, xx, yy, sprite_w*scale, sprite_h*scale);
}

// draw code for every button in the window's context
for(var i = 0; i < n_but; i++) {
	var but = button_context[i];
	
	with but {
		draw_sprite_stretched(spr, 0, x1*win_scale, y1*win_scale, (x2-x1)*win_scale, (y2-y1)*win_scale);
		
		// if the button has an additional sprite, draw it
		if sprite_draw != noone {
			draw_sprite_stretched(sprite_draw, 0, x1, y1, x2-x1, y2-y1);
		}
		
		if win_scale < .6 {
			draw_set_font(font_small);
		} else {
			draw_set_font(font_mid);
		}
	
		if text != -1 {
			draw_text(x1*win_scale, y1*win_scale, text)
		}
	}
}

if(text != -1){
	var in_text = scr_wrap_text(text, window_w-48);
	
	
	
	draw_text(x1 + ((window_w - string_width(in_text))/2), y1 + 20, in_text);
}

draw_set_font(font_mid);