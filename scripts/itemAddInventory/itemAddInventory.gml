/// @function itemAddInventory(type);
/// @description Add item to inventory, return true on success and false in faliure
/// Checks if a slot is empty, if empty then assign it the item, else failure
/// @param {enum} type Type of the item
function itemAddInventory() {

	var itemType = argument[0];
	var indexAddedAt = 0;

	//Process the input manager
	with (InventoryManager) {
		//Check if the item already exists, if not exists save it to the empty index and save the index in the variable
		if (array_find_index(inventorySlot,itemType) == -1) {
		    //Add Item into the inventory
			indexAddedAt = array_replace_value(inventorySlot,enum_item_type.none,itemType);
		}

		//If the item is added to the inventory, than increase the amount of the item in inventory
		if (indexAddedAt != -1) {
				//Add the item
				itemDef[itemType,enum_item_state.amount] += 1;
				return true;
			}
		}
	return false;


}
