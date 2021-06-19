 //Test for keyboard inputs
input_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
input_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
input_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
input_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
input_interact = keyboard_check_pressed(ord("E"));
input_space = keyboard_check_pressed(vk_space) and not input_space;
input_use_item = keyboard_check_pressed(ord("F"));
input_use_weapon = keyboard_check_pressed(vk_tab);

// flip-flopping inv_bool for invincibility flash
if invincible {
	if inv_count >= 20 {
		inv_count = 0;
		inv_bool = !inv_bool
	}

	inv_count += 1;
}

// dash 
if dash and dash_count < dash_time {
	if not dash_count { // if first loop iter
	
		var _angle = point_direction(prev_x, prev_y, x, y);
		dx = lengthdir_x(spd, _angle);
		dy = lengthdir_y(spd, _angle);

	}
	dash_count += 1;

	
} else if dash and dash_count >= dash_time {
	dash = false;
	dash_count = -1;
	spd = 2.5;
	prev_x = -1;
	prev_y = -1;
	dx = 0;
	dy = 0;
	x_move = 0;
	y_move = 0;
}

//Calculate intended movement
y_move = (input_down - input_up + (dy*dash_distance)) * spd;
if (!y_move) { x_move = (input_right - input_left + (dx*dash_distance)) * spd; }

//Assign facing variable with movement's direction, default to xmovement
if not move_override {
	if(x_move != 0){
		switch(sign(x_move)){
			case 1: facing = dir.right; break;
			case -1: facing = dir.left; break;
		}
	} else if (y_move != 0) {
		switch(sign(y_move)){
			case 1: facing = dir.down; break;
			case -1: facing = dir.up; break;
		}
	}
}

//Assign walking sprite according to direction facing
if(!in_dialogue and !move_override){
	if(x_move != 0 or y_move != 0 and curr_tree == noone){
		switch(facing){
			case 0: sprite_index = walk_back; break;
			case 90: sprite_index = walk_right; break;
			case 180: sprite_index = walk_front; break;
			case 270: sprite_index = walk_left; break;
		}
	} else { // assign standing  sprite if polka is not moving
		switch(facing){
			case 0: sprite_index = stand_back; break;
			case 90: sprite_index = stand_right; break;
			case 180: sprite_index = stand_front; break;
			case 270: sprite_index = stand_left; break;
		}
	}
} else if in_dialogue and !move_override {
	switch(facing){
		case 0: sprite_index = stand_back; break;
		case 90: sprite_index = stand_right; break;
		case 180: sprite_index = stand_front; break;
		case 270: sprite_index = stand_left; break;
	}
}

//Check for collision with collision object
if(x_move != 0){
	if(place_meeting(x+x_move, y, par_collision)) {
		repeat(abs(x_move)){
			if(!place_meeting(x+sign(x_move), y, par_collision)){
				x += sign(x_move);	
			} else { break; }
		}
		x_move = 0;
	}
}
if(y_move != 0){
	if(place_meeting(x, y+y_move, par_collision)) {
		repeat(abs(y_move)){
			if(!place_meeting(x, y+sign(y_move), par_collision)){
				y += sign(y_move);	
			} else { break; }
		}
		 y_move = 0;
	}
}

if(!in_dialogue and !move_override){
	x += x_move;
	y += y_move;
	curr_x = x;
	curr_y = y;
}

//Check for collision with transition object
var inst = instance_place(x, y, obj_transition);

if (inst != noone and not inst.disable and not game.do_transition) {
	scr_audio_play_sound(snd_door_enter, 1, false);
	with (game) {
		if (!do_transition){
			spawn_room = inst.target_room;
			spawn_x = inst.target_x;
			spawn_y = inst.target_y;
			spawn_facing = other.facing;
			do_transition = true;
		}
	}
}

//Check for attack on enemy
if input_use_weapon and polka.itemEquiped == enum_item_type.pitchfork {
	var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, par_enemy, false, true);
	if inst != noone and not obj_combat_manager.attack {
		
		/*
		// Setting bg layer shader
		var lay_id = layer_get_id("Background");
		layer_shader(lay_id, shader0);
		
		// deactivating all other enemies
		with par_enemy {
			if id != inst.id {
				instance_deactivate_object(id);
			}
		}
		*/
		obj_combat_manager.enemy = inst;
		obj_combat_manager.attack = true;
		//obj_combat_manager.alarm[0] = 600;
		obj_combat_manager.fade = true;
		obj_combat_manager.knock_count = 15;
		obj_combat_manager.knock_angle = point_direction(inst.x, inst.y, polka.x, polka.y);
	}
	
}

