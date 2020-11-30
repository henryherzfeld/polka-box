/// @description Insert description here

questions = [
	["3 * 7", 21],
	["2 + 2", 4],
	["10 / 5", 2],
	["12 * 3", 36],
	["9 + 51", 60],
	["10 * 10", 100],
	["100 / 2", 50],
	["16 / 2", 8],
	["12 * 12", 144],
]

polled_question = false;

fade = false;
attack = false;
curr_num = "";
max_char = 5;

enemy = noone;

xx = game.gui_width/2;
yy = 0;

draw = true;
alarm[1] = 500;

knock_count = -1;
knock_angle = 0;

spd = 0.5