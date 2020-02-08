/*


//The player TELLS Poppy about how the farmer's plants are getting enough water, but not enough soil



text[? "GREET"] = ["What did you find?", ["A1", "A1_1", "GREET"], [id]]


text[? "A1"] = ["The farmer's crops are not getting enough water", "Are you sure? You might want to check again.", ["A1", "A1_1", "GREET"], [polka, id]]


text[? "A1_1"] = ["The farmer's crops are getting enough water.", "How did you figure that out?", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]



text[? "A2"] = ["The soil moisture levels are between 40 - 50 kpa.", "Are you sure? You might want to check again.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]


text[? "A2_1"] = ["The soil moisture levels are between 50 - 60 kpa.", "So what could that mean?", ["A3", "A3_1", "GREET", [polka, id]]


text[? "A2_2"] = ["The soil moisture levels are between 60 - 70 kpa.", "Are you sure? You might want to check again.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]



text[? "A3"] = ["That they are likely getting enough soil to grow properly.", "Are you sure? You might want to check again.", ["A3", "A3_1", "GREET"], [polka, id]]


text[? "A3_1"] = ["That they are likely not getting enough soil to grow properly.", "Makes sense. You're doing pretty good!", ["EXIT", "GREET", [polka, id]]



text[? "EXIT"] = ["Great", []]



//———————————— 



//The player ASKS Poppy more info about topsoil



text[? "GREET"] = ["How much soil do plants need in order to grow?", "The nutrients NPK are found a lot in topsoil. About 8 - 10 inches of topsoil depth is good. Less than that, and a plant is likely not getting enough nutrients.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]


text[? "A1"] = ["How do you know when the topsoil layer ends?", "This is important! So listen carefully.", "Dig through the topsoil layer. Beneath the topsoil layer is the subsoil layer.", "You'll know when the topsoil layer ends when you've reached subsoil. Subsoil has more sand/clay.", ["EXIT", "GREET"], [polka, id, id, id]]


text[? "A1_1"] = ["What is topsoil?", "Topsoil is the top layer of soil for growing plants -- like vegetables.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]


text[? "A1_2"] = ["Why is topsoil important?", "Topsoil holds all the nutrients that are super-important to plants. It has a lot of organic matter and microorganisms that help plants flourish.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]



text[? "EXIT"] = ["Cool", []]



//———————————— 



//The player TELLS Poppy about how the farmer's plants are not getting enough topsoil



text[? "GREET"] = ["Back already? You're quick! What's up?", ["A1", "A1_1", "GREET"], [id]]


text[? "A1"] = ["The farmer's crops are not getting enough topsoil.", "What makes you say that?", ["A2", "A2_1", "A2_2", "A2_3", "GREET"], [polka, id]]


text[? "A1_1"] = ["The farmer's crops are getting enough topsoil.", "Are you sure? You might want to check again.", ["A1", "A1_1", "GREET"], [polka, id]]



text[? "A2"] = ["We measured the topsoil layer and found 8 - 10 inches of topsoil.", "Are you sure? You might want to check again.", ["A2_1", "A2_2", "A2_3", "GREET"], [polka, id]]


text[? "A2_2"] = ["We measured the topsoil layer and found 6 - 8 inches of topsoil.", "Are you sure? You might want to check again.", ["A2", "A2_1", "A2_3", "GREET"], [polka, id]]


text[? "A2_3"] = ["We measured the topsoil layer and found 4 - 6 inches of topsoil.", "That explains a bit. You're good at this!", ["EXIT", "GREET", [polka, id]]



text[? "EXIT"] = ["Thanks", []]



//———————————— 



//The player ASKS Poppy about why there isn't enough topsoil

text[? "GREET"] = ["Why is there not enough topsoil?", "I really don't know! I wonder what Villy Weeraway has been up to?", ["EXIT", "GREET"], [polka, id]]


text[? "EXIT"] = ["Thanks", []]



//———————————— 



//The player TELLS Weeraway about what they found

text[? "GREET"] = ["Why haven't you put enough topsoil in your crop fields?", "What? I did put enough topsoil!", "It looks like some of it disappeared.", "WHAT? How does soil just disappear?? ...We have a ghost problem!", ["EXIT", "GREET"], [polka, id, polka, id]]

text[? "EXIT"] = ["Now that sounds cool", []]


*/