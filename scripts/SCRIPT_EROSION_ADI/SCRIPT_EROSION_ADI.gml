event_inherited();

/* --------------------------------------------------------------------------------------------------------- */ 

/*
**INTRO STORY**
You and the Quanta Knights are traveling in space. The Quanta Knights are a band of explorers from the planet Cosmo who find discoveries that help the world advance.  

There's a dangerous plague terrorizing the people on Cosmo. You hear that a far away moon far away holds a possible cure. You go to that moon and collect the Crystal of Inventa. 

On your way back home after collecting the crystal, you get hit by an asteroid. The ship lands on the planet closest — Navilla. 

Navilla is a thriving planet similar to Cosmo, home to the Villies. When you crash land into Navilla, the Crystal breaks. 

It then released a set of spirits trapped in the crystal pieces, Virus and his henchmen. These spirits took over the Villies and wiped away their ability to discover. 

Virus wants the Villy society to fall under its failure to come together and move forward. When people live under fear and ignorance, then Virus gets more and more powerful.

To save the Villies and recreate the cure for your home planet, you have to put the Crystal of Inventa back together. It's time to make your move! Step into the world of Navilla and start your story. 

*/

/* --------------------------------------------------------------------------------------------------------- */ 

text = ds_map_create();

/* BEGINNING TUTORIAL
Player wakes up
The Quanta Baron is standing by Polka's bed. There's a cat snoozing on the side of the room.*/

//BARON DIALOGUE
scr_dia_segment(text, "GREET");
scr_dia_line("Good morning, young squire! Hope I didn't startle you.", obj_npc_baron); 
scr_dia_line("All the other Quanta Knights are busy fixing the ship. You've been chosen to get back the missing Crystal pieces so that we can recreate the cure.", obj_npc_baron); //baron 
scr_dia_line("When you crash landed in your spaceship, the Crystal of Inventa broke. The art of discovery has disappeared thanks to Virus and his henchmen.", obj_npc_baron); //baron 
scr_dia_line("The henchmen live inside other Villy hosts throughout the land.", obj_npc_baron);  
scr_dia_line("To recreate the Crystal of Inventa, you will have to help bring advancements that make the world a better place to live in.", obj_npc_baron); //baron 
scr_dia_line("Each problem you find, no matter how small or big, takes you on a quest. Each time you do a quest, you knock out a henchman of Virus and the Crystal gets another piece back.", obj_npc_baron); //baron 
scr_dia_line("The Villies cooperate more with each other. Problems get solved. Society benefits from its advancements.", obj_npc_baron); //baron 
scr_dia_line("When all the quests have been completed, Virus and his henchmen get defeated and the Crystal becomes whole.", obj_npc_baron); //baron 
scr_dia_line("Navilla becomes a thriving planet once again.", obj_npc_baron); 
scr_dia_line("The power from the Crystal can then be used to destroy the plague on our planet, Cosmo, and save its people.", obj_npc_baron); //baron 

scr_dia_line("Now here's how you beat a quest!", obj_npc_baron); 
scr_dia_line("In each quest, you have to ask questions, investigate, analyze clues, and come up with conclusions that determine the direction you take next.", obj_npc_baron); //baron 
scr_dia_line("You keep doing this until you've reached the end of your quest.", obj_npc_baron); 
scr_dia_line("Are you ready? I think you can do it!", obj_npc_baron); 
scr_dia_line("Here's your first item, given to all budding Quanta Knights: a camera!", obj_npc_baron);  
//THE CAMERA ITEM (obj_camera_item) IS NOW VISIBLE IN THE ITEM INVENTORY

scr_dia_line("You can use it to make observations and take pictures of what you find.", obj_npc_baron); //baron 
scr_dia_line("You may leave. If you have any questions, feel free to ask me. I'm right here.", obj_npc_baron); //baron 

/* The player heads to the door. The door is locked.
The player goes and asks Baron a question
*/

scr_dia_line("Oh! I forgot to tell you. So, er, the key to the door is missing.", obj_npc_baron); //baron
scr_dia_line("The last time I had it was when I was sitting at your desk. I went to drink some water.", obj_npc_baron); //baron 
scr_dia_line("When I came back, the key was gone.", obj_npc_baron); 
scr_dia_line("If you have what it takes to be a Quanta Knight, you'll be able to figure out where it is.", obj_npc_baron); //baron 
scr_dia_line("When you find any clue, tell me about it.", obj_npc_baron); 

/* Show objective at top of the screen:
*** QUEST: get the key back ***

(SHOW TUTORIAL FOR CLICKING ON CAMERA ITEM IN INVENTORY USING MOUSE, 
APPROACHING A NEARBY OBJECT, 
AND PRESSING SPACE TO TAKE A PICTURE)

(The player should approach the desk with the camera.) 

An Indicator should pop up. "What do you observe about the desk?" 
Show a picture of the desk surface with some animal hairs on top. **(1/1 clue found)**

The picture should be stored in the Notebook.
The Notebook icon should flash for 3 seconds as the picture is collected
A message flashes on the screen: "Any time you want to check what clues you've found, you can go into your Notebook."

(SHOW TUTORIAL FOR CLICKING ON NOTEBOOK ICON USING MOUSE TO ACCESS NOTEBOOK, 
CLICKING ON AN ITEM IN THE NOTEBOOK TO VIEW THE OBSERVATION/PICTURE AS A BIGGER SIZE, 
CLICKING ON RETURN BUTTON USING MOUSE TO EXIT THE NOTEBOOK)

(TELL PLAYER TO GO BACK TO BARON AFTER 1/1 CLUE HAS BEEN FOUND)

(The player goes back to the Baron.)

*/


//BEGINNING TUTORIAL QUIZ QUESTIONS
beginning_tutorial_quiz_questions = ds_list_create();
scr_quiz_list(beginning_tutorial_quiz_questions);

scr_quiz_question(enum_question_type.multi, 
"What did you find out?", 
["They key fell down the toilet", "An animal might have taken the key", "You swallowed the key", "The key was dissolved by strong acid"], 
1);
scr_quiz_question_response("How did you find out?", 
"Are you sure that's what happened?");

scr_quiz_question(enum_question_type.multi, 
"How did you find out?", 
["There was some toilet paper on the desk", "There was a jar of acid on the desk", "There were some animal hairs on the desk", "There were some animal hairs on the dining table"], 
2);
scr_quiz_question_response(["But how do I know you're telling the truth?", 
"I need to see evidence. Remember, showing evidence helps to support what you're saying.",
"It makes it more likely for people to trust you."], 
"Why don't you try a different answer?");


