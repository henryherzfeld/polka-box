///@description scr_add_question
///@arg0 ds_list
///@arg1 question_type
///@arg2 prompt
///@arg3 choices
///@arg4 answer

var list = argument0;
var type = argument1;
var prompt = argument2;
var choices = argument3;
var answer = argument4;

var n = ds_list_size(list);
if type == enum_question_type.evidence {
	list[| n] = [type, answer, []];
} else {
	list[| n] = [type, prompt, choices, answer, []];
}
