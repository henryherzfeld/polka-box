active = true;

instance_create_layer(100, 100, "Menus", cursor);

scene_info = [

	// equip camera
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, cursor, game.gui_width/2-290, game.gui_height-50, false, 10],
	[scr_cutscene_wait, 0.5],
	[scr_cutscene_change_variable, cursor, "click_change", true],
	[scr_cutscene_change_variable, polka, "itemEquiped", enum_item_type.camera],
	[scr_cutscene_change_variable, polka, "move_override", false],
	
	// open nb
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, cursor, obj_overlay.nb_x1, obj_overlay.nb_y1, false, 10],
	[scr_cutscene_wait, 0.5],
	[scr_cutscene_change_variable, cursor, "click_change", true],
	[scr_cutscene_change_variable, obj_notebook, "draw_evidence", true],
	[scr_cutscene_change_variable, obj_notebook, "draw_change", true],
	
	// evidence select
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, cursor, 520, 220, false, 10],
	[scr_cutscene_wait, 0.5],
	[scr_cutscene_change_variable, cursor, "click_change", true],
	[scr_cutscene_change_variable, obj_notebook, "selected", 0],
	
	// close notebook
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character, cursor, 1300, 320, false, 10],
	[scr_cutscene_change_variable, cursor, "click_change", true],
	[scr_cutscene_change_variable, obj_notebook, "draw_evidence", false],
	[scr_cutscene_change_variable, obj_notebook, "draw_change", true],
	
];