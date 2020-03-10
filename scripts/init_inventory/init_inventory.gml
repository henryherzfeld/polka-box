
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
	tensiometer = 6,
	empty_tube = 7,
	water_tube = 8,
	mag_glass = 9,
	//ADD new item here
	//new_item = 7;
	length,
	}
enum enum_item_state {
	sprite,
	name,
	amount,
	callback_script,
	description,
	//ADD new item property
	//new_property
	length,
	}
	
//Declare the constants	
#macro MAX_ACTIVE_INV_ITEMS 4	//Maximum no of active items tobe added in inventory 
#macro MAX_INV_ITEMS 10			//Maximum on of items to be in inventory (no of inventory slot)
