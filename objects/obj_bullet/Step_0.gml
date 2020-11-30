/// @description Insert description here


if destroy and knock_count >= 0 {
	knock_count -= 1;
	
	polka.x += lengthdir_x(3*spd+(knock_count*knock_count*.001), knock_angle);
	polka.y += lengthdir_y(3*spd+(knock_count*knock_count*.001), knock_angle);
	exit;
} else if destroy {
	instance_destroy();
}

dx = lengthdir_x(spd*30, angle);
dy = lengthdir_y(spd*30, angle);

x += dx;
y += dy;

//var inst = collision_circle(x, y, hit_radius, );
if point_distance(x+sprite_width/2, y+sprite_height/2, polka.x+polka.sprite_width/2, polka.y+polka.sprite_height/2) >= spd*20 {

} else {
	polka.invincible = true;
	polka.alarm[1] = room_speed*3;
	flags.hearts -= 1;
	audio_play_sound(snd_question_wrong, 1, false);
	destroy = true;
	
	// get knockback values
	knock_angle = point_direction(x+sprite_width/2, y+sprite_height/2, polka.x+polka.sprite_width/2, polka.y+polka.sprite_height/2);
	knock_count = knock_time;
}