scr_dia_segment(text, "GREET");
scr_dia_line("Hey and hello....... ", polka);
scr_dia_line("Me an NPC", obj_npc_test);
scr_dia_options("EXIT", "A1", "EXIT");



//scr_dia_line_script(scr_change_variable, obj_npc_weeraway, "crying", false);
//scr_dia_line_quiz(questions, id);




scr_dia_segment(text, "A1");
scr_dia_line("Convo", polka);
scr_dia_line("Convo2", polka);
scr_dia_line("Convo3", polka);
scr_dia_line("Resp1", [id, enum_portrait.angry]);
scr_dia_line("Resp2", id);
scr_dia_line("Resp3", id);
scr_dia_options("EXIT", "EXIT");


scr_dia_segment(text, "EXIT");
scr_dia_line("Bye", polka);
scr_dia_line("Bye", id);
