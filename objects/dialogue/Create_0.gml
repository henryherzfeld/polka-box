/// @description Insert description here

idxs = ds_map_create();
dialogues = ds_map_create();

var characters = [obj_npc_weeraway, obj_npc_test, obj_npc_villy, npc_green_villy, obj_npc_poppy, obj_npc_baron];

var i = 0; repeat(array_length_1d(characters)) {
	idxs[? characters[i]] = 0;
	i++;
}

var temp = scr_dialogue_weeraway();

dialogues[? obj_npc_weeraway] = temp;
dialogues[? obj_npc_test] = temp;
dialogues[? obj_npc_villy] = temp;
dialogues[? npc_green_villy] = scr_dialogue_green_villy();
dialogues[? obj_npc_poppy] = scr_dialogue_poppy();
dialogues[? obj_npc_baron] = scr_dialogue_baron();
dialogues[? obj_npc_chieftain] = scr_dialogue_chieftain();