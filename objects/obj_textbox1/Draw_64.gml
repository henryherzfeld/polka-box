/// @description Draw textbox
draw_sprite(spr_textbox2,0,textbox_x,textbox_y);

draw_set_font(font);
draw_set_valign(fa_top);										
draw_set_halign(fa_left);										

//Test to produce initial greeting text for dialogue
if (first){
	current = text[? "GREET"];
	first = false;
}

n = array_length_1d(current);
show_debug_message(speaker)
options = current[n-2];        // get last item of current dialogue array for options array
speakers = current[n-1];

//deciding to draw an option selection or the current speaker's text
if (!draw_options){

	speaker = speakers[page];
	draw_text_ext_color(textbox_padded_x, textbox_padded_y, current[page], string_height(current[page]), box_width-10, text_col,text_col,text_col,text_col,true);
}
else {
	_y = 0;
	speaker = noone;
	
	for (var i = 0; i < array_length_1d(options) - 1; i++){
	
		preview = text[? options[i]];
		selection_x = string_width(preview[0]);
		
		var col1 = c_white;
		var col2 = c_white;
		var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
		var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)

		// Testing mouse location within selection box for dialogue choice
		if (point_in_rectangle(mx, my, textbox_padded_x, textbox_padded_y + _y, textbox_padded_x + selection_x, textbox_padded_y + _y + selection_y)){
			col1 = c_red;
			col2 = c_gray;
								
			//If We are on the option and clicked, then move into dialogue
			if (mouse_check_button_pressed(mb_left)) {
				draw_options = false;
				page = 0;
				current = text[? options[i]];
				if(options[i] = "EXIT"){exiting = true;}
			}
		}
		draw_text_color(textbox_padded_x, textbox_padded_y + _y, preview[0], col2, col2, col2, col2, true);
		draw_rectangle_color(textbox_padded_x, textbox_padded_y + _y, textbox_padded_x + selection_x, textbox_padded_y + _y + selection_y,col1,col1,col1,col1,true);	
		
		_y += option_padding;
		
	}

	back = options[i];
	
	//Back button
	col2 = c_white;
	
	var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
	var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)

	// Testing mouse location with selection box for back button
	if (point_in_rectangle(mx, my, textbox_x + 300, textbox_y + 10, textbox_x + 310, textbox_y +20)){
		col2 = c_red;

		if (mouse_check_button_pressed(mb_left)) {
			draw_options = false;
			page = 0;
			current = text[? back];
			}
	}
	draw_rectangle_color(textbox_x + 300, textbox_y + 10, textbox_x + 310, textbox_y + 20,col2,col2,col2,col2,true);
}

if(speaker != noone){ draw_text(0, 0, speaker.name); draw_sprite(speaker.portrait, 0, 30, 0)}