/// @description Insert description here

if prev_x == -1 and prev_y == -1 and not dash {
	spd = .5;
	prev_x = x;
	prev_y = y;
	alarm[0] = dash_delay;
	dash_count = 0;
}