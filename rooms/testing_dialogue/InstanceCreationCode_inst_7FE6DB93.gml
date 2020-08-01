active = true;

scene_info = [

	[scr_cutscene_change_variable, obj_camera, "following", noone],
	[scr_cutscene_change_room, rm_weeraway_interior, -200, -200],
	[scr_cutscene_change_variable, obj_camera, "x", 512],
	[scr_cutscene_change_variable, obj_camera, "y", 800],
	[scr_cutscene_wait, 0.2],
	[scr_cutscene_instance_create, 400, 140, "Characters", obj_npc_weeraway_wife],
	[scr_cutscene_instance_create, 483, 150, "Characters", tf_food_1],
	[scr_cutscene_instance_create, 483, 174, "Characters", tf_food_2],
	[scr_cutscene_instance_create, 507, 150, "Characters", tf_food_3],
	[scr_cutscene_instance_create, 507, 174, "Characters", tf_food_4],
	[scr_cutscene_instance_create, 531, 150, "Characters", tf_food_5],
	[scr_cutscene_instance_create, 483, 174, "Characters", tf_food_6],

	
	
	
	
	[scr_cutscene_pan_camera, 512, 100, false, 4],

	
];