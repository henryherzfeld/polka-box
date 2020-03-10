/// @description Insert description here

if(draw_evidence){
	///Loop through all the object
	var evi_index = 0;	//Use to index the items in inventory slot

	//Loop through all the inventory slots
	repeat (MAX_ACTIVE_EVI_ITEMS) {
		for (var evi_index = 0; evi_index < MAX_EVI_ITEMS; ++evi_index) {
		//Get Values from the InventoryManager
		// Draw the content	
		var evi_type	= evidence_slot[evi_index];	///Item we are dealing with, saving it in a local variable to process with
	
		//Offset of the slots 
		var xoffset = 16;		//X offset
		var yoffset = 8;		//y Offset
	
		//Slot Variables
		var slot_width = 48;	//Slot Width
		var slot_height = 48;	//Slot Height
		var slot_gap = 52;		//Gap Between Slots
	
		//Slot Positions
		var slot_x1 = (x1 + xoffset) + (evi_index * slot_gap);
		var slot_y1 = y1 + yoffset;
		var slot_x2 = slot_x1 + slot_width;
		var slot_y2 = slot_y1 + slot_height;		
	
		//Item Positoin
	
		var evi_x = slot_x1;		//Item x position relative to slot's x postion
		var evi_y = slot_y1;		//Item y position relative to slot's y postion
	
		var col = c_black;			//Default color for the Slots
	
	///We will only process further if the slot is not empty
			if (evi_type != enum_evi_type.none) {
					var evi_sprite	= evi_def[# evi_type,enum_evi_state.sprite];		//Sprite for the respective type of the item from the itemDef array

		
					draw_sprite_stretched(evi_sprite,0,evi_x,evi_y,48,48);			//Draw the item Sprite
					//Draw Amount
					draw_set_color(c_black);										//Set the draw color to black
	//					draw_set_font(font_small);										//Set the font to font_small
					draw_set_valign(fa_center);										//Draw the text from the bottom
					draw_set_halign(fa_center);										//Draw the text from the left
					draw_set_color(c_white);										//Set the color to white
			
				//Draw Inventory Slot
				var mx = device_mouse_x_to_gui(0);									//Mouse x position relative to display
				var my = device_mouse_y_to_gui(0);									//Mouse y position relative to display
	
	
				///Check If mouse is on the slot, if we are on the slot make white outline to red
				if (point_in_rectangle(mx,my,slot_x1,slot_y1,slot_x2,slot_y2,)){
					col = c_red;														//Change the color to red
					preview_spr = evi_sprite;
						
					//If clicked when inside the slot
					if (mouse_check_button_pressed(mb_left)) {
						//Slot Selected
						//Use the item in the inventory slot
						itemUseInventory(evi_type);
						}
					}
				}
			
		draw_rectangle_color(slot_x1,slot_y1,slot_x2,slot_y2,col,col,col,col,true);					    //Draw Slot Rectangle			

		}
	}
	if(preview_spr != noone){draw_sprite(preview_spr, 0, 450, 600);}
} else {
	preview_spr = noone;
}