/// @description Insert description here

var player_coll = point_in_rectangle(player.x, player.y, x, y, bbox_right, bbox_bottom);

if can_fire and player_coll {
	instance_create_layer(x+view_wport[0], y, "Projectiles", obj_arrow_slow);
	can_fire = false;
	alarm[0] = fire_timeout;
}