/// @description Check coll with polka
// You can write your code in this editor

var inst = instance_place(x, y, polka);

if (inst != noone and inst.input_interact){
	with (InventoryManager) {
		//Add Shovel
		itemAddInventory(enum_item_type.shovel);	
	}
	instance_destroy();
}