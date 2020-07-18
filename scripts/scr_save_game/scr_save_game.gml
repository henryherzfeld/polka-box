/// @description Insert description here

var inst = instance_find(obj_cutscene, 0);

if inst != noone {
	if inst.active { exit; }
}

// create our root list
var root_list = ds_list_create();

// game map, add pertinent info
var game_data = ds_map_create();
ds_map_add(game_data, "coins", flags.coins);
ds_map_add(game_data, "hearts", flags.hearts);
ds_map_add(game_data, "name", game.name);
ds_map_add(game_data, "time", flags.time);

// location map
var loc_data = ds_map_create();
instance_activate_object(polka)
ds_map_add(loc_data, "x", polka.x);
ds_map_add(loc_data, "y", polka.y);
ds_map_add(loc_data, "room", room);

// dialogue_indexes
var dialogue_idx_map = ds_map_create();
ds_map_copy(dialogue_idx_map, dialogue.idxs);

// grids
var grid_map = ds_map_create();
var objectives_str = ds_grid_write(flags.objectives);
var quests_str = ds_grid_write(quests.quests_grid);
ds_map_add(grid_map, "objectives", objectives_str);
ds_map_add(grid_map, "quests", quests_str);

// lists
var list_map = ds_map_create();
var inventory_list = scr_convert_array_to_list(InventoryManager.inventorySlot);
var evidence_list = scr_convert_array_to_list(obj_notebook.evidence_slot);
ds_map_add_list(list_map, "inventory", inventory_list)
ds_map_add_list(list_map, "evidence", evidence_list)

/*
// villy locations
var villy_loc = ds_map_create();
var villies_ = ds_list_create(); var x_coords_ = ds_list_create(); var y_coords_ = ds_list_create();
ds_list_copy(villies_, obj_state_manager.villies); 
ds_list_copy(x_coords_, obj_state_manager.x_coords); 
ds_list_copy(y_coords_, obj_state_manager.y_coords);

ds_map_add_list(villy_loc, "villies", villies_);
ds_map_add_list(villy_loc, "x_villies", x_coords_);
ds_map_add_list(villy_loc, "y_villies", y_coords_);
*/

// add maps to root list
ds_list_add(root_list, game_data);
ds_list_add(root_list, loc_data);
ds_list_add(root_list, grid_map);
ds_list_add(root_list, list_map);
ds_list_add(root_list, dialogue_idx_map);
//ds_list_add(root_list, villy_loc);

// confirm maps in list
for(var i = 0; i < ds_list_size(root_list); i++){
	ds_list_mark_as_map(root_list, i);
}

// wrap root list in a map
var wrapper = ds_map_create();
ds_map_add_list(wrapper, "ROOT", root_list);

var string_ = json_encode(wrapper);
scr_save_string_to_JSON("savedgame.sav", string_);

ds_map_destroy(wrapper);

show_debug_message("Game Saved");