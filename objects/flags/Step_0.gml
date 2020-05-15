
if(objective_change or objective_update){
	for(var i = 0; i < enum_objective_type.length; i++){
		if(scr_check_objective(i)){
			
			objective = i;
			if(objective_update) {progress = i }
			objective_text = ds_grid_get(objectives, i, enum_objective_state.text);
			
			// using temp to test for a change in objective phase, if so fire off a small notification
			var temp = scr_get_objective_phase(i)
			objective_phase_text = scr_get_phase_state(temp, enum_phase_state.text);
			
			if(objective_phase != temp){
				show_debug_message(objective_phase_text);
				scr_fire_lg_noti("New Phase: " + objective_phase_text);
			}
			
			objective_phase = scr_get_objective_phase(i);
		}
	}
	
	if(objective_change){
		//send_event("Objective", objective, "na")
		progress += 1;
		objective_change = false;
		obj_overlay.objective_change = true;
	} else{
	objective_update = false;
	}
}

if (game.pause){
	time = paused_time;
} else {
	paused_time = -1;
}