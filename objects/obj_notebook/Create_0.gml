/// @description Insert description here

scr_init_evidence();

preview_spr = noone;

notebook_key = ord("N");

bg_col = c_olive;
draw_evidence = false;
	
//Slot Variables
slot_start_x = 256;
slot_start_y = 300;

slot_width = 48;	//Slot Width
slot_height = 48;	//Slot Height
slot_buffer = 8;
slot_col_max = 8;

selected_slot = -1;

slot_total_width = (slot_width + slot_buffer) * slot_col_max;
slot_total_height = (slot_height + slot_buffer) * MAX_EVI_ITEMS div slot_col_max; 

evidence_slot = array_create(MAX_EVI_ITEMS, enum_evi_type.none);
evi_def = ds_grid_create(enum_evi_type.length, enum_evi_state.length);

scr_evi_add_data(enum_evi_type.none,spr_inventory_slot,"", "");
scr_evi_add_data(enum_evi_type.evidence1,sprite140,"evidence 1", "a piece of evidence");
scr_evi_add_data(enum_evi_type.evidence2,sprite138,"evidence 2", "a piece of evidence");

scr_evi_add_notebook(enum_evi_type.evidence1);
scr_evi_add_notebook(enum_evi_type.evidence2);