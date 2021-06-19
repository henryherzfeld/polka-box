/// @description Insert description here
// You can write your code in this editor
planting_sys_ptr = part_system_create();
part_system_position(planting_sys_ptr, -200, -200);
emitter_ptr = part_emitter_create(planting_sys_ptr);

particle1_idx = part_type_create();
part_type_shape(particle1_idx, pt_shape_cloud);
part_type_size(particle1_idx, .3, .4, .001, 0);
part_type_speed(particle1_idx, 1, 1.1, 0, 0);
part_type_color2(particle1_idx, c_white, c_gray)
part_type_direction(particle1_idx, 0, 360, 0, 0);
part_type_orientation(particle1_idx, 0, 360, 0, 0, true)
part_type_life(particle1_idx, .5*room_speed, .5*room_speed);
part_type_alpha2(particle1_idx, 1, 0);

particle2_idx = part_type_create();
part_type_shape(particle2_idx, pt_shape_cloud);
part_type_size(particle2_idx, .5, .6, .001, 0);
part_type_speed(particle2_idx, 1.2, 1.4, 0, 0);
part_type_color_rgb(particle2_idx, 133, 133, 87, 87, 35, 35);
part_type_direction(particle2_idx, 0, 360, 0, 0);
part_type_orientation(particle2_idx, 0, 360, 0, 0, true)
part_type_life(particle2_idx, .5*room_speed, .5*room_speed);
part_type_alpha2(particle2_idx, 1, 0);


particle_count = 0;
interval_max = 10;
interval_min = 1;
interval = irandom_range(interval_max, interval_min);