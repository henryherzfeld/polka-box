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
				
		case 4: draw_sprite_stretched(space_key, image_index*draw_time, xx, yy, space_key_w, space_key_h); break;
		        draw_text(xx, yy+space_key_h, "Press Space to Open a Chest");
		
		case 5: //draw_sprite_stretched(m_pressed, image_index*draw_time, xx, yy, m_pressed_w, m_pressed_h); 
				break;
		
		case 6: draw_sprite_stretched(m_pressed, image_index*draw_time, xx, yy, m_pressed_w, m_pressed_h); break;
		
		case 7: draw_sprite_stretched(space_key, image_index*draw_time, xx, yy, space_key_w, space_key_h); break;
	}
}

