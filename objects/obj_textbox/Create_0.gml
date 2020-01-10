/// @description Calculate and set draw coords from txtbox sprites

interact_key = vk_space;
page = 0;
n = 0;
draw_options = false;
first = true;
option_padding = 25;
exiting = false;

box_width=sprite_get_width(spr_textbox);
box_height=sprite_get_height(spr_textbox);

gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

textbox_x = (gui_width / 2) - (box_width / 2);
textbox_y = gui_height - box_height;

global.hide_inventory = true;