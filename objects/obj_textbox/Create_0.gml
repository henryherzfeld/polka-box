/// @description Calculate and set draw coords from txtbox sprites

//var namebox = instance_create_layer(0, 0, "Text", obj_nameTextbox)

//with (namebox) {
//	name = self.name;
//	portrait = self.portrait;
//}

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

selection_y = string_height("M")

global.hide_inventory = true;

with (polka) {
	interactable = false;
}

