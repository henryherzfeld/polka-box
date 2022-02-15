active = false;

ero_fin_text4a = ds_map_create();
scr_dia_segment(ero_fin_text4a, "GREET");

scr_dia_line("You've got your first crystal piece! Good work, young knight.", obj_npc_poppy); 
scr_dia_line_sprite(spr_crystal_inventa_status_1);

scr_dia_line("Knock out the next quests to get more crystal pieces", obj_npc_poppy); 
scr_dia_line_sprite(spr_crystal_inventa_status_1);


scr_dia_options("EXIT", "EXIT");
scr_dia_segment(ero_fin_text4a, "EXIT");
scr_dia_line("[Continue]", polka);

scene_info = [
	[scr_cutscene_change_room, rm_poppy, 416, 160],
	[scr_cutscene_wait, 2],
	[scr_cutscene_move_character_facing, obj_npc_poppy, -48, 24, true, 3],
	[scr_cutscene_wait, .2],
	[scr_cutscene_change_facing, obj_npc_poppy, dir.down],
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_love, 50],
	[scr_cutscene_wait, 1],
	[scr_cutscene_create_dialogue, ero_fin_text4a, [], obj_npc_poppy],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_character_sprites, obj_npc_poppy, 
											spr_villy_walk_front, spr_villy_walk_left, spr_villy_walk_back, spr_villy_walk_right,
											spr_villy_stand_front, spr_villy_stand_left, spr_villy_stand_back, spr_villy_stand_right],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_facing, obj_npc_poppy, dir.left],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_facing, obj_npc_poppy, dir.right],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_facing, obj_npc_poppy, dir.down],
	[scr_cutscene_wait, 2],
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_shocked, 50],
	[scr_cutscene_wait, 1],
	[scr_cutscene_animate_character, obj_npc_poppy, spr_villy_boop_front],
//	[scr_cutscene_move_character_facing, obj_npc_poppy, 316, 160, false, 2, dir.left],
	[scr_cutscene_change_facing, obj_npc_poppy, dir.right],
	[scr_cutscene_wait, 1],
	[scr_cutscene_change_facing, obj_npc_poppy, dir.down],
	[scr_cutscene_emote_character, obj_npc_poppy, spr_emote_blush, 50],
	[scr_cutscene_move_character, obj_npc_poppy, 422, 226, false, 3],
	[scr_cutscene_instance_destroy_nearest, 422, 226, obj_npc_poppy],
	[scr_cutscene_change_room_fade, fin, 0, 0, .1],
]


/* EXAMPLES

[scr_cutscene_scale_camera, .3, 1000],
[scr_cutscene_change_variable, polka, "move_override", true],
[scr_cutscene_change_variable, obj_camera, "following", noone],
[scr_cutscene_wait, 1],
[scr_cutscene_scale_camera, 1.3, 2],
[scr_cutscene_pan_camera, 770, 1025, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 1900, 1025, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 1900, 500, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 400, 500, false, 12],
[scr_cutscene_wait, .5],
[scr_cutscene_pan_camera, 1200, 500, false, 12],
[scr_cutscene_change_variable, npc_green_villy, "draw", true],
[scr_cutscene_scale_camera, 1, 1],
[scr_cutscene_wait, 3],
[scr_cutscene_pan_camera_char, polka, false, 12],
[scr_cutscene_change_variable, npc_green_villy, "draw", false],
[scr_cutscene_wait, 1],
[scr_cutscene_change_variable, obj_camera, "following", polka],
[scr_cutscene_change_variable, polka, "move_override", false]
























/*
ero_fin_text4a = ds_map_create();
scr_dia_segment(ero_fin_text4a, "GREET");

scr_dia_line("You've got your first crystal piece! Good work, young knight.", obj_npc_poppy); 
scr_dia_line_sprite(spr_crystal_inventa_status_1);

scr_dia_line("Knock out the next quests to get more crystal pieces", obj_npc_poppy); 
scr_dia_line_sprite(spr_crystal_inventa_status_1);
scr_dia_line_sprite(spr_virus_henchmen);

scr_dia_line("You have to take Virus down! He's still out there. Who knows what he's plotting next...", obj_npc_poppy); 

scr_dia_line("Get ready for your next quest! You'll be exploring space!", obj_npc_poppy);
scr_dia_line_sprite(spr_virus_henchmen);
scr_dia_line_sprite(spr_ship); 

scr_dia_options("EXIT", "EXIT");
scr_dia_segment(ero_fin_text4a, "EXIT");
scr_dia_line("Ok", polka);
*/




/*
	[scr_cutscene_change_room, rm_polka_interior, 340, 170],
	[scr_cutscene_change_variable, obj_camera, "x", 512],
	[scr_cutscene_change_variable, obj_camera, "y", 800],
	[scr_cutscene_change_variable, polka, "move_override", true],
	[scr_cutscene_pan_camera, 512, 0, false, 4],
	[scr_cutscene_wait, 2],
	[scr_cutscene_instance_create, 370, 270, "Characters", obj_npc_poppy],
	
	[scr_cutscene_wait, 0.5],
	[scr_cutscene_move_character, obj_npc_poppy, 0, -100, true, 2],
	[scr_cutscene_wait, 1],
	[scr_cutscene_create_dialogue, ero_fin_text4a, []],
	[scr_cutscene_wait, 0.5],
	[scr_cutscene_pan_camera_char, polka, false, 1],
	[scr_cutscene_change_variable, polka, "move_override", false],
	[scr_cutscene_change_variable, obj_camera, "following", polka],
];