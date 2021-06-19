/// @description Insert description here
// You can write your code in this editor
if(following == noone){exit;}

x = clamp(x, following.x - h_border, following.x + h_border) + x_offset;
y = clamp(y, following.y - v_border, following.y + v_border);