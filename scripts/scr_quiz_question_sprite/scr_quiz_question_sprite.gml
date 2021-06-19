///@description scr_quiz_question_sprite
///@arg0 sprite
function scr_quiz_question_sprite(argument0) {
	var list = ds_factory.list_ptr;

	var n = ds_list_size(list)-1;

	var question = list[| n];

	var temp = question[1];

	question[1] = [temp, argument0];

	list[| n] = question;


}
