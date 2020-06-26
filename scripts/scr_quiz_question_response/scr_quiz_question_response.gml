///@description scr_quiz_question_response
///@arg0 correct_response
///@arg1 incorrect_response

var correct_response = argument0;
var incorrect_response = argument1;
var list = ds_factory.list_ptr;

if correct_response == noone { exit; }

if not is_array(correct_response) {
	correct_response = [correct_response];
}

if not is_array(incorrect_response) {
	incorrect_response = [incorrect_response];
}

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