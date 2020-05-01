/// @description Insert description here
// You can write your code in this editor

event_inherited();

par_ptr = par_menu;

if build_menu {
	build_menu = false;
	
	n = array_length_1d(question_data);
	button_grid = ds_grid_create(n+1, 6);

	switch type {
		case enum_question_type.checkbox: {
			var but_event = enum_button_event.quiz_checkbox;
			break;
		}
		case enum_question_type.multi: {
			var but_event = enum_button_event.quiz_multi;
			break;
		}
	}
	
	for(var i = 0; i < n; i++) {
		var option = question_data[i];
		scr_grid_add_button(200, i*100, option, enum_button_type.checkbox, but_event, i);
	}
	
	scr_grid_add_button(200, 600, "Submit", enum_button_type.click, enum_button_event.exit_, noone);
	window_map = ds_map_create();
	scr_add_window("Question", 0, 0, prompt);
	
	par_ptr.curr_window = "Question";
}