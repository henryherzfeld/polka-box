/// @description Insert description here

event_inherited();



questions = ds_list_create();
scr_quiz_list(questions);

scr_quiz_question(enum_question_type.multi, "QUESTION PROMPT", ["Right", "Wrong", "Wrong",], 0);

scr_quiz_question(enum_question_type.checkbox, "The soil compaction in the patch surrounded by vegetation is 170 psi, while the soil compaction in the patch surrounded with no vegetation is 80 psi.", ["Right", "Wrong", "Right", "Right"], [0, 2, 3]);






text = ds_map_create();

scr_dia_segment(text, "GREET");

scr_dia_line("You'd want to make sure your friend is actually testing the right thing. What is he looking for? He makes a hypothesis. His hypothesis is that adding honey instead of sugar to lemonade will make people like it more.", polka);
scr_dia_line_quiz(questions, obj_npc_test);

scr_dia_line("Me an NPC", obj_npc_test);
scr_dia_options("EXIT", "A1", "EXIT");

scr_dia_segment(text, "A1");
scr_dia_line("We are having a convo", polka);
scr_dia_line("Yes we are having a convo", obj_npc_test);

scr_dia_segment(text, "EXIT");
scr_dia_line("Bye", id);


//scr_dia_line_script(scr_change_variable, obj_npc_weeraway, "crying", false);
//scr_dia_line_quiz(questions, id);


name = "Villy";
 portrait = spr_portrait;
scripts = [
	[scr_change_variable, game.id, "find_weeravay", true],
]