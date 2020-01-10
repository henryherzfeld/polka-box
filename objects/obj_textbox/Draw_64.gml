/// @description Draw textbox
draw_sprite(spr_textbox,0,textbox_x,textbox_y);
draw_set_font(font_comic);

if (first){
	current = text[? "greet"];
	first = false;
}

N = ds_map_size(text);
n = array_length_1d(current);
options = current[n-1]


if (!draw_options){
	draw_text_ext(textbox_x, textbox_y, current[page], string_height(current[page]), box_width-10);
} 
else {
	_y = 0;
	for (var i = 0; i < array_length_1d(options) - 1; i++){
	
		preview = text[? options[i]];
		selection_x = string_width(preview[0])
		selection_y = string_height(preview[0])
		
		var col1 = c_white;										
		var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
		var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)

		// Testing mouse location within selection box for dialogue choice
		if (point_in_rectangle(mx, my, textbox_x, textbox_y + _y, textbox_x + selection_x, textbox_y + _y + selection_y)){
			col1 = c_red;										//Change Color to Red
			//If We are on the option and clicked, than move into dialogue
			if (mouse_check_button_pressed(mb_left)) {
				draw_options = false;
				page = 0;
				current = text[? options[i]];
				if(options[i] = "EXIT"){
					exiting = true;
				}
				
				}
			}
		draw_text(textbox_x, textbox_y + _y, preview[0]);
		draw_rectangle_color(textbox_x, textbox_y + _y, textbox_x + selection_x, textbox_y + _y + selection_y,col1,col1,col1,col1,true);	
		
		_y += option_padding;
		
	}
	

	back = options[i];
	col2 = c_white;

	// Testing mouse location with selection box for back button
	if (point_in_rectangle(mx, my, textbox_x + 300, textbox_y + 10, textbox_x + 310, textbox_y +20)){
		col2 = c_red;

		if (mouse_check_button_pressed(mb_left)) {
			draw_options = false;
			page = 0;
			current = text[? back]
			}
	}
	draw_rectangle_color(textbox_x + 300, textbox_y + 10, textbox_x + 310, textbox_y + 20,col2,col2,col2,col2,true);
}
