/// @description Insert description here
var grid = quests_grid;

var i = 0; repeat(quests_grid_n) {
	
	if update_map[? i] { update = true; update_map[? i] = false;}
	
	var step = grid[# 1, i]
	var objectives = grid[# 2, i];
	var objectives_n = array_length_1d(objectives);
	var ev = noone;
	if i == quest.tutorial show_debug_message(step);

	switch(i) {

		#region tutorial
		case quest.tutorial:
			switch(step) {
				case 0: {
					if room == rm_polka_interior {
						scr_progress_quest(i);
						instance_create_layer(250, 200, "Characters", obj_npc_baron);
						/* starting cutscene for baron to walk up to polka
			 			var inst = instance_find(obj_cutscene, 0);
						inst.active = true;
						*/
					}
				
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
							[scr_cutscene_move_character, cursor, game.gui_width/2-290, game.gui_height-50, false, 10],
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
						scr_progress_quest(quest.hints);  // PRESSING F TO USE ITEM
						var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
						inst.scene_info = [	
							[scr_cutscene_wait, 1],
							[scr_cutscene_move_character, polka, 383, 87, false, 3],
							[scr_cutscene_wait, 1],
							];
						inst.active = true;
					}
					
					if polka.input_use_item {
						scr_progress_quest(i);
					}
					break;
				
				case 6: {
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
							[scr_cutscene_move_character, cursor, obj_overlay.nb_x1, obj_overlay.nb_y1, false, 10],
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
						scr_progress_quest(quest.hints);  // HOVER ITEM TO SEE, CLICK EXIT TO LEAVE
						var inst = instance_create_layer(100, 100, "Meta", obj_cutscene);
						inst.scene_info = [	
							[scr_cutscene_move_character, cursor, 520, 220, false, 10],
							[scr_cutscene_change_variable, obj_notebook, "preview_spr", spr_animal_hairs_on_desk_photo_evidence],
							[scr_cutscene_wait, 4],
							
							// close notebook
							[scr_cutscene_change_variable, obj_notebook, "preview_spr", noone],
							[scr_cutscene_move_character, cursor, 1300, 320, false, 10],
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
					
					if mouse_check_button_pressed(mb_left) mouse_clear(mb_left); // clearing all user inputs to avoid crashing upon early notebook close
					
					if not instance_find(obj_cutscene, 0) scr_progress_quest(i);
					break;
				
				case 9: if update {
					scr_draw_notification("Now that you have a piece of evidence, tell the Baron what you've found.");
					scr_progress_quest(i);
				}
				
				case 10: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_npc_baron, false, true);
					if inst != noone {
						scr_progress_quest(i);
					}
				break;}
				
				case 11: {
					ev = event.talk_baron; 
					if update {
						var temp = dialogue.dialogues[? obj_npc_baron];
						var text1 = temp[3];
						var text2 = temp[4];

						var scene_info = [
							[scr_cutscene_change_variable, polka, "move_override", true],
							[scr_cutscene_create_dialogue, text1],
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
				}break;
				
//			case 5: ev = event.talk_baron; if update scr_char_change_dialogue(obj_npc_baron, 4); scr_char_update_dialogue(obj_npc_baron); break;
			
			case 12: if update {
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
		break;
		#endregion

		#region erosion investigation
		case quest.erosion_investigation:
			switch(step) {
				case 0: ev = event.talk_green_villy; break;
				
				case 1: {
					ev = event.talk_weeraway;
					
					if room == erosion_forest {
						var inst = instance_find(obj_cutscene, 0);
						if inst != noone {
							inst.active = true;
						}
					}
					
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
				
				case 17: if update {
					scr_char_change_dialogue(obj_npc_poppy, 0);
					scr_activate_objective(enum_objective_type.ero_poppy4); 

					var temp = dialogue.dialogues[? obj_npc_baron];
					var investigation_text = temp[5];

					var scene_info = [
						[scr_cutscene_change_room, rm_polka_interior, 500, 266],
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
					}
					break;
			}
		break;
		#endregion
		
		#region erosion experiment
		case quest.erosion_experiment:
			switch(step) {
				
				case 0: ev = event.talk_baron; break;
				
				case 1: if room == rm_weeraway_interior {
							scr_progress_quest(i);
					
							var temp = dialogue.dialogues[? obj_npc_weeraway];
							var investigation_text = temp[3];

							var scene_info = [
								[scr_cutscene_change_variable, polka, "move_override", true],
								[scr_cutscene_wait, 1],
								[scr_cutscene_move_character, polka, 424, 225, false, 2],
								[scr_cutscene_move_character, polka, 434, 108, false, 2],
								[scr_cutscene_move_character, polka, 464, 108, false, 2],
								[scr_cutscene_create_dialogue, investigation_text, [[scr_event_fire, event.talk_weeraway]]],
								[scr_cutscene_change_variable, polka, "move_override", false],
							];
						
							var inst = instance_create_layer(0, 0, "Meta", obj_cutscene);
							inst.active = true;
							inst.scene_info = scene_info;
							
						}
						break;
						
				case 2: ev = event.talk_weeraway; break;
						
				case 3: 
					if update {
						scr_progress_quest(quest.erosion_case);
						scr_evi_add_notebook(enum_evi_type.soil_experiment_tbl, true);
					}
					break;
				
			}
		break;
		#endregion
		
		#region erosion case
		case quest.erosion_case:
			switch(step) {
				case 0: 
					if room == rm_courthouse_interior {
						instance_create_layer(458, 84, "Characters", obj_npc_chieftain);
						instance_create_layer(292, 50, "Characters", obj_npc_weeraway);
						instance_create_layer(665, 54, "Characters", obj_npc_poppy);
						instance_create_layer(389, 142, "Characters", obj_npc_investor_female);
						instance_create_layer(640, 145, "Characters", obj_npc_investor_male);
						
						var inst = instance_find(obj_cutscene, 0);
						inst.active = true;
						scr_progress_quest(i);
					}
				break;
				case 1: break;
			}
		break;
		#endregion
	
		#region hints
		case quest.hints:
			var draw_time = 4;
			switch(step) {
				case 0: {
					ev = event.talk_baron;
				break;}
				case 1: {
					var inst =  collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, par_NPC, false, true);
					if inst != noone and not polka.move_override {
						scr_progress_quest(i);
					}
				break;}
				case 2: {
					var inst = instance_find(obj_textbox, 0);
					if inst != noone and inst.draw_options {
						scr_progress_quest(i);
					}
					break;}
					
				case 3: // click on camera in inventory
					break;
					
					
				case 4: draw_time = 10; // press f to use
					break;
					
				case 5: draw_time = 10;// click on notebook
					break;
					
					
				case 6: draw_time = 10; // hover an item to see it and use exit to leave
					break;
					
				case 7: {
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
		break;
		#endregion
	}
	
	if update and step < objectives_n and step >= 0 {
		show_debug_message("registering new quest event");
		if ev != noone scr_event_register_script(ev, quests, scr_progress_quest, i);
		else show_debug_message("no event to register");
		if objectives[step] != noone scr_activate_objective(objectives[step]);
	} 
	i++;
	update = false;
}