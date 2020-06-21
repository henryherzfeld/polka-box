/// @description Insert description here
var grid = quests_grid;

var i = 0; repeat(quests_grid_n) {
	
	if update_map[? i] { register_events = true; }
	
	var step = grid[# 1, i]
	var objectives = grid[# 2, i];
	var objectives_n = array_length_1d(objectives);
	var ev;
	
	switch(i) {
		#region test1
		case quest.test1:
			switch(step) {
				case 0: ev = event.find_poppy;
				break;
				case 1: ev = event.pause;
				break;
				case 2: ev = event.pause;
				break;
			}

		if register_events and step < objectives_n {
			show_debug_message("here");
			scr_event_register_script(ev, quests, scr_progress_quest, quest.test1);
			scr_activate_objective(objectives[step]);
		}
		break;
		#endregion
	
		#region test2
		case quest.test2:
		break;
		#endregion
	}
	
	i++;
	register_events = false;
}

ds_map_clear(update_map);
