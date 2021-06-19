/// @description Insert description here



if do_animation {
	anim_count += 1;

	part_system_position(particles.signpost_sys_ptr, x, y);
	part_emitter_burst(particles.signpost_sys_ptr, particles.emitter_ptr, particles.particle1_idx, 2);
	part_emitter_burst(particles.signpost_sys_ptr, particles.emitter_ptr, particles.particle2_idx, 1);
	
	//draw_sprite_stretched(spr, 0, x+(spr_w+anim_scale)/2, y+(spr_h+anim_scale)/2, spr_w+anim_scale, spr_h+anim_scale);
	draw_sprite_stretched(spr, 0, x-spr_w/2, y-spr_h/2, spr_w+anim_scale, spr_h+anim_scale);

	anim_scale = sin(anim_count)*anim_grow_scale;
	
	if anim_count >= anim_length * 100 {
		part_emitter_burst(particles.signpost_sys_ptr, particles.emitter_ptr, particles.particle3_idx, 50);
		anim_count = 0;
		do_animation = false;
		anim_scale = 0;
		spr = spr_signpost_complete;
		
		
		
	}
} else {
	draw_sprite(spr, 0, x, y);
}