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

var xx = 0;
var yy = 0;
var cs = obj_tile_manager.cell_size;

var xr = room_width div cs;
repeat(xr) {
	draw_line_color(xx, 0, xx, room_height, c_black, c_black);	
	xx += cs;
}

var yr = room_height div cs;
repeat(yr){
	draw_line_color(0, yy, room_width, yy, c_black, c_black)
	yy += cs;
}
