/// @description Insert description here
// You can write your code in this editor

name = "Anonymous";
scripts = -1;

portraits = array_create(enum_portrait.length, spr_portrait);

walk_back = spr_villy_walk_back;
walk_front  = spr_villy_walk_front;
walk_left = spr_villy_walk_left;
walk_right = spr_villy_walk_right;

stand_back = spr_villy_stand_back;
stand_front = spr_villy_stand_front;
stand_left = spr_villy_stand_left;
stand_right = spr_villy_stand_right;

textbox = spr_textbox_grey;

var temp = dialogue.dialogues[? object_index];
var idx = dialogue.idxs[? string(object_index)];
text = temp[idx];

//scr_event_register_script(event.talk, id, scr_char_update_dialogue, object_index);
coll = instance_create_layer(x, y, "Characters", obj_collision);