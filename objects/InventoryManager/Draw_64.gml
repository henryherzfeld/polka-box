/// @description Draw

//Draw the Rectangle (Inventory Panel)
var width = 256;									//Width of the inventory
var height = 64;									//Height of the inventory
var x1 = width;										//x1 pos of the rectangele ( 0 + width) Top-Left edge
var y1 = display_get_gui_height() - height;			//Y1 postion (top-left edge) relative to bottom of the screen
var x2 = display_get_gui_width() - width;			//Y1 postion (top-left edge) relative to bottom of the screen
var y2 = display_get_gui_height();					//Y1 postion (top-left edge) relative to bottom of the screen

draw_rectangle(x1,y1,x2,y2,false);					//Draw the Rectangle at the bottom of the display

///Loop through all the object
var itemIndex = 0;	//Use to index the items in inventory slot

//Loop through all the inventory slots
//repeat (MAX_ACTIVE_INV_ITEMS) {
	for (var itemIndex = 0; itemIndex < MAX_INV_ITEMS; ++itemIndex) {
	//Get Values from the InventoryManager
	// Draw the content	
	var itemType	= inventorySlot[itemIndex];	///Item we are dealing with, saving it in a local variable to process with
	
	//Offset of the slots 
	var xoffset = 16;		//X offset
	var yoffset = 8;		//y Offset
	
	//Slot Variables
	var slot_width = 48;	//Slot Width
	var slot_height = 48;	//Slot Height
	var slot_gap = 52;		//Gap Between Slots
	
	//Slot Positions
	var slot_x1 = (x1 + xoffset) + (itemIndex * slot_gap);
	var slot_y1 = y1 + yoffset;
	var slot_x2 = slot_x1 + slot_width;
	var slot_y2 = slot_y1 + slot_height;		
	
	//Item Positoin
	
	var itemX = slot_x1;		//Item x position relative to slot's x postion
	var itemY = slot_y1;		//Item y position relative to slot's y postion
	
	var col = c_black;			//Default color for the Slots
	
///We will only process further if the slot is not empty
		if (itemType != enum_item_type.none) {

				var itemSprite	= itemDef[itemType,enum_item_state.sprite];		//Sprite for the respective type of the item from the itemDef array
				var itemAmount	= itemDef[itemType,enum_item_state.amount];		//Amount of the respective type of the item from the itemDef array

		
				draw_sprite_stretched(itemSprite,0,itemX,itemY,48,48);			//Draw the item Sprite
				//Draw Amount
				draw_set_color(c_black);										//Set the draw color to black
				draw_set_font(font_small);										//Set the font to font_small
				draw_set_valign(fa_bottom);										//Draw the text from the bottom
				draw_set_halign(fa_left);										//Draw the text from the left
				draw_text(itemX,slot_y2,itemAmount);							//Draw the amount text
				draw_set_color(c_white);										//Set the color to white
			
			//Draw Inventory Slot
			var mx = device_mouse_x_to_gui(0);									//Mouse x position relative to display
			var my = device_mouse_y_to_gui(0);									//Mouse y position relative to display
	
	
			///Check If mouse is on the slot, if we are on the slot make white outline to red
			if (point_in_rectangle(mx,my,slot_x1,slot_y1,slot_x2,slot_y2,)){
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
		

