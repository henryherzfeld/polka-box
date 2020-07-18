/// @description Insert description here

step = 0;
draw = false;
draw_time = .05;
radius = 30;

counter = 0;
wait = 200;

xx = 100;
yy = 100;
scale = 4;
text_offset = 60;

arrow_keys = spr_arrow_keys;
arrow_keys_h = sprite_get_height(arrow_keys) * scale;
arrow_keys_w = sprite_get_width(arrow_keys) * scale;

e_key = spr_e;
e_key_h = sprite_get_height(e_key) * scale;
e_key_w = sprite_get_width(e_key) * scale;

up_down_keys = spr_arrow_up_down;
up_down_keys_h = sprite_get_height(up_down_keys) * scale;
up_down_keys_w = sprite_get_width(up_down_keys) * scale;

space_key = spr_space;
space_key_h = sprite_get_height(space_key) * scale;
space_key_w = sprite_get_width(space_key) * scale;

m_pressed = spr_mouse_pressed;
m_pressed_h = sprite_get_height(m_pressed) * scale;
m_pressed_w = sprite_get_width(m_pressed) * scale;