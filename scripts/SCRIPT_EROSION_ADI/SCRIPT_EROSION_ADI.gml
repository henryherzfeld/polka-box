


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

scr_dia_segment(text, "GREET");
scr_dia_line("Good morning, young squire! Hope I didn't startle you.", polka); //baron 
scr_dia_line("All the other Quanta Knights are busy fixing the ship. You've been chosen to get back the missing Crystal pieces so that we can recreate the cure.", polka); //baron 
scr_dia_line("When you crash landed in your spaceship, the Crystal of Inventa broke. The art of discovery has disappeared thanks to Virus and his henchmen.", polka); //baron 
scr_dia_line("The henchmen live inside other Villy hosts throughout the land.", polka); //baron 
scr_dia_line("To recreate the Crystal of Inventa, you will have to help bring advancements that make the world a better place to live in.", polka); //baron 
scr_dia_line("Each problem you find, no matter how small or big, takes you on a quest. Each time you do a quest, you knock out a henchman of Virus and the Crystal gets another piece back.", polka); //baron 
scr_dia_line("The Villies cooperate more with each other. Problems get solved. Society benefits from its advancements.", polka); //baron 
scr_dia_line("When all the quests have been completed, Virus and his henchmen get defeated and the Crystal becomes whole.", polka); //baron 
scr_dia_line("Navilla becomes a thriving planet once again.", polka); //baron 
scr_dia_line("The power from the Crystal can then be used to destroy the plague on our planet, Cosmo, and save its people.", polka); //baron 

scr_dia_line("Now here's how you beat a quest!", polka); //baron 
scr_dia_line("In each quest, you have to ask questions, investigate, analyze clues, and come up with conclusions that determine the direction you take next.", polka); //baron 
scr_dia_line("You keep doing this until you've reached the end of your quest.", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 

scr_dia_line("Here's your first item, given to all budding Quanta Knights: a camera!", polka); //baron 
scr_dia_line("You can use it to make observations and take pictures of what you find.", polka); //baron 
scr_dia_line("You may leave. If you have any questions, feel free to ask me. I'm right here.", polka); //baron 

/* The player heads to the door. The door is locked.
The player goes and asks Villy Chieftain a question
*/

scr_dia_line("Are you ready? I think you can do it!", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 
scr_dia_line("Are you ready? I think you can do it!", polka); //baron 



scr_dia_line_quiz(questions, obj_npc_test);
scr_dia_line("Me an NPC", obj_npc_test);
scr_dia_options("EXIT", "A1", "EXIT");

scr_dia_segment(text, "A1");
scr_dia_line("We are having a convo", polka);
scr_dia_line("Yes we are having a convo", obj_npc_test);
scr_dia_options("EXIT", "EXIT");

scr_dia_segment(text, "EXIT");
scr_dia_line("Bye", polka);
scr_dia_line("Bye", id);

/*

The player goes and asks Villy Chieftain a question ("Why is the door locked?"). 
"Oh! I forgot to tell you. So, er, the key to the door is missing. The last time I had it was when I was sitting at your desk. I went to drink some water. When I came back, the key was gone. If you have what it takes to be a Quanta Knight, you'll be able to figure out where it is. When you find any clue, tell me about it."

QUEST: get the key back
(SHOW TUTORIAL FOR CLICKING ON CAMERA ITEM IN INVENTORY USING MOUSE, APPROACHING A NEARBY OBJECT, AND PRESSING SPACE TO TAKE A PICTURE)
(The player should approach the desk with the camera.) 
An Indicator should pop up. "What do you observe about the desk?" Show a picture of the desk surface with some animal hairs on top. (1/1 clue found)
The picture should be stored in the Notebook. ("Any time you want to check what clues you've found, you can go into your Notebook.")
(SHOW TUTORIAL FOR CLICKING ON NOTEBOOK ICON USING MOUSE TO ACCESS NOTEBOOK, CLICKING ON AN ITEM IN THE NOTEBOOK TO VIEW THE OBSERVATION/PICTURE AS A BIGGER SIZE, CLICKING ON RETURN BUTTON USING MOUSE TO EXIT THE NOTEBOOK) 

(TELL PLAYER TO GO BACK TO VILLY CHIEFTAIN AFTER 1/1 CLUE HAS BEEN FOUND)
(The player goes back to the Villy Chieftain.)
VC: "What did you find out?"
P: "An animal might have taken the key."
VC: "How did you find out?"
P: "There were some animal hairs on the desk."
VC: "But how do I know you're telling the truth? I need to see evidence. Remember, showing evidence helps to support what you're saying. It makes it more likely for people to trust you."

VC: How did you find out?"
(Show the same quiz question, but now with the evidence slot. "You can also use an item in the Notebook as a piece of evidence.")
(SHOW TUTORIAL FOR CLICKING ON EVIDENCE SLOT IN QUIZ QUESTION USING MOUSE TO ACCESS NOTEBOOK, CLICKING ON THE ITEM THEY WISH TO PRESENT, AND CLICKING ON SUBMIT TO EXIT THE NOTEBOOK WITH THE ITEM SELECTED)
(The player should be referenced to click on the evidence slot to access their Notebook. The Notebook opens. They then select the picture they took of the desk. It attaches to the evidence slot.)
P: "There were some animal hairs on the desk.
VC: "Is that so? I wonder if…?" 
The Villy Chieftain approaches the snoozing cat on the side of the room, picks it up, and…lo and behold!…there is the key where the cat was sleeping. (cutscene)
"Aha, excellent work! You just finished your first Quest investigation! I'm confident that you'll do great out there! This is also your chance to prove your worth and finally join the ranks of the Quanta Knights. Good luck!"
(Show a pop-up of the crystal being filled with one piece, indicating that the player has finished their first quest.)
The Badge screen pops up and shows the player which badges they won.
One badge is automatically given for completing the quest
One badge is given if they didn't run out of time for any quiz question
One badge is given if they didn't lose all three hearts any time during the quest  
The door unlocks and the player can leave the house 


*/