/// @description Insert description here
switch (tut_step){
	case 0: if(room = rm_polka_interior){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
				break;
			}
			
	case 1: if(collision_rectangle(polka.x-radius,polka.y-radius,polka.x+radius,polka.y+radius, par_NPC, false, true)){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
				break;
			}

	case 2: var inst = instance_find(obj_textbox, 0);
			if(inst != noone){
				if(inst.draw_options){
					tut_step += 1;	
					draw = true;
					alarm[0] = draw_time * room_speed;
				}
				break;
			}
			
	
	case 3: if(flags.find_poppy and !polka.in_dialogue){
				if(!counter){
					text = ds_map_create();
					text[? "GREET"] = ["Sometimes you will want to review or you may want to ask something different. You can always repeat the most recent conversation with a Villy Nilly", ["EXIT", "EXIT"], [noone]]
					text[? "EXIT"] = ["Ok.", [], [polka]]
				} else if (counter >= wait){
					scr_create_textbox(text, "", polka, []);
					counter = -1;
					tut_step += 1;
				}
				counter += 1;
				break;
			}
			
	case 4: if(flags.examine_crops and !polka.in_dialogue){
				if(!counter){
					text = ds_map_create();
					text[? "GREET"] = ["Now let's take whatever the Villy Nilly has told us and do some investigating ourselves. What clues should we be looking for? What do we have to examine?", ["EXIT", "EXIT"], [noone]]
					text[? "EXIT"] = ["Ok.", [], [polka]]
				} else if (counter >= wait){
					scr_create_textbox(text, "", polka, []);
					counter = -1;
					tut_step += 1;
				}
				counter += 1;
				break;
			}
			
	case 5: if(flags.report_crops_to_poppy and !polka.in_dialogue){
				if(!counter){
					text = ds_map_create();
					text[? "GREET"] = ["Finding a clue will lead to more unanswered questions. Let’s go back and tell the Villy what we found out. We might get some answers.", ["EXIT", "EXIT"], [noone]]
					text[? "EXIT"] = ["Ok.", [], [polka]]
				} else if (counter >= wait){
					scr_create_textbox(text, "", polka, []);
					counter = -1;
					tut_step += 1;
				}
				counter += 1;
				break;
			}

	case 6: var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_chest, false, true);
			if(inst != noone){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
				break;
			}
			
	case 7: var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_chest, false, true);
			if(inst != noone){
				if(inst.show_chest){
					tut_step += 1;
					draw = true;
					alarm[0] = draw_time * room_speed;
					break;
				}
			}

	case 8: if(InventoryManager.inventorySlot[0] != enum_item_type.none){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
				break;
			}

	case 9: if(polka.itemEquiped){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
				break;
			}
}
			
	