/// @description Insert description here

if disp >= max_x or disp < 0 {
	facing *= -1;
}

var x_move = spd * facing;
x += x_move;
disp += x_move;


if place_meeting(x, y, polka_pt) {
	scr_restart_room();
}

if place_meeting(x, y, polka_pt_rc) {
	scr_restart_room();
}