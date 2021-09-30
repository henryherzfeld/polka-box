draw_set_font(font_small);

application_surface_draw_enable(false);

// silly alternate player check
if instance_find(polka_pt, 0) {
	player = polka_pt;
} else {
	player = polka_pt_rc;
}

// @@@@@@@@@@@@ DEBUG @@@@@@@@@@@@@@@
debug_path_timeout = false;
debug_time_slowed = false;
player.move_override = false;
global.debug = true;


checkpoint = -1;
checkpoint_spawn_x = 0;
checkpoint_spawn_y = 0;
spawn_x = 0;
spawn_y = 0;
initial_spawn_room = room;
spawn_room = room;
checkpoint_spawn_room = room;
black_alpha = 0;
line_slowdown_spd = 25;

_lives = 1;
coins = 0;
star_coins = 0;

snapshot_exists = false;
room_snapshot = noone;

// line drawing and placement
mx_prev = 0;
my_prev = 0;
camx_prev = 0;
camy_prev = 0;

room_list = [rm_platformer_test, rm_platformer_test_drawing];
in_pt_room = false;

// Check if we're in a platformer room as dictated by room_list
for(var i = 0; i < array_length_1d(room_list); i++) {
	if room == room_list[i] {
		in_pt_room = true;
	}
}

if not in_pt_room { instance_destroy(); }

// grab all still active instances, deactivate them and put in trans_instances
trans_instances = ds_list_create();
var curr_inst;
var j = 0;
repeat(instance_count) {
	curr_inst = instance_find(all, j);
	if curr_inst.persistent and curr_inst.object_index != obj_fm and curr_inst.object_index != game_pt {
		instance_deactivate_object(curr_inst);
		trans_instances[| j] = curr_inst;
	}
	j++;
}

// Create Camera
var inst = instance_create_layer(0, 0, "Meta", obj_camera_pt);
inst.following = player;


drawing = false;
draw_count_max = 60*1.45;
draw_count = draw_count_max;

coll_obj = obj_drawn_line;

var inst = instance_create_layer(0, 0, "Meta", coll_obj);
inst.visible = false;
coll_w = coll_obj.bbox_right+1-coll_obj.bbox_left;
coll_h = coll_obj.bbox_bottom+1-coll_obj.bbox_top;
coll_diag = sqrt(power(coll_w, 2) + power(coll_h, 2));
spd = 15;

path_position_margin = .2;

do_transition = false;

enum path {
	path,
	angle,
	time,
	type,
	objects,
	length
}

enum path_type {
	normal,
	slide,
	wall
}

path_timeout = 3*60;

n_paths = 0;
max_paths = 100;
max_path_objects = 15;

path_grid = ds_grid_create(max_paths, path.length);
// grid default value is 0, first drawn path index is 0, confusing checks for path existence
// following code addresses that
var i = 0;
repeat(max_paths) {
	path_grid[# i, path.path] = noone;
	path_grid[# i, path.objects] = array_create(max_path_objects, noone);
	i += 1;
}

path_idx = 0;
curr_path_idx = -1;

closest_calc_counter = 0;
closest = 0;
py = 0;
px = 0;

//pbar = instance_create_layer(0, 0, "Meta", obj_progress_bar);

max_line_len = 200;

path_ended_count = 0;
path_ended_timeout = 12;

grid_h = ds_grid_height(path_grid);

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

path_coll_count_max = 20;
path_coll_count = -1;

grab_resolution_dir = 0;
grab_resolution_x = 0;
grab_resolution_y = 0;

grab_resolution_spd = 6;