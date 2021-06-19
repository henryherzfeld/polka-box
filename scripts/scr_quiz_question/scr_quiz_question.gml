///@description scr_quiz_question
///@arg1 question_type
///@arg2 prompt
///@arg3 choices
///@arg4 answer
function scr_quiz_question(argument0, argument1, argument2, argument3) {

	var type = argument0;
	var prompt = argument1;
	var choices = argument2;
	var answer = argument3;

	var list = ds_factory.list_ptr;

	var n = ds_list_size(list);
	if type == enum_question_type.evidence {
		list[| n] = [type, answer, []];
	} else {
		list[| n] = [type, prompt, choices, answer, []];
	}



}
