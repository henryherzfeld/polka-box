/// @description Movemnt Code
var move_x,move_y,move_speed;
move_speed = 5;					//Speed of movement
move_x = keyboard_check(vk_right) - keyboard_check(	vk_left);
move_y = keyboard_check(vk_down) - keyboard_check(vk_up)
x += move_x * move_speed;
y += move_y * move_speed;