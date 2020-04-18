///@description scr_load_game_start

scr_init_game();

if(file_exists("savedgame.sav")){
	
	// get objects from JSON
	var wrapper = scr_load_string_from_JSON("savedgame.sav");
	
	// unpack list from map wrapper
	var root_list = ds_map_find_value(wrapper, "ROOT");
	
	// retrieve maps
	var game_data = ds_list_find_value(root_list, 0); // game_data (coins, hearts, name)
	var loc_data = ds_list_find_value(root_list, 1);  // loc_data  (x, y, room)
	var grid_map = ds_list_find_value(root_list, 2);  // grid_map  (objectives_str)
	var list_map = ds_list_find_value(root_list, 3);  // list_map  (inventory, evidence)
	var villy_loc = ds_list_find_value(root_list, 4); // villy_loc (villies, x, y)
	
	//// access and assign values from maps
	// game_data
	var coins_ = game_data[? "coins"];
	var hearts_ = game_data[? "hearts"];
	var name_ = game_data[? "name"];
	var time_ = game_data[? "time"];
	
	// loc_data
	var x_ = loc_data[? "x"];
	var y_ = loc_data[? "y"];
	var room_ = loc_data[? "room"];
	
	// grid_map
	var objectives_str = grid_map[? "objectives"];
	
	// list_map
	var inventorySlot_ = list_map[? "inventory"];
	var evidence_slot_ = list_map[? "evidence"];
	
	// villy_loc
	var villies_ = villy_loc[? "villies"];
	var x_coords_ = villy_loc[? "x_villies"];
	var y_coords_ = villy_loc[? "y_villies"];
	
	
	//// ASSIGN IT ALLLLLLLL
	// game_data
	flags.coins = coins_;
	flags.hearts = hearts_;
	game.name = name_;
	flags.time = time_;
	
	// grid_map
	var objectives_ = ds_grid_create(enum_objective_type.length, enum_objective_state.length);
	ds_grid_read(objectives_, objectives_str);
	ds_grid_destroy(flags.objectives);
	flags.objectives = objectives_;
	flags.objective_update = true;
	
	// loc_data
	room_goto(room_);

	game.spawn_x = x_;
	game.spawn_y = y_;
	
	// list_map
	InventoryManager.inventorySlot = scr_convert_list_to_array(inventorySlot_);
	obj_notebook.evidence_slot = scr_convert_list_to_array(evidence_slot_);
	
	// villy_loc
	if(!ds_list_empty(obj_state_manager.villies)){
		obj_state_manager.villies = villies_;
		obj_state_manager.x_coords = x_coords_;
		obj_state_manager.y_coords = y_coords_;
	}
	
	// Destroy maps, list
	ds_list_destroy(root_list);
	ds_list_destroy(inventorySlot_);
	ds_list_destroy(evidence_slot_);
	ds_map_destroy(wrapper);
	ds_map_destroy(game_data);
	ds_map_destroy(loc_data);
	ds_map_destroy(grid_map);
	ds_map_destroy(list_map);
	ds_map_destroy(villy_loc);
	
	show_debug_message("Game Loaded");
}




