///@description script_execute with any number of params
///@arg data
var data = argument0
var len = array_length_1d(data) - 1;


switch(len){
	case 0: script_execute(data[0]); break;
	case 1: script_execute(data[0], data[1]); break;
	case 2: script_execute(data[0], data[1], data[2]); break;
	case 3: script_execute(data[0], data[1], data[2], data[3]); break;
	case 4: script_execute(data[0], data[1], data[2], data[3], data[4]); break;
	case 5: script_execute(data[0], data[1], data[2], data[3], data[4], data[5]); break;
}