
if(objective_change or objective_update){
	for(var i = 0; i < enum_objective_type.length; i++){
		if(scr_check_objective(i)){
			
			objective = i;
			if(objective_update) { progress = i }
			objective_text = ds_grid_get(objectives, i, enum_objective_state.text);
			
			// using temp to test for a change in objective phase, if so fire off a notification
			var temp = scr_get_objective_phase(i);
			
			
			if(objective_phase != temp) {
				objective_phase = temp;
				
				// updating text
				objective_phase_text = scr_get_phase_state(temp, enum_phase_state.text);
				
				// getting colors of phase for notification
				var noti_bg_col = scr_get_phase_state(objective_phase, enum_phase_state.bg_color);
				var noti_text_col = scr_get_phase_state(objective_phase, enum_phase_state.text_color);

				scr_fire_lg_noti("New Phase: " + objective_phase_text, noti_bg_col, noti_text_col);
			}
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