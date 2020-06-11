/// @description Insert description here
// You can write your code in this editor

event_inherited();


var add_evi_select = false;

if build_menu {
	build_menu = false;

	switch type {
		case enum_question_type.evidence_checkbox: add_evi_select = true;
		case enum_question_type.checkbox: {
			var but_event = enum_button_event.quiz_checkbox;
			n = array_length_1d(question_data);
			break;
		}
		case enum_question_type.evidence_multi: add_evi_select = true;
		case enum_question_type.multi: {
			var but_event = enum_button_event.quiz_multi;
			n = 1;
			break;
		}
	}
	
	// handling button grid size for introduction of evidence select button
	if add_evi_select {
		button_grid = ds_grid_create(n+2, 6);
		scr_grid_add_button(1080, 300, "evidence", enum_button_type.click, enum_button_event.quiz_evidence, scr_open_evi_prompt);
	} else {
		button_grid = ds_grid_create(n+1, 6);
	}
	
	// handling adding timer, progress bar
	timer_ptr = instance_create_layer(0, 0, "Menus", obj_timer);
	if add_evi_select { timer_ptr.time = 30; } 
	else if obj_quiz_manager.fun_fact { timer_ptr.time = 10; } 
	else { timer_ptr.time = 20; }
	timer_ptr.start = true;
	timer_ptr.on_finish = [scr_change_variable, obj_quiz_manager.id, "submitted", true];
		
	progress_ptr = instance_create_layer(0, 0, "Menus", obj_progress_bar);
	progress_ptr.max_prog = obj_quiz_manager.n_questions;
	progress_ptr.prog_ptr = obj_quiz_manager;
	
	if but_event == enum_button_event.quiz_multi {
		// creating x and y coordinate arrays for radio buttons
		var xs = [];
		var ys = [];
		var answer_data = [];
		
		for(i = 0; i < array_length_1d(question_data); i++){
			answer_data[i] = i;
			xs[i] = 20;
			ys[i] = 250+i*100;
		}
		scr_grid_add_button(xs, ys, question_data, enum_button_type.radio, but_event, answer_data);
		
	} else {
		for(var i = 0; i < n; i++) {
			var option = question_data[i];

			scr_grid_add_button(20, 250+(i*100), option, enum_button_type.checkbox, but_event, i);
		}
	}
	
	scr_grid_add_button(1080, 600, "Submit", enum_button_type.click, enum_button_event.run_script,
						[scr_change_variable, obj_quiz_manager.id, "submitted", true]);
	window_map = ds_map_create();
	scr_add_window("Question", 0, 0, prompt);
	
	curr_window = "Question";
} 

if destroy_menu {
	instance_destroy(timer_ptr);
	instance_destroy(progress_ptr);
}