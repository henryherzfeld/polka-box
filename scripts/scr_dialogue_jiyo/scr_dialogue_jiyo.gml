text1 = ds_map_create();

scr_dia_segment(text1, "GREET");
scr_dia_line("Hello!", polka);

scr_dia_options("A1", "FILLER");

scr_dia_segment(text1, "A1");
scr_dia_line("What do you do", polka);
scr_dia_line("I study the planet and its landforms and how it's changed over time.", obj_npc_jiyo);

scr_dia_options("B1", "FILLER"); 

scr_dia_segment(text1, "B1");
scr_dia_line("What are you working on right now?", polka);
scr_dia_line("Lithium's a mineral found in the ground (1/4)", obj_npc_jiyo);
scr_dia_line("We need lithium to make rechargeable batteries that power our phones and electric cars (2/4)", obj_npc_jiyo);
scr_dia_line("I'm helping figure out how we can mine lithium from the ground in a way that's safer and easier (3/4)", obj_npc_jiyo);
scr_dia_line("This way, people nearby the mining site won't get hurt (4/4)", obj_npc_jiyo);



scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text1, "EXIT");
scr_dia_line("Thanks!", polka);

return [text1];