scr_quiz_question(enum_question_type.evidence_multi, 
"How did you find out?", 
["There was some toilet paper on the desk", "There was a jar of acid on the desk", "There were some animal hairs on the desk", "There were some animal hairs on the dining table"], 
[enum_evi_type.evidence2, 2]); 
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
scr_quiz_question_response(["Is that so? I wonder if…?"], 
"You almost got it! Try again");
//END OF BEGINNING TUTORIAL QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_baron);
scr_dia_line_quiz(beginning_tutorial_quiz_questions, obj_npc_baron);
scr_dia_line("Aha, excellent work! You just finished your first Quest investigation!", obj_npc_baron);
scr_dia_line("I'm confident that you'll do great out there!", obj_npc_baron);
scr_dia_line("This is also your chance to prove your worth and finally join the ranks of the Quanta Knights.", obj_npc_baron);
scr_dia_line("Good luck!", obj_npc_baron);


/*
(Show a pop-up of the crystal being filled with one piece, indicating that the player has finished their first quest.)

**The Badge screen pops up and shows the player which badges they won.**
One badge is automatically given for completing the quest
One badge is given if they didn't run out of time for any quiz question
One badge is given if they didn't lose all three hearts any time during the quest  

The door unlocks and the player can leave the house
*/

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Thanks!", polka);

/*
** END OF TUTORIAL SECTION **
*/

/* --------------------------------------------------------------------------------------------------------- */ 

/* EROSION QUEST INVESTIGATION SECTION */

//They arrive at a farm near the village. The townsfolk (Villies) are upset and are protesting with pitchforks outside the farm
//(Polka approaches the Green Villy. A "talk" bubble appears.

//GREEN VILLY DIALOGUE

//Dialogue Segment (A)
scr_dia_segment(text, "GREET");
scr_dia_line("What's going on?", polka);
scr_dia_line("We're doomed, " + game.name + "! The people of this town are starving!", npc_green_villy); 
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text, "A1");
scr_dia_line("Why are you starving?", polka);
scr_dia_line("The farmers aren't giving enough food. The Great Famine is upon us!", npc_green_villy); 
scr_dia_options("B1", "B2", "B3", "FILLER"); 

scr_dia_segment(text, "A2");
scr_dia_line("What do you do?", polka);
scr_dia_line("I'm a baker at the bazaar. I need my food if I have to work. I can't live off of just bread and cupcakes!", npc_green_villy); 
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text, "A3");
scr_dia_line("How long have you been starving for?", polka);
scr_dia_line("For the past few days!", npc_green_villy); 
scr_dia_options("A1", "A2", "A3", "FILLER"); 

//Dialogue Segment (B)
scr_dia_segment(text, "B1");
scr_dia_line("Why aren't the farmers giving enough food?", polka);
scr_dia_line("I don't know, but you'd have to ask farmer Villy Nilly Weeraway.", npc_green_villy); 
scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "B2");
scr_dia_line("What food do the farmers give?", polka);
scr_dia_line("Vegetables! Lots and lots of vegetables! Corn, carrots, potatoes, squash, peas...uh, what else...oh, yeah! — beans, turnips, and the like.", npc_green_villy); 
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text, "B3");
scr_dia_line("There's nothing else to eat?", polka);
scr_dia_line("The food prices have shot up like a rocket these last few weeks. But now we don't even have vegetables! All I have are fish, bread, and stale cupcakes.", npc_green_villy); 
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Ok, I'll see what I can do.", polka);

//VILLY WEERAWAY DIALOGUE

/*This last sentence finishing triggers the next event: 
the player can now view a new batch of dialogue choices when approaching the farmer

(They go visit the farmer by entering the house. 
The farmer is sobbing at the dining table.)
*/

//Dialogue Segment (A) 
scr_dia_segment(text, "GREET");
scr_dia_line("Hello", polka);
scr_dia_options("A1", "A2", "A3", "FILLER");

scr_dia_segment(text, "A1");
scr_dia_line("Why aren't you giving the villagers enough food?", polka);
scr_dia_line("What can I do, " + game.name + "? The crops are dying!", obj_npc_weeraway);
scr_dia_options("B1", "B2", "B3", "FILLER"); 

scr_dia_segment(text, "A2");
scr_dia_line("What are you doing here?", polka);
scr_dia_line("Hiding! I'm a miserable farmer whose… *sniff*... reputation is in ruins.", obj_npc_weeraway);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text, "A3");
scr_dia_line("Why are you crying?", polka);
scr_dia_line("My kids might not have enough to eat. The villagers will go hungry. And it's all my fault!", obj_npc_weeraway);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

//Dialogue Segment (B)
scr_dia_segment(text, "B1");
scr_dia_line("Why are the crops dying?", polka);
scr_dia_line("The crops don't have what they need to live. I don't know why!", obj_npc_weeraway);
scr_dia_options("C1", "C2", "C3", "FILLER");

scr_dia_segment(text, "B2");
scr_dia_line("How long have they been dying?", polka);
scr_dia_line("I first noticed some of them dying a few weeks ago. The problem got worse. I tried to stop them from dying. Nothing I did worked.", obj_npc_weeraway);
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text, "B3");
scr_dia_line("What kinds of crops do you grow?", polka);
scr_dia_line("You may not know this, " + game.name + ", but I've worked on this farm for 30 years.", obj_npc_weeraway);
scr_dia_line("Since I was little and I farmed with my father, I've always grown corn, potatoes, carrots, turnips, and other vegetables.", obj_npc_weeraway);
scr_dia_options("B1", "B2", "B3", "FILLER");

//Dialogue Segment (C)
scr_dia_segment(text, "C1");
scr_dia_line("What do crops need to live?", polka);
scr_dia_line("I'd ask someone who knows all about plants. I don't know what else to do. You need to help me, " + game.name + "!", obj_npc_weeraway);
scr_dia_line("If you don't, my kids and the townspeople will starve!", obj_npc_weeraway);
scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "C2");
scr_dia_line("Where are your crops?", polka);
scr_dia_line("In the fields besides the house.", obj_npc_weeraway);
scr_dia_options("C1", "C2", "C3", "FILLER");

