////@description scr_char_change_dialogue
///@arg0 char
///@rand_min
///@rand_max
function scr_char_change_dialogue_randrange(argument0, argument1, argument2) {

	var char = argument0;
	var idx = irandom_range(argument1, argument2);

	scr_char_change_dialogue(char, idx);


}
