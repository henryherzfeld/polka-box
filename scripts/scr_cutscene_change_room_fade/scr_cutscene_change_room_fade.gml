///@description scr_cutscene_change_room_fade
///@spawn_room
///@target_x
///@target_y
///@spd
function scr_cutscene_change_room_fade(argument0, argument1, argument2, argument3) {

	var _spawn_room = argument0;
	var _target_x = argument1;
	var _target_y = argument2;
	var spd = argument3;

	if spawn_room == noone {
		spawn_room = _spawn_room;
		game.spawn_x = _target_x;
		game.spawn_y = _target_y;
	}

	if (room != spawn_room) {
		black_alpha += spd/10;
		
		if (black_alpha >= 1) {
			room_goto(spawn_room);
		}
	} else {
		//alarm[0] = 2 * room_speed;
		black_alpha -= 0.1;
		if (black_alpha <= 0){
			spawn_room = noone;
			scr_cutscene_end_action();
		}
	}



}
