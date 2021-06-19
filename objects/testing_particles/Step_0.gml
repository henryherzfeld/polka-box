/// @description Insert description here

if not ((particle_count+1) mod interval) {
	part_system_position(planting_sys_ptr, x, y);
	part_emitter_burst(planting_sys_ptr, emitter_ptr, particle1_idx, 2);
	part_emitter_burst(planting_sys_ptr, emitter_ptr, particle2_idx, 2);
	interval = irandom_range(interval_max, interval_min);
	particle_count = 0;
}

particle_count += 1;