scr_dia_segment(text, "C3");
scr_dia_line("What are you giving your crops?", polka);
scr_dia_line("Plenty of water and fresh soil. And a bucket of love and prayers. But those don't seem to be working...", obj_npc_weeraway);
scr_dia_options("C1", "C2", "C3", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("I won't let you down!", polka);

/* 
This last sentence finishing triggers the next event: 
the player can now view a new batch of dialogue choices when approaching the botanist

(They visit Villy Poppy, the botanist)
*/

//VILLY POPPY DIALOGUE

//Dialogue Segment (A) 
scr_dia_segment(text, "A1");
scr_dia_line("What do crops need to live?", polka);
scr_dia_line("Plants need air, sunlight, water, and soil.", obj_npc_poppy);
scr_dia_line_sprite(spr_air_sunlight_water_soil);
scr_dia_options("B1", "B2", "B3", "FILLER"); 

scr_dia_segment(text, "A2");
scr_dia_line("Can you help me?", polka);
scr_dia_line("Hi there, " +game.name + "! Good to see you. Well, I study plants, how they work, and how we can use them to improve our lives.", obj_npc_poppy);
scr_dia_line("So it really depends on what you need help with!", obj_npc_poppy);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

scr_dia_segment(text, "A3");
scr_dia_line("What are you working on?", polka);
scr_dia_line("I'm looking at chamomile! It's a really cool plant that looks like a daisy.", obj_npc_poppy);
scr_dia_line("I'm checking out how chamomile makes people more relaxed and calm.", obj_npc_poppy);
scr_dia_line("It can help parents that are stressed out by this whole farming problem.", obj_npc_poppy);
scr_dia_options("A1", "A2", "A3", "FILLER"); 

//Dialogue Segment (B)
scr_dia_segment(text, "B1");
scr_dia_line("How do you know that the plants are getting enough air, sunlight, water, and soil?", polka);
scr_dia_line("This is what a healthy plant looks like. It's green, has lots of leaves, has strong stems. It has plenty of nutrient-rich soil. Nutrients make a plant healthy. Just like people need nutrients to grow and stay healthy.", obj_npc_poppy);
scr_dia_line_sprite(spr_healthy_plant); 

scr_dia_line("If the plant isn't getting enough water — it will wilt. The edges of the leaves turn out dry and brown. The soil will be dry. There is low soil moisture found when measuring.", obj_npc_poppy);
scr_dia_line_sprite(spr_dying_plant);

scr_dia_line("If the plant isn't getting enough light — the stems are long and thin. They have small, yellow leaves.", obj_npc_poppy);
scr_dia_line_sprite(spr_plant_less_sunlight);

scr_dia_line("The stems grow thin because the plant is desperately reaching its leaves up to get more light.", obj_npc_poppy);
scr_dia_line_sprite(spr_dying_plant);

scr_dia_line("If there isn't enough soil, then the plant will wilt. The edges of the leaves turn out dry and brown.", obj_npc_poppy);
scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "B2");
scr_dia_line("Why do plants need water?", polka);
scr_dia_line("Plants use water to bring nutrients up from the roots into their leaves", obj_npc_poppy);
scr_dia_line_sprite(spr_water_going_up_plant);
scr_dia_options("B1", "B2", "B3", "FILLER");

scr_dia_segment(text, "B3");
scr_dia_line("Why do plants need sunlight?", polka);
scr_dia_line("Plants use sunlight to power their food-making process. This is called photosynthesis. Photosynthesis is Greek for 'putting together light'. It's how plants get the energy they need to live.", obj_npc_poppy);
scr_dia_line_sprite(spr_air_sunlight_water_soil);
scr_dia_options("B1", "B2", "B3", "FILLER");


scr_dia_segment(text, "EXIT");
scr_dia_line("Thanks!", polka);

/*
They visit the farm fields

They observe that the plants look dried. 
They have wilted. They have brown leaves.

THEY PULL OUT THE CAMERA
THEY GO TO A SPOT IN THE FIELDS WHERE THEY SEE AN INDICATOR THAT THE CAMERA CAN BE USED
THEY PRESS SPACE ON THE INDICATOR AREA WITH THE CAMERA

THEY CAN SEE THE PHOTO OF THE DYING CROPS
THE PHOTO GETS STORED IN THE NOTEBOOK. 
THE NOTEBOOK ICON FLASHES RED FOR 3 SECONDS

**1/1 CLUE FOUND**
*/

//VILLY POPPY DIALOGUE
scr_dia_segment(text, "GREET");
scr_dia_line("So what did you find?", obj_npc_poppy); 

scr_dia_line("filler", obj_npc_poppy);
//CROPS APPEARANCE QUIZ QUESTIONS
crops_appearance_quiz = ds_list_create();
scr_quiz_list(crops_appearance_quiz);

scr_quiz_question(enum_question_type.multi, 
"The farmer's crops ____ getting enough nutrients.", 
["Are", "Are not"], 
1);
scr_quiz_question_response("Really? How did you find out?", noone);

scr_quiz_question(enum_question_type.evidence_checkbox, 
"Their leaves look",
["Dry", "Brown", "Wilting", "Strong", "Green", "Healthy"],
[enum_evi_type.evidence2,[0,1,2]]); 
//RESERVED EVIDENCE 2 FOR CROP APPEARANCE PHOTO EVIDENCE (spr_crop_appearance_fields_photo_evidence)
scr_quiz_question_response("The plants are getting enough air and sunlight. The sun has been bright.", noone);
//END OF CROPS APPEARANCE QUIZ QUESTIONS

scr_dia_line_quiz(crops_appearance_quiz, obj_npc_poppy); 
//QUIZ WHERE THEY HAVE TO ATTACH PHOTO EVIDENCE ABOUT HOW THE CROPS LOOKS

scr_dia_line("The air is plenty. Perhaps they're not getting enough water?", obj_npc_poppy);
scr_dia_line_sprite(spr_water_lake);
scr_dia_line("You can tell from the soil moisture if a plant is getting enough.", obj_npc_poppy);

