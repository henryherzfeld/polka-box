/// @description Draw textbox
draw_sprite(box,0,textbox_x,textbox_y);

draw_set_font(font);
draw_set_valign(fa_top);										
draw_set_halign(fa_left);										

if first { exit; }

//deciding to draw an option selection or the curr_seq speaker's text
if (!draw_options){
	var substr = string_copy(string_wrapped, 1, counter);
	
	if(!pause and counter < string_len){
		counter += 1;
		
		switch (string_char_at(string_wrapped, counter)){
			case ",": pause = true; alarm[0] = 15; break;
			case ".": pause = true; alarm[0] = 25; break;
			case "?": pause = true; alarm[0] = 25; break;
			case "!": pause = true; alarm[0] = 25; break;
			case "\n": row_offset += 1; break;
			
			// Testing for color character
			case "@": 
				pause = true;
				alarm[0] = 25;
				
				//loop to find end of color segment
				
				string_wrapped = string_replace(string_wrapped, "@", "iiiii")
				counter += 6 - 1;
				string_len += 6 - 1;

				color_substr = "asd";
				xx = textbox_padded_x + string_width(substr)
				yy = textbox_padded_y + string_height("M") * row_offset
		}
		
	}
	
	
	draw_text_color(textbox_padded_x, textbox_padded_y, substr, text_col, text_col, text_col, text_col, true);
	if(xx){
		draw_text_color(xx, yy, color_substr, c_blue, c_blue, c_red, c_red, true);
	}
}
else {
	_y = 0;
	speaker = noone;
	
	for (var i = 0; i < n_options - 1; i++){

		var seq = text[? options[i]];
		var preview_len = string_length(seq[0]);
		var preview = string_copy(seq[0], 0, max_preview_len);
		
		if(preview_len >  max_preview_len){preview = string_insert("...", preview, max_preview_len+1);}
		
		
		var selection_x = string_width(preview);
		var selection_y = string_height("M")
		
		var col1 = c_white;
		var col2 = c_white;
		
		// Setting color of option preview text if we've visited it before
		if(visited[? options[i]]){
			col2 = c_gray;
		}
		//var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
		//var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)

		// Testing mouse location within selection box for dialogue choice
		//if (point_in_rectangle(mx, my, textbox_padded_x, textbox_padded_y + _y, textbox_padded_x + selection_x, textbox_padded_y + _y + selection_y)){
		
		if(i = selected){
			col1 = c_red;
		}
			
			//If We are on the option and clicked, then move into dialogue
			/*if (mouse_check_button_pressed(mb_left)) {
				draw_options = false;
				page = 1;
				curr_seq = text[? options[i]];
				if(options[i] = "EXIT"){exiting = true;}
			}*/
		//}

		draw_text_color(textbox_padded_x, textbox_padded_y + _y, preview, col2, col2, col2, col2, true);
		draw_rectangle_color(textbox_padded_x, textbox_padded_y + _y, textbox_padded_x + selection_x, textbox_padded_y + _y + selection_y,col1,col1,col1,col1,true);	
		
		_y += selection_y + 2;
		
	}
/*
	//Back button
	back = options[i];
	col2 = c_white;
	
	if(selected = n_options-1){
		col2 = c_red;	
	}

	draw_rectangle_color(textbox_x + box_width - 30, textbox_y, textbox_x + box_width, textbox_y + 30, col2,col2,col2,col2,true);
	*/
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
	
	if(speaker.portrait == spr_portrait_weeraway){
		draw_sprite(speaker.portrait, 0, port_x  + ((port_width - sprite_get_width(speaker.portrait) - 24)/2), port_y - 13)
	} else{
		draw_sprite_stretched(speaker.portrait, 0, port_x + portrait_padding, port_y, port_width - portrait_padding*2, port_height - portrait_padding);
	}
}

draw_set_font(font_comic);