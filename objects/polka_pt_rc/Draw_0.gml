/// @description Insert description here

/// @description Insert description here

draw_self();

var bbox_width = bbox_right-bbox_left
var bbox_height = bbox_bottom-bbox_top


var bbox_xs = [x, x+bbox_width/2, y];
var i = 0;
repeat(3) {
	var bbox_x = bbox_xs[i];
	var inst = collision_line(bbox_x, y+bbox_height, bbox_x, y+bbox_height+32, par_slope, false, true);
	i++;
	
	if inst != noone {
		ds_list_add(inst_collision, inst);
	}
}

for(var j = 0; j < ds_list_size(inst_collision); j++) {
	var inst = inst_collision[| j];
}


if inst != noone {
	var inst_bbox_width = inst.bbox_right-inst.bbox_left;
	var inst_bbox_height = inst.bbox_bottom - inst.bbox_top;
	
	draw_line_color(x+bbox_width/3, y+bbox_height, x+bbox_width/3, y+bbox_height+32, c_red, c_red);
	draw_line_color(x+bbox_width*(2/3), y+bbox_height, x+bbox_width*(2/3), y+bbox_height+32, c_red, c_red);
	draw_rectangle_color(inst.x, inst.y+inst_bbox_height, inst.x+inst_bbox_width, inst.y, c_lime, c_lime, c_lime, c_lime, false);
}