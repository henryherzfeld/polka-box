/// @description Insert description here

draw_sprite_stretched(box, 0, draw_x + spr_width, draw_y, 500, spr_height);
draw_sprite(bg_spr, 0, draw_x, draw_y);
draw_sprite_stretched(sprite, 0, draw_x, draw_y, spr_width, spr_height);
draw_text_ext(draw_x + spr_width + text_offset, draw_y + text_offset, description, string_height("M"), box_width);