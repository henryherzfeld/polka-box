/// @description Insert description here
// You can write your code in this editor

name = "Anonymous";
scripts = -1;

portraits = array_create(enum_portrait.length, spr_portrait);

textbox = spr_textbox_grey;

var temp = dialogue.dialogues[? object_index];
var idx = dialogue.idxs[? string(object_index)];
text = temp[idx];

scr_event_register_script(event.talk, id, scr_char_update_dialogue, object_index);