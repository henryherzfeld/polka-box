///@description script_execute with up to 6 params
///@arg data
function scr_script_execute_array_1d(argument0) {

	var data = argument0
	var len = array_length_1d(data) - 1;

	switch(len){
		case 0: return script_execute(data[0]); break;
		case 1: return script_execute(data[0], data[1]); break;
		case 2: return script_execute(data[0], data[1], data[2]); break;
		case 3: return script_execute(data[0], data[1], data[2], data[3]); break;
		case 4: return script_execute(data[0], data[1], data[2], data[3], data[4]); break;
		case 5: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5]); break;
		case 6: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5], data[6]); break;
		case 7: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]); break;
		case 8: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8]); break;
		case 9: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9]); break;
		case 10: return script_execute(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10]); break;
	}


}
