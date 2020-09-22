/// @description Insert description here
// You can write your code in this editor
spawn_room = -1;
disable = false;
draw = false;
count = 0;

yy = y + (sprite_height/3);

system_ptr = part_system_create();
part_system_position(system_ptr, x, y)

emitter_fg = part_emitter_create(system_ptr);
emitter_bg = part_emitter_create(system_ptr);

part_emitter_region(system_ptr, emitter_fg, 0, sprite_width, 0, 10, ps_shape_rectangle, ps_distr_linear);
part_emitter_region(system_ptr, emitter_bg, 0, sprite_width, 0, 10, ps_shape_rectangle, ps_distr_linear);

part_fg = part_type_create();
part_type_shape(part_fg, pt_shape_star);
part_type_size(part_fg, .03, .05, -.001, .01);
part_type_speed(part_fg, .01, .5, -.01, .2);
part_type_direction(part_fg, 60, 120, 0, 0);
part_type_orientation(part_fg, 0, 360, 0, 0, true)
part_type_life(part_fg, 2*room_speed, 2*room_speed);
part_type_blend(part_fg, true);
part_type_gravity(part_fg, 0.01, 90);

part_bg1 = part_type_create();
part_type_shape(part_bg1, pt_shape_star);
part_type_size(part_bg1, .03, .05, -.001, .01);
part_type_speed(part_bg1, .1, .4, 0, .2);
part_type_colour1(part_bg1, c_yellow);
part_type_direction(part_bg1, 60, 120, 0, 0);
part_type_orientation(part_bg1, 0, 360, 0, 0, true)
part_type_life(part_fg, 1*room_speed, 2.5*room_speed);

part_bg2 = part_type_create();
part_type_shape(part_bg2, pt_shape_star);
part_type_size(part_bg2, .03, .05, -.001, .01);
part_type_speed(part_bg2, .1, .4, 0, .2);
part_type_colour1(part_bg2, c_yellow);
part_type_direction(part_bg2, 60, 120, 0, 0);
part_type_orientation(part_bg2, 0, 360, 0, 0, true)
part_type_life(part_fg, 1*room_speed, 2*room_speed);
part_type_gravity(part_fg, 0.02, 90);

sprite_draw = polka_title_big;