scr_dia_line("Plants grow best when our soil moisture is 50 to 60 kPa.", obj_npc_poppy);
scr_dia_line("For measuring soil moisture, you would have to use a tool.", obj_npc_poppy);
scr_dia_line("I might have one lying around that could help", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Sounds good", polka);

/*

(They get the tensiometer from the tool chest.) 
(They visit the farm fields. 
The tensiometer should only work in a crop tile or a soil tile)
(They measure the soil moisture levels in the farmer's crop field)
(They find soil moisture levels of 50 - 60 kpa.)

THEY PULL OUT THE TENSIOMETER
THEY GO TO A SPOT IN THE FIELDS WHERE THEY SEE AN INDICATOR THAT THE CAMERA CAN BE USED
THEY PRESS SPACE ON THE INDICATOR AREA WITH THE TENSIOMETER

THEY CAN SEE THE TABLE OF SOIL MOISTURE VALUES
THE TABLE GETS STORED IN THE NOTEBOOK. 
THE NOTEBOOK ICON FLASHES RED FOR 3 SECONDS

**1/1 CLUE FOUND**

*/

//VILLY POPPY DIALOGUE
scr_dia_segment(text, "GREET");
scr_dia_line("So what did you find out?", obj_npc_poppy); 

//SOIL MOISTURE QUIZ QUESTIONS
soil_moisture_quiz = ds_list_create();
scr_quiz_list(soil_moisture_quiz);

scr_quiz_question(enum_question_type.multi, 
"The farmer's crops ____ getting enough water.", 
["Are", "Are not"], 
0);
scr_quiz_question_response("How did you find out?", noone);

scr_quiz_question(enum_question_type.evidence_multi, 
"The soil moisture levels are between",
["20-40 kpa", "50-60 kpa", "70-80 kpa"],
[enum_evi_type.evidence1, 1]); 
//RESERVED EVIDENCE 1 FOR SOIL MOISTURE TABLE EVIDENCE (spr_soil_moisture_table_evidence)
scr_quiz_question_response("The plants are getting enough air and sunlight. The sun has been bright.", noone);

scr_quiz_question(enum_question_type.multi, 
"They are _____ getting enough soil to grow properly",
["likely", "likely not"],
1); 
scr_quiz_question_response("That's what I was thinking. Plants don't get enough nutrients when they don't have enough soil.", noone);

//END OF SOIL MOISTURE QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_poppy);
//QUIZ WHERE THEY HAVE TO ATTACH TABLE EVIDENCE ABOUT HOW THE SOIL MOISTURE LEVELS IN THE CROPS ARE
scr_dia_line_quiz(soil_moisture_quiz, obj_npc_poppy); 

scr_dia_line("How much soil do plants need in order to grow?", polka);
scr_dia_line("Topsoil is the top layer of soil for growing plants — like vegetables.", obj_npc_poppy);
scr_dia_line_sprite(spr_topsoil);

scr_dia_line("It holds all the nutrients that are super-important to plants.", obj_npc_poppy);
scr_dia_line_sprite(spr_topsoil);

scr_dia_line("About 8 - 10 inches of topsoil depth is good.", obj_npc_poppy);
scr_dia_line("Less than that, and a plant is likely not getting enough nutrients.", obj_npc_poppy);
 
scr_dia_line("You'll also have to find some tool that helps you measure how deep the topsoil is.", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Thanks!", polka);

/* 
(They collect the measuring tape from the tool chest.)
(They return to the farm and they measure the level of topsoil. They shovel through the ground (since they must find topsoil depth). They use a measuring tape to measure the topsoil depth)
(It is around 4-6 inches (which is below the normal)) 

THEY PULL OUT THE MEASURING STICK
THEY GO TO A SPOT IN THE FIELDS WHERE THEY SEE AN INDICATOR THAT THE STICK CAN BE USED
THEY PRESS SPACE ON THE INDICATOR AREA WITH THE MEASURING STICK

THEY CAN SEE THE TABLE OF TOPSOIL DEPTH VALUES
THE TABLE GETS STORED IN THE NOTEBOOK. 
THE NOTEBOOK ICON FLASHES RED FOR 3 SECONDS

**1/1 CLUE FOUND**

*/

//VILLY POPPY DIALOGUE
scr_dia_segment(text, "GREET");

//TOPSOIL DEPTH QUIZ QUESTIONS
topsoil_depth_quiz = ds_list_create();
scr_quiz_list(topsoil_depth_quiz);

scr_quiz_question(enum_question_type.multi, 
"The crops _____ getting enough topsoil.", 
["Are", "Are not"], 
0);
scr_quiz_question_response("How did you find out?", noone);

scr_quiz_question(enum_question_type.evidence_multi, 
"The soil depth levels are between",
["4-6 inches", "6-8 inches", "8-10 inches"],
[enum_evi_type.evidence1, 0]); 
//RESERVED EVIDENCE 1 FOR TOPSOIL DEPTH LEVELS EVIDENCE (spr_topsoil_depth_evidence)
scr_quiz_question_response("Now we got something!", noone);

//END OF TOPSOIL DEPTH QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_poppy);
//QUIZ WHERE THEY HAVE TO ATTACH TABLE EVIDENCE ABOUT HOW DEEP THE TOPSOIL LEVELS ARE
scr_dia_line_quiz(topsoil_depth_quiz, obj_npc_poppy); 

scr_dia_line("Why is there not enough topsoil?", polka);
scr_dia_line("I really don't know! I wonder what Villy Weeraway has been up to.", obj_npc_poppy);
scr_dia_line("But if you find anything, then be sure to let me know!", obj_npc_poppy);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Will do!", polka);

/* 
Telling the botanist about the topsoil triggers the next event: 
the player can now view a new batch of dialogue choices when approaching the farmer the next time

(They talk to Villy Weeraway)

*/

//VILLY WEERAWAY DIALOGUE
scr_dia_segment(text, "GREET");
scr_dia_line("Why haven't you put enough topsoil in your crop fields?", polka);
scr_dia_line("What? What do you mean, " + game.name + "? I DID put enough topsoil!", obj_npc_weeraway);
scr_dia_line("It looks like some of it disappeared.", polka);
scr_dia_line("WHAT? How does soil just disappear?? ...We have a ghost problem!", obj_npc_weeraway);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("We'll figure this out", polka);

/* 
CUTSCENE;
When they step outside of Weeraway's house, it's raining
Weeraway's fields fill with water. 
They notice a stream of water filled with soil moving down the slopes of the field) 

The topsoil is being carried away by rain. 

THEY PULL OUT THE CAMERA
THEY GO TO A SPOT IN THE STREAM OF WATER WHERE THEY SEE AN INDICATOR THAT THE CAMERA CAN BE USED
THEY PRESS SPACE ON THE INDICATOR AREA WITH THE CAMERA

THEY CAN SEE THE PHOTO OF THE WATER ERODING THE TOPSOIL
THE PHOTO GETS STORED IN THE NOTEBOOK. 
THE NOTEBOOK ICON FLASHES RED FOR 3 SECONDS

**1/1 CLUE FOUND**

*/

//VILLY POPPY DIALOGUE
scr_dia_segment(text, "GREET");

//TOPSOIL RAIN EROSION QUIZ QUESTIONS
topsoil_rain_erosion_quiz = ds_list_create();
scr_quiz_list(topsoil_rain_erosion_quiz);

scr_quiz_question(enum_question_type.multi, 
"What did you find out", 
["The topsoil is being moved by people", "The topsoil is getting grabbed by animals", "The rain outside is flooding people's homes", "The topsoil is being removed away by water"], 
3);
scr_quiz_question_response("How did you find out?", noone);

scr_quiz_question(enum_question_type.evidence_multi, 
"We saw the topsoil getting moved by _____ into a lake when it was raining outside",
["Wind", "Water", "Animals", "Ice"],
[enum_evi_type.evidence2, 1]); 
//RESERVED EVIDENCE 2 FOR SOIL-EROSION-WATER PHOTO EVIDENCE (spr_soil_erosion_water_photo_evidence)
scr_quiz_question_response("This is wonderful, you figured it out!", noone);

//END OF TOPSOIL RAIN EROSION QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_poppy);
//QUIZ WHERE THEY HAVE TO ATTACH PHOTO EVIDENCE ABOUT HOW THE TOPSOIL WAS GETTING ERODED BY WATER
scr_dia_line_quiz(topsoil_rain_erosion_quiz, obj_npc_poppy); 

scr_dia_line("So THAT'S how the topsoil got removed!", obj_npc_poppy);
scr_dia_line("When soil or dirt is moved from one place to another by wind or water, it's called EROSION.", obj_npc_poppy);
scr_dia_line_sprite(spr_soil_erosion_water_photo_evidence);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Thanks for all your help!", polka);

//END OF EROSION QUEST INVESTIGATION SECTION

/* --------------------------------------------------------------------------------------------------------- */ 

/* EROSION QUEST EXPERIMENT TUTORIAL */

//They are now back in Polka's room with the Baron. 
//The Baron will explain the purpose of doing an experiment and how to do one

//BARON DIALOGUE
scr_dia_segment(text, "GREET");

scr_dia_line("Well done! You've gotten so far already!", obj_npc_baron);

scr_dia_line("Now that we know what the root problem is, different people will come up with a solution.", obj_npc_baron);
scr_dia_line("They want to get support so that they can carry out the solution for all the farm fields.", obj_npc_baron);
scr_dia_line("To solve the problem, you will help the scientists plan and analyze an experiment.", obj_npc_baron);
scr_dia_line("You look for clues that show the experiment was not well-performed. Or maybe something was said that should not have been said. Or maybe something was missing. ", obj_npc_baron);

scr_dia_line("Experimental Research is a skill that's helpful for anyone. Not just scientists and researchers.", obj_npc_baron);
scr_dia_line("Even some entrepreneurs can do it. An entrepreneur is somebody who runs a business and sells things.", obj_npc_baron);
scr_dia_line_sprite(spr_entrepreneur); 

scr_dia_line("Experimental Research is all about testing something you want to find out if it's true.", obj_npc_baron);
scr_dia_line("Say your friend runs a lemonade stand. He wants to add honey instead of sugar to lemonade because he thinks it'll make the lemonade taste better.", obj_npc_baron);
scr_dia_line_sprite(spr_lemonade_stand);

scr_dia_line("He asks you for money so that he can buy enough honey to use in all his lemonades.", obj_npc_baron);
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
scr_quiz_question_response("Exactly", noone);
//END OF EROSION EXPERIMENT TUTORIAL 1 QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_baron);
scr_dia_line_quiz(erosion_experiment_tutorial_1, obj_npc_baron); 

scr_dia_line("You'd want to know where he got the idea from. He tells you an article he read said that adding honey instead of sugar to lemonade makes it taste better. This is his background research.", obj_npc_baron);
scr_dia_line_sprite(spr_magazine_article_honey); 

scr_dia_line("But what if people don't like honey? What if his customers think that lemonade tastes good with sugar and not with honey?", obj_npc_baron);
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
scr_quiz_question_response("You'd want your friend to try this out with a little honey before he goes out and buys a whole bunch of honey. So your friend sets up an experiment.", noone);

scr_quiz_question(enum_question_type.multi, 
"Then you'd ask:", 
["What are you trying to test?", 
"How much does honey weigh?", 
"Have any of your customers tried your lemonade with honey instead of sugar?", 
"What color is honey?"], 
0);
scr_quiz_question_sprite(spr_hypothesis_question_marks); 
scr_quiz_question_response("You'd want to make sure your friend is actually testing the right thing. What is he looking for? He makes a hypothesis. His hypothesis is that adding honey instead of sugar to lemonade will make people like it more.", noone);

scr_quiz_question(enum_question_type.multi, 
"Then you'd ask:", 
["What are you trying to test?", 
"What does your experiment data show?", 
"How will you test your hypothesis?", 
"What color is honey?"], 
2);
scr_quiz_question_sprite(spr_tutorial_procedure); 
scr_quiz_question_response("You'd want to know how your friend plans on carrying out the experiment. What steps will he take to find out? He sets up a procedure on what he'll be doing. ", noone);

//END OF EROSION EXPERIMENT TUTORIAL 2 QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_baron);
scr_dia_line_quiz(erosion_experiment_tutorial_2, obj_npc_baron);

scr_dia_line("He has two groups. He will give half of his customers lemonade with sugar, but without honey. This is his first group.", obj_npc_baron);
scr_dia_line_sprite(spr_experiment_tutorial_setup);

scr_dia_line("He will give the other half of his customers the lemonade with honey, but without sugar. This is his second group.", obj_npc_baron);
scr_dia_line_sprite(spr_experiment_tutorial_setup);

scr_dia_line("He asks each customer to give a rating, from 1-10, on how much they liked his lemonade. Then he adds up the ratings from each group.", obj_npc_baron);
scr_dia_line_sprite(spr_experiment_tutorial_setup);

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
scr_quiz_question_response("You will want to know what results your friend found. Was the honey a success?", noone);

//END OF EROSION EXPERIMENT TUTORIAL 3 QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_baron);
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
scr_quiz_question_response("Your friend has to make a final decision. He comes up with a conclusion: adding honey instead of sugar to lemonade makes customers like it more.", noone);

//END OF EROSION EXPERIMENT TUTORIAL 4 QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_baron);
//QUIZ QUESTION: (MC) You'd then ask him: How will you test your hypothesis?
scr_dia_line_quiz(erosion_experiment_tutorial_4, obj_npc_baron);

scr_dia_line("So he decides to go and buy more honey.", obj_npc_baron);
scr_dia_line("Now that your friend has shown you the evidence, you can now trust him more. You give him the money needed to buy more honey.", obj_npc_baron);
scr_dia_line("And that's all there is to an experiment! Now let's see you with the real deal!", obj_npc_baron);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Thanks!", polka);

//END OF EXPERIMENT TUTORIAL

/* --------------------------------------------------------------------------------------------------------- */ 

/* EROSION QUEST EXPERIMENT SECTION */

//They are now back in Villy Weeraway's room with the Weeraway. 

/*
The player reads a narrative on how the experiment was performed. 
They look for clues that show the experiment was not well-performed, that something was stated that should not have been stated, or that something was missing.

The farmer tells Polka what they found about erosion and its relation to vegetation planted around soil. 
The farmer also explains to Polka how they figured this out. 
(background research)
*/

//VILLY WEERAWAY DIALOGUE

scr_dia_line("After learning that the soil in the fields was being eroded by water, we looked for places where soil eroded less. We checked out the Gumdrop Forest, which has trees planted in soil.", obj_npc_weeraway);
scr_dia_line_sprite(spr_forest); 

scr_dia_line("We used a measuring stick to find the topsoil depth in the forest. We found about 8-10 inches of topsoil.", obj_npc_weeraway);
scr_dia_line_sprite(spr_measuring_stick); 

scr_dia_line("We also used a soil penetrometer, which is used to find the soil compaction. The more compact soil is, the harder it is for it to erode. The more psi something has, the higher the compaction.", obj_npc_weeraway);
scr_dia_line_sprite(spr_penetrometer); 

scr_dia_line("The soil compaction in the forest was 180 psi, while the soil compaction in my fields was 80 psi!", obj_npc_weeraway);
scr_dia_line_sprite(spr_topsoil_depth_forest_table); 

scr_dia_line("We noticed that the forest has more vegetation, like trees, compared to our farm fields.", obj_npc_weeraway);
scr_dia_line_sprite(spr_compact_vs_loose_soil);

scr_dia_line("We should go and get money from the council to plant more trees and other vegetation around the farmland. What do you think?", obj_npc_weeraway);

//EROSION EXPERIMENT 1 QUIZ QUESTIONS
erosion_experiment_1 = ds_list_create();
scr_quiz_list(erosion_experiment_1);

scr_quiz_question(enum_question_type.multi, 
"What do you think?", 
["Yeah, great idea", 
"That's not the best idea"], 
1);
scr_quiz_question_response("What? Why not?", noone);

scr_quiz_question(enum_question_type.multi, 
"", 
["People might not trust us later.",
"We might be wasting money.",
"We don't know for sure if it's the extra vegetation that helps the soil erode less in the forest.",
"All of the above"], 
3);
scr_quiz_question_response("So what should we do?", noone);

scr_quiz_question(enum_question_type.multi, 
"What should we do?", 
["Remove the vegetation in the forest and see if the soil erodes more",
"Set up an experiment",
"Put cameras around the forest and see if the vegetation stops erosion",
"None of the above"], 
1);
scr_quiz_question_response("That's a good idea! Let's plant vegetation around crop fields and see if the soil erodes less. What next?", noone);

scr_quiz_question(enum_question_type.multi, 
"What's next", 
["Make a hypothesis",
"Start planting vegetation around the crop fields",
"Collect data",
"None of the above"], 
0);
scr_quiz_question_response("Why?", noone);

scr_quiz_question(enum_question_type.multi, 
"Why?", 
["It explains what we're trying to find out.",
"It gives direction to the experiment.",
"A and B",
"None of the above"], 
2);
scr_quiz_question_response("So our hypothesis is that we predict planting more vegetation around the crop fields will lower soil erosion. Now what?", noone);

scr_quiz_question(enum_question_type.multi, 
"Now what?", 
["Analyze the data",
"Start planting vegetation around the crop fields",
"Set up a procedure to carry out the experiment.",
"None of the above"], 
2);
scr_quiz_question_response("Why do we do that?", noone);

scr_quiz_question(enum_question_type.multi, 
"Why do we do that?", 
["It lets others know what steps were taken to come up with the data.",
"Without it, it will look like we came up with the data on our own without doing anything.",
"It gives others a way to repeat our experiment",
"All of the above"], 
3);
scr_quiz_question_response("I see, you're right. So here's what steps we'll take.", noone);
//END OF EROSION EXPERIMENT 1 QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_weeraway);
//QUIZ QUESTIONS: EROSION EXPERIMENT PART 1
scr_dia_line_quiz(erosion_experiment_1, obj_npc_weeraway);

scr_dia_line("We will make two different square patches. Each patch will be filled with soil. We will plant crops in both patches.", obj_npc_weeraway);
scr_dia_line_sprite(spr_erosion_experiment_setup_before); 

scr_dia_line("The difference will be how much vegetation there is in each patch. The first patch will have no vegetation planted around it. It's just like what we have right now in the fields.", obj_npc_weeraway);
scr_dia_line_sprite(spr_erosion_experiment_setup_before); 

scr_dia_line("The second patch will have vegetation like big and small trees planted around it. Over 4 weeks, we'll measure the soil depth, soil compaction, and crop growth in each patch and compare the results at the end. ", obj_npc_weeraway);
scr_dia_line_sprite(spr_erosion_experiment_setup_before); 

//EROSION EXPERIMENT 2 QUIZ QUESTIONS
erosion_experiment_2 = ds_list_create();
scr_quiz_list(erosion_experiment_2);

scr_quiz_question(enum_question_type.multi, 
"What do you say we do now?", 
["Repeat the experiment",
"Make our case",
"Show the data found from doing the experiment.",
"None of the above"], 
2);
scr_quiz_question_response("What? We also have to show the data? Why does that matter?", noone);

scr_quiz_question(enum_question_type.multi, 
"Why does that matter?", 
["It shows how we did the experiment",
"It shows what results were found from the procedure",
"It explains what we're trying to find out.",
"None of the above"], 
1);
scr_quiz_question_response("Ok, good point. Here's the data we found after doing the experiment", noone);

scr_quiz_question(enum_question_type.multi, 
"From the analysis, I've found that planting more vegetation around crop fields does not lower the soil erosion.", 
["No, there's a mistake.",
"Yeah, that looks right.",], 
0); 
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence); //SHOW THE EROSION EXPERIMENT DATA TABLE
scr_quiz_question_response("What do you mean? How?", noone);

scr_quiz_question(enum_question_type.multi, 
"The soil compaction in the patch surrounded by vegetation is ___ psi, while the soil compaction in the patch surrounded with no vegetation is ___ psi.", 
["170; 80",
"80; 170",
"9.5; 4",
"4; 9.5"], 
0);
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence);
scr_quiz_question_response("Which means that...", noone);

