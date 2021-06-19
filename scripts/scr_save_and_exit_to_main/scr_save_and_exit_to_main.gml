function scr_save_and_exit_to_main() {
	scr_save_game();

	with(game) {instance_destroy();}
	with(obj_camera) {instance_destroy();}
	with(obj_state_manager) {instance_destroy();}
	with(InventoryManager) {instance_destroy();}
	with(flags) {instance_destroy();}
	with(obj_badge_manager) {instance_destroy();}
	with(obj_notebook) {instance_destroy();}
	with(obj_hints) {instance_destroy();}
	with(obj_tile_manager) {instance_destroy();}
	with(dialogue) {instance_destroy();}
	with(quests) {instance_destroy();}

	room_goto(main_menu);


}
