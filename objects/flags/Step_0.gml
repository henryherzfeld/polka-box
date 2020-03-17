
if(objective_change){
	for(var i = 0; i < enum_objective_type.length; i++){
		if(scr_check_objective(i)){
			show_debug_message(objectives);
			objective = i;
			objective_text = ds_grid_get(objectives, i, enum_objective_state.text);
			objective_phase = scr_check_objective_phase(i);
		}
	}
	
	//send_event("Objective", objective, "na")
	progress += 1;
	objective_change = false;
}
