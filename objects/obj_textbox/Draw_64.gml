/// @description Draw textbox
draw_sprite(box,0,textbox_x,textbox_y);

draw_set_font(font);
draw_set_valign(fa_top);										
draw_set_halign(fa_left);										

//Test to produce initial greeting text for dialogue
if (first){
	current = text[? "GREET"];
	first = false;
}

n = array_length_1d(current);
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
		selection_y = string_height("M")
		
		var col1 = c_white;
		var col2 = c_white;
		//var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
		//var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)

		// Testing mouse location within selection box for dialogue choice
		//if (point_in_rectangle(mx, my, textbox_padded_x, textbox_padded_y + _y, textbox_padded_x + selection_x, textbox_padded_y + _y + selection_y)){
		
		if(i = selected){
			col1 = c_red;
			col2 = c_gray;
		}
			
			//If We are on the option and clicked, then move into dialogue
			/*if (mouse_check_button_pressed(mb_left)) {
				draw_options = false;
				page = 1;
				current = text[? options[i]];
				if(options[i] = "EXIT"){exiting = true;}
			}*/
		//}

		draw_text_color(textbox_padded_x, textbox_padded_y + _y, preview[0], col2, col2, col2, col2, true);
		draw_rectangle_color(textbox_padded_x, textbox_padded_y + _y, textbox_padded_x + selection_x, textbox_padded_y + _y + selection_y,col1,col1,col1,col1,true);	
		
		_y += selection_y + 2;
		
	}

	//Back button
	back = options[i];
	col2 = c_white;
	
	if(selected = n_options-1){
		col2 = c_red;	
	}

	draw_rectangle_color(textbox_x + box_width - 30, textbox_y, textbox_x + box_width, textbox_y + 30, col2,col2,col2,col2,true);
}

//Drawing player Portrait and Namebox
if(speaker != noone){
	//Draw Portrait Back
	draw_sprite(frame,0,port_x,port_y);

	//Draw Portrait Frame
	draw_sprite(frame,1,port_x,port_y);

	//Draw Namebox
	draw_sprite(namebox,0,namebox_x,namebox_y);
	
	//Draw Name
	draw_text(namebox_x, namebox_y, speaker.name); 
	
	//Draw Portrait Sprite
	draw_sprite(speaker.portrait, 0, port_x, port_y);
}