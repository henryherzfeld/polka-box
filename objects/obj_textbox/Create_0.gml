/// @description Calculate and set draw coords from txtbox sprites

box=spr_textbox;
frame=spr_portrait_frame;
portrait=spr_portrait;
namebox=spr_namebox;

text_col=c_black;
name_text_col=c_black;
font=font_comic;

interact_key = vk_space;
page = 0;
n = 0;
draw_options = false;
first = true;
option_padding = 25;
exiting = false;

box_width=sprite_get_width(box);
box_height=sprite_get_height(box);

gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

textbox_x = (gui_width / 2) - (box_width / 2);
textbox_y = gui_height - box_height;

selection_y = string_height("M")

global.hide_inventory = true;

with (polka) {
	interactable = false;
}

