text1 = ds_map_create();

//BARON DIALOGUE
scr_dia_segment(text1, "GREET");
scr_dia_line("Good morning! Glad to have you on board, "+game.name, obj_npc_baron);
scr_dia_options("A1", "A2", "A3", "EXIT");

scr_dia_segment(text1, "A1");
scr_dia_line("Who are you?", polka);
scr_dia_line("I am the Baron! I train Quanta Knights to travel in space.", obj_npc_baron);
scr_dia_options("A1", "A2", "A3", "EXIT");

scr_dia_segment(text1, "A2");
scr_dia_line("I like your cat.", polka);
scr_dia_line("Why thanks, I got her from the planet Euboxia.", obj_npc_baron);
scr_dia_options("A1", "A2", "A3", "EXIT");

scr_dia_segment(text1, "A3");
scr_dia_line("What am I doing here?", polka);
scr_dia_line("The evil Virus has invaded this world and is causing chaos.", [obj_npc_baron, enum_portrait.sad]);
scr_dia_line_color(c_red, 9, 14);
scr_dia_line_sprite(spr_virus_henchmen);

scr_dia_line("Our job as Quanta Knights is to help the world advance.", obj_npc_baron);
scr_dia_line_sprite(spr_virus_henchmen);
scr_dia_line_sprite(spr_advancement_invention);

scr_dia_line("We use our powers of science and discovery to complete quests.", obj_npc_baron);
scr_dia_line_sprite(spr_advancement_invention);

scr_dia_line("To make sure that you will succeed out there, I have a little task for you.", obj_npc_baron);

scr_dia_line("Perform well, and I'll be confident that you have what it takes to do your first quest.", obj_npc_baron);

scr_dia_line("The task is this!: ", obj_npc_baron);

scr_dia_line("I've hidden the key to the door. You will have to find it.", obj_npc_baron);

scr_dia_line("To help you find the key, I'm giving you your first item: a camera!", obj_npc_baron);
scr_dia_line_sprite(spr_new_camera);
scr_dia_line_script(itemAddInventory, enum_item_type.camera);

scr_dia_line("You can use it to make observations and take pictures of what you find.", obj_npc_baron);
scr_dia_line_sprite(spr_new_camera);

scr_dia_line("When you think you know where the key is, then let me know.", obj_npc_baron);
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text1, "EXIT");
scr_dia_line("Okay, I'll get to it then.", polka);

/*
scr_dia_line("Good morning, young squire!", obj_npc_baron);
scr_dia_line("All the other Quanta Knights are busy fixing the ship. You've been chosen to get back the missing Crystal pieces so that we can recreate the cure.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_ship);

scr_dia_line("When you crash landed in your spaceship, the Crystal of Inventa broke. The art of discovery has disappeared thanks to Virus and his henchmen.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_ship);
scr_dia_line_sprite(spr_crystal_inventa_broken); 

scr_dia_line("The henchmen live inside other Villy hosts throughout the land.", obj_npc_baron);  
scr_dia_line_sprite(spr_crystal_inventa_broken);
scr_dia_line_sprite(spr_virus_henchmen);

scr_dia_line("To recreate the Crystal of Inventa, you will have to help bring advancements that make the world a better place to live in.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_virus_henchmen);
scr_dia_line_sprite(spr_advancement_invention);

scr_dia_line("Each problem you find, no matter how small or big, takes you on a quest. Each time you do a quest, you knock out a henchman of Virus and the Crystal gets another piece back.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_advancement_invention);
scr_dia_line_sprite(spr_start_quest);

scr_dia_line("The Villies cooperate more with each other. Problems get solved. Society benefits from its advancements.", obj_npc_baron); //baron 

scr_dia_line("When all the quests have been completed, Virus and his henchmen get defeated and the Crystal becomes whole.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_start_quest);
scr_dia_line_sprite(spr_crystal_inventa);

scr_dia_line("Navilla becomes a thriving planet once again.", obj_npc_baron); 

scr_dia_line("The power from the Crystal can then be used to destroy the plague on our planet, Cosmo, and save its people.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_crystal_inventa);
scr_dia_line_sprite(spr_cosmo_space);

scr_dia_line("Now here's how you beat a quest!", obj_npc_baron); 

scr_dia_line("In each quest, you have to ask questions, investigate, analyze clues, and come up with conclusions that determine the direction you take next.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_cosmo_space);
scr_dia_line_sprite(spr_quest_magnifying_glass);

scr_dia_line("You keep doing this until you've reached the end of your quest.", obj_npc_baron); 
scr_dia_line_sprite(spr_quest_magnifying_glass);
scr_dia_line_sprite(spr_finish_quest);

scr_dia_line("Are you ready? I think you can do it!", obj_npc_baron); 
scr_dia_line("Feel free to press 'H' on your keyboard for HELP on how to play", obj_npc_baron); 

scr_dia_line("You may leave. If you have any questions, feel free to ask me. I'm right here.", obj_npc_baron); //baron 
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text1, "EXIT");
scr_dia_line("Bye", polka);
*/

