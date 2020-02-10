/// @description Insert description here
// You can write your code in this editor

if(collision_rectangle(x-coll_range, y-coll_range + 30, x+coll_range, y+coll_range + 40, polka, false, true)){
	draw = true;
	
	if(anim_count >= spacing){
	anim_count -= spd;	
	}
	
} else {
	draw = false;	
	anim_count = anim_max;
}

rect_x = gui_width - anim_count;
rect_y = gui_height - anim_count;