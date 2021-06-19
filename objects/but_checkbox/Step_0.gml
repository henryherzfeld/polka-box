/// @description Insert description here
// You can write your code in this editor

event_inherited();

if enabled { spr = spr_enabled; } else { spr = spr_disabled; }

if clicked{
	
	clicked = false;

	enabled = !enabled;
	if enabled { spr = spr_enabled; } else { spr = spr_disabled; }
	
	update = true;
	
	spr_w = sprite_get_width(spr);
	spr_h = sprite_get_height(spr);

}