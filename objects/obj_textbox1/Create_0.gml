/// @description Calculate and set draw coords from txtbox sprites

box=spr_textbox2;
frame=spr_portrait_frame;
portrait=spr_portrait;
namebox=spr_namebox;

text_col=c_white;
highlight_col=c_ltgray;
name_text_col=c_black;
text_padding=10;
font=font_small;

interact_key = vk_space;

option_padding = 25;

box_width=sprite_get_width(box);
box_height=sprite_get_height(box);

gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

textbox_x = (gui_width / 2) - (box_width / 2);
textbox_y = gui_height - box_height;
textbox_padded_x = textbox_x + text_padding;
textbox_padded_y = textbox_y + text_padding;

global.show_inventory = false;
exiting = false;
first = true;
page = 0;
n = 0;
draw_options = false;
speaker = noone;


selection_y = string_height("M")

with (polka) {
	in_dialogue = true;
	interactable = false;
}

