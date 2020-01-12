///@description cutscene_create_dialogue
///@arg text
///@arg scripts

if(dialogue_inst = -1){
	dialogue_inst = scr_create_textbox(argument0, "Placeholder", spr_portrait, argument1)
	
} else if (!polka.in_dialogue){
	dialogue_inst = -1;
	scr_cutscene_end_action();
}

