///@description scr_add_question_sprite
///@arg0 ds_list
///@arg1 sprite
var list = argument0;

var n = ds_list_size(list)-1;

var question = list[| n];

var temp = question[1];

question[1] = [temp, argument1];

list[| n] = question;