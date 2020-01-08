//Test for keyboard inputs
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_down = keyboard_check(vk_down);
input_up = keyboard_check(vk_up);
input_interact = keyboard_check_pressed(ord("E"));
input_space = keyboard_check_pressed(vk_space)

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
radius = 10;
if(input_interact){
	
	var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_NPC, false, false)
	if(inst != noone){
		x += 10;
	}
}

//Check for collision with chest
var inst = instance_place(x, y, obj_chest)

if(inst != noone){
	with (inst) {
	    // Check if we can open the chest
		if (canOpen == true) {
			//Chest is close, open it!
			if (show_chest == false) {
			    //Open Chest
				show_chest = true;
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
				itemEquiped = noone;	
		        break;
			
		    case enum_item_type.pitchfork:
				//Use Shovel
				instance_create_layer(x,y,"Instances",obj_soil_grass);		//Createing an instance with hole sprite assigneed
				itemEquiped = noone;										//Item is destroy after single use
		        break;

		    default:
		        // code here
		        break;
		}

	}
}

x += x_move;
y += y_move;

