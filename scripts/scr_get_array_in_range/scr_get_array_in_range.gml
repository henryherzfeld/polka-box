// Script assets have changed for v2.3.0 see
///@arg0 start
///@arg1 stop
///@arg2 *step
function scr_get_array_in_range(){
	
	var start = argument[0];
	var stop = argument[1];
	var step = (argument_count > 2 ? argument[2]: 1)
	
	var n = (stop-start) div step
	var ret = array_create(n, 0);
	var i = 0;
	var curr = start;
	repeat(n) {
		ret[i] = curr;
		curr += step;
		i += 1;
	}
	
	return ret;
}