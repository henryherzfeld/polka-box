scr_save_game();

with(game) {instance_destroy();}
with(obj_camera) {instance_destroy();}
with(obj_state_manager) {instance_destroy();}
with(InventoryManager) {instance_destroy();}
with(flags) {instance_destroy();}
with(obj_badge_manager) {instance_destroy();}
with(obj_notebook) {instance_destroy();}
with(obj_tutorial) {instance_destroy();}
with(obj_tile_manager) {instance_destroy();}

room_goto(main_menu);