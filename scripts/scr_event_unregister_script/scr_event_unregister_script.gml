///@description scr_event_unregister_script
///@arg0 event
///@arg1 id

with(events) {
	var event = argument0;
	var obj_id = argument1;
	
	// get listeners from event_map
	if ds_map_exists(event_map, event) {
		var listener_list = event_map[? event];
		var len_list = ds_list_size(listener_list);
		
		var i = 0; repeat(len_list) {
			var listener_info = listener_list[| i];
			if listener_info[0] == obj_id {
				if len_list == 1 {
					ds_list_destroy(listener_list);
					ds_map_delete(event_map, event);
				} else ds_list_delete(listener_list, i);
				break;
			}
			i++;
		}
	}
}