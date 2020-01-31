/// @description Insert description here

if(!debug) {exit;}

with(obj_collision){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);	
}

with(obj_transition){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, true);	
}

with(obj_trigger){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_purple, c_purple, c_purple, c_purple, true);
}

with(polka){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);	
}