/// @description Insert description here

if questions != noone and !response {
	if initial {
		initial = false;
		n_questions = ds_list_size(questions);
		question_change = true;
		
		if fun_fact { polka.move_override = true; }
		instance_deactivate_object(obj_textbox);
	}
	
	var curr_question = questions[| question_idx];
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
					draw_change = true;
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
				inst.question_data = curr_question[2];
				target = curr_question[3];
				
				// unpacking sprite from prompt
				var prompt = curr_question[1];
				if is_array(prompt) { inst.prompt = prompt[0]; inst.sprite_draw = prompt[1]; }
				else { inst.prompt = prompt; }
				
				inst.build_menu = true;
				pending_choice = true;
				quiz_menu_ptr = inst;
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

				// if there is an evidence prompt unpack target array to target_temp
				// otherwise just assign target_temp the target array
				if evidence { var button_target = target[1]; } 
				else { var button_target = target; }

				var n_target = array_length_1d(button_target);
				var n_choice = array_length_1d(choice);
				
				// assume choice match is true
				var choice_match = true;

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
		
			// single question survey evaluation 1-5 and firing event or send guess
			if survey {
				survey = false;
				match = true;
				
				//unpacking which quest we're on
				var quest_text;
				var exp_step = quests.quests_grid[# 1, 2];
				var case_step = quests.quests_grid[# 1, 3];
				
				if case_step > 1 {
					quest_text = "Case";
				} else if exp_step > 2 {
					quest_text = "Experiment";
				} else {
					quest_text = "Investigation";
				}

				send_event("Survey", quest_text, choice+1);
				scr_fire_sm_noti("Anonymous response submitted.\nThank you for your feedback!");
			} else {
				var text_;
				if fun_fact text_ = "Fun Fact: " + curr_question[1];
				else text_ = string(quizzer_id.name) + ": " + string(curr_question[1]);
				send_event("Question", text_, match);
				
			}
			
		
			quiz_menu_ptr = noone;
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
						var coins = irandom_range(fun_fact_coins_min, fun_fact_coins_max);
						scr_fire_sm_noti("Correct Answer" + "\n" + string(coins) + " Coins found!");
						flags.coins += coins;
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
					fun_fact = false;
					scr_fire_sm_noti("Incorrect Answer \nYou didn't find anything...");
					questions = noone;
					initial = true;
					polka.move_override = false;
					question_idx = 0;
					questions = noone;
					question_change = false;
				}   // test phase to determine if heart removed
				else if room != rm_polka_interior {
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