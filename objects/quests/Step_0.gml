/// @description Insert description here
var grid = quests_grid;

var i = 0; repeat(quests_grid_n) {
	
	if update_map[? i] { register_events = true; }
	
	var step = grid[# 1, i]
	var objectives = grid[# 2, i];
	var objectives_n = array_length_1d(objectives);
	var ev = noone;
//	if i == quest.erosion_investigation show_debug_message(step);
	switch(i) {

		#region erosion investigation
		case quest.erosion_investigation:
			switch(step) {
				case 0: ev = event.talk_green_villy; break;
				case 1: ev = event.talk_weeraway; if register_events scr_char_change_dialogue(obj_npc_weeraway, 1); break;
				case 2: ev = event.talk_poppy; if register_events scr_char_change_dialogue(obj_npc_poppy, 1); break;
				case 3: ev = event.examine_crops; break;
				//case 4: ev = event.talk_poppy; if register_events scr_char_change_dialogue(obj_npc_poppy, 2); break;
				case 4: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
					if polka.itemEquiped == enum_item_type.camera and inst != noone and polka.input_space {
						scr_progress_quest(i);
						scr_evi_add_notebook(enum_evi_type.photo_crop);
						scr_new_evi_noti();
					}
					break;}
				case 5: ev = event.talk_poppy; if register_events scr_char_change_dialogue(obj_npc_poppy, 2); break;
				case 6: {
					var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
					if polka.itemEquiped == enum_item_type.tensiometer and inst != noone and polka.input_space {
						scr_progress_quest(i);
						scr_evi_add_notebook(enum_evi_type.soil_moisture_tbl);
						scr_new_evi_noti();
					}
				break;}
				case 7: ev = event.talk_poppy;  if register_events scr_char_change_dialogue(obj_npc_poppy, 3); break;
			}

		if register_events and step < objectives_n {
			show_debug_message("registering new quest event");
			if ev != noone scr_event_register_script(ev, quests, scr_progress_quest, quest.erosion_investigation);
			scr_activate_objective(objectives[step]);
		}
		break;
		#endregion
	
		#region test2
		case quest.test2:
		break;
		#endregion
	}
	
	i++;
	register_events = false;
}

ds_map_clear(update_map);
