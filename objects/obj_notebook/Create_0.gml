/// @description Insert description here

scr_init_evidence();

x1 = 256;
y1 = 300;
x2 = game.gui_width;
y2 = game.gui_height;
preview_spr = noone;

bg_color = c_olive;
draw = false;

evidence_slot = array_create(MAX_EVI_ITEMS, enum_evi_type.none);
evi_def = ds_grid_create(enum_evi_type.length, enum_evi_state.length);

scr_evi_add_data(enum_evi_type.none,spr_inventory_slot,"",0,scr_use_item_callback_demo, "");
scr_evi_add_data(enum_evi_type.evidence1,sprite140,"evidence 1",0,scr_use_item_callback_demo, "a piece of evidence");
scr_evi_add_data(enum_evi_type.evidence2,sprite138,"evidence 2",0,scr_use_item_callback_pitchfork, "a piece of evidence");