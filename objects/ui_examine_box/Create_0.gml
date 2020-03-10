/// @description Insert description here
sprite = spr_portrait;
description = "";
object = noone;

interact_key = vk_space;
draw = true;

draw_x = 100;
draw_y = 100;

bg_spr = spr_portrait_frame

spr_height = sprite_get_height(bg_spr);
spr_width = sprite_get_width(bg_spr);

box = spr_textbox1;
box_width = sprite_get_width(box);

counter = 0;

polka.move_override = true;

text_offset = 10;