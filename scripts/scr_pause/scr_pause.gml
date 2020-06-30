///@description scr_pause

if(flags.paused_time == -1){
	flags.paused_time = flags.time;
}

if(!sprite_exists(screenshot)){
	screenshot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);
}

instance_deactivate_all(false);
instance_activate_object(game);
instance_activate_object(par_menu);
instance_activate_object(ui_window);
instance_activate_object(par_button);
instance_activate_object(flags);
instance_activate_object(obj_state_manager);
instance_activate_object(obj_tile_manager);
instance_activate_object(InventoryManager);
instance_activate_object(obj_notebook);
instance_activate_object(quests);
instance_activate_object(dialogue);