/// @description Insert description here

if(draw){
	//Background
	draw_rectangle_color(0, 0, game.gui_width, game.gui_height, bg_col, bg_col, bg_col, bg_col, false);
	
	//Header
	draw_text((game.gui_width - string_width(header))/2, 10, header);
	
	//Badges
	var count = 0;
	repeat(enum_badge_type.length){
		var sprite_col = badge_def[count, enum_badge_state.sprite_col];
		var sprite_bw = badge_def[count, enum_badge_state.sprite_bw];
		var name = badge_def[count, enum_badge_state.name];
		var desc = badge_def[count, enum_badge_state.description];
		var acquired = badge_def[count, enum_badge_state.acquired];
		
		// Changing badge to color if we've acquired it
		var sprite = sprite_bw;
		if(acquired){ sprite = sprite_col};
		
		draw_sprite(sprite, 0, badge_x + count*badge_x_offset, badge_y);
		draw_text(badge_x + count*badge_x_offset - badge_width, badge_y + 30, name);
		
		var mx = device_mouse_x_to_gui(0);									//Mouse x position relative to display
		var my = device_mouse_y_to_gui(0);									//Mouse y position relative to display
		
		if (point_in_rectangle(mx,my,badge_x + count*badge_x_offset, badge_y, badge_x + count*badge_x_offset + badge_width, badge_y + badge_height)){
			draw_text(mx + 10, my + 10, desc);
		}
		count++;
	}
}