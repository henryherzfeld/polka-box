/// @function itemRemoveInventory(type);
/// @description Remove item from the inventory
/// @param {enum} type Type of the item
function itemRemoveInventory() {

	/// Decrease the item from the inventory
	/// Checks if the amount of the item in the inventory is greate then 0, if its greater than 0 than decrease 1 unit,
	/// Else remove the item from the inventory

	/// @param {enum} type Type of the item

	var itemType = argument[0];

	with (InventoryManager) {
			//Find the index of the item in the inventory Slot
			var index = array_find_index(inventorySlot,itemType);

			///If item index found
			if (index != -1) {
			    //Decrease Item from the inventory
				itemDef[itemType,enum_item_state.amount] -= 1;

			    //Remove the item if it's negative value
				if (itemDef[itemType,enum_item_state.amount] <= 0) {
					//assign the empty slot properties
					   inventorySlot[index] = enum_item_type.none;
				}

			}
	}


}
