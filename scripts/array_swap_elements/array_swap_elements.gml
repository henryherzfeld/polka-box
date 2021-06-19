///description 
function array_swap_elements(argument0, argument1, argument2) {
	//@param0 array
	//@param1 idx1
	//@param2 idx2

	var arr = argument0;

	var idx1 = argument1;
	var idx2 = argument2;

	var temp = arr[idx1];

	arr[idx1] = arr[idx2];
	arr[idx2] = temp;

	return arr;


}
