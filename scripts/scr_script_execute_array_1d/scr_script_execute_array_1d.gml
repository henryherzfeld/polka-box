///@description script_execute with up to 6 params
///@arg data

var data = argument0
var len = array_length_1d(data) - 1;

switch(len){
	case 0: return script_execute(data[0]); break;
	case 1: return script_execute(data[0], data[1]); break;
	case 2: return script_execute(data[0], data[1], data[2]); break;
	case 3: return script_execute(data[0], data[1], data[2], data[3]); break;
	case 4: return script_execute(data[0], data[1], data[2], data[3], data[4]); break;
	case 5: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5]); break;
}