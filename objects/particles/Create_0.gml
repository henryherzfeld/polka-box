/// @description Insert description here

rain = false;


/*
system_ptr = part_system_create();
part_system_position(system_ptr, -200, -200)
emitter_ptr = part_emitter_create(system_ptr);

particle1_idx = part_type_create();
part_type_shape(particle1_idx, pt_shape_star);
part_type_size(particle1_idx, .1, .2, .001, 0);
part_type_speed(particle1_idx, 4, 8, 0, 0);
part_type_color2(particle1_idx, c_white, c_green)
part_type_direction(particle1_idx, 270, 360, 0, 0);
part_type_orientation(particle1_idx, 0, 360, 0, 0, true)
part_type_life(particle1_idx, 20*room_speed, 30*room_speed);

particle2_idx = part_type_create();
part_type_shape(particle2_idx, pt_shape_star);
part_type_size(particle2_idx, .1, .2, .001, 0);
part_type_color3(particle2_idx, c_blue, c_white, c_green)
part_type_speed(particle2_idx, 4, 8, 0, 0);
part_type_direction(particle2_idx, 270, 360, 0, 0);
part_type_orientation(particle2_idx, 0, 360, 0, 0, true)
part_type_life(particle2_idx, 20*room_speed, 30*room_speed);

counter = 1;