/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr, 0, x1, y1);

with (par_button){
	draw_sprite(spr, 0, x1, y1);
	
	if text != -1 {
		draw_text(x1, y1, text)
	}
}

if(text != -1){
	draw_text(400, 475, text);
}