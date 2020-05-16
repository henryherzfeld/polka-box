/// @description Insert description here
// You can write your code in this editor

event_inherited();

par_ptr = par_menu;
var add_evi_select_but = false;

if build_menu {
	build_menu = false;


	switch type {
		case enum_question_type.evidence_checkbox: add_evi_select_but = true;
		case enum_question_type.checkbox: {
			var but_event = enum_button_event.quiz_checkbox;
			n = array_length_1d(question_data);
			break;
		}
		case enum_question_type.evidence_multi: add_evi_select_but = true;
		case enum_question_type.multi: {
			var but_event = enum_button_event.quiz_multi;
			n = 1;
			break;
		}
	}
	
	// handling button grid size for introduction of evidence select button
	if add_evi_select_but {
		button_grid = ds_grid_create(n+2, 6);
		scr_grid_add_button(0, 0, "evidence", enum_button_type.click, enum_button_event.quiz_evidence, scr_open_evi_prompt);
	} else {
		button_grid = ds_grid_create(n+1, 6);
	}
	
	// handling adding timer if in particular phase
	if flags.objective_phase == enum_phase_type.miscellaneous {
		timer_ptr = instance_create_layer(0, 0, "Menus", obj_timer);
		timer_ptr.time = 5;
		timer_ptr.xx = 500;
		timer_ptr.yy = 40;
		timer_ptr.start = true;
		//timer_ptr.on_finish = [scr_change_variable, object_get_parent(id).id, "destroy_menu", true];
	}
	
	
	if but_event == enum_button_event.quiz_multi {
		// creating x and y coordinate arrays for radio buttons
		var xs = [];
		var ys = [];
		var answer_data = [];
		
		for(i = 0; i < array_length_1d(question_data); i++){
			answer_data[i] = i;
			xs[i] = 200;
			ys[i] = i*100;
		}
		scr_grid_add_button(xs, ys, question_data, enum_button_type.radio, but_event, answer_data);
		
	} else {
		for(var i = 0; i < n; i++) {
			var option = question_data[i];

			scr_grid_add_button(200, i*100, option, enum_button_type.checkbox, but_event, i);
		}
	}
	
	scr_grid_add_button(200, 600, "Submit", enum_button_type.click, enum_button_event.run_script_exit,
						[scr_change_variable, obj_quiz_manager.id, "submitted", true]);
	window_map = ds_map_create();
	scr_add_window("Question", 0, 0, prompt);
	
	par_ptr.curr_window = "Question";
}

if destroy_menu {
	instance_destroy(timer_ptr);
}