/// @description Insert description here

if spr == noone { exit; }

var offset = 1;
if pause { draw_rectangle_color(x-offset, y-offset, x+spr_w*scale/10+offset, y+spr_h*scale/10+offset, bg_grad1, bg_grad2, bg_grad1, bg_grad2, false); }

draw_sprite_stretched(spr, 0, x, y, spr_w*scale/10, spr_h*scale/10);
