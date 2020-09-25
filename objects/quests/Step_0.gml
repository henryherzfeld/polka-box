/// @description Insert description here
if room == testing_dialogue or room == testing_cutscene exit;

var grid = quests_grid;

var i = 0; repeat(quests_grid_n) {
	
	if update_map[? i] { update = true; update_map[? i] = false;}
	
	var step = grid[# 1, i];
	var objectives = grid[# 2, i];
	var objectives_n = array_length_1d(objectives);
	var ev = noone;
//	if i == quest.tutorial show_debug_message(step);
	var save = true;

	switch(i) {

		#region tutorial
		case quest.tutorial: {
			save = false; // every tutorial objective should not save
			switch(step) {
				case 0: {
					if room == rm_polka_interior {
						scr_progress_quest(i);
						scr_progress_quest(i);
						scr_progress_quest(i);
						
						instance_create_layer(250, 200, "Characters", obj_npc_baron);
					
						/* TRY LOCKED DOOR CUTSCENE
						var inst = instance_create_layer(100, 100, "Meta", obj_cutscene);
						inst.scene_info = [	
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_wait, 1],
							[scr_cutscene_instance_create, 0, 0, "Characters", emote],
							[scr_cutscene_wait, 1.5],
							[scr_cutscene_instance_destroy_nearest, 0, 0, emote],
							[scr_cutscene_wait, .5],
							[scr_cutscene_notification, "The door is locked.. \nMaybe the Baron knows why?"],
							[scr_cutscene_change_variable, polka, "move_override", false],
						];
						inst.persistent = false;
						*/
						
						/* INSTANTLY GREETED BY BARON
						text = ds_map_create();
						scr_dia_segment(text, "GREET");
						scr_dia_line("Ah, you're awake. Come over here and talk to me.", obj_npc_baron);
						var tbox = scr_create_textbox(text, obj_npc_baron, obj_npc_baron.portrait, []);
						tbox.alarm[2] = 3*room_speed;
						*/
					}
					
						/* // set trigger scripts with cutscene pointer
						var trig = instance_find(obj_trigger, 0);
						if trig != noone {
							obj_trigger.scripts = [
								[scr_change_variable, inst, "active", true],
								[scr_activate_objective, enum_objective_type.tut_try_to_leave],
							]
						}
						*/
				break;}
				
				case 1: ev = event.talk_baron; 
						// switching to baron's alternate text in case where player attempts door early
						if scr_check_objective(enum_objective_type.tut_try_to_leave) {
							scr_char_change_dialogue(obj_npc_baron, 1); 
							scr_char_update_dialogue(obj_npc_baron);
							scr_progress_quest(i);
							scr_progress_quest(i);
							scr_event_unregister_script(event.talk_baron, quests);
						}
				break;
				
				case 2: {
					if scr_check_objective(enum_objective_type.tut_try_to_leave){
						scr_char_change_dialogue(obj_npc_baron, 2);
						scr_char_update_dialogue(obj_npc_baron);
						scr_progress_quest(i);
					}
				break;}
				
				case 3: ev = event.talk_baron; break;
				
				case 4: 
					if update {
						scr_progress_quest(quest.hints) // CLICKING ITEM TO USE IT
						instance_create_layer(300, 400, "Menus", cursor);
						var inst = instance_create_layer(100, 100, "Meta", obj_cutscene);
						
						inst.scene_info = [	
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_move_character, cursor, game.gui_width/2-290, game.gui_height-50, false, 15],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_change_variable, cursor, "click_change", true],
							[scr_cutscene_wait, 4],
							[scr_cutscene_instance_destroy_nearest, 0, 0, cursor],
							];
						inst.active = true;
					}
					
					if polka.itemEquiped = enum_item_type.camera {
						scr_progress_quest(i);
					}
					break;
				
				case 5: 
					if update {
						
						var inst = instance_find(cursor, 0);
						if inst instance_destroy(inst);
						
						scr_progress_quest(quest.hints);  // PRESSING F TO USE ITEM
						scr_draw_notification("Use your camera to find clues. Press the F key at any of the '!' to learn more.");
						polka.move_override = false;
					}
					
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_desk, false, true);
					if polka.input_use_item {
						scr_progress_quest(i);
					}
					break;
				
				case 6: {
					if update {
						var inst = instance_find(obj_cutscene, 0);
						if inst instance_destroy(inst);
					}
					
					if not instance_find(ui_examine_box, 0) {
						scr_evi_add_notebook(enum_evi_type.photo_desk, true);	
						scr_progress_quest(i);
					}
				break;}
				
				case 7:
					if update {
						scr_progress_quest(quest.hints);  // CLICKING NOTEBOOK ICON TO VIEW EVIDENCE
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						instance_create_layer(900, 100, "Menus", cursor);
						inst.scene_info = [	
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, cursor, obj_overlay.nb_x1, obj_overlay.nb_y1, false, 15],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_change_variable, cursor, "click_change", true],
							];
						inst.active = true;
					}
					
					if obj_notebook.draw_evidence {
						scr_progress_quest(i);
					}
					break;
					
				case 8: 				
					if update {
						
						// destroy residual cutscene object
						var inst = instance_find(obj_cutscene, 0);
						if inst instance_destroy(inst);
						
						scr_progress_quest(quest.hints);  // HOVER ITEM TO SEE, CLICK EXIT TO LEAVE
						var inst = instance_create_layer(100, 100, "Meta", obj_cutscene);
						inst.scene_info = [	
							[scr_cutscene_move_character, cursor, obj_notebook.slot_start_x+12, obj_notebook.slot_start_y+12, false, 15],
							[scr_cutscene_change_variable, obj_notebook, "preview_spr", obj_notebook.evi_def[enum_evi_type.photo_desk,enum_evi_state.sprite]],
							[scr_cutscene_change_variable, obj_notebook, "preview_desc", obj_notebook.evi_def[enum_evi_type.photo_desk,enum_evi_state.description]],
							[scr_cutscene_wait, 2.5],
							
							// close notebook
							[scr_cutscene_change_variable, obj_notebook, "preview_spr", noone],
							[scr_cutscene_change_variable, obj_notebook, "preview_desc", noone],
							[scr_cutscene_move_character, cursor, 1300, 320, false, 15],
							[scr_cutscene_wait, 2],
							[scr_cutscene_change_variable, cursor, "click_change", true],
							[scr_cutscene_wait, 0.4],
							[scr_cutscene_change_variable, obj_notebook, "draw_evidence", false],
							[scr_cutscene_change_variable, obj_notebook, "draw_change", true],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_instance_destroy_nearest, 0, 0, cursor],
							[scr_cutscene_change_variable, polka, "move_override", false],
						];
						inst.active = true;
					}
					
					//if mouse_check_button_pressed(mb_left) mouse_clear(mb_left); // clearing all user inputs to avoid crashing upon early notebook close
					
					if not obj_notebook.draw_evidence scr_progress_quest(i);
					break;
				
				case 9: if update {
					var inst = instance_find(obj_cutscene, 0);
					if inst {
						instance_destroy(inst);
						obj_hints.draw = false;
					}
					polka.move_override = false;
					
					var inst = instance_find(cursor, 0);
					if inst instance_destroy(inst);
					
					scr_draw_notification("Now that you have a piece of evidence, tell the Baron what you've found.");
					scr_progress_quest(i);
				}
				
				case 10: {
					if update {
						scr_char_change_dialogue(obj_npc_baron, 3);
						scr_char_update_dialogue(obj_npc_baron);
						scr_progress_quest(i);
					}
				break;}
				
				case 11: ev = event.talk_baron; break;
				
				case 12: {
					if update {
						var temp = dialogue.dialogues[? obj_npc_baron];
						var text2 = temp[4];

						var scene_info = [
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_wait, 2],
							[scr_cutscene_move_character, obj_npc_baron, 115, 0, true, 2],
							[scr_cutscene_wait, 2],
							[scr_cutscene_instance_create, 420, 210, "Instances", obj_key],
							[scr_cutscene_move_character, obj_black_sleeping_cat , 0, -20, true, .5],
							[scr_cutscene_wait, 1],
							[scr_cutscene_instance_destroy_nearest, 425, 205, obj_key],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_black_sleeping_cat, 0, 30, true, .5],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_npc_baron, -115, 0, true, 2],
							[scr_cutscene_create_dialogue, text2, [[scr_event_fire, event.talk_baron]]],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_npc_baron, 125, 0, true, 2],
							[scr_cutscene_move_character, obj_npc_baron, 0, 120, true, 2],
							[scr_cutscene_instance_destroy_nearest, 0, 0, obj_npc_baron],
							[scr_cutscene_change_variable, polka, "move_override", false], 
						]
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						inst.active = true;
						inst.scene_info = scene_info;
					}
					
					var inst = instance_find(obj_cutscene, 0);
					if inst == noone {
						scr_progress_quest(i);
						audio_play_sound(snd_segment_complete, 1, false);
					}
				
				break;}

			
			case 13: if update {
					var inst = instance_find(obj_transition, 0);
					inst.disable = false;
					/*
					tut_end_text = ds_map_create();
					tut_end_text[? "GREET"] = ["Now it's time for the case! Take what you've learned and present the evidence! You need to convince the investors to give enough money so that the erosion problem can be solved.",
											  ["EXIT", "EXIT"], [noone]];
					tut_end_text[? "EXIT"] = ["Ok.", [], [polka]];
					scr_create_textbox(tut_end_text, "", polka, []);
					*/
				}
				break;
			}
		}
		break;
		#endregion

		#region erosion investigation
		case quest.erosion_investigation:
			switch(step) {
				case 0: ev = event.talk_green_villy; break;
				
				case 1: {
					if update {
						scr_draw_notification("Remember to press the M key to open the map.")
					}
					ev = event.talk_weeraway;
					
					if update scr_char_change_dialogue(obj_npc_weeraway, 1); 
				break;}
					
				
				case 2: { 
					if !polka.in_dialogue {
						scr_progress_quest(i);
						scr_draw_notification("Sometimes you will want to review or you may want to ask something different. You can always repeat the most recent conversation with a Villy Nilly")
					}
				break;}
				
				case 3: ev = event.talk_poppy; if update scr_char_change_dialogue(obj_npc_poppy, 1); break;
				
				case 4: {
					
					if !polka.in_dialogue {
						scr_progress_quest(i);
						scr_draw_notification("Now let's take whatever the Villy Nilly has told us and do some investigating ourselves. What clues should we be looking for? What do we have to examine?");
					}
				break;}
				
				case 5: ev = event.examine_crops; break;
				
				case 6: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
					if polka.itemEquiped == enum_item_type.camera and inst != noone and polka.input_use_item {
						audio_play_sound(snd_clue_item, 1, false);
						inst.draw_examine_box = false;
						instance_destroy(ui_examine_box);
						polka.move_override = false;
						scr_progress_quest(i);
						scr_evi_add_notebook(enum_evi_type.photo_crop, true); 
					}
				break;}
				
				case 7: {
					if !polka.in_dialogue {
						scr_progress_quest(i);
						scr_draw_notification("Finding a clue will lead to more unanswered questions. Let's go back and tell the Villy what we found out. We might get some answers.");
					}
				break;}
				
				case 8: ev = event.talk_poppy; if update scr_char_change_dialogue(obj_npc_poppy, 2); break;
				
				case 9: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
					if polka.itemEquiped == enum_item_type.tensiometer and inst != noone and polka.input_use_item {
						audio_play_sound(snd_clue_item, 1, false);
						scr_progress_quest(i);
						scr_evi_add_notebook(enum_evi_type.soil_moisture_tbl, true); 
					}
				break;}
				
				case 10: {
					if !polka.in_dialogue {
						scr_progress_quest(i);
						scr_draw_notification("Finding a clue will lead to more unanswered questions. Let's go back and tell the Villy what we found out. We might get some answers.");
					}
				break;}
				

				case 11: ev = event.talk_poppy;  if update scr_char_change_dialogue(obj_npc_poppy, 3); break;
				
				case 12: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
					if polka.itemEquiped == enum_item_type.tape and inst != noone and polka.input_use_item {
						audio_play_sound(snd_clue_item, 1, false);
						scr_progress_quest(i);
						scr_evi_add_notebook(enum_evi_type.soil_depth_tbl, true); 
						scr_draw_notification("Finding a clue will lead to more unanswered questions. Let's go back and tell the Villy what we found out. We might get some answers.");
					}
				break;}
				
				case 13: ev = event.talk_poppy; 
					if update {	
						scr_char_change_dialogue(obj_npc_poppy, 4);
						scr_char_change_dialogue(obj_npc_weeraway, 2);
					}
					break;
					
				case 14: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
					if polka.itemEquiped == enum_item_type.camera and inst != noone and polka.input_use_item {
						audio_play_sound(snd_clue_item, 1, false);
						inst.draw_examine_box = false;
						instance_destroy(ui_examine_box);
						polka.move_override = false;
						scr_progress_quest(i);
						scr_evi_add_notebook(enum_evi_type.photo_erosion_water, true); 
					}
				break;}
				
				case 15: {
					if !polka.in_dialogue {
						scr_progress_quest(i);
						scr_draw_notification("Finding a clue will lead to more unanswered questions. Let's go back and tell the Villy what we found out. We might get some answers.");
					}
				break;}
				
				case 16: ev = event.talk_poppy; if update scr_char_change_dialogue(obj_npc_poppy, 5); break;
				
				case 17: 
						if update { audio_play_sound(snd_segment_complete, 1, false); }
						if room != rm_poppy_interior {
							scr_progress_quest(i);
						} break;
						
				case 18:
						if update {

							survey_investigation = ds_list_create();
							scr_quiz_list(survey_investigation);
							scr_quiz_question(enum_question_type.multi, "How are you enjoying the game so far? (Lowest: 1, Highest: 5)", [1,2,3,4,5], noone);

							obj_quiz_manager.questions = survey_investigation;
							obj_quiz_manager.survey = true;
							scr_progress_quest(i);
						}
						
						
						break;
						
				case 19: if not obj_quiz_manager.survey scr_progress_quest(i); break;
				
				case 20: 
					save = false;
					if update {
						scr_char_change_dialogue(obj_npc_poppy, 0);
						scr_activate_objective(enum_objective_type.ero_poppy4); 

						var temp = dialogue.dialogues[? obj_npc_baron];
						var investigation_text = temp[5];

						var scene_info = [
							[scr_cutscene_wait, 2],
							[scr_cutscene_change_room, rm_polka_interior, 300, 220],
							[scr_cutscene_wait, 0.2],
							[scr_cutscene_instance_create, 250, 200, "Characters", obj_npc_baron],
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_wait, 1],
							[scr_cutscene_create_dialogue, investigation_text, [[scr_event_fire, event.talk_baron]]],
							[scr_cutscene_change_variable, polka, "move_override", false],
						];
						
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						inst.active = true;
						inst.scene_info = scene_info;

				
						scr_progress_quest(quest.erosion_experiment);
						scr_progress_quest(i);
					}
					break;
					
				case 21: save = false; break;
			}
			
			
		break;
		#endregion
		
		#region erosion experiment
		case quest.erosion_experiment:
			switch(step) {
				
				case 0: save = false; ev = event.talk_baron; break;
				
				case 1: if room == rm_weeraway_interior {
					
							scr_progress_quest(i);
					
							scr_char_change_dialogue(obj_npc_weeraway, 0); 
							scr_char_update_dialogue(obj_npc_weeraway);

							var temp = dialogue.dialogues[? obj_npc_weeraway];
							var investigation_text = temp[3];

							var scene_info = [
								[scr_cutscene_change_variable, polka, "move_override", true],
								[scr_cutscene_wait, 1],
								[scr_cutscene_move_character, polka, 424, 225, false, 2],
								[scr_cutscene_move_character, polka, 434, 108, false, 2],
								[scr_cutscene_move_character, polka, 440, 108, false, 2],
								[scr_cutscene_create_dialogue, investigation_text, []],
								[scr_cutscene_change_variable, polka, "move_override", false],
							];
						
							var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
							inst.active = true;
							inst.scene_info = scene_info;
							
						}
						break;
						
				case 2: 
					save = false;
					var inst = instance_find(obj_cutscene, 0);
					if inst == noone {
						scr_progress_quest(i);
					}
					break;
				
				case 3: 
					save = false;
					if update {
						scr_save_game();
						scr_progress_quest(quest.erosion_case);
						scr_evi_add_notebook(enum_evi_type.soil_experiment_tbl, true);
						audio_play_sound(snd_segment_complete, 1, false); // sound effect
					}
					if room != rm_weeraway_interior scr_progress_quest(i); break;
				
				case 4: 
					if update {
						survey_investigation = ds_list_create();
						scr_quiz_list(survey_investigation);
						scr_quiz_question(enum_question_type.multi, "How did you enjoy the experiment with Weeraway? (Lowest: 1, Highest: 5)", [1,2,3,4,5], noone);

						obj_quiz_manager.questions = survey_investigation;
						obj_quiz_manager.survey = true;
						
						scr_progress_quest(i);
					}
					break;

				
			}
		break;
		#endregion
		
		#region erosion case					
		case quest.erosion_case:
		    save = false;
			switch(step) {
				case 0: 
					if room == rm_courthouse_interior {
						instance_create_layer(458, 84, "Characters", obj_npc_chieftain);
						instance_create_layer(292, 50, "Characters", obj_npc_weeraway);
						instance_create_layer(665, 54, "Characters", obj_npc_poppy);
						instance_create_layer(389, 142, "Characters", obj_npc_investor_female);
						instance_create_layer(640, 145, "Characters", obj_npc_investor_male);
						
						var temp = dialogue.dialogues[? obj_npc_chieftain];
						var case_text = temp[0];

						var scene_info = [
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_move_character, obj_npc_chieftain, 100, 10, true, 1],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_npc_chieftain, 498, 44, false, 2],
							[scr_cutscene_wait, 1],
							[scr_cutscene_create_dialogue, case_text, []],
							[scr_cutscene_wait, 1],
							[scr_cutscene_change_variable, polka, "move_override", false],
						]
						
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						inst.scene_info = scene_info;
						inst.active = true;
						
						scr_progress_quest(i);
					}
					break;
					
				case 1: 
					save = false;
					
					if room != rm_courthouse_interior {
						scr_progress_quest(i);
						audio_play_sound(snd_segment_complete, 1, false);
					} 
					break;
					
				case 2:
					save = false;
					if update {
						survey_investigation = ds_list_create();
						scr_quiz_list(survey_investigation);
						scr_quiz_question(enum_question_type.multi, "How did you enjoy the Courthouse case? (Lowest: 1, Highest: 5)", [1,2,3,4,5], noone);

						obj_quiz_manager.questions = survey_investigation;
						obj_quiz_manager.survey = true;
						scr_progress_quest(i);
					}
					break;
					
				case 3: 
					if not obj_quiz_manager.survey {
						// Camera is not following polka post cutscene
						ero_fin_text1a = ds_map_create();
						scr_dia_segment(ero_fin_text1a, "GREET");
						scr_dia_line("I can't believe we were able to grow the crops in time.", obj_npc_weeraway_wife);

						ero_fin_text1b = ds_map_create();
						scr_dia_segment(ero_fin_text1b, "GREET");
						scr_dia_line("Neither can I. We have mashed potatoes, steamed carrots, green bean casserole, creamed corn, mashed turnips, and pumpkin pie.", [obj_npc_weeraway, enum_portrait.happy]); 

						ero_fin_text1c = ds_map_create();
						scr_dia_segment(ero_fin_text1c, "GREET");
						scr_dia_line("... If the soil erosion problem hadn't been fixed, we wouldn't be enjoying any of these this year.", obj_npc_weeraway);


						ero_fin_text2a = ds_map_create();
						scr_dia_segment(ero_fin_text2a, "GREET");
						scr_dia_line("These mashed potatoes are delicious, mom!", [obj_npc_weeraway_kid_1, enum_portrait.happy]);

						ero_fin_text2b = ds_map_create();
						scr_dia_segment(ero_fin_text2b, "GREET");
						scr_dia_line("Thank you, dear!", [obj_npc_weeraway_wife, enum_portrait.happy]);

						ero_fin_text2c = ds_map_create();
						scr_dia_segment(ero_fin_text2c, "GREET");
						scr_dia_line("Pass the pumpkin pie, Gooey.", obj_npc_weeraway);

						ero_fin_text2d = ds_map_create();
						scr_dia_segment(ero_fin_text2d, "GREET");
						scr_dia_line("I didn't think I'd ever miss carrots...", obj_npc_weeraway_kid_2); 

						ero_fin_text2e = ds_map_create();
						scr_dia_segment(ero_fin_text2e, "GREET");
						scr_dia_line("That's what happens when you have nothing to eat. You'll eat just about anything you can get. And pass me the creamed corn, will you?", obj_npc_weeraway);


						ero_fin_text3a = ds_map_create();
						scr_dia_segment(ero_fin_text3a, "GREET");
						scr_dia_line("Because of you, my family could live. The villagers could finally get food to eat. Please take this as a token of my thanks.", obj_npc_weeraway);
						
						var scene_info = [
							[scr_cutscene_change_variable, obj_camera, "following", noone],
							[scr_cutscene_change_room, rm_weeraway_interior_dinner_1, -200, -200],
							[scr_cutscene_change_variable, obj_camera, "x", 512],
							[scr_cutscene_change_variable, obj_camera, "y", 800],
							[scr_cutscene_wait, 0.2],
							[scr_cutscene_move_character, obj_npc_weeraway, 400, 70, false, 200],
							[scr_cutscene_instance_create, 400, 140, "Characters", obj_npc_weeraway_wife],
	
							[scr_cutscene_pan_camera, 512, 100, false, 4],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_npc_weeraway_wife, 10, -30, true, 3],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text1a, []],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_npc_weeraway, 120, 30, true, 3],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text1b, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_move_character, obj_npc_weeraway, -110, 0, true, 3],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text1c, []],
	
							[scr_cutscene_wait, 2],
							[scr_cutscene_change_room, rm_empty, -300, -300],
							[scr_cutscene_wait, 0.2],
							[scr_cutscene_change_room, rm_weeraway_interior_dinner_2, -200, -200],
							[scr_cutscene_wait, 1],
	
							[scr_cutscene_create_dialogue, ero_fin_text2a, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text2b, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text2c, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text2d, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_create_dialogue, ero_fin_text2e, []],
							[scr_cutscene_wait, 2],

							[scr_cutscene_change_room, rm_weeraway_interior, 370, 200],
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, obj_npc_weeraway, 0, 75, true, 2],
							[scr_cutscene_create_dialogue, ero_fin_text3a, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_notification, "Weeraway has given you 300 coins!"],
							[scr_cutscene_change_variable, flags, "coins", flags.coins+300],
							[scr_cutscene_change_variable, polka, "move_override", false],
						]
						
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						inst.scene_info = scene_info;
						inst.active = true;
						scr_progress_quest(i);
					} 
					break;
					
				case 4:
					save = false;
					if room != rm_weeraway_interior and room != rm_weeraway_interior_dinner_1 and
					   room != rm_weeraway_interior_dinner_2 and room != erosion_village and room != rm_empty {
						audio_play_sound(snd_quest_complete, 1, false);
						
						ero_fin_text4a = ds_map_create();
						scr_dia_segment(ero_fin_text4a, "GREET");

						scr_dia_line("You've got your first crystal piece! Good work, young knight.", obj_npc_baron); 
						scr_dia_line_sprite(spr_crystal_inventa_status_1);

						scr_dia_line("Knock out the next quests to get more crystal pieces", obj_npc_baron); 
						scr_dia_line_sprite(spr_crystal_inventa_status_1);
						scr_dia_line_sprite(spr_virus_henchmen);

						scr_dia_line("You have to take Virus down! He's still out there. Who knows what he's plotting next...", obj_npc_baron); 

						scr_dia_line("Get ready for your next quest! You'll be exploring space!", obj_npc_baron);
						scr_dia_line_sprite(spr_virus_henchmen);
						scr_dia_line_sprite(spr_ship); 

						scr_dia_options("EXIT", "EXIT");
						scr_dia_segment(ero_fin_text4a, "EXIT");
						scr_dia_line("Ok", polka);
						
						
						var scene_info = [
							[scr_cutscene_change_room, rm_polka_interior, 340, 170],
							[scr_cutscene_change_variable, obj_camera, "x", 512],
							[scr_cutscene_change_variable, obj_camera, "y", 800],
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_pan_camera, 512, 0, false, 4],
							[scr_cutscene_wait, 2],
							[scr_cutscene_instance_create, 370, 270, "Characters", obj_npc_baron],
	
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_move_character, obj_npc_baron, 0, -100, true, 2],
							[scr_cutscene_wait, 1],
							[scr_cutscene_create_dialogue, ero_fin_text4a, []],
							[scr_cutscene_wait, 0.5],
							[scr_cutscene_move_character, obj_npc_baron, 0, 120, true, 2],
							[scr_cutscene_instance_destroy_nearest, 0, 0, obj_npc_baron],
							[scr_cutscene_pan_camera_char, polka, false, 1],
							[scr_cutscene_change_variable, obj_camera, "following", polka],
							[scr_cutscene_change_variable, polka, "move_override", false],
						]
						
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						inst.scene_info = scene_info;
						inst.active = true;
						scr_progress_quest(i);
					}
					break;
				
				case 5:
					save = false;
					if obj_camera.following != noone {
						url_open("https://www.surveymonkey.com/r/C3XNRLS"); 
						scr_progress_quest(i);
					}
					break;
			}
		break;
		#endregion
	
		#region hints
		case quest.hints: {
			var draw_time = 4;
			save = false;
			switch(step) {
				case 0: {
					var inst =  collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, par_NPC, false, true);
					if inst != noone and not polka.move_override {
						scr_progress_quest(i);
					}
				break;}
				case 1: {
					var inst = instance_find(obj_textbox, 0);
					if inst != noone and inst.draw_options {
						scr_progress_quest(i);
					}
					break;}
					
				case 2: // click on camera in inventory
					break;
					
				case 3: draw_time = 10; // press f to use
					break;
					
				case 4: draw_time = 10;// click on notebook
					break;
					
				case 5: draw_time = 10; // hover an item to see it and use exit to leave
					break;
					
				case 6: {
					draw_time = 8;
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_chest, false, true);
					if(inst != noone and scr_check_objective(enum_objective_type.ero_poppy1)){
						scr_progress_quest(i);
					}
				break;}
			}
			
		if update {
			obj_hints.step = step;
			obj_hints.draw = true;
			obj_hints.alarm[0] = draw_time * room_speed;
		}
		}break;
		#endregion
	}
	
	if update and step < objectives_n and step >= 0 {
		show_debug_message("registering new quest event");
		if ev != noone scr_event_register_script(ev, quests, scr_progress_quest, i);
		else show_debug_message("no event to register");
		if objectives[step] != noone { 
			scr_activate_objective(objectives[step]); 
			
			// sending an event for quest objective changes
			if i != 4 {
				var obj_text = ds_grid_get(flags.objectives, objectives[step], enum_objective_state.text);
			
				var quest_text;
				switch i {
					case 0: quest_text = "Tutorial"; break;
					case 1: quest_text = "Investigation"; break;
					case 2: quest_text = "Experiment"; break;
					case 3: quest_text = "Case"; break;
				}
				send_event("Objective", quest_text, obj_text);
			}
		}
	}
	
	if update and save { scr_save_game(); }
	
	i++;
	update = false;
}