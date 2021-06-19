/// @description Init
// You can write your code in this editor
event_inherited();

itemEquiped = noone;		//Variable to store type of item from inventory to player,Default we have equided nothing
spd = 2.5
x_move = 0;
y_move = 0;
in_dialogue = false;
interactable = false;
move_override = false;
moving = false;
radius = 30;
npc = noone;
chest = noone;

name = game.name;
portraits = array_create(enum_portrait.length, spr_portrait_polka);
facing = dir.down;

curr_x = 0;
curr_y = 0;

if game.mode == "pb" {
	walk_front = spr_polka_walk_front;
	walk_back = spr_polka_walk_back;
	walk_left = spr_polka_walk_left;
	walk_right = spr_polka_walk_right;

	stand_front = spr_polka_stand_right;
	stand_back = spr_polka_stand_right;
	stand_left = spr_polka_stand_left;
	stand_right = spr_polka_stand_right;
} else if game.mode == "mtv" {

	walk_front = spr_villy_walk_front;
	walk_back = spr_villy_walk_back;
	walk_left = spr_villy_walk_left;
	walk_right = spr_villy_walk_right;

	stand_front = spr_villy_stand_front;
	stand_back = spr_villy_stand_back;
	stand_left = spr_villy_stand_left;
	stand_right = spr_villy_stand_right;
}

boop_front = spr_villy_boop_front;
boop_back = spr_villy_boop_back;
boop_left = spr_villy_boop_left;
boop_right = spr_villy_boop_right;

sprite_index = stand_right;

sprite_prev = sprite_index;

input_space = false;

//dash
prev_x = -1;
prev_y = -1;
dash_time = 25;
dash = false;
dash_delay = 7;
dash_count = -1;
dx = 0;
dy = 0;
dash_distance = 25;

invincible = false;
inv_count = 0;
inv_bool = false;

//tree planting
curr_tree = noone;