///@description scr_add_question_response
///@arg0 ds_list
///@arg1 correct_response
///@arg2 incorrect_response

var list = argument0;
var correct_response = argument1;
var incorrect_response = argument2;

if correct_response == noone { exit; }

var n = ds_list_size(list)-1;

var question = list[| n];

var k = 4;
if question[0] == enum_question_type.evidence { k = 2; }

if incorrect_response == noone {
	question[k] = [correct_response];
} else {
	question[k] = [correct_response, incorrect_response];
}

list[| n] = question;