//Check for collision with NPC
npc = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, par_NPC, false, true);
if(input_interact and !in_dialogue){
	if(npc != noone){
		var inst = scr_create_textbox(npc.text, npc.name, npc.portraits, npc.scripts);
		inst.char = npc.object_index;
		inst.char_audio = npc.textbox_audio;
		scr_audio_play_sound(snd_dialogue_start, 1, false);
	}
}
     
//Check for collision with chest
chest = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_chest, false, true);

if(chest != noone){
	with (chest) {
	    // Check if we can open the chest
		if(polka.input_space){
			if (canOpen or game.debug) {
				if (show_chest = false) {
					show_chest = true;
				}
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
					scr_script_execute_array_1d(args);
				}
			}
			if destroy instance_destroy();
		}
	}
}


//Check for collision with fun_fact
var inst = instance_place(x, y, obj_fun_fact);

if(inst != noone){
	if not inst.visited {
		obj_quiz_manager.questions = inst.question;
		obj_quiz_manager.fun_fact = true;
		inst.visited = true;
	}
}

//Check for used item
if(input_use_item and !in_dialogue){
	if (itemEquiped != noone) {
	
		switch (itemEquiped) {
		    case enum_item_type.shovel:
			
				scr_event_fire(event.use_shovel);
				
				//Finding a snapped-to tile coordinate
				var cs = obj_tile_manager.cell_size;
				var xx = obj_tile_manager.x_proj div cs;
				var yy = obj_tile_manager.y_proj div cs;
				xx = xx*cs;
				yy = yy*cs;
				
				var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_digable_tile, false, true);
				if(inst){
					if(!inst.dug){
						inst.dug = true;
						var dug_coins = irandom_range(3, 10);
						flags.coins += dug_coins;
						scr_fire_sm_noti(string(dug_coins) + " Coins Added")
					}
				} else {
				instance_create_layer(xx,yy,"Instances",obj_soil_hole);		//Createing an instance with hole sprite assigneed
				}
		        break;
			
		    case enum_item_type.pitchfork:
				instance_create_layer(x,y,"Instances",obj_soil_grass);		//Createing an instance with hole sprite assigneed
		        break;
				
			case enum_item_type.tensiometer:
			
				scr_event_fire(event.use_tensiometer);
			
				var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_tensiometer_tile, false, true);
				if(inst != noone){
					inst.draw_temp = true;
					inst.units = "kpa";
					inst.alarm[2] = room_speed * 2;
				}
				break;
				
			case enum_item_type.empty_tube:
				if(collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_water_tube_tile, false, true)){
					itemEquiped = enum_item_type.water_tube;
					itemRemoveInventory(enum_item_type.empty_tube)
					itemAddInventory(enum_item_type.water_tube)
				}
				
			case enum_item_type.water_tube:
				if(collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_microscope_tile, false, true)){
					itemEquiped = noone;
					itemRemoveInventory(enum_item_type.water_tube)
				}
				
			case enum_item_type.camera:
				scr_event_fire(event.use_camera);
				var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, par_examinable, false, true)
				if(inst){
					if(!inst.draw_examine_box){
						scr_draw_examine_obj(inst)
					}
				}
			
		    default:
		        // code here
		        break;
		}
	}
}
/*
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
*/

//check for plantable tree
var inst = collision_circle(obj_tile_manager.x_proj, obj_tile_manager.y_proj, obj_tile_manager.cell_size/2, obj_plantable_tree, false, true);
if room == second_village_planting and inst != noone {
	
	// outline newly stored tree
	if inst != curr_tree {
		inst.outline = true;
		
		// negate old tree's outline if polka stored one
		if curr_tree != noone {
			curr_tree.outline = false;
		}
		
		//store new tree reference
		curr_tree = inst;
	}
	
	// on input change tree sprite
	if input_space and not inst.lock {
		inst.tree_change = true;
		move_override = true;

		scr_audio_play_sound(snd_find_clue_with_item, 0, false);
		
		// assign plant anim sprite
		switch(facing){
			case 0: sprite_index = boop_back; break;
			case 90: sprite_index = boop_right; break;
			case 180: sprite_index = boop_front; break;
			case 270: sprite_index = boop_left; break;
		}
		
		alarm[3] = sprite_get_number(sprite_index)*(fps/sprite_get_speed(sprite_index));
	} else { // 
	}
} else {
	curr_tree = noone;
}