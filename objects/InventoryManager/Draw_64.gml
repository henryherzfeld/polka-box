/// @description Draw

if disable { exit; }

/*
var x1 = width;										//x1 pos of the rectangele ( 0 + width) Top-Left edge
var y1 = game.gui_height - height - anim_count;			//Y1 postion (top-left edge) relative to bottom of the screen
var x2 = game.gui_width - width;			//Y1 postion (top-left edge) relative to bottom of the screen
var y2 = game.gui_height - anim_count;					//Y1 postion (top-left edge) relative to bottom of the screen


if(open){											//If inventory is open we need to draw the lower portion
	draw_rectangle_color(x1-anim_count, y2-anim_count, x2+anim_count, y2+anim_count, bg_color,bg_color,bg_color,bg_color,false);
}
*/	

// draw background rectangle
draw_rectangle_color(slot_start_x-4,slot_start_y-4,slot_start_x+slot_total_width-4,slot_start_y+slot_total_width-4,bg_color,bg_color,bg_color,bg_color,false);

var slot_row = 0;
var slot_col = 0;

///Loop through all objects
for (var ii = 0; ii < MAX_INV_ITEMS; ii++) {

	var itemType	= inventorySlot[ii];	///Item we are dealing with, saving it in a local variable to process with
	
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
	
	var col = c_black;			//Default color for the Slots
	
///We will only process further if the slot is not empty
	if (itemType != enum_item_type.none) {
		var itemSprite	= itemDef[itemType,enum_item_state.sprite];		//Sprite for the respective type of the item from the itemDef array
		var itemAmount	= itemDef[itemType,enum_item_state.amount];		//Amount of the respective type of the item from the itemDef array
		
		draw_sprite_stretched(itemSprite, 0, slot_x1, slot_y1, 48, 48);			//Draw the item Sprite

		draw_set_color(c_black);										//Set the draw color to black
		draw_set_font(font_small);										//Set the font to font_small
		draw_set_valign(fa_center);										//Draw the text from the bottom
		draw_set_halign(fa_center);										//Draw the text from the left
		draw_text(slot_x1, slot_y2,itemAmount);							//Draw the amount text
		draw_set_color(c_white);										//Set the color to white
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);	
			
		var mx = device_mouse_x_to_gui(0);									//Mouse x position relative to display
		var my = device_mouse_y_to_gui(0);									//Mouse y position relative to display
		
		var i_mx = mx - slot_start_x;
		var i_my = my - slot_start_y;
		
		var cell_xbuff = slot_width + slot_buffer;
		var cell_ybuff = slot_height + slot_buffer;
		
		if i_mx > 0 and i_my > 0 and i_mx < slot_total_width and i_my < slot_total_height {			
			
				var nx = i_mx div cell_xbuff;
			var ny = i_my div cell_ybuff;

			var selected_x = i_mx - (nx * cell_xbuff);
			var selected_y = i_my - (ny * cell_ybuff);
			
			if selected_x < slot_width and selected_y < slot_height {
				m_slotx = nx;
				m_sloty = ny;
			}
			// setting selected slot var via mos position
			selected_slot = m_slotx + (m_sloty * slot_col_max);
		} else { 
			selected_slot = noone;
			};
		
		///Check If mouse is on the slot, if we are on the slot make white outline to red
		if (ii = selected_slot){
			col = c_red;														//Change the color to red
						
			//If clicked when inside the slot
			if (mouse_check_button_pressed(mb_left)) {
				//Slot Selected
				//Use the item in the inventory slot
				itemUseInventory(itemType);
				}
			}
		}
			
	draw_rectangle_color(slot_x1,slot_y1,slot_x2,slot_y2,col,col,col,col,true);					    //Draw Slot Rectangle			

}