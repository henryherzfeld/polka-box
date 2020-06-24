/// @description Insert description here

system_ptr = part_system_create();
part_system_position(system_ptr, -200, -200)
emitter_ptr = part_emitter_create(system_ptr);

particle_idx = part_type_create();
part_type_shape(particle_idx, pt_shape_star);
part_type_size(particle_idx, .1, .2, .001, 0);
part_type_speed(particle_idx, 4, 8, 0, 0);
part_type_direction(particle_idx, 270, 360, 0, 0);
part_type_orientation(particle_idx, 0, 360, 0, 0, true)
part_type_life(particle_idx, 20*room_speed, 30*room_speed);