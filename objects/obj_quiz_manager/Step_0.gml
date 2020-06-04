/// @description Insert description here

if questions != noone and !response {
	if initial {
		initial = false;
		n_questions = ds_list_size(questions);
		question_change = true;
		
		if fun_fact { polka.move_override = true; }
		instance_deactivate_object(obj_textbox);
	}
	
	var curr_question = questions[| question_idx]
	prog = question_idx;
	
	if question_change {
		question_change = false;
		
		// get dialogue data from question data
		var n_current_question = array_length_1d(curr_question) - 1;
		question_dialogue = curr_question[n_current_question];
		
		// enable bools for available responses
		var n_question_dialogue = array_length_1d(question_dialogue);

		switch n_question_dialogue {
			case 1: no_match_response = false; match_response = true; break;
			case 2: no_match_response = true;  match_response = true; break;
		}
		
		switch curr_question[0] {
			
			case enum_question_type.evidence: {

				target = curr_question[1];
				pending_choice = true;
			
				// enable evidence choice prompt
				with(obj_notebook){
					draw_evidence = true;
				}
				break;
			}
			case enum_question_type.evidence_checkbox:
			case enum_question_type.checkbox: {
				choice = [];
			}
			case enum_question_type.evidence_multi:
			case enum_question_type.multi: {
				var inst = instance_create_layer(0, 0, "Menus", menu_quiz);
				inst.type = curr_question[0];
				inst.prompt = curr_question[1];
				inst.question_data = curr_question[2];
				inst.build_menu = true;
				
				target = curr_question[3];
				pending_choice = true;
				break;
			}
		}
	}

	// checking if we made a choice for our prompt
	if pending_choice {
		
		// finding the evidence button and setting its sprite
		// this is pretty inefficient
		if evi_choice != noone {
			var evidence_choice = evi_choice;
			with par_button {
				if event == enum_button_event.quiz_evidence {
					var spr = obj_notebook.evi_def[evidence_choice, enum_evi_state.sprite];
					sprite_draw = spr;
				}
			}
		}
		
		// we assume there is no evidence prompt
		var evidence = false;
		
		// testing type of question against provided answer
		switch curr_question[0] {
			case enum_question_type.evidence_checkbox: var evidence = true;
			case enum_question_type.checkbox: {
				show_debug_message(target);
				// if there is an evidence prompt unpack target array to target_temp
				// otherwise just assign target_temp the target array
				if evidence { var button_target = target[1]; } 
				else { var button_target = target; }

				var n_target = array_length_1d(button_target);
				var n_choice = array_length_1d(choice);
				
				// assume choice match is true
				var choice_match = true;
				
				show_debug_message([n_choice, n_target]);
				if n_choice != n_target {
					choice_match = false;
				} else {
					var choice_sorted = scr_array_sort(choice, true);
					
					for(var i = 0; i < n_choice; i++){
						
						if choice_sorted[i] != button_target[i] {
							choice_match = false;
						}
					}					
				} 
				
				// if there is an evidence prompt test if theres an evi_match
				// otherwise just default to true
				if evidence {
					if target[0] == evi_choice { var evi_match = true;} 
					else { var evi_match = false; }
				} else {
					var evi_match = true;
				}
					
				if choice_match and evi_match {
					match = true;
					show_debug_message("match");
				} else {
					match = false;
				}
				break;
			}
			case enum_question_type.evidence: {
				if(evi_choice != noone){
					if(evi_choice == target){
						match = true;
						show_debug_message("match");
					} else {
						match = false;
					}
				}
				break;
			}	
			case enum_question_type.evidence_multi: {
				if evi_choice != noone {
					if evi_choice == target[0] and choice == target[1] {
						match = true;
						show_debug_message("match");		
					} else {
						match = false;
					}
				}
				break;
			}
			case enum_question_type.multi: {
				show_debug_message(choice)
				if(choice != noone){
					if(choice == target){
						match = true;
						show_debug_message("match");
					} else {
						match = false;
					}
				}
				break;
			}
		}
		
		if submitted {
		
			submitted = false;
			pending_choice = false;
			choice = noone; 
			evi_choice = noone;
			question_change = true;
			
			var inst = instance_find(menu_quiz, 0)
				if inst != noone {
					show_debug_message("destroying menu");
					inst.destroy_menu = true;
			}
			
			if match {
				match = false;
				show_debug_message("MATCH");
				
				if match_response {
					response = true;
					question_change = false;
					match_response = false; no_match_response = false;
					scr_create_quiz_response(question_dialogue[0], quizzer_id);
					show_debug_message("match response");
				}
				
				// move forward in the question array or finish quiz
				if question_idx < n_questions - 1{
					question_idx += 1;
				} else {
					initial = true;
					question_idx = 0;
					questions = noone;
					question_change = false;
					
					if fun_fact { 
						fun_fact = false;
						scr_fire_sm_noti("Correct Answer");
						polka.move_override = false;
					} 
					else if textbox_ptr != noone {
						instance_activate_object(textbox_ptr);
						polka.in_dialogue = true;
						polka.interactable = true;
						InventoryManager.disable = true;
						textbox_ptr.alarm[1] = 1;
						textbox_ptr = noone;
					}
				}
			} else {
				// incorrect answer
				if fun_fact { 
					scr_fire_sm_noti("Incorrect Answer");
					questions = noone;
					initial = true;
					polka.move_override = false;
					question_idx = 0;
					questions = noone;
					question_change = false;
					fun_fact = false;
				}   // test phase to determine if heart removed
				else if flags.objective_phase == enum_phase_type.miscellaneous {
					flags.hearts -= 1;
				}
			}
			
			if no_match_response {
				scr_create_quiz_response(question_dialogue[1], quizzer_id);
				response = true;
				match_response = false; no_match_response = false;
				show_debug_message("no match response");
			}
		}
	}
}