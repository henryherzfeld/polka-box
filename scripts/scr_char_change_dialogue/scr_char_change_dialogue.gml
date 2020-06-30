////@description scr_char_change_dialogue
///@arg0 char
///@arg1 new_index

var char = argument0;
show_debug_message(ds_exists(dialogue.idxs, ds_type_map));
dialogue.idxs[? string(char)] = argument1;