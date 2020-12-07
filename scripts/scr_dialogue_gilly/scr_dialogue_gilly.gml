text1 = ds_map_create();

scr_dia_segment(text1, "GREET");
scr_dia_line("Hello!", polka);

scr_dia_options("A1", "FILLER");

scr_dia_segment(text1, "A1");
scr_dia_line("What do you do", polka);
scr_dia_line("I study creatures in the ocean and how we can learn from them to improve our own lives", obj_npc_gilly);

scr_dia_options("B1", "FILLER"); 

scr_dia_segment(text1, "B1");
scr_dia_line("What are you working on right now? (1/6)", polka);
scr_dia_line("I'm looking at octopuses to design robots better (2/6)", obj_npc_gilly);
scr_dia_line("Right now, robots are hard and not very flexible (3/6)", obj_npc_gilly);
scr_dia_line("This makes it hard for them to move and unsafe to keep near humans (4/6)", obj_npc_gilly);
scr_dia_line("But octopuses are the opposite: they're soft, flexible, and strong (5/6)", obj_npc_gilly);
scr_dia_line("By taking inspiration from octopuses, we can make it way easier for robots to move around and grab different objects (6/6)", obj_npc_gilly);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text1, "EXIT");
scr_dia_line("Thanks!", polka);


return [text1];