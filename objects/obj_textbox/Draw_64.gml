/// @description Draw textbox
if (first){
	current = text[? "greet"];
	first = false;
}

N = ds_map_size(text);
n = array_length_1d(current);
options = current[n-1]


if (!draw_options){
	draw_text(0, 0, current[page]);
} else {
	_y = 0;
	for (var i = 0; i < array_length_1d(options) - 1; i++){
	
		preview = text[? options[i]];
		selection_x = string_width(preview[0])
		selection_y = string_height(preview[0])
		
		var col1 = c_white;										
		var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
		var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)

		if (point_in_rectangle(mx, my, 0, _y, selection_x, selection_y)){
			col1 = c_red;										//Change Color to Red
			//If We are on the option and clicked, than move into dialogue
			if (mouse_check_button_pressed(mb_left)) {
				draw_options = false;
				page = 0;
				current = text[? options[i]];
				}
			}
		draw_text(0, _y, preview[0]);
		draw_rectangle_color(0, _y, selection_x, selection_y,col1,col1,col1,col1,true);	
		
		_y += 20;
	}

	back = options[i];
	col2 = c_white;

	if (point_in_rectangle(mx, my, 300, 10, 310, 20)){
		col2 = c_red;

		if (mouse_check_button_pressed(mb_left)) {
			draw_options = false;
			page = 0;
			current = text[? back]
			}
	}
	draw_rectangle_color(300, 10, 310, 20,col2,col2,col2,col2,true);
}
