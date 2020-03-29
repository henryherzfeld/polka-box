/// @description Calculate and set draw coords from txtbox sprites

box=spr_textbox_green;
frame=spr_frame_green;
portrait=spr_portrait;
portrait_padding=48;
namebox=spr_namebox;

text_col=c_white;
highlight_col=c_ltgray;
name_text_col=c_black;
text_padding=54;
font=font_mid;

interact_key = vk_space;

gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

box_width=sprite_get_width(box);
box_height=sprite_get_height(box);
port_width=sprite_get_width(frame);
port_height=sprite_get_height(frame);
namebox_width=sprite_get_width(namebox);
namebox_height=sprite_get_height(namebox);

port_x=(gui_width-box_width-port_width)*0.5;
port_y=(gui_height*0.98) - box_height;
textbox_x=port_x+port_width - 24;
textbox_y=port_y;
namebox_x=port_x;
namebox_y=port_y + port_height;
textbox_padded_x = textbox_x + text_padding;
textbox_padded_y = textbox_y + text_padding;

//textbox_x = (gui_width / 2) - (box_width / 2);
//textbox_y = gui_height - box_height;


global.show_inventory = false;
exiting = false;
first = true;
page = 0;
n = 0;
draw_options = false;
max_preview_len = 45;
n_options = 0;
curr_seq = [];

speaker = noone;
selected = 0;
visited = ds_map_create();

with (polka) {
	in_dialogue = true;
	interactable = false;
}

page_change = true;

counter = 0;
pause = false;

xx=0;
yy=0;
row_offset = 0;

string_object = noone;
string_ = "";
string_n_mods = 0;
string_mods = [];

dialogue_pause = false;

evidence_choice = noone;
evidence_target = noone;
evi_prompt_resp = [];