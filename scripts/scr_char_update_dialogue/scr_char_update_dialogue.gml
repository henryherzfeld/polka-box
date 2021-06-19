////@description scr_char_update_dialogue
///@arg0 character
function scr_char_update_dialogue(argument0) {

	var char = argument0;

	var temp = dialogue.dialogues[? char];
	var idx = dialogue.idxs[? string(char)];
	char.text = temp[idx];

	return false;


}
