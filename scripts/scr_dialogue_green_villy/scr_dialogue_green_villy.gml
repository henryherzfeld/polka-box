
text1 = ds_map_create();

scr_dia_segment(text1, "GREET");
scr_dia_line("What's going on?", polka);
scr_dia_line("We're doomed, " + game.name + "! The people of this town are starving!", npc_green_villy); 
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text1, "A1");
scr_dia_line("Why are you starving?", polka);
scr_dia_line("The farmers aren't giving enough food. The Great Famine is upon us!", npc_green_villy); 
scr_dia_options("B1", "B2", "B3", "FILLER"); 

scr_dia_segment(text1, "A2");
scr_dia_line("What do you do?", polka);
scr_dia_line("I'm a baker at the bazaar. I need my food if I have to work. I can't live off of just bread and cupcakes!", npc_green_villy); 
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text1, "A3");
scr_dia_line("How long have you been starving for?", polka);
scr_dia_line("For the past few days!", npc_green_villy); 
scr_dia_options("A1", "A2", "A3", "FILLER"); 

//Dialogue Segment (B)
scr_dia_segment(text1, "B1");
scr_dia_line("Why aren't the farmers giving enough food?", polka);
scr_dia_line("I don't know, but you'd have to ask farmer Villy Nilly Weeraway.", npc_green_villy); 
scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text1, "B2");
scr_dia_line("What food do the farmers give?", polka);
scr_dia_line("Vegetables! Lots and lots of vegetables! Corn, carrots, potatoes, squash, peas...uh, what else...oh, yeah! — beans, turnips, and the like.", npc_green_villy); 
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text1, "B3");
scr_dia_line("There's nothing else to eat?", polka);
scr_dia_line("The food prices have shot up like a rocket these last few weeks. But now we don't even have vegetables! All I have are fish, bread, and stale cupcakes.", npc_green_villy); 
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text1, "EXIT");
scr_dia_line("Ok, I'll see what I can do.", polka);


return [text1];