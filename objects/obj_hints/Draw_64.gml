/// @description Insert description here

if(draw){
	switch (step){
		case 1: draw_sprite_stretched(arrow_keys, image_index*draw_time, xx, yy, arrow_keys_w, arrow_keys_h); 
				draw_text(xx, yy+arrow_keys_h, "Use the Arrow Keys to Move"); 
				break;
		
		case 2: draw_sprite_stretched(e_key, image_index*draw_time, xx, yy, e_key_w, e_key_h); 
				draw_sprite_stretched(space_key, image_index*draw_time, xx, yy+space_key_h, space_key_w, space_key_h);
				draw_text(xx, yy+e_key_h+space_key_h, "Use E to Talk to Someone. \nPress Spacebar to Continue a Conversation."); 
				break;
		
		case 3: draw_sprite_stretched(up_down_keys, image_index*draw_time, xx, yy, up_down_keys_w, up_down_keys_h);
				draw_sprite_stretched(space_key, image_index*draw_time, xx, yy+up_down_keys_h, space_key_w, space_key_h);
				draw_text(xx, yy+up_down_keys_h+space_key_h, "Use the Up and Down Keys to Navigate. \nPress Spacebar to Make a Selection.");
				break;
				
		case 4: draw_text(InventoryManager.slot_start_x, InventoryManager.slot_start_y-24, "Click on an item to equip it."); 
				break;
		
		case 5: draw_sprite_stretched(f_key, image_index*draw_time, xx, yy, f_key_w, f_key_h); 
				draw_text(xx, yy+e_key_h, "Use F to Use an Equipped Item."); 
				break;
		
		case 6: draw_text(obj_overlay.nb_x1-72, obj_overlay.nb_y1-48, "Click on the Notebook Button \n    to View your Evidence."); break;
		
		case 7: draw_text(obj_notebook.slot_start_x, obj_notebook.slot_start_y-24, "Hover the Mouse Cursor over Evidence to Learn More About It.");
				draw_text(700+obj_notebook.child_window_ptr.x1, 100+obj_notebook.child_window_ptr.y1-48, "Click the Exit Button to\n  Return to the Game."); 
				break;
		
		case 8: draw_sprite_stretched(space_key, image_index*draw_time, xx, yy, space_key_w, space_key_h); break;
		        draw_text(xx, yy+space_key_h, "Press Space to Open a Chest");
	}
}

