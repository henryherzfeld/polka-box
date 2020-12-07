/// @description Insert description here

idxs = ds_map_create();
dialogues = ds_map_create();

var characters = [obj_npc_weeraway, obj_npc_test, obj_npc_villy, npc_green_villy, obj_npc_poppy, obj_npc_baron, 
				  obj_npc_shopkeeper, obj_npc_gilly, obj_npc_hubble, obj_npc_boojum, obj_npc_jiyo];

var i = 0; repeat(array_length_1d(characters)) {
	idxs[? string(characters[i])] = 0;
	i++;
}

dialogues[? obj_npc_weeraway] = scr_dialogue_weeraway();
dialogues[? npc_green_villy] = scr_dialogue_green_villy();
dialogues[? obj_npc_poppy] = scr_dialogue_poppy();
dialogues[? obj_npc_baron] = scr_dialogue_baron();
dialogues[? obj_npc_chieftain] = scr_dialogue_chieftain();
dialogues[? obj_npc_villy] = scr_dialogue_villy();

// meet the villies
dialogues[? obj_npc_gilly] = scr_dialogue_gilly();
dialogues[? obj_npc_hubble] = scr_dialogue_hubble();
dialogues[? obj_npc_boojum] = scr_dialogue_boojum();
dialogues[? obj_npc_jiyo] = scr_dialogue_jiyo();


/*one-liner for shopkeeper text */ shopkeep_text = ds_map_create();shopkeep_text[? "GREET"] = ["Howdy There!", ["A1", "EXIT"], [obj_npc_shopkeeper]];shopkeep_text[? "A1"] = ["Oh, Hello!", "How can I help you?", ["B1", "B2"], [polka, obj_npc_shopkeeper]];shopkeep_text[? "B1"] = ["What is this place?", "Oh yes this is the Bazaar, we sell things here.", ["B1", "B2", "C1", "EXIT"], [polka, obj_npc_shopkeeper]];shopkeep_text[? "B2"] = ["Who are you?", "I'm Villy Jeff from Sales.", ["B1", "B2", "C1", "EXIT"], [polka, obj_npc_shopkeeper]];shopkeep_text[? "C1"] = ["Can I buy something?", "Unfortunately no, you may not. We are closed at the moment." ,["B1", "B2", "C1", "EXIT", "EXIT"], [polka, obj_npc_shopkeeper]]shopkeep_text[? "EXIT"] = ["Oh, alright then. Goodbye.", "Take care!", [], [polka, obj_npc_shopkeeper]];
dialogues[? obj_npc_shopkeeper] = [shopkeep_text];

/* TEST NPC DIALOGUE HERE */ villy_text = ds_map_create();villy_text[? "GREET"] = ["Hi", "Hello " + game.name + "!", ["EXIT", "GREET"], [polka, obj_npc_villy]];villy_text[? "EXIT"] = ["Bye.", [], [polka]]; 
dialogues[? obj_npc_test] = [villy_text];