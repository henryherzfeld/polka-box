/// @description Check coll with polka

var inst = instance_place(x, y, polka);

if (inst != noone and inst.input_interact){
	with (InventoryManager) {
		//Add Shovel
		itemAddInventory(enum_item_type.microscope);	
	}
	instance_destroy();
}