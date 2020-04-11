
if(objective_change or objective_update){
	for(var i = 0; i < enum_objective_type.length; i++){
		if(scr_check_objective(i)){
			
			objective = i;
			if(objective_update) {progress = i }
			objective_text = ds_grid_get(objectives, i, enum_objective_state.text);
			
			// using temp to test for a change in objective phase, if so fire off a small notification
			var temp = scr_check_objective_phase(i)
			objective_phase_text = objective_phase_texts[temp];
			
			if(objective_phase != temp){
				scr_fire_sm_noti("New Phase: " + objective_phase_text);
			}
			
			objective_phase = scr_check_objective_phase(i);
		}
	}
	
	if(objective_change){
		//send_event("Objective", objective, "na")
		progress += 1;
		objective_change = false;
	} else{
	objective_update = false;
	}
}

if (game.pause){
	time = paused_time;
} else {
	paused_time = -1;
}