
if(objective_change){

	objective_text = ds_grid_get(objectives, objective, enum_objective_state.text);
			
	// using temp to test for a change in objective phase, if so fire off a notification
	var temp = scr_get_objective_phase(objective);
			
	if(objective_phase != temp) {
		objective_phase = temp;
				
		// updating text
		objective_phase_text = scr_get_phase_state(temp, enum_phase_state.text);
				
		// getting colors of phase for notification
		var noti_bg_col = scr_get_phase_state(objective_phase, enum_phase_state.bg_color);
		var noti_text_col = scr_get_phase_state(objective_phase, enum_phase_state.text_color);

		//scr_fire_lg_noti("New Phase: " + objective_phase_text, noti_bg_col, noti_text_col);

	}
	

	//send_event("Objective", objective, "na")
	progress += 1;
	objective_change = false;
	obj_overlay.objective_change = true;

}

if (game.pause){
	time = paused_time;
} else {
	paused_time = -1;
}


if hearts_diff != hearts {
	hearts_diff = hearts;
	
	// out of hearts
	if hearts <= 0 {
		obj_quiz_manager.no_match_response = false;
		scr_destroy_meta();
		game.game_over_bg = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);
		game.alarm[1] = room_speed*3;

	} else if hearts == 3 {
		scr_fire_sm_noti("Only Three Hearts Remaining!");
	}
}

