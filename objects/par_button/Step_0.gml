/// @description Insert description here

if disable { exit; }

var win_scale = min((game.gui_width/1500), game.gui_height/840);

if(point_in_rectangle(par_menu.mx, par_menu.my, x1*win_scale, y1*win_scale, x2*win_scale, y2*win_scale) and mouse_check_button_pressed(mb_left)){
	clicked = true;
	audio_play_sound(snd_click, 1, false);
}

if update{
	update = false;
	x2 = x1 + spr_w;
	y2 = y1 + spr_h;
}