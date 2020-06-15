///@description scr_event_fire
///@arg event

with(events) {
	var event = argument0;
	if ds_map_exists(event_map, event) {
		var listener_list = event_map[? event];
		var len_list = ds_list_size(listener_list);
		
		var listener_info, listener, script, args;
		var i = 0; repeat(len_list) {
			listener_info = listener_list[| i];
			listener = listener_info[0];
			script = listener_info[1];
			
			var len_args = array_length_1d(listener_info) - 2;
			var unregister = false;
			if len_args <= 0 {
				if instance_exists(listener) {
					with(listener) unregister = script_execute(script);
				} else unregister = true;
			} else {
				if instance_exists(listener) {
					args = array_create(len_args+1, 0);
					args[0] = script;
					array_copy(args, 1, listener_info, 2, len_args);
					with(listener) unregister = scr_script_execute_array_1d(args);
				} else unregister = true;
			}
			
			if unregister {
				scr_event_unregister_script(event, listener);
				i--;
			}
			i++;
		}
		
	}
}