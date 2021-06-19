///@description scr_destroy_meta
function scr_destroy_meta() {

	instance_destroy(events);
	instance_destroy(dialogue);
	instance_destroy(obj_camera);
	instance_destroy(flags);
	instance_destroy(obj_hints);
	instance_destroy(obj_state_manager);
	instance_destroy(obj_badge_manager);
	instance_destroy(obj_overlay);
	instance_destroy(obj_notebook);
	instance_destroy(InventoryManager);
	instance_destroy(particles);
	instance_destroy(obj_save_manager);
	instance_destroy(obj_fun_fact_manager);
	instance_destroy(obj_quiz_manager);
	instance_destroy(quests);
	instance_destroy(obj_dungeon_manager);
	instance_destroy(depth_sorter);


}
