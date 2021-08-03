/// @description Insert description here

//if place_meeting(polka_pt.x, polka_pt.y, obj_ground_secret) {
with polka_pt {
	var inst = instance_place(x, y, obj_ground_secret);
}

if inst != noone {	
	if not surface_exists(surface_mask) {
		surface_mask = surface_create(room_width, room_height);
	}
		
	surface_set_target(surface_mask);
	//draw_clear_alpha(c_white, 0);
		
	//gpu_set_blendenable(false);
	draw_sprite_ext(inst.sprite_index, 0, inst.x, inst.y, inst.image_xscale, inst.image_yscale, 0, 0, 1);
	//gpu_set_blendenable(true);
	
	gpu_set_blendmode(bm_subtract);
	draw_circle_color(polka_pt.x+polka_pt.bbox_w/2, polka_pt.y+polka_pt.bbox_h/2, 90, c_black, c_black, false);
	gpu_set_blendmode(bm_normal);
		
	surface_reset_target();
	draw_surface(surface_mask, 0, 0);

} else {
	with obj_ground_secret {
		draw_self();
	}
}
