/// @description Insert description here
// You can write your code in this editor

event_inherited();

default_ = digged_in_soil_tile;

trees = [
		default_,
		spr_peace_lily,
		spr_gerbera_daisy,
		spr_snake_plant,
]

n_trees = array_length_1d(trees);

trees_w = array_create(n_trees);
trees_h = array_create(n_trees);

for(var i = 0; i < n_trees; i++){
	var curr = trees[i];
	trees_w[i] = sprite_get_width(curr);
	trees_h[i] = sprite_get_height(curr);
}

curr_tree = 0;

outline = false;
lock = false;
tree_change = false;