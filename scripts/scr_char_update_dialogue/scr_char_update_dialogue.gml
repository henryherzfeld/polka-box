////@description scr_char_update_dialogue
///@arg0 character

var char = argument0;

var temp = dialogue.dialogues[? char.object_index];
var idx = dialogue.idxs[? char.object_index];
char.text = temp[idx];