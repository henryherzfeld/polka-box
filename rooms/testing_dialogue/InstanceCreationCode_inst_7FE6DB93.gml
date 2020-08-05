active = false;


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


scene_info = [
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
	[scr_cutscene_pan_camera_char, polka, false, 1],
	[scr_cutscene_change_variable, polka, "move_override", false],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
];