scr_quiz_question(enum_question_type.multi, 
"The soil is ___ compact in the soil patch surrounded by vegetation than in the one not surrounded by vegetation.", 
["more",
"less"], 
0);
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence);
scr_quiz_question_response("Ok", noone);

scr_quiz_question(enum_question_type.multi, 
"The soil depth in the patch surrounded by vegetation is __ inches, while the soil depth in the patch surrounded with no vegetation is __ inches.", 
["170; 80",
"80; 170",
"9.5; 4",
"4; 9.5"], 
2);
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence);
scr_quiz_question_response("Which means that...", noone);

scr_quiz_question(enum_question_type.multi, 
"There's a ____ topsoil depth in the soil patch not surrounded by vegetation than in the one surrounded by vegetation.", 
["higher",
"lower"], 
1);
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence);
scr_quiz_question_response("Ok", noone);

scr_quiz_question(enum_question_type.multi, 
"The plant growth in the patch surrounded by vegetation is ___ inches, while the plant growth in the patch surrounded with no vegetation is ___ inches.", 
["0.2; 0.8",
"0.2; 170",
"9.5; 0.8",
"0.8; 0.2"], 
3);
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence);
scr_quiz_question_response("Which means that...", noone);

scr_quiz_question(enum_question_type.multi, 
"There's _____ plant growth in the soil patch surrounded by vegetation than in the one not surrounded by vegetation.", 
["higher",
"lower"], 
0);
scr_quiz_question_sprite(spr_erosion_experiment_table_evidence);
scr_quiz_question_response("This is great! That means we can conclude that planting vegetation around the crop fields can lower soil erosion.", noone);

