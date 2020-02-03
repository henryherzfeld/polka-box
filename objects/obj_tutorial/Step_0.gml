/// @description Insert description here

switch (tut_step){
	case 0: if(room = rm_polka_interior){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
			}
			
	case 1: if(collision_rectangle(polka.x-10,polka.y-10,polka.x+10,polka.y+10, par_NPC, false, true)){
				tut_step += 1;
				draw = true;
				alarm[0] = draw_time * room_speed;
			}

	case 2: var inst = instance_find(obj_textbox, 0);
			if(inst != noone){
				if(inst.draw_options){
				tut_step += 1;	
				draw = true;
				alarm[0] = draw_time * room_speed;
				}
			}
			
	
	/*case 3: if(flags.find_poppy){
				text = ds_map_create();
				text[? "GREET"] = ["Sometimes you will want to review or you may want to ask something different. You can always repeat the most recent conversation with a Villy Nilly", ["EXIT", "EXIT"], []]
				text[? "EXIT"] = ["Ok.", [], [polka]]
				scr_create_textbox(text, "", polka, []);
				tut_step += 1;
			}*/
}
			
	