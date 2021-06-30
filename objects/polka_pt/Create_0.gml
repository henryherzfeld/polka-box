/// @description Insert description here

/*
stand_front = spr_villy_stand_front;
stand_back = spr_villy_stand_back;
stand_left = spr_villy_stand_left;
stand_right = spr_villy_stand_right;
walk_front = spr_villy_walk_front;
walk_back = spr_villy_walk_back;
walk_left = spr_villy_walk_left;
walk_right = spr_villy_walk_right;
*/
inst_collision = ds_list_create();
move_override = false;

stand_front = spr_polka_pt;
stand_back = spr_polka_pt;
stand_left = spr_polka_pt;
stand_right = spr_polka_pt;
walk_front = spr_polka_pt;
walk_back = spr_polka_pt;
walk_left = spr_polka_pt;
walk_right = spr_polka_pt;

spd = 2.5;
base_spd = spd;
run_spd = 3.25;
max_spd = 5.5;

is_jumping = false;
jump_length = 30;
jump_count = 0;
grav = -1;

is_slow = false;

x_move = 0;
y_move = 0;

y_move_max = 25;

accel = 2;
decel = .5;

on_ground = false;
ground_buffer_len = 5;
ground_buffer = ground_buffer_len;

max_slope_y = 5;
on_slope = false;

on_wall = false;

do_roll = false;
do_roll_left = false;
roll_degree = 0;
roll_speed = 10;
max_roll_spd = 8;

collision = true;

bbox_w = bbox_right+1-bbox_left;
bbox_h = bbox_bottom+1-bbox_top;

input_jump = false;

run_dir = 1;