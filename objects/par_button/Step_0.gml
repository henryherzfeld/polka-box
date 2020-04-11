/// @description Insert description here

if(point_in_rectangle(par_menu.mx, par_menu.my, x1, y1, x2, y2) and mouse_check_button_pressed(mb_left)){
	clicked = true;
}

if update{
	update = false;
	x2 = x1 + spr_w;
	y2 = y1 + spr_h;
}