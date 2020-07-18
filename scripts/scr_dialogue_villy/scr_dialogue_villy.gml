
text1 = ds_map_create();
scr_dia_segment(text1, "GREET");
scr_dia_line("Oh, you're finally awake!", obj_npc_villy);
scr_dia_line("Everyone was worried about your recovery. It looks like you're doing great!", [obj_npc_villy, enum_portrait.happy]);
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text1, "EXIT");
scr_dia_line("I am, thankss!", polka);

text2 = ds_map_create();
scr_dia_segment(text2, "GREET");
scr_dia_line("Hey there, space cowboy!", obj_npc_villy);
scr_dia_line("I'm no space cowboy I'm a quanta knight, you little villy...", polka);
scr_dia_line_color(c_red, 27, 27);
scr_dia_line_color(c_orange, 28, 28);
scr_dia_line_color(c_yellow, 29, 29);
scr_dia_line_color(c_green, 30, 30);
scr_dia_line_color(c_blue, 31, 31);
scr_dia_line_color(c_purple, 32, 32);

scr_dia_line("As colorful as that may be, you still look like a cowboy to me.", obj_npc_villy);
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text2, "EXIT");
scr_dia_line("Thanks..?", polka);


text3 = ds_map_create();
scr_dia_segment(text3, "GREET") 
scr_dia_line("Hey, Polka!", [obj_npc_villy, enum_portrait.happy])
scr_dia_line("Hello!", polka);
scr_dia_line("Have you been to the botanist's house yet? I always like checking out the latest experiment!", obj_npc_villy);
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text3, "EXIT");
scr_dia_line("Bye!", polka);

scr_dia_line_color(c_green, 22, 31);



return [text1, text2, text3]