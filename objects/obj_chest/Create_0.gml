/// @description Chest values

image_speed = 0;			//No animation for Chest
image_index = 0;			//Always on 1st image

//Item Array
//No of content = size of array - 1
//Item[0] = enum_item_type.shovel
//Item[1] = enum_item_type.pitchfork
//Item[2] = enum_item_type.tape 

item = [enum_item_type.shovel,enum_item_type.pitchfork,enum_item_type.tensiometer];

///Get the data of the items from the inventory manager, so we can use respective sprite,name etc
for (var i = 0; i < 3; ++i) {
    //Get the Type of the item in the chwst
	var itemType	= item[i];	
	//Inside Inventory manager
	with (InventoryManager) {
		//Get the Data of item from itemDef Array
		var itemSprite	= itemDef[itemType,enum_item_state.sprite];		//Get the Sprite of the item
		var itemName	= itemDef[itemType,enum_item_state.name];		//Get the Name of the item
		}
	//Save the data in itemData Array, so we can use it in the draw event	
	itemData[i,0] = itemName;				
	itemData[i,1] = itemSprite;
}
///Chest Stat 
show_chest = false;			//Use to check if chest is open/close (displaying on screen or not)
canOpen = true;				//If we can open the chest, as we collide and open the chest,