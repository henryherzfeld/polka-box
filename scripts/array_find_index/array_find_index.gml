/// @function array_find_index(array,index);
/// @description Remove item from the inventory
/// @param {real} array Array 
/// @param {real} type Type of the item
for (var i = 0; i < array_length_1d(argument0); ++i) {
    //
	if (argument0[i] == argument1) {
	    // Find the item, return the index where the item is in the array
		return i;
	}
}

//Nothinf found return -1
return -1;