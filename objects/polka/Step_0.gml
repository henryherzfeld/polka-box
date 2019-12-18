//Test for keyboard inputs
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_down = keyboard_check(vk_down);
input_up = keyboard_check(vk_up);

//Calculate intended movement
y_move = (input_down - input_up) * spd;
if (!y_move) { x_move = (input_right - input_left) * spd; }

//Check for collision
if(place_meeting(x+x_move, y, obj_collision)) {
	x_move = 0;
}
if(place_meeting(x, y+y_move, obj_collision)) {
	y_move = 0;
}

x += x_move;
y += y_move;

