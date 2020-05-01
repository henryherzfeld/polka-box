///@description scr_array_sort(array, ascend)

///@arg0      array        array to sort, array
// @arg1      ascend       ascending (true) or descending (false) order, boolean
//
// GMLscripts.com/license

var array = argument0;
var ascend = argument1;
var list = ds_list_create();
var count = array_length_1d(array);
for (var i=0; i<count; i++) list[| i] = array[i];
ds_list_sort(list, ascend);
for (i=0; i<count; i++) array[i] = list[| i];
ds_list_destroy(list);
return array;
