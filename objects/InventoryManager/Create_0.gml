/// @description Init

//Create the inventory array, Basicly slots and giving then a default value i.e enum_item_type.none == 0
inventorySlot[MAX_INV_ITEMS] = enum_item_type.none;

//Create an array to store the item properties, giving them defalt value of noone
itemDef[enum_item_type.length,enum_item_state.length] = noone;

///Define Properties to the items
//Here we define the properties of the items
///itemAddData("ITEM TYPE","ITEM SPRITE ","ITEM NAME","ITEM AMOUNT","ITEM SCIPT WHEN WE USE IT");
//When the item is selected from the inventory, the CALL BACK script will be executed
itemAddData(enum_item_type.none,spr_inventory_slot,"",0,scr_use_item_callback_demo);
itemAddData(enum_item_type.microscope,spr_inventory_item_microscope,"microscope",0,scr_use_item_callback_demo);
itemAddData(enum_item_type.pitchfork,spr_inventory_item_pitchfork,"pitchfork",0,scr_use_item_callback_pitchfork);
itemAddData(enum_item_type.shovel,spr_inventory_item_shovel,"shovel",0,scr_use_item_callback_shovel);
itemAddData(enum_item_type.tape,spr_inventory_item_tape_measure,"tape",0,scr_use_item_callback_tape);
itemAddData(enum_item_type.trowel,spr_inventory_item_trowel,"trowel",0,scr_use_item_callback_demo);

global.hide_inventory = false;