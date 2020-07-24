/// @description Insert description here
sprite = spr_portrait;
description = "";
object = noone;

interact_key = vk_space;
draw = true;

bg_spr = spr_portrait_frame

spr_height = sprite_get_height(bg_spr);
spr_width = sprite_get_width(bg_spr);

box = spr_textbox1;
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);

draw_x = (game.gui_width - box_width - spr_width)/2;
draw_y = game.gui_height/2 + spr_height;

counter = 0;

polka.move_override = true;

text_offset = 10;

con_text = "Press space to continue...";
con_text_h = string_height(con_text);
con_text_w = string_width(con_text);
