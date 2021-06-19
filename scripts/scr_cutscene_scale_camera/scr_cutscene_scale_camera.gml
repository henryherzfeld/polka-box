///@description cutscene_scale_camera
///@arg scale percentage
///@arg speed
function scr_cutscene_scale_camera(argument0, argument1) {

	var scale = argument0;
	var spd = argument1 / 100;
	var cam = view_camera[0];
	var view_h = camera_get_view_height(cam);
	var view_w = camera_get_view_width(cam);

	// setting scale, base view in cutscene obj
	// scale change is one time bool flag in custscene lifetime for base view value
	if not scale_change { 
		scale_change = true;
		base_view_h = view_h;
		base_view_w = view_w;
	} 

	var target_h = base_view_h * scale;
	var target_w = base_view_w * scale;

	var curr_scale = view_h / base_view_h;

	var diff = sign(curr_scale-scale);

	var new_h = view_h + (spd*(-diff)*base_view_h);
	var new_w = view_w + (spd*(-diff)*base_view_w);

	if (diff == 1 and new_h < target_h) or (diff == -1 and new_h > target_h) or diff == 0 {
		camera_set_view_size(cam, target_w, target_h);
		scr_cutscene_end_action();
	} else {
		camera_set_view_size(cam, new_w, new_h);	
	}


}
