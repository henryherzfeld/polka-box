

application_surface_draw_enable(false);

// silly alternate player check
if instance_find(polka_pt, 0) {
	player = polka_pt;
} else {
	player = polka_pt_rc;
}

room_list = [rm_platformer_test, rm_platformer_test_drawing];
in_pt_room = false;

// Check if we're in a platformer room as dictated by room_list
for(var i = 0; i < array_length_1d(room_list); i++) {
	if room == room_list[i] {
		in_pt_room = true;
	}
}

if not in_pt_room { instance_destroy(); }

trans_instances = ds_list_create();

// grab all still active instances, deactivate them
for(var j = 0; j < instance_count; j++) {
	curr_inst = instance_id[j];
	if curr_inst.persistent and curr_inst.object_index != obj_fm {
		instance_deactivate_object(curr_inst);
		trans_instances[| j] = curr_inst;
	}
}

// Create Camera
var inst = instance_create_layer(0, 0, "Meta", obj_camera_pt);
inst.persistent = false;
inst.following = player;

drawing = false;

coll_obj = obj_drawn_line;

var inst = instance_create_layer(0, 0, "Meta", coll_obj);
inst.visible = false;
coll_w = coll_obj.bbox_right+1-coll_obj.bbox_left;
coll_h = coll_obj.bbox_bottom+1-coll_obj.bbox_top;
coll_diag = sqrt(power(coll_w, 2) + power(coll_h, 2));
spd = 20;

path_position_margin = .1;

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

path_timeout = 3*room_speed;

n_paths = 0;
max_paths = 100;
max_path_objects = 15;

path_grid = ds_grid_create(max_paths, path.length);
// grid default value is 0, first drawn path index is 0, confusing checks for path existence
// following code addresses that
var i = 0;
repeat(max_paths) {
	path_grid[# i, path.path] = noone;
	i += 1;
}

path_idx = 0;
curr_path_idx = -1;

py = 0;
px = 0;

//pbar = instance_create_layer(0, 0, "Meta", obj_progress_bar);

max_line_len = 200;

path_ended_count = 0;
path_ended_timeout = 20;

grid_h = ds_grid_height(path_grid);

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

grab_coll_count_max = 10;
grab_coll_count = -1;

grab_resolution_dir = 0;
grab_resolution_x = 0;
grab_resolution_y = 0;

grab_resolution_spd = 6;