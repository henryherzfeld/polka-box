/// @description Init

//inventory animate parameters
anim_count = 0;
animate = false;
inv_move = -20;

open = false;

//inventory draw parameters
width = 256;		
height = 64;
distance = 600;
bg_color = c_gray;

notebook_id = instance_create_layer(0,0,"Meta",obj_notebook);;

//Create the inventory array, Basicly slots and giving then a default value i.e enum_item_type.none == 0
inventorySlot = array_create(MAX_INV_ITEMS, enum_item_type.none);

//Create an array to store the item properties, giving them defalt value of noone
itemDef = ds_grid_create(enum_item_type.length, enum_item_state.length);

///Define Properties to the items
//Here we define the properties of the items
///itemAddData("ITEM TYPE","ITEM SPRITE ","ITEM NAME","ITEM AMOUNT","ITEM SCIPT WHEN WE USE IT");
//When the item is selected from the inventory, the CALL BACK script will be executed
itemAddData(enum_item_type.none,spr_inventory_slot,"",0,scr_use_item_callback_demo, "");
itemAddData(enum_item_type.microscope,spr_inventory_item_microscope,"microscope",0,scr_use_item_callback_demo, "Used for viewing very small objects");
itemAddData(enum_item_type.pitchfork,spr_inventory_item_pitchfork,"pitchfork",0,scr_use_item_callback_pitchfork, "Lifts hay");
itemAddData(enum_item_type.shovel,spr_inventory_item_shovel,"shovel",0,scr_use_item_callback_shovel, "Digs through soil");
itemAddData(enum_item_type.tape,spr_inventory_item_tape_measure,"tape",0,scr_use_item_callback_tape, "Measures length");
itemAddData(enum_item_type.trowel,spr_inventory_item_trowel,"trowel",0,scr_use_item_callback_demo, "Trowel");
itemAddData(enum_item_type.tensiometer,spr_inventory_item_tensiometer,"tensiometer",0,scr_use_item_callback_tensiometer, "Collects soil moisture");
itemAddData(enum_item_type.empty_tube,spr_empty_test_tube,"empty test tube",0,scr_use_item_callback_empty_test_tube, "Used to hold small amounts of a material");
itemAddData(enum_item_type.water_tube,spr_water_test_tube,"water filled test tube",0,scr_use_item_callback_water_test_tube, "A test tube filled with water");
itemAddData(enum_item_type.mag_glass,spr_water_test_tube,"magnifying glass",0,scr_use_item_callback_mag_glass, "Use to examine an object");

global.show_inventory = true;