//END OF EROSION EXPERIMENT 2 QUIZ QUESTIONS

scr_dia_line("filler", obj_npc_weeraway);
//QUIZ QUESTIONS: EROSION EXPERIMENT PART 2
scr_dia_line_quiz(erosion_experiment_2, obj_npc_weeraway);

scr_dia_options("EXIT", "FILLER");

scr_dia_segment(text, "EXIT");
scr_dia_line("Now let's go present this as a case at the Courthouse!", polka);

//END OF EXPERIMENT SECTION

/* --------------------------------------------------------------------------------------------------------- */ 

/* EROSION QUEST CASE SECTION */

//They are in Villy Weeraway's room with Weeraway.
//They head over to the courthouse

/*
A group of 6 investors are sitting in the courthouse

The Baron is there as well, standing near the front.

CUTSCENE:
When Polka walks in, the Baron says:
Now it's time for the case! 
Take what you've learned and present the evidence! 
You need to convince the investors to give enough money so that the erosion problem can be solved.

The Chieftain is at the front. 
The player walks over to them and initiates dialogue.
*/

//VILLY CHIEFTAIN DIALOGUE
scr_dia_line("Present your case!", obj_npc_chieftain);

scr_dia_line("We found out that the farmer's crops are dying because the soil they need in order to grow the crops is being washed away by rainwater.", polka);
scr_dia_line("To understand why the crops were dying, we first had to understand what crops need to live.", polka);

