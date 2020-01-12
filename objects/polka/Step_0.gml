//Test for keyboard inputs
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_down = keyboard_check(vk_down);
input_up = keyboard_check(vk_up);
input_interact = keyboard_check_pressed(ord("E"));
input_space = keyboard_check_pressed(vk_space)

radius = 30;
show_debug_message(move_override)
//Calculate intended movement
y_move = (input_down - input_up) * spd;
if (!y_move) { x_move = (input_right - input_left) * spd; }

//Check for collision with collision object
if(place_meeting(x+x_move, y, obj_collision)) {
	x_move = 0;
}
if(place_meeting(x, y+y_move, obj_collision)) {
	y_move = 0;
}

if(!in_dialogue and !move_override){
	x += x_move;
	y += y_move;
}

//Check for collision with transition object
var inst = instance_place(x, y, obj_transition);

if (inst != noone) {
	with (game) {
		if (!do_transition){
			spawn_room = inst.target_room;
			spawn_x = inst.target_x;
			spawn_y = inst.target_y;
			do_transition = true;
		}
	}
}

//Check for collision with NPC
if(input_interact and !in_dialogue){
	
	var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_NPC, false, false)
	if(inst != noone){
		scr_create_textbox(inst.text, inst.name, inst.portrait, inst.scripts);
	}
}

//Check for collision with chest
var inst = instance_place(x, y, obj_chest)

if(inst != noone){
	with (inst) {
	    // Check if we can open the chest
		if (canOpen and polka.input_interact) {
			if (show_chest == false) {
				show_chest = true;
			}
		}
	}
}

//Check for collision with trigger
var inst = instance_place(x, y, obj_trigger);

if(inst != noone){
	with (inst) {
		scripts = inst.scripts;
		if(is_array(scripts)){
			n = array_length_1d(scripts);
			for (var i = 0; i < n; i++){
				args = scripts[i];
				if(is_array(args)){
					script_execute(args[0], args[1], args[2], args[3]);
				}
			}
		}
	}
}

//Check for used item
if(input_space){
	if (itemEquiped != noone) {
	
		switch (itemEquiped) {
		    case enum_item_type.shovel:
				//Use Shovel
				instance_create_layer(x,y,"Instances",obj_soil_hole);		//Createing an instance with hole sprite assigneed
		        break;
			
		    case enum_item_type.pitchfork:
				//Use Shovel
				instance_create_layer(x,y,"Instances",obj_soil_grass);		//Createing an instance with hole sprite assigneed									//Item is destroy after single use
		        break;
				
			case enum_item_type.tape:
				//Use tape
				var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_soil_hole, false, false)
				if(inst != noone){
					inst.draw_temp = true;
					inst.alarm[0] = room_speed * 2;
				}
				break;

		    default:
		        // code here
		        break;
		}

	}
}

//check for nearby interactable for overhead prompt
if (!in_dialogue){
	var interactable_1 = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_NPC, false, false)
	var interactable_2 = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_item, false, false)
	if (interactable_1 or interactable_2){
		interactable = true;
	}
else{
	interactable = false;
}
}