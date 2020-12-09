/// @description Insert description here

rain = false;



signpost_sys_ptr = part_system_create();
part_system_position(signpost_sys_ptr, -200, -200);
emitter_ptr = part_emitter_create(signpost_sys_ptr);

particle1_idx = part_type_create();
part_type_shape(particle1_idx, pt_shape_star);
part_type_size(particle1_idx, .1, .2, .001, 0);
part_type_speed(particle1_idx, 2, 4, 0, 0);
part_type_color2(particle1_idx, c_white, c_green)
part_type_direction(particle1_idx, 0, 360, 0, 0);
part_type_orientation(particle1_idx, 0, 360, 0, 0, true)
part_type_life(particle1_idx, .5*room_speed, .5*room_speed);
part_type_alpha2(particle1_idx, 1, 0);

particle2_idx = part_type_create();
part_type_shape(particle2_idx, pt_shape_star);
part_type_size(particle2_idx, .05, .1, .001, 0);
part_type_color3(particle2_idx, c_yellow, c_white, c_green)
part_type_speed(particle2_idx, 2, 4, 0, 0);
part_type_direction(particle2_idx, 0, 360, 0, 0);
part_type_orientation(particle2_idx, 0, 360, 0, 0, true)
part_type_life(particle2_idx, .75*room_speed, .75*room_speed);
part_type_alpha2(particle2_idx, 1, 0);

particle3_idx = part_type_create();
part_type_shape(particle3_idx, pt_shape_star);
part_type_size(particle3_idx, .1, .2, .001, 0);
part_type_color3(particle3_idx, c_yellow, c_white, c_green)
part_type_speed(particle3_idx, 4, 8, 0, 0);
part_type_direction(particle3_idx, 0, 360, 0, 0);
part_type_orientation(particle3_idx, 0, 360, 0, 0, true)
part_type_life(particle3_idx, 3*room_speed, 3*room_speed);
part_type_alpha2(particle2_idx, 1, 0);

counter = 1;