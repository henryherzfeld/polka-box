/// @description Insert description here

if questions != noone and !response {
	if initial {
		initial = false;
		n_questions = ds_list_size(questions);
		question_change = true;
		instance_deactivate_object(obj_textbox);
	}
	
	var curr_question = questions[| question_idx]
	
	if question_change {
		question_change = false;
		
		// get dialogue data from question data
		var n_current_question = array_length_1d(curr_question) - 1;
		question_dialogue = curr_question[n_current_question];
		
		// enable bools for available responses
		var n_question_dialogue = array_length_1d(question_dialogue);
		show_debug_message(n_question_dialogue);
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

			case enum_question_type.checkbox: {
				choice = [];
			}

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
		
		// testing type of question against provided answer
		switch curr_question[0] {
			case enum_question_type.checkbox: {
				var n_target = array_length_1d(target);
				var n_choice = array_length_1d(choice);
				
				if n_target == n_choice { 
					choice = scr_array_sort(choice, true); 
				
					var limit = min(n_target, n_choice);
					
					
					var count = 0;
					for(var i = 0; i < limit; i++){
						if choice[i] == target[i] {
							count += 1;
						}
					}
					if count == n_target {
						match = true;
						show_debug_message("match");
					}
				} 
				break;
			}
			case enum_question_type.multi:
			case enum_question_type.evidence: {
				if(choice != noone){
					if(choice == target){
						match = true;
						show_debug_message("match");
					}
				}
				break;
			}
		}
		
		if not instance_find(menu_quiz, 0) and not obj_notebook.draw_evidence {
			pending_choice = false;
			choice = noone; 
			question_change = true;
			
			if match {
				match = false;
				
				if match_response {
					response = true;
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
					instance_activate_object(obj_textbox);
					var inst = instance_find(obj_textbox, 0)
					inst.alarm[1] = 1;
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
