
///Assign Items a number
//Type of items 
//If you want to add one add one above "length"
enum enum_item_type {
	none,
	microscope = 1,
	pitchfork = 2,
	shovel = 3,
	tape = 4,
	trowel = 5,
	//ADD new item here
	//new_item = 6;
	length,
	}
enum enum_item_state {
	sprite,
	name,
	amount,
	callback_script,
	//ADD new item property
	//new_property
	length,
	}
	
//Declare the constants	
#macro MAX_ACTIVE_INV_ITEMS 4	//Maximum no of active items tobe added in inventory 
#macro MAX_INV_ITEMS 5			//Maximum on of items to be in inventory (no of inventory slot)
