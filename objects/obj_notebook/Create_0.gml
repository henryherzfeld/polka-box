/// @description Insert description here

event_inherited();

scr_init_evidence();

preview_spr = noone;

notebook_key = ord("N");

bg_col = c_olive;
draw_evidence = false;
draw_change = false;
	
//Slot Variables
m_slotx = 0;
m_sloty = 0;

slot_width = 48;	//Slot Width
slot_height = 48;	//Slot Height
slot_buffer = 8;
slot_col_max = 8;

send_selected = false;
selected_slot = -1;
clicked_slot = -1;

draw_windows = false;

slot_total_width = (slot_width + slot_buffer) * slot_col_max;
slot_total_height = (slot_height + slot_buffer) * MAX_EVI_ITEMS div slot_col_max; 

slot_start_x = (game.gui_width - slot_total_width)/2;
slot_start_y = (game.gui_height - slot_total_height)/3;

evidence_slot = array_create(MAX_EVI_ITEMS, enum_evi_type.none);
evi_def = ds_grid_create(enum_evi_type.length, enum_evi_state.length);

scr_evi_add_data(enum_evi_type.none,spr_inventory_slot,"", "");
scr_evi_add_data(enum_evi_type.soil_moisture_tbl,spr_soil_moisture_table_evidence,
				"Soil Moisture Table", "Contains soil temperature readings");
scr_evi_add_data(enum_evi_type.photo_crop, spr_crop_appearance_fields_photo_evidence, 
				"Weeraway's Crop Photo", "A photo taken at Weeraway's farm");
scr_evi_add_data(enum_evi_type.photo_desk, spr_animal_hairs_on_desk_photo_evidence, 
				"Desk Photo", "A photo of the desk in your room depicting animal hairs");
scr_evi_add_data(enum_evi_type.soil_depth_tbl, spr_topsoil_depth_forest_table,
				"Soil Depth Table", "Contains soil depth readings");
scr_evi_add_data(enum_evi_type.photo_erosion_water, spr_soil_erosion_water_photo_evidence,
				"Soil Erosion Photo", "A photo depicting Weeraway's farm soil washing away");
scr_evi_add_data(enum_evi_type.soil_experiment_tbl, spr_erosion_experiment_table_evidence,
				"Soil Experiment Table", "Contains soil temperature and depth readings");
				
window_map = ds_map_create();

button_grid = ds_grid_create(1, 6);
scr_grid_add_button(700, 100, "Exit", enum_button_type.click, enum_button_event.run_script, [
								[scr_change_variable, obj_notebook.id, "draw_evidence", false],
								[scr_change_variable, obj_notebook.id, "draw_change", true],
								]);
scr_add_window("default", 0, 0, "");

button_grid = ds_grid_create(1, 6);
scr_grid_add_button(700, 500, "Submit", enum_button_type.click, enum_button_event.run_script, [
								[scr_change_variable, obj_notebook.id, "draw_evidence", false],
								[scr_change_variable, obj_notebook.id, "draw_change", true],
								[scr_change_variable, obj_notebook.id, "send_selected", true],
								]);
scr_add_window("evidence_select", 0, 0, "");

preview_h = sprite_get_height(spr_erosion_experiment_table_evidence);
preview_w = sprite_get_width(spr_erosion_experiment_table_evidence);