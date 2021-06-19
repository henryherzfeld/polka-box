/// @description Insert description here
// You can write your code in this editor

planted_count = 0;
update_count = 0;
interval = 50;

n = instance_number(obj_plantable_tree);
n_tree_opts = array_length_1d(instance_find(obj_plantable_tree, 0).trees);

is_done = false;

//audio
minigame_music = snd_loop;

audio_stop_sound(game.main_music);
sound_loop(minigame_music);

//creating progress bar for planted trees
pbar_ptr = instance_create_layer(0, 0, "Menus", obj_progress_bar);
pbar_ptr.max_prog = n
pbar_ptr.prog = -1;
pbar_ptr.bar = spr_pbar_bg_big;
prog_change = false;
anim_interval = 6;
pbar_text = "Trees Planted"
pbar_text_w = string_width(pbar_text);

//particle systems
planting_sys_ptr = part_system_create();
part_system_position(planting_sys_ptr, -200, -200);
emitter_ptr = part_emitter_create(planting_sys_ptr);

particle1_idx = part_type_create();
part_type_shape(particle1_idx, pt_shape_cloud);
part_type_size(particle1_idx, .1, .2, .02, .001);
part_type_speed(particle1_idx, 1, 1.1, 0, 0);
part_type_color2(particle1_idx, c_white, c_gray)
part_type_direction(particle1_idx, 0, 360, 0, 0);
part_type_orientation(particle1_idx, 0, 360, 0, 0, true)
part_type_life(particle1_idx, .3*room_speed, .4*room_speed);
part_type_alpha2(particle1_idx, 1, .2);

particle2_idx = part_type_create();
part_type_shape(particle2_idx, pt_shape_cloud);
part_type_size(particle2_idx, .1, .2, .02, .001);
part_type_speed(particle2_idx, 1.2, 1.4, 0, 0);
part_type_color_rgb(particle2_idx, 133, 133, 87, 87, 35, 35);
part_type_direction(particle2_idx, 0, 360, 0, 0);
part_type_orientation(particle2_idx, 0, 360, 0, 0, true)
part_type_life(particle2_idx, .3*room_speed, .4*room_speed);
part_type_alpha2(particle2_idx, 1, 0);

particle_count = 0;
interval_max = 5;
interval_min = 1;
interval = irandom_range(interval_max, interval_min);