//EROSION INVESTIGATION CASE QUIZ QUESTIONS
erosion_investigation_case = ds_list_create();
scr_quiz_list(erosion_investigation_case);

scr_quiz_question(enum_question_type.multi, 
"To learn about this, we spoke with a ______ named Villy Poppy.", 
["farmer",
"gardener",
"botanist",
"chemist"], 
2);

scr_quiz_question(enum_question_type.checkbox,
"We learned that plants need:", 
["Air",
"Sunlight",
"Water",
"Soil"],
[0,1,2,3]);

scr_quiz_question(enum_question_type.checkbox,
"If a plant wasn't getting enough sunlight, it looked:", 
["Yellow",
"Strong",
"Long",
"Thin"],
[0,2,3]);

scr_quiz_question(enum_question_type.checkbox,
"If a plant wasn't getting enough water, it looked:", 
["Dry",
"Brown",
"Green",
"Wilting"],
[0,1,3]);

scr_quiz_question(enum_question_type.checkbox,
"If a plant wasn't getting enough soil, it looked:", 
["Strong",
"Brown",
"Dry",
"Wilting"],
[1,2,3]);

scr_quiz_question(enum_question_type.multi, 
"We observed that the plants that weren't getting enough water or enough soil looked", 
["Similar",
"Different"], 
0);

scr_quiz_question(enum_question_type.multi, 
"That's because these plants lacked ______.", 
["Soda",
"Nutrients",
"Insects",
"All of the above"], 
0);

scr_quiz_question(enum_question_type.evidence_checkbox,
"After investigating the farmer's crops, we realized they looked", 
["Wilting",
"Brown",
"Dry",
"Green"],
[enum_evi_type.evidence2, [0,1,2]]); 
//EVIDENCE 2 IS RESERVED FOR CROP APPEARANCE PHOTO EVIDENCE (spr_crop_appearance_fields_photo_evidence)

scr_quiz_question(enum_question_type.checkbox,
"They either weren't getting enough", 
["Water",
"Air",
"Sunlight",
"Soil"],
[0,3]);

scr_quiz_question(enum_question_type.multi, 
"We concluded that the plants ____ getting enough nutrients.", 
["were",
"were not"], 
1);

scr_quiz_question(enum_question_type.multi, 
"We learned that measuring the ______ could help us conclude whether the crops were getting enough water.", 
["soil depth",
"soil moisture",
"soil density",
"All of the above"], 
1);

scr_quiz_question(enum_question_type.multi, 
"If the soil moisture was between _____ kpa, then it meant there was enough water available for the plants.", 
["10-20",
"30-40",
"50-60",
"None of the above"], 
2);

scr_quiz_question(enum_question_type.multi, 
"We used a ____ to measure the moisture", 
["tensiometer",
"thermometer",
"measuring stick",
"None of the above"], 
0);

scr_quiz_question(enum_question_type.evidence_multi, 
"We discovered that the soil moisture was between ____ kpa", 
["30-40",
"50-60",
"70-80",
"None of the above"], 
[enum_evi_type.evidence2, 1]); 
//EVIDENCE 2 IS RESERVED FOR THE SOIL MOISTURE TABLE (spr_soil_moisture_table_evidence)

scr_quiz_question(enum_question_type.multi, 
"We concluded that the soil ____ enough water", 
["didn't have",
"had"], 
1);

scr_quiz_question(enum_question_type.multi, 
"We decided to investigate if the crops were getting enough topsoil. We measured the ____ in the farmer's fields.", 
["soil moisture",
"soil compaction",
"soil depth",
"All of the above"], 
2);

