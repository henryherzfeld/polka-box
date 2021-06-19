/// @function array_replace_value(array,old value,new value);
/// @description Replace the old value with new value in the array
/// @param {real} array Array 
/// @param {real} real Old value in array
/// @param {real} real New Value in array
function array_replace_value() {

	var _array = argument[0];
	var _oldVal = argument[1];
	var _newVal = argument[2];

	//Find the index of the old value in the array
	var _index = array_find_index(_array,_oldVal);
	//If no index is found, failed
	if (_index == -1) {
	    //Replace
		return -1;
	}

	//Index fround replace value 
	_array[@ _index] = _newVal;
	return true;


}
