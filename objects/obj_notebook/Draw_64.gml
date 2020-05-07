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
		
		if i_mx > 0 and i_my > 0 and i_mx < slot_total_width and i_my < slot_total_height {				

			var selected_x = i_mx div (slot_width + slot_buffer);
			var selected_y = i_my div (slot_height + slot_buffer);
		
			selected_slot = selected_x + (selected_y * slot_col_max);
			
		}
	
		///Check If mouse is on the slot, if we are on the slot make white outline to red
		if (ii == selected_slot){
			col = c_red;														//Change the color to red
			preview_spr = evi_sprite;
						
			//If clicked when inside the slot
			if (mouse_check_button_pressed(mb_left)) {
				//Slot Selected
				//Use the item in the inventory slot
				if(obj_quiz_manager.pending_choice){
					obj_quiz_manager.evi_choice = evi_type;
					draw_evidence = false;
					
					// testing if a window is open, if so re-enable or un-disable it
					var inst = instance_find(ui_window, 0);
					if inst != noone {
						ui_window.disable = false;
					}
				}		
			}
		}
	}
	draw_rectangle_color(slot_x1,slot_y1,slot_x2,slot_y2,col,col,col,col,true); //Draw Slot Rectangle			
}
	
if(preview_spr != noone){draw_sprite(preview_spr, 0, 450, 600);}

draw_set_valign(fa_top);
draw_set_halign(fa_top);		