active = false;
scene_info = [
		[scr_cutscene_scale_camera, .3, 1000],
		[scr_cutscene_change_variable, polka, "move_override", true],
		[scr_cutscene_change_variable, obj_camera, "following", noone],
		[scr_cutscene_wait, 1],
		[scr_cutscene_scale_camera, 1.3, 2],
		[scr_cutscene_pan_camera, 1913, 881, false, 12],
		[scr_cutscene_wait, .5],
		[scr_cutscene_pan_camera, 1913, 420, false, 12],
		[scr_cutscene_wait, .5],
		[scr_cutscene_pan_camera, 400, 420, false, 12],
		[scr_cutscene_wait, .5],
		[scr_cutscene_pan_camera, 1200, 550, false, 12],
		[scr_cutscene_wait, 1],
		[scr_cutscene_scale_camera, 1, 1],
		[scr_cutscene_wait, 3],
		[scr_cutscene_pan_camera_char, polka, false, 12],
		[scr_cutscene_change_variable, obj_camera, "following", polka],
		[scr_cutscene_change_variable, polka, "move_override", false],
];