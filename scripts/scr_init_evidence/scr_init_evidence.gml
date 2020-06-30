
///Assign Items a number
//Type of items 
//If you want to add one add one above "length"
enum enum_evi_type {
	none,
	evidence1,
	evidence2,
	photo_crop,
	soil_moisture_tbl,
	length,
	}
	
show_debug_message(enum_evi_type.length);
enum enum_evi_state {
	sprite,
	name,
	description,
	length,
	}
	
//Declare the constants	
#macro MAX_ACTIVE_EVI_ITEMS 4	//Maximum no of active items tobe added in inventory 
#macro MAX_EVI_ITEMS 32			//Maximum on of items to be in inventory (no of inventory slot)
