if(!draw_evidence){ exit; }

// drawing temp background "sprite"
draw_rectangle_color(0, 0, game.gui_width, game.gui_height, bg_col, bg_col, bg_col, bg_col, false);

var slot_row = 0;
var slot_col = 0;
//Loop through all the evidence slots
for (var ii = 0; ii < MAX_EVI_ITEMS; ++ii) {

	var evi_type = evidence_slot[ii];	///Item we are dealing with, saving it in a local variable to process with
	
	//// setting row and col using index
	// if we're over our slot column max move into a new row
	if slot_col >= slot_col_max - 1 { 
		slot_row += 1;
	}
	slot_col = ii mod slot_col_max;
	
	//Slot Positions
	var slot_x1 = slot_start_x + (slot_width + slot_buffer) * slot_col;
	var slot_y1 = slot_start_y + (slot_height + slot_buffer) * slot_row;
	var slot_x2 = slot_x1 + slot_width;
	var slot_y2 = slot_y1 + slot_height;		
	
	///We will only process further if the slot is not empty
	var col = c_black;			//Default color for the Slots
	
	if (evi_type != enum_evi_type.none) {

		var evi_sprite	= evi_def[evi_type,enum_evi_state.sprite];		//Sprite for the respective type of the item from the itemDef array
		
		draw_sprite_stretched(evi_sprite, 0, slot_x1, slot_y1, slot_width, slot_height);			//Draw the item Sprite

		draw_set_color(c_black);										//Set the draw color to black
		draw_set_font(font_small);										//Set the font to font_small
		draw_set_valign(fa_center);										//Draw the text from the bottom
		draw_set_halign(fa_center);										//Draw the text from the left
		draw_set_color(c_white);										//Set the color to white
			
		var mx = device_mouse_x_to_gui(0);									//Mouse x position relative to display
		var my = device_mouse_y_to_gui(0);									//Mouse y position relative to display
		
		var i_mx = mx - slot_start_x;
		var i_my = my - slot_start_y;
		
		var cell_xbuff = slot_width + slot_buffer;
		var cell_ybuff = slot_height + slot_buffer;
		
		var nx = i_mx div cell_xbuff;
		var ny = i_my div cell_ybuff;
		
		if i_mx > 0 and i_my > 0 and i_mx < slot_total_width and i_my < slot_total_height {				

			var selected_x = i_mx - (nx * cell_xbuff);
			var selected_y = i_my - (ny * cell_ybuff);
			
			if selected_x < slot_width and selected_y < slot_height {
				m_slotx = nx;
				m_sloty = ny;
			}
			// setting selected slot var via mos position
			selected_slot = m_slotx + (m_sloty * slot_col_max);
		} else { selected_slot = noone; };
	
		if (ii == selected_slot){	
			col = c_red;
			preview_spr = evi_sprite;

			//If clicked when inside the slot
			if (mouse_check_button_pressed(mb_left)) {
				clicked_slot = ii;
			}
		}
	}
	if ii == clicked_slot { col = c_blue; }
	draw_rectangle_color(slot_x1,slot_y1,slot_x2,slot_y2,col,col,col,col,true); //Draw Slot Rectangle			
}
	
if preview_spr != noone draw_sprite_stretched(preview_spr, 0, slot_start_x + (preview_w - slot_total_width)/2, slot_start_y + game.gui_height / 3, preview_w/2, preview_h/2);

draw_set_valign(fa_top);
draw_set_halign(fa_top);		