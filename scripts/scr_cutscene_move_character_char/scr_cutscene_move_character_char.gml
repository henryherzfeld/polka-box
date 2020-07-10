///@description move polka
///@arg obj
///@arg char
///@arg relative?
///@arg speed

var obj = argument0;
var char = argument1;
var relative = argument2;
var spd = argument3;

scr_cutscene_move_character(obj, char.x, char.y, relative, spd);