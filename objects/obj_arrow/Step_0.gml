/// @description Insert description here

if dist < max_dist {
	x -= spd;
} else {
	instance_destroy();
}

var player_coll = point_in_rectangle(player.x, player.y, x-24, y-24, bbox_right, bbox_bottom+24);

if player_coll {
	scr_restart_room();
}