scr_quiz_question(enum_question_type.multi, 
"We learned that about _____ inches of topsoil depth was needed for plants to grow.", 
["8-10",
"11-13",
"6-8",
"None of the above"], 
0);

scr_quiz_question(enum_question_type.multi, 
"We used a ____ to measure the topsoil depth", 
["tensiometer",
"thermometer",
"measuring stick",
"None of the above"], 
2);

scr_quiz_question(enum_question_type.evidence_multi, 
"We discovered that the topsoil depth was between ____ inches", 
["1-2",
"4-6",
"8-10",
"None of the above"], 
[enum_evi_type.evidence2, 1]); 
//EVIDENCE 2 IS RESERVED FOR THE TOPSOIL DEPTH TABLE (spr_topsoil_depth_evidence)

scr_quiz_question(enum_question_type.multi, 
"We concluded that the crops _____ getting enough topsoil", 
["were not",
"were"], 
0);

scr_quiz_question(enum_question_type.evidence_multi, 
"We made an observation while returning to the farm. While it was _____, we saw water carrying the topsoil away from the fields over to the lake nearby.", 
["snowing",
"raining",
"hailing",
"None of the above"], 
[enum_evi_type.evidence2, 1]); 
//EVIDENCE 2 IS RESERVED FOR THE SOIL-EROSION-WATER PHOTO (spr_soil_erosion_water_photo_evidence)
 
scr_quiz_question(enum_question_type.multi, 
"When soil or rock is moved from one place to another by wind or water, it's called", 
["Weathering",
"Sleet",
"Erosion",
"Earthquake"], 
2);
//END OF EROSION INVESTIGATION CASE QUIZ QUESTIONS

scr_dia_line("The court has noted the account given!", obj_npc_chieftain); 
scr_dia_line_quiz(erosion_investigation_case, obj_npc_chieftain); 

scr_dia_line("That brings us to our conclusion: The farmer's crops are dying because the soil they need to grow is being eroded away by rainwater.", polka);

scr_dia_line("We found out that planting more vegetation around the fields lowers soil erosion.", polka);
scr_dia_line_sprite(spr_erosion_experiment_setup_after); 

//EROSION EXPERIMENT CASE QUIZ QUESTIONS
erosion_experiment_case = ds_list_create();
scr_quiz_list(erosion_experiment_case);

scr_quiz_question(enum_question_type.multi, 
"In our _____, we found out that the soil in forests had a higher topsoil depth and soil compaction.", 
["hypothesis",
"procedure",
"background research",
"None of the above"], 
2);

scr_quiz_question(enum_question_type.multi, 
"We set up an experiment. Our ______ was that planting more vegetation around the fields would lower soil erosion.", 
["hypothesis",
"procedure",
"background research",
"None of the above"], 
0);

scr_quiz_question(enum_question_type.multi, 
"We set up a step-by-step ______ for doing the experiment.", 
["hypothesis",
"procedure",
"background research",
"None of the above"], 
1);

scr_quiz_question(enum_question_type.multi, 
"We made _____ different square patches. Each patch was filled with soil.", 
["one",
"two",
"three",
"None of the above"], 
1);

scr_quiz_question(enum_question_type.multi, 
"We planted crops in both patches. The difference was how much _______ there was in each patch.", 
["earthworms",
"soil",
"vegetation",
"None of the above"], 
2);

scr_quiz_question(enum_question_type.multi, 
"The ____ patch had no vegetation planted around it. The ____ patch had vegetation like big and small trees planted around it.", 
["first; second",
"second; first"], 
0);

scr_quiz_question(enum_question_type.multi, 
"Over 4 weeks, we measured the ______ in each patch and compared the results at the end.", 
["topsoil depth",
"crop growth",
"soil compaction",
"All of the above"], 
3);

scr_quiz_question(enum_question_type.evidence_multi, 
"From our data ____, we found that the patch with vegetation had higher plant growth and soil depth than the patch with no vegetation.", 
["analysis",
"procedure",
"hypothesis",
"None of the above"], 
0);

scr_quiz_question(enum_question_type.multi, 
"We came to the _____ that planting more vegetation around the fields does lower soil erosion.", 
["hypothesis",
"conclusion",
"background research",
"None of the above"], 
[enum_evi_type.evidence2, 0]);
scr_quiz_question_sprite(spr_erosion_experiment_setup_after);
//EVIDENCE 2 IS RESERVED FOR THE EROSION EXPERIMENT TABLE (spr_erosion_experiment_table_evidence)

//END OF EROSION EXPERIMENT CASE QUIZ QUESTIONS
scr_dia_line("The court has decided to grant the farmers the funding needed to solve the erosion problem. Session adjourned!", obj_npc_chieftain); 
scr_dia_line_quiz(erosion_experiment_case, obj_npc_chieftain);

/* END OF EROSION QUEST CASE SECTION*/

/* --------------------------------------------------------------------------------------------------------- */ 

//ENDING CUTSCENES

/*
CHARACTER OBJECTS:
obj_npc_weeraway
obj_npc_weeraway_wife
obj_npc_weeraway_kid_1
obj_npc_weeraway_kid_2

(SCENE 1) The farmer and his wife are looking at the table. There's a bowl of each food on the table.)
Potatoes (mashed potatoes)
Carrots (steamed carrots)
Green beans (green bean casserole)
Corn (creamed corn)
Turnips (mashed turnips)
Pumpkin (pumpkin pie)

Wife: "I can't believe we were able to grow the crops in time."

Weeraway: "Neither can I. We have mashed potatoes, steamed carrots, green bean casserole, creamed corn, mashed turnips, and pumpkin pie."

Weeraway: "... If the soil erosion problem hadn't been fixed, we wouldn't be enjoying any of these this year."


(SCENE 2) At the end, you have a scene in which the farmer and his family are eating a wholesome dinner at Weeraway's house.
They're sitting at the dining table in Weeraway's house

Kid 1, Gooey: "These mashed potatoes are delicious, mom!"

Wife (smiling): "Thank you, dear!"

Weeraway: "Pass the pumpkin pie, Gooey."

Kid 2, Chewy: "I didn't think I'd ever miss carrots.."

Weeraway: "That's what happens when you have nothing to eat. You'll eat just about anything you can get. And pass me the creamed corn, will you?"

(SCENE 3) Weeraway thanks Polka in Polka's house 

Weeraway: "Because of you, my family could live. The villagers could finally get food to eat. Please take this as a token of my thanks."

Weeraway gives Polka 300 coins.

*/