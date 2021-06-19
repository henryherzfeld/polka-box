///@description scr_construct_meta
function scr_construct_meta() {

	if not instance_exists(obj_tile_manager) instance_create_layer(0, 0, "Meta", obj_tile_manager);
	instance_create_layer(0, 0, "Meta", flags);
	instance_create_layer(0, 0, "Meta", events);
	instance_create_layer(0, 0, "Meta", obj_camera);
	instance_create_layer(0, 0, "Meta", obj_hints);
	instance_create_layer(0, 0, "Meta", obj_state_manager);
	instance_create_layer(0, 0, "Meta", obj_badge_manager);
	instance_create_layer(0, 0, "Meta", obj_save_manager);
	instance_create_layer(0, 0, "Meta", obj_fun_fact_manager);
	instance_create_layer(0, 0, "Meta", obj_quiz_manager);
	instance_create_layer(0, 0, "Meta", quests);
	instance_create_layer(0, 0, "Meta", dialogue);
	instance_create_layer(0, 0, "Meta", particles);
	instance_create_layer(0, 0, "Meta", obj_overlay);
	instance_create_layer(0, 0, "Meta", obj_combat_manager);
	instance_create_layer(0, 0, "Meta", obj_dungeon_manager);
	instance_create_layer(0, 0, "Meta", depth_sorter);

	if game.mode == "pb" {
	instance_create_layer(0, 0, "Meta", obj_notebook);
	instance_create_layer(0, 0, "Meta", InventoryManager);
	}


}
