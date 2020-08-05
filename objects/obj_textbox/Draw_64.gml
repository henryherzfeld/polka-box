/// @description Draw textbox
draw_sprite(box,0,textbox_x,textbox_y);

draw_set_font(font);
draw_set_valign(fa_top);										
draw_set_halign(fa_left);										

if first { exit; }

//deciding to draw an option selection or the curr_seq speaker's text
if (!draw_options){
	
	if !pause {
		if counter < string_len{
			counter += 1;
			
			var curr_char;
			if color_draw { curr_char = string_char_at(string_pre_arr[color_idx], counter)}
			else { curr_char = string_char_at(string_wrapped, counter)}
		
			switch (curr_char){
				case ",": pause = true; alarm[0] = 15; break;
				case ".": pause = true; alarm[0] = 25; break;
				case "?": pause = true; alarm[0] = 25; break;
				case "!": pause = true; alarm[0] = 25; break;
				case "\n": row_offset += 1; break;
		
			}
		} else if color_draw and counter >= string_len {
			if color_idx < array_length_1d(string_pre_arr)-1 {
				
				color_idx += 1;
				string_len = string_length(string_pre_arr[color_idx]);
				counter = 0;

				if newline_draw_offset < array_length_1d(newline_draw_idxs) {
					if color_idx == newline_draw_idxs[newline_draw_offset] {
						newline_draw_offset += 1;
						newline_draw_change = true;
					} 
				} 

				col_ys[color_idx] = string_height(string_pre_arr[color_idx-1])*newline_draw_offset;
				
				if newline_draw_change {
					newline_draw_change = false;
					col_xs[color_idx] = 0;
				} else {
					col_xs[color_idx] = string_width(string_pre_arr[color_idx-1]) + col_xs[color_idx-1];
				}
			} else {
				text_drawn = true;
			}
		} else {
			text_drawn = true;
		}
	}
	
	if not color_draw { 
		var substr = string_copy(string_wrapped, 1, counter);
	} else {
		var substr = string_copy(string_pre_arr[color_idx], 1, counter);
	}
	
	if color_draw {
		
		var draw_col = text_col_default;
		var n_col_drawn = 0;
		var temp = 0;
		var n_newline_draw_idxs = array_length_1d(newline_draw_idxs);
		for(var i = 0; i < color_idx; i++) {
			var drawn_col = text_col_default;
		
			if n_newline_draw_idxs and i == newline_draw_idxs[temp] {
				temp += 1;
			}

			if not ((i+1-temp) mod 2) {
				n_col_drawn += 1;
				drawn_col = string_colors[(i-temp) div 2];
			} else if not ((i-temp) mod 2) and i == color_idx-1 and n_col_drawn < array_length_1d(string_colors) { draw_col = string_colors[(i-temp) div 2]; }
			draw_text_color(textbox_padded_x + col_xs[i], textbox_padded_y + col_ys[i], string_pre_arr[i], drawn_col, drawn_col, drawn_col, drawn_col, true);
		}
		draw_text_color(textbox_padded_x + col_xs[color_idx], textbox_padded_y + col_ys[color_idx], substr, draw_col, draw_col, draw_col, draw_col, true);
	} else {
		draw_text_color(textbox_padded_x, textbox_padded_y, substr, text_col, text_col, text_col, text_col, true);
	}
	
	// drawing dialogue continue symbol
	if text_drawn {
		draw_sprite(spr_arrow, 0, textbox_x + box_width - 100, textbox_y + box_height - 100);
	}
	
}
else {
	draw_set_font(font_small);
	_y = 0;
	speaker = noone;
	
	for (var i = 0; i < n_options - 1; i++){

		var seq = text[? options[i]];
		if is_array(seq[0]) { seq = seq[0]; }
		var preview_len = string_length(seq[0]);
		var preview = string_copy(seq[0], 0, max_preview_len);
		
		if(preview_len > max_preview_len){preview = string_insert("...", preview, max_preview_len+1);}
		
		
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
		draw_rectangle_color(textbox_padded_x, textbox_padded_y + _y +selection_y, textbox_padded_x + selection_x, textbox_padded_y+_y+selection_y,col1,col1,col1,col1,false);	
		
		_y += selection_y + 24;
		
	
	}
	draw_set_font(font_large);
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
	var portrait = speaker.portraits[emotion];

	draw_sprite_stretched(portrait, 0, port_x + (portrait_padding)/2-4, port_y - portrait_padding, port_width - portrait_padding*2, port_height);

	//old portrait draw
	//draw_sprite_stretched(portrait, 0, port_x + portrait_padding, port_y, port_width - portrait_padding*2, port_height - portrait_padding);

	
	//If sprite_draw draw set sprite
	if sprite_draw {
		draw_sprite(sprite_to_draw, 0, textbox_x + (box_width - sprite_x) / 2, textbox_y-sprite_y);
	}
}

draw_set_font(font_comic);