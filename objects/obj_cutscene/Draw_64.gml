/// @description Insert description here

if game.debug and active {
	var curr_scene = scene_info[scene];
	var curr_scene_name = script_get_name(curr_scene[0])
	draw_text(10, game.gui_height-36, curr_scene_name);
	
	var scene_param;
	switch curr_scene_name {
		case "scr_cutscene_move_character":
		case "scr_cutscene_emote_character":
		case "scr_cutscene_animate_character": scene_param = object_get_name(curr_scene[1]); break;
		default: scene_param = "";
	}

	draw_text(20+string_width(curr_scene_name), game.gui_height-36, scene_param);

}


// room fade for cutscene scripts
if spawn_room == noone { exit; }
draw_set_alpha(black_alpha);
draw_rectangle_colour(0, 0, game.gui_width, game.gui_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);