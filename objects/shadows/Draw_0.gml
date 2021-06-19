/// @description Insert description here

surface_shadow = surface_create(room_height, room_width);

surface_set_target(surface_shadow);

draw_clear_alpha(c_white, 0);

var off = 6;

with par_NPC {
	var xx = x-sprite_xoffset;
	var yy = y-sprite_yoffset;

	draw_sprite_pos(sprite_index, image_index, xx, yy+sprite_height-18, xx+sprite_width+off, yy+sprite_height-18-off, 
	xx+sprite_width, yy+sprite_height, xx, yy+sprite_height, 1);
}

with polka {
	var xx = x-sprite_xoffset;
	var yy = y-sprite_yoffset;
	
	draw_sprite_pos(sprite_index, image_index, xx, yy+sprite_height-18, xx+sprite_width+off, yy+sprite_height-18-off, 
	xx+sprite_width, yy+sprite_height, xx, yy+sprite_height, 1);
}

surface_reset_target();

draw_surface_ext(surface_shadow,0,0,1,1,0,c_black,0.35);

surface_free(surface_shadow);