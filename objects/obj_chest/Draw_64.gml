/// @description Draw Chest Interface

//If chest is closed, no need to calculate any further so exit from here
if (show_chest == false){exit}

//If Chest is open, Draw the elemnts

///Draw the Rectangle with outline
var inv_x = 80;								//x value of inventory
var inv_y = 128;							//y value of inventory
var inv_width = 640;						//width value of inventory
var inv_height = 320;						//height value of inventory

draw_rectangle_color(inv_x,inv_y,inv_x + inv_width,inv_y + inv_height,c_white,c_white,c_white,c_white,true);		//Outline rectangle
draw_rectangle_color(inv_x,inv_y,inv_x + inv_width,inv_y + inv_height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);	//Fill rectangle

//Draw Title
var tx = inv_x + inv_width/2;		//X positoin of the Title, i.e (Invetory's x position) + (Half Width of Inventory) . i.e Middle of the Rectangle
var ty = inv_y + 8;					//Y positoin of the Title	//Some Offset from the top of the rectangle
draw_set_color(c_white);			//Colour of the Title
draw_set_valign(fa_top);			//Verticle Align (To Top)
draw_set_halign(fa_middle);			//Horizontal Align (to left)
draw_set_font(font_large);			//Using font_Large for Title
draw_text(tx,ty,"CHEST");			//Drawing The TEXT (TITLE) ar tx, ty

//Slot Positions and Values
var xOffSet = 64;					//Slot X-OffSet For 1st Slot from where it'll be drawn relative to the rectangle of inventory
var yOffSet = 80;					//Slot Y-OffSet For 1st Slot from where it'll be drawn relative to the rectangle of inventory
var slot_x = inv_x + xOffSet;		//Slot X Position For 1st Slot from where it'll be drawn relative to the rectangle of inventory and Adding Offset to it
var slot_y = inv_y + yOffSet;		//Slot Y Position For 1st Slot from where it'll be drawn relative to the rectangle of inventory and Adding Offset to it
var slot_width = 128;				//Slot Width For Slot 
var slot_height = 180;				//Slot Height For Slot
var slot_gap = slot_width * 1.5;	//Gap Between Two Slots (Slot Width + some gap) i.e (128 + 64), just made it realtive to width , so changing Width value will effect gap value adjust automatically
var slot_no = 0;					//Slot Index, will be used to identify on which slot our mouse is hovring/clicked

var noOfItem = array_length_1d(item);	//No of Items in the chest, length of the array

///Drawing the Slots, Items and there names, repeting the process for each items (so 3 items will repeat Process 3 times)
repeat(noOfItem){
	
			//Calculating the values for slot, like x1,y1,x2,y2,
			var slot_x1 = slot_x + (slot_no * slot_gap);			//top-left edge x position of the slot (Initial Slot X Posiion + ( Slot No x Gap Bwteen slots )) so for each slot it'll move to right depending on the value of Slot Index
			var slot_y1 = slot_y;									//top-left edge y position of the slot
			var slot_x2 = slot_x1 + slot_width;						//bottom-right x position edge of the slot realtive to Slot's x position
			var slot_y2 = slot_y1 + slot_height;					//bottom-right y position edge of the slot realtive to Slot's y position
		    //Drawing Slot
			var col = c_white;										//Slot Default Color
			var mx = device_mouse_x_to_gui(0);						//Mouse's X pos relative to the display (not the game world)
			var my = device_mouse_y_to_gui(0);						//Mouse's Y pos relative to the display (not the game world)
			///Check If mouse is on the slot, if we are on the slot make white outline to red
			if (point_in_rectangle(mx,my,slot_x1,slot_y1,slot_x2,slot_y2,)){
				col = c_red;										//Change Color to Red
				//If We are on the slot and clicked, than add the item to inventory
				if (mouse_check_button_pressed(mb_left)) {
				    //Slot Selected		
					itemAddInventory(item[slot_no]);						//Add item to Inventory			
					canOpen = false;										//Disable the Chest
					alarm[0] = room_speed * 2;								//Timer the enable the chest after 2 sec
					show_chest = false;										//Close the chest
					}
				}
		
			draw_rectangle_color(slot_x1,slot_y1,slot_x2,slot_y2,col,col,col,col,true);												//Draw Slot Rectangle
	
			draw_set_font(font_mid);																								//Set the font to font_mid
			draw_text(slot_x1 + slot_width/2,slot_y1,itemData[slot_no,0]);															//Draw Item Name at the top middle of the slot
			draw_sprite_ext(itemData[slot_no,1],0,(slot_x1 + slot_width/2),(slot_y1 + slot_height/2),2,2,0,c_white,1);				//Draw Item Sprite in the middile of the slot
	
			//Increase the slot no, so next time we will draw next slot
			slot_no++;	
		}

