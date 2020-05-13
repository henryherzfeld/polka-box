/// @description Insert description here
// You can write your code in this editor

event_inherited();

// assigning appropriate sprite for enabled state
if enabled { spr = spr_enabled; } else { spr = spr_disabled; }


if clicked{
	show_debug_message(attr);
	clicked = false;
	
	enabled = !enabled;
	if enabled { 
		spr = spr_enabled;
		enable_change = true;
	} else { spr = spr_disabled; }
	
	spr_w = sprite_get_width(spr);
	spr_h = sprite_get_height(spr);

	update = true;
}

if enable_change {
	enable_change = false;
	ui_window.enable_change = true;
	ui_window.enabled_radio = id;
}