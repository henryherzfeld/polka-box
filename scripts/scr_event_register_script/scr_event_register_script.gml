///@description event_register_script
///@arg0 event
///@arg1 id
///@arg2 script
///@arg arg1...*

with(events) {
	var event = argument[0];
	var obj_id = argument[1];
	
	if not ds_map_exists(event_map, event) {
		// add event to event map
		var listener_list = ds_list_create();
		ds_map_add_list(event_map, event, listener_list);
	} else {
		var listener_list = event_map[? event];
	}
	// add listener info	
	var listener_info = [];
	listener_info[0] = obj_id;
	
	var arg_len = argument_count-2;
	var i = 0; repeat(arg_len) {
		listener_info[i+1] = argument[i+2];
		i++;
	}
	ds_list_add(listener_list, listener_info);
}