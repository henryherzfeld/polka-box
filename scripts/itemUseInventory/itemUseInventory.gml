/// @function itemUseInventory(type)
/// @description Execute the call back script and remove 1 amount of the item from the array
/// @param {enum} type enum Index of the item
function itemUseInventory() {


	var itemType = argument[0];
	var itemScript = InventoryManager.itemDef[itemType,enum_item_state.callback_script]

	script_execute(itemScript);			//Execute the call back script
	//itemRemoveInventory(itemType);		//Decrease the value from the inventory


}
