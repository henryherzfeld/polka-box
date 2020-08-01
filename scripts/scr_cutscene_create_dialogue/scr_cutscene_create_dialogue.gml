///@description cutscene_create_dialogue
///@arg text
///@arg scripts

if dialogue_inst == -1 {
	dialogue_inst = scr_create_textbox(argument0, "Placeholder", spr_portrait, argument1);
} else if not instance_exists(dialogue_inst) and obj_quiz_manager.questions == noone {
	dialogue_inst = -1;
	scr_cutscene_end_action();
}