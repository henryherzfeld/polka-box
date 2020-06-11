///@description scr_add_question
///@arg0 ds_list
///@arg1 question_type
///@arg2 prompt
///@arg3 choices
///@arg4 answer
///@arg5 response


var list = argument0;
var type = argument1;
var prompt = argument2;
var choices = argument3;
var answer = argument4;
var response = argument5;

if response == noone {
	response = [];
}

var n = ds_list_size(list);

list[| n] = [type, prompt, choices, answer, response];