text2 = ds_map_create();

// DUPLICATE BARON DIALOGUE where player has already attempted door but hasn't spoken with baron, addressing both with his dialogue
scr_dia_segment(text2, "GREET");
scr_dia_line("Good morning, young squire!", obj_npc_baron);
scr_dia_line("All the other Quanta Knights are busy fixing the ship. You've been chosen to get back the missing Crystal pieces so that we can recreate the cure.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_ship);

scr_dia_line("When you crash landed in your spaceship, the Crystal of Inventa broke. The art of discovery has disappeared thanks to Virus and his henchmen.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_ship);
scr_dia_line_sprite(spr_crystal_inventa_broken); 

scr_dia_line("The henchmen live inside other Villy hosts throughout the land.", obj_npc_baron);  
scr_dia_line_sprite(spr_crystal_inventa_broken);
scr_dia_line_sprite(spr_virus_henchmen);

scr_dia_line("To recreate the Crystal of Inventa, you will have to help bring advancements that make the world a better place to live in.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_virus_henchmen);
scr_dia_line_sprite(spr_advancement_invention);

scr_dia_line("Each problem you find, no matter how small or big, takes you on a quest. Each time you do a quest, you knock out a henchman of Virus and the Crystal gets another piece back.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_advancement_invention);
scr_dia_line_sprite(spr_start_quest);

scr_dia_line("The Villies cooperate more with each other. Problems get solved. Society benefits from its advancements.", obj_npc_baron); //baron 

scr_dia_line("When all the quests have been completed, Virus and his henchmen get defeated and the Crystal becomes whole.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_start_quest);
scr_dia_line_sprite(spr_crystal_inventa);

scr_dia_line("Navilla becomes a thriving planet once again.", obj_npc_baron); 

scr_dia_line("The power from the Crystal can then be used to destroy the plague on our planet, Cosmo, and save its people.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_crystal_inventa);
scr_dia_line_sprite(spr_cosmo_space);

scr_dia_line("Now here's how you beat a quest!", obj_npc_baron); 

scr_dia_line("In each quest, you have to ask questions, investigate, analyze clues, and come up with conclusions that determine the direction you take next.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_cosmo_space);
scr_dia_line_sprite(spr_quest_magnifying_glass);

scr_dia_line("You keep doing this until you've reached the end of your quest.", obj_npc_baron); 
scr_dia_line_sprite(spr_quest_magnifying_glass);
scr_dia_line_sprite(spr_finish_quest);

scr_dia_line("Are you ready? I think you can do it!", obj_npc_baron); 
scr_dia_line("Feel free to press 'H' on your keyboard for HELP on how to play", obj_npc_baron); 
scr_dia_line_sprite(spr_finish_quest);

scr_dia_line("I would have asked you to leave, but I see that you've already tried to open the door.", obj_npc_baron); //baron 

scr_dia_line("So, er, the key to the door is missing.", obj_npc_baron); //baron
scr_dia_line("The last time I had it was when I was sitting at your desk. I went to drink some water.", obj_npc_baron); //baron 
scr_dia_line("When I came back, the key was gone.", obj_npc_baron);

scr_dia_line("Here's your first item, given to all budding Quanta Knights: a camera!", obj_npc_baron);  
scr_dia_line_sprite(spr_new_camera);
scr_dia_line_script(itemAddInventory, enum_item_type.camera);
//THE CAMERA ITEM (obj_camera_item) IS NOW VISIBLE IN THE ITEM INVENTORY

scr_dia_line("You can use it to make observations and take pictures of what you find.", obj_npc_baron); //baron 

scr_dia_line("If you have what it takes to be a Quanta Knight, you'll be able to figure out where the key is.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_new_camera);
scr_dia_line_sprite(spr_quanta_knights);

scr_dia_line("When you find any clue, tell me about it.", obj_npc_baron); 

scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text2, "EXIT");
scr_dia_line("See ya", polka);


text3 = ds_map_create();

scr_dia_segment(text3, "GREET");
scr_dia_line("Oh! I forgot to tell you. So, er, the key to the door is missing.", obj_npc_baron); //baron
scr_dia_line("The last time I had it was when I was sitting at your desk. I went to drink some water.", obj_npc_baron); //baron 
scr_dia_line("When I came back, the key was gone.", obj_npc_baron);

scr_dia_line("Here's your first item, given to all budding Quanta Knights: a camera!", obj_npc_baron);  
scr_dia_line_sprite(spr_new_camera);
scr_dia_line_script(itemAddInventory, enum_item_type.camera);
//THE CAMERA ITEM (obj_camera_item) IS NOW VISIBLE IN THE ITEM INVENTORY

scr_dia_line("You can use it to make observations and take pictures of what you find.", obj_npc_baron); //baron 

scr_dia_line("If you have what it takes to be a Quanta Knight, you'll be able to figure out where the key is.", obj_npc_baron); //baron 
scr_dia_line_sprite(spr_new_camera);
scr_dia_line_sprite(spr_quanta_knights);

scr_dia_line("When you find any clue, tell me about it.", obj_npc_baron); 
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text3, "EXIT");
scr_dia_line("See ya", polka);


text4 = ds_map_create();

//BEGINNING TUTORIAL QUIZ QUESTIONS
beginning_tutorial_quiz_questions = ds_list_create();
scr_quiz_list(beginning_tutorial_quiz_questions);

scr_quiz_question(enum_question_type.multi, 
"What did you find out?", 
["They key fell down the toilet", "An animal might have taken the key", "You swallowed the key", "The key was dissolved by strong acid"], 
1);
scr_quiz_question_response("How did you find out?", 
"Are you sure that's what happened?");
scr_quiz_question_sprite(spr_animal_hairs_on_desk_photo_evidence); 

scr_quiz_question(enum_question_type.multi, 
"How did you find out?", 
["There was some toilet paper on the desk", "There was a jar of acid on the desk", "There were some animal hairs on the desk", "There were some animal hairs on the dining table"], 
2);
scr_quiz_question_response(["Hm, that might be right...", "...But how do I know you're telling the truth?", 
"I need to see evidence. Remember, showing evidence helps to support what you're saying.",
"It makes it more likely for people to trust you."], 
"You almost got it! Try again");


scr_quiz_question(enum_question_type.evidence_multi, 
"How did you find out?", 
["There was some toilet paper on the desk", "There was a jar of acid on the desk", "There were some animal hairs on the desk", "There were some animal hairs on the dining table"], 
[enum_evi_type.photo_desk, 2]); 
//EVIDENCE2 RESERVED FOR "ANIMAL HAIRS ON DESK" PHOTO EVIDENCE (spr_animal_hairs_on_desk_photo_evidence)

/* 
Show message to player: "You can also use an item in the Notebook as a piece of evidence.")
(SHOW TUTORIAL FOR CLICKING ON EVIDENCE SLOT IN QUIZ QUESTION USING MOUSE TO ACCESS NOTEBOOK, 
CLICKING ON THE ITEM THEY WISH TO PRESENT, 
AND CLICKING ON SUBMIT TO EXIT THE NOTEBOOK WITH THE ITEM SELECTED)

(The player should be referenced to click on the evidence slot to access their Notebook. 
The Notebook opens. 
They then select the picture they took of the desk. 
It attaches to the evidence slot.)
*/
scr_quiz_question_response("Is that so? I wonder if...?", 
"You almost got it! Try again");
//END OF BEGINNING TUTORIAL QUIZ QUESTIONS

scr_dia_segment(text4, "GREET");
scr_dia_line("Is that so? I wonder if...?", obj_npc_baron);
scr_dia_line_quiz(beginning_tutorial_quiz_questions, obj_npc_baron);

text5 = ds_map_create();
scr_dia_segment(text5, "GREET");
scr_dia_line("Aha, excellent work! You just finished your first Quest investigation!", obj_npc_baron);
scr_dia_line("I'm confident that you'll do great out there!", obj_npc_baron);

scr_dia_line("You'll find these tiles throughout the world. Go to them to win some coins! You can use these coins to buy skins and items from the shop", obj_npc_baron); 
scr_dia_line_sprite(spr_coin_tiles); 

scr_dia_line("And remember to press 'M' on your keyboard to see a map where everything is!", obj_npc_baron);
scr_dia_line_sprite(spr_coin_tiles);

scr_dia_line("This is your chance to prove your worth and finally join the ranks of the Quanta Knights.", obj_npc_baron);
scr_dia_line_sprite(spr_quanta_knights);

scr_dia_line("Good luck!", obj_npc_baron);
scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text5, "EXIT");
scr_dia_line("Thanks!", polka);


/*
(Show a pop-up of the crystal being filled with one piece, indicating that the player has finished their first quest.)

**The Badge screen pops up and shows the player which badges they won.**
One badge is automatically given for completing the quest
One badge is given if they didn't run out of time for any quiz question
One badge is given if they didn't lose all three hearts any time during the quest  

The door unlocks and the player can leave the house
*/





text6 = ds_map_create();

scr_dia_segment(text6, "GREET");

scr_dia_line("Well done! You've gotten so far already!", obj_npc_baron);

scr_dia_line("Now that we know what the root problem is, different people will come up with a solution.", obj_npc_baron);
scr_dia_line("They want to get support so that they can carry out the solution for all the farm fields.", obj_npc_baron);
scr_dia_line("To solve the problem, you will help the scientists plan and analyze an experiment.", obj_npc_baron);
scr_dia_line("You look for clues that show the experiment was not well-performed. Or maybe something was said that should not have been said. Or maybe something was missing. ", obj_npc_baron);

scr_dia_line("Experimental Research is a skill that's helpful for anyone. Not just scientists and researchers.", obj_npc_baron);
scr_dia_line("Even some entrepreneurs can do it. An entrepreneur is somebody who runs a business and sells things.", obj_npc_baron);
//scr_dia_line_sprite(spr_entrepreneur); 

scr_dia_line("Experimental Research is all about testing something you want to find out if it's true.", obj_npc_baron);
scr_dia_line("Say your friend runs a lemonade stand. He wants to add honey instead of sugar to lemonade because he thinks it'll make the lemonade taste better.", obj_npc_baron);
scr_dia_line_sprite(spr_lemonade_stand);

scr_dia_line("He asks you for money so that he can buy enough honey to use in all his lemonades.", obj_npc_baron);
scr_dia_line_sprite(spr_lemonade_stand);
scr_dia_line_sprite(spr_money_bills); 

//EROSION EXPERIMENT TUTORIAL 1 QUIZ QUESTIONS
erosion_experiment_tutorial_1 = ds_list_create();
scr_quiz_list(erosion_experiment_tutorial_1);

scr_quiz_question(enum_question_type.multi, 
"The first question you'd have for him is:", 
["What are you trying to test?", 
"How much does honey cost?", 
"How will you test your hypothesis?", 
"Why do you think honey will taste better than sugar in lemonade?"], 
3);
scr_quiz_question_response("Exactly", "You almost got it! Try again");
//END OF EROSION EXPERIMENT TUTORIAL 1 QUIZ QUESTIONS

scr_dia_line("Exactly", obj_npc_baron);
scr_dia_line_quiz(erosion_experiment_tutorial_1, obj_npc_baron); 

scr_dia_line("You'd want to know where he got the idea from. He tells you an article he read said that adding honey instead of sugar to lemonade makes it taste better. This is his background research.", obj_npc_baron);
scr_dia_line_sprite(spr_magazine_article_honey); 

scr_dia_line("But what if people don't like honey? What if his customers think that lemonade tastes good with sugar and not with honey?", obj_npc_baron);
scr_dia_line_sprite(spr_magazine_article_honey); 

scr_dia_line("Then it means your friend wasted a lot of money. And you'll trust your friend less with your money.", obj_npc_baron);


//EROSION EXPERIMENT TUTORIAL 2 QUIZ QUESTIONS
erosion_experiment_tutorial_2 = ds_list_create();
scr_quiz_list(erosion_experiment_tutorial_2);

scr_quiz_question(enum_question_type.multi, 
"So then you'd ask him:", 
["What are you trying to test?", 
"How much does honey cost?", 
"Have any of your customers tried your lemonade with honey instead of sugar?", 
"What is honey made of?"], 
2);
scr_quiz_question_response("You'd want your friend to try this out with a little honey before he goes out and buys a whole bunch of honey. So your friend sets up an experiment.", "You almost got it! Try again");

scr_quiz_question(enum_question_type.multi, 
"Then you'd ask:", 
["What are you trying to test?", 
"How much does honey weigh?", 
"Have any of your customers tried your lemonade with honey instead of sugar?", 
"What color is honey?"], 
0);
scr_quiz_question_sprite(spr_hypothesis_question_marks); 
scr_quiz_question_response("You'd want to make sure your friend is actually testing the right thing. What is he looking for? He makes a hypothesis. His hypothesis is that adding honey instead of sugar to lemonade will make people like it more.", "You almost got it! Try again");

scr_quiz_question(enum_question_type.multi, 
"Then you'd ask:", 
["What are you trying to test?", 
"What does your experiment data show?", 
"How will you test your hypothesis?", 
"What color is honey?"], 
2);
scr_quiz_question_sprite(spr_tutorial_procedure); 
scr_quiz_question_response("You'd want to know how your friend plans on carrying out the experiment. What steps will he take to find out? He sets up a procedure on what he'll be doing.", "You almost got it! Try again");

//END OF EROSION EXPERIMENT TUTORIAL 2 QUIZ QUESTIONS

scr_dia_line("You'd want to know how your friend plans on carrying out the experiment. What steps will he take to find out? He sets up a procedure on what he'll be doing.", obj_npc_baron);
scr_dia_line_quiz(erosion_experiment_tutorial_2, obj_npc_baron);

scr_dia_line("He has two groups. He will give half of his customers lemonade with sugar, but without honey. This is his first group.", obj_npc_baron);
scr_dia_line_sprite(spr_experiment_tutorial_setup);

scr_dia_line("He will give the other half of his customers the lemonade with honey, but without sugar. This is his second group.", obj_npc_baron);

scr_dia_line("He asks each customer to give a rating, from 1-10, on how much they liked his lemonade. Then he adds up the ratings from each group.", obj_npc_baron);

//EROSION EXPERIMENT TUTORIAL 3 QUIZ QUESTIONS
erosion_experiment_tutorial_3 = ds_list_create();
scr_quiz_list(erosion_experiment_tutorial_3);

scr_quiz_question(enum_question_type.multi, 
"Then you'd ask:", 
["What color is honey?", 
"What did you find out?", 
"How will you test your hypothesis?", 
"Do bears like honey?"], 
1);
scr_quiz_question_response("You will want to know what results your friend found. Was the honey a success?", "You almost got it! Try again");

//END OF EROSION EXPERIMENT TUTORIAL 3 QUIZ QUESTIONS

scr_dia_line("You will want to know what results your friend found. Was the honey a success?", obj_npc_baron);
scr_dia_line_quiz(erosion_experiment_tutorial_3, obj_npc_baron);

scr_dia_line("Or should he stick with plain sugar? He does an analysis of the ratings from each group.", obj_npc_baron);
scr_dia_line("His analysis found that the total sum of ratings from the first group was 25. The total sum of ratings from the second group was 45.", obj_npc_baron);
scr_dia_line_sprite(spr_experiment_tutorial_table);

//EROSION EXPERIMENT TUTORIAL 4 QUIZ QUESTIONS
erosion_experiment_tutorial_4 = ds_list_create();
scr_quiz_list(erosion_experiment_tutorial_4);

scr_quiz_question(enum_question_type.multi, 
"Then you'd ask:", 
["What do you decide?", 
"What did you find out?", 
"How will you test your hypothesis?", 
"Do bears like honey?"], 
0); 
scr_quiz_question_sprite(spr_experiment_tutorial_table); 
//SHOW EXPERIMENT TUTORIAL TABLE
scr_quiz_question_response("Your friend has to make a final decision. He comes up with a conclusion: adding honey instead of sugar to lemonade makes customers like it more.", "You almost got it! Try again");

//END OF EROSION EXPERIMENT TUTORIAL 4 QUIZ QUESTIONS

scr_dia_line("Your friend has to make a final decision. He comes up with a conclusion: adding honey instead of sugar to lemonade makes customers like it more.", obj_npc_baron);
//QUIZ QUESTION: (MC) You'd then ask him: How will you test your hypothesis?
scr_dia_line_quiz(erosion_experiment_tutorial_4, obj_npc_baron);

scr_dia_line("So he decides to go and buy more honey.", obj_npc_baron);
scr_dia_line("Now that your friend has shown you the evidence, you can now trust him more. You give him the money needed to buy more honey.", obj_npc_baron);
scr_dia_line("And that's all there is to an experiment! Now let's see you with the real deal!", obj_npc_baron);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text6, "EXIT");
scr_dia_line("Thanks!", polka);

//END OF EXPERIMENT TUTORIAL


return [text1, text2, text3, text4, text5, text6];