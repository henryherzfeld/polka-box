/// @description Init
// You can write your code in this editor

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

name = game.name;
portraits = array_create(enum_portrait.length, spr_portrait_polka);
facing = -1;

curr_x = 0;
curr_y = 0;

walk_front = spr_polka_walk_front;
walk_back = spr_polka_walk_back;
walk_left = spr_polka_walk_left;
walk_right = spr_polka_walk_right;

stand_front = spr_polka_stand_right;
stand_back = spr_polka_stand_right;
stand_left = spr_polka_stand_right;
stand_right = spr_polka_stand_right;

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