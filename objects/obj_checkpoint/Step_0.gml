/// @description Insert description here

if not pressed and checkpoint_id != noone and place_meeting(x, y, game_pt.player) {
	game_pt.checkpoint = checkpoint_id;
	game_pt.spawn_x = x;
	game_pt.spawn_y = y;
	pressed = true;
}