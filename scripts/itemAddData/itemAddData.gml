/// @function itemAddData(type,sprite,name,amount,script)
/// @description Add item with the provided properties in the itemDef array
/// @param {enum}	type  Type of the item
/// @param {sprite} sprite Sprite used for the item to be shown in inventory
/// @param {string} name Name of the object
/// @param {string} amount The Amount of the item (usually 0)
/// @param {script} script Script to used as callback

///Add the property of item to the 2d array "itemDef[ , ]"
//Easy to use, making a grid 
///getting the arguments provided in the script and using it
var itemType	= argument[0];
var itemSprite  = argument[1];
var itemName	= argument[2];
var itemAmount	= argument[3];
var itemScript	= argument[4];
var itemDescription = argument[5];

itemDef[itemType,enum_item_state.sprite] = itemSprite;			// = itemDef[ 0, 0];	///Sprite Data in array
itemDef[itemType,enum_item_state.name] = itemName;				// = itemDef[ 0, 1];	///Name Data in array
itemDef[itemType,enum_item_state.amount] = itemAmount;			// = itemDef[ 0, 2];	///Amount Data in array
itemDef[itemType,enum_item_state.callback_script] = itemScript;	// = itemDef[ 0, 3];	///Script Data in array
itemDef[itemType,enum_item_state.description] = itemDescription;
