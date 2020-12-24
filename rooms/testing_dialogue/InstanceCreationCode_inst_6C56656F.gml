//scr_event_register_script(event.test, id, scr_change_variable, id, "crying", false);
//Dialogue Segment (A) 
scr_dia_segment(text, "GREET");
scr_dia_line("Hello!", polka);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text, "A1");
scr_dia_line("What do crops need to live?", polka);
scr_dia_line("Crops and plants need AIR, SUNLIGHT, WATER, and SOIL.", obj_npc_poppy);
scr_dia_line_sprite(spr_air_sunlight_water_soil);
scr_dia_options("B1", "B2", "B3", "FILLER"); 

scr_dia_segment(text, "A2");
scr_dia_line("Can you help me?", polka);
scr_dia_line("Hi there, " +game.name + "!", obj_npc_poppy);
scr_dia_line("It's SO good to see you.", obj_npc_poppy);
scr_dia_line("Well, I study plants, how they work, and how we can use them to improve our lives.", obj_npc_poppy);
scr_dia_line("So it really depends on what you need help with!", obj_npc_poppy);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text, "A3");
scr_dia_line("What are you working on?", polka);
scr_dia_line("I'm looking at chamomile!", obj_npc_poppy);
scr_dia_line("It's a really cool plant that looks like a daisy.", obj_npc_poppy);
scr_dia_line("I'm checking out how chamomile makes people more relaxed and calm.", obj_npc_poppy);
scr_dia_line("It can help parents that are stressed out by this whole farming problem!", obj_npc_poppy);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

//Dialogue Segment (B)
scr_dia_segment(text, "B1");
scr_dia_line("How do you know that the plants are getting enough air, sunlight, water, and soil?", polka);
scr_dia_line("This is what a HEALTHY plant looks like.", obj_npc_poppy);
scr_dia_line_sprite(spr_healthy_plant); 

scr_dia_line("It's green, has lots of leaves, has strong stems.", obj_npc_poppy);

scr_dia_line("It has plenty of nutrient-rich soil.", obj_npc_poppy);

scr_dia_line("Nutrients make a plant healthy.", obj_npc_poppy);

scr_dia_line("Just like people need nutrients to grow and stay healthy.", obj_npc_poppy);


scr_dia_line("If the plant isn't getting enough WATER - it will wilt.", obj_npc_poppy);
scr_dia_line_sprite(spr_healthy_plant); 
scr_dia_line_sprite(spr_dying_plant);

scr_dia_line("The edges of the leaves turn out dry and brown.", obj_npc_poppy);

scr_dia_line("The soil will be dry.", obj_npc_poppy);

scr_dia_line("There is low soil moisture found when measuring.", obj_npc_poppy);


scr_dia_line("If the plant isn't getting enough LIGHT - the stems are long and thin.", obj_npc_poppy);
scr_dia_line_sprite(spr_dying_plant);
scr_dia_line_sprite(spr_plant_less_sunlight);

scr_dia_line("They have small, yellow leaves.", obj_npc_poppy);

scr_dia_line("The stems grow thin because the plant is desperately reaching its leaves up to get more light.", obj_npc_poppy);

scr_dia_line("If there isn't enough SOIL, then the plant will wilt.", obj_npc_poppy);
scr_dia_line_sprite(spr_plant_less_sunlight);
scr_dia_line_sprite(spr_dying_plant);

scr_dia_line("The edges of the leaves turn out dry and brown.", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "B2");
scr_dia_line("Why do plants need water?", polka);
scr_dia_line("Plants use water to bring nutrients up from the roots into their leaves", obj_npc_poppy);
scr_dia_line_sprite(spr_water_going_up_plant);
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text, "B3");
scr_dia_line("Why do plants need sunlight?", polka);
scr_dia_line("Plants use sunlight to power their food-making process.", obj_npc_poppy);
scr_dia_line_sprite(spr_air_sunlight_water_soil);

scr_dia_line("This is called photosynthesis.", obj_npc_poppy);
scr_dia_line("Photosynthesis is Greek for 'putting together light'.", obj_npc_poppy);
scr_dia_line("It's how plants get the energy they need to live.", obj_npc_poppy);

scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